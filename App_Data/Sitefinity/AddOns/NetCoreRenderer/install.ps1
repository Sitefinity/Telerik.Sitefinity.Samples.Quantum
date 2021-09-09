param($installPath, $toolsPath, $package, $project)

Import-Module (Join-Path $toolsPath "addons-registry.psm1")

# Get destinatin path
$contentFolderPath = (Get-ChildItem $installPath -filter "content" | Select-Object -first 1).FullName
$addonFolderPath = (Get-ChildItem $installPath -recurse -filter $package.Id | Select-Object -first 1).FullName
$addonRelativePath = $addonFolderPath.Replace($contentFolderPath, "")

$projectFullName = $project.FullName 
$fileInfo = new-object -typename System.IO.FileInfo -ArgumentList $projectFullName
$projectDirectory = $fileInfo.DirectoryName

$destinationPath = $projectDirectory + $addonRelativePath

# Get nuget package file
$packageFilePath = (Get-ChildItem $installPath -filter "*.nupkg" | Select-Object -first 1).FullName

# Open Zip file
[Reflection.Assembly]::LoadWithPartialName( "System.IO.Compression.FileSystem" )
$packageArchive = [System.IO.Compression.ZipFile]::OpenRead($packageFilePath)

# Find nuspec file in zip and extract it to destination path
$zippedNuspec = $packageArchive.Entries | Where-Object {$_.Name -match ".nuspec"} | Select-Object -first 1
$nuspecName = $zippedNuspec.Name
$destinationNuspecPath = "$destinationPath\$nuspecName"
$nuspecFileStream = New-Object IO.FileStream ($destinationNuspecPath) ,'Create','Write','Read'
$nuspecStream = $zippedNuspec.Open()
$nuspecStream.CopyTo($nuspecFileStream)
$nuspecStream.Close()
$nuspecFileStream.close()

# Add the add-on to the addon_registry
$addonsFolderPath = Split-Path $destinationPath
Add-Addon $addonsFolderPath $package.Id
