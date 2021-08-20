Add-Type @"
    /// <summary>
    /// Represents installed add-ons registry information
    /// </summary>
    public class AddonRegistryItem
    {
        /// <summary>
        /// Gets or sets the name of the addon.
        /// </summary>
        /// <value>The name of the addon.</value>
        public string AddonName { get; set; }

        /// <summary>
        /// Gets or sets the key.
        /// </summary>
        /// <value>The key.</value>
        public string Key { get; set; }

        /// <summary>
        /// Gets or sets a value indicating whether the add-on is deleted
        /// </summary>
        /// <value>The is deleted state.</value>
        public bool IsDeleted { get; set; }
    }
"@

function Add-Addon([string] $addonsFolderPath, [string] $addonName)
{
	If(!(Test-Path $addonsFolderPath))
	{
		New-Item -ItemType Directory -Force -Path $addonsFolderPath
	}

	$addonsRegistryFilePath = Join-Path -Path $addonsFolderPath -ChildPath "addons_registry.sf"
	if (!(Test-Path $addonsRegistryFilePath))
	{
		New-Item -ItemType "file" -Path $addonsRegistryFilePath 
	}

	[AddonRegistryItem[]] $currentContent = (Get-Content $addonsRegistryFilePath) -Join "`n" | ConvertFrom-Json
	if ($currentContent -eq $null)
	{
		$currentContent = @()
	}

	[AddonRegistryItem] $currentItem = $currentContent | Where-Object {($_.AddonName -eq $addonName)} | Select-Object -first 1
	if ($currentItem -eq $null)
	{
		$currentItem = New-Object AddonRegistryItem
		$currentItem.AddonName = $addonName
		$currentItem.IsDeleted = $false
		$currentItem.Key = [guid]::NewGuid().ToString()
		$currentContent += $currentItem
	}
	elseif ($currentItem.IsDeleted -eq $true)
	{
		$currentItem.IsDeleted = $false
		$currentItem.Key = [guid]::NewGuid().ToString()
	}

	$jsonContent = ConvertTo-Json $currentContent

	Set-Content -Path $addonsRegistryFilePath -Value $jsonContent
}

function Remove-Addon([string] $addonsFolderPath, [string] $addonName)
{
	$addonsRegistryFilePath = Join-Path -Path $addonsFolderPath -ChildPath "addons_registry.sf"
	if (Test-Path $addonsRegistryFilePath)
	{
		[AddonRegistryItem[]] $currentContent = (Get-Content $addonsRegistryFilePath) -Join "`n" | ConvertFrom-Json
		if ($currentContent -ne $null) {
			[AddonRegistryItem] $currentItem = $currentContent | Where-Object {($_.AddonName -eq $addonName) -and ($_.IsDeleted -eq $false)} | Select-Object -first 1
			if ($currentItem -ne $null){
				$currentItem.IsDeleted = $true
				$jsonContent = ConvertTo-Json $currentContent
				Set-Content -Path $addonsRegistryFilePath -Value $jsonContent
			}
		}
	}	
}