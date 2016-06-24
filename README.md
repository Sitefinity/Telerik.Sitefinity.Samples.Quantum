Progress.Sitefinity.Samples.Quantum
==================================

[![Build Status](http://sdk-jenkins-ci.cloudapp.net/buildStatus/icon?job=Telerik.Sitefinity.Samples.Quantum.CI)](http://sdk-jenkins-ci.cloudapp.net/job/Telerik.Sitefinity.Samples.Quantum.CI/)

The Quantum sample project showcases all Sitefinity CMS features available out of the box in a aestethically designed Quantum Portable Computers website. This starter kit is designed to help business users get up to speed quickly using Sitefinity CMS and gives developers a way to easily add custom features to it. The Quantum website is perfect for doing Sitefinity CMS demos to project stakeholders.


The main purpose of the Quantum project is to provide a real life example of how users can practically utilize the core features of Sitefinity CMS thus bringing value to organizations by empowering non-technical employees to quickly and efficiently manage their content.

The Quantum project is based on few principles:

•	It involves minimum customization done by developers, so that the focus lies on Telerik Sitefinity CMS core features
•	Pages are built and assembled with the goal to give maximum power to non-technical content editors
•	It provides styling best practices, so that designers can use it as a reference and styling example


Some of the main highlights of the Quantum project include:

* full-blown online shop
* multilingual environment
* usage of dynamic modules
* social media features
* personalization
* email campaigns
* responsive design
* Google maps usage
* blogging
* workflows
* forums

### Requirements

* Sitefinity CMS license
* .NET Framework 4
* Visual Studio 2012
* Microsoft SQL Server 2008R2 or later versions
* Windows Identity Foundation
   NOTE: Depending on the Microsoft OS version you are using, the method for downloading and installing or enabling the identity framework differs:

  * **Windows 7** - download from [Windows Identity Foundation](http://www.microsoft.com/en-us/download/details.aspx?id=17331)
  * **Windows 8** - in the Control Panel, turn on the relevant Windows feature Windows Identity Foundation 3.5



### Prerequisites

Clear the NuGet cache files. To do this:

1. In Windows Explorer, open the **%localappdata%\NuGet\Cache** folder.
2. Select all files and delete them.

You need to attach the database backup files to your SQL Server. To do this:

1. Navigate to the _SitefinityWebApp_ -> *App_Data* folder.
2. Unzip the **QuantumDB.zip** file.
2. In SQL Management Studio, open the context menu of _Databases_ and click _Attach..._
2. Click the _Add..._ button and navigate to the folder where you unzipped the **QuantumDB.zip** file.
3. Select the **SitefinityQuantum.mdf** file and click _OK_.
4. Click _OK_.

Powershell Execution Policy

Please make sure to set the appropriate __Powershell__ execution policy in order to avoid build errors. To do this open your _Visual Studio_'s _Package Manager Console_ and execute the following command:  
```Set-ExecutionPolicy RemoteSigned```

### Nuget package restoration
The solution in this repository relies on NuGet packages with automatic package restore while the build procedure takes place.   
For a full list of the referenced packages and their versions see the [packages.config](https://github.com/Sitefinity-SDK/Telerik.Sitefinity.Samples.Quantum/blob/master/packages.config) file.    
For a history and additional information related to package versions on different releases of this repository, see the [Releases page](https://github.com/Sitefinity-SDK/Telerik.Sitefinity.Samples.Quantum/releases).   


### Installation instructions: SDK Samples from GitHub


1. In Solution Explorer, navigate to _SitefinityWebApp_ -> *App_Data* -> _Sitefinity_ -> _Configuration_ and select the **DataConfig.config** file. 
2. Modify the **connectionString** value to match your server address.
3. Build the solution.


### Login

To login to the Sitefinity CMS backend, use the following credentials: 

**Username:** admin
**Password:** password
