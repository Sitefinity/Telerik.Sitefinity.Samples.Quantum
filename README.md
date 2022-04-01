The Quantum sample project showcases all Sitefinity CMS features available out of the box in an aesthetically designed website. This starter kit is designed to help business users get up to speed quickly using Sitefinity CMS and gives developers a way to easily add custom features to it. The Quantum website is perfect for doing Sitefinity CMS demos to project stakeholders.

The main purpose of the Quantum project is to provide a real life example of how users can practically utilize the core features of Sitefinity CMS thus bringing value to organizations by empowering non-technical employees to quickly and efficiently manage their content.

The Quantum project is based on few principles:

- It involves minimum customization done by developers, so that the focus lies on the core features of the CMS 
- Pages are built and assembled with the goal to give maximum power to non-technical content editors 
- It provides styling best practices, so that designers can use it as a reference and styling example

Some of the main highlights of the Quantum project include:

- Responsive design
- Multilingual environment
- Usage of dynamic modules
- Native Chat https://www.progress.com/nativechat (Self-service, Smart Automation, Multichannel chat bot)
- Social media features
- Personalization
- Workflows
- Email campaigns
- Google maps usage
- Blogs
- Forums
- News


### **Requirements**

- Sitefinity CMS license
- .NET Framework 4.8
- Visual Studio 2015 or later
- Microsoft SQL Server 2012R2 or later versions
- Windows Identity Foundation NOTE: Depending on the Microsoft OS version you are using, the method for downloading and installing or enabling the identity framework differs:
  - **Windows 7**  - download from  Windows Identity Foundation : http://www.microsoft.com/en-us/download/details.aspx?id=17331
  - **Windows 8** and **Windows 10** - in the Control Panel, turn on the *Windows Identity Foundation 3.5* feature 

See a complete list of the system requirements for the solution here: http://docs.sitefinity.com/system-requirements.

### **Prerequisites**

You need to attach the database backup files to your SQL Server. To do this:

1. Download the database backup file from [here](https://sitefinitystore.blob.core.windows.net/files/Telerik.Sitefinity.Samples.Quantum/QuantumDB_v_1417800.zip). **If using the .NET Renderer, download the database backup file from [here](https://sitefinitystore.blob.core.windows.net/files/Telerik.Sitefinity.Samples.Quantum/QuantumDb_V141_NetRenderer.zip)**
2. Unzip the  **QuantumDB_version.zip**  file.
3. In SQL Management Studio, open the context menu of _Databases_ and click _Restore database..._
4. Locate the database backup file that was extracted in step 3 and proceed with the restoration of the database.
5. Click _OK_.

### **Nuget package restoration**

The solution in this repository relies on NuGet packages with Nuget Package Restore enabled. Sitefinity&#39;s Nuget Repository and the instructions on how to add the Sitefinity NuGet server are available here : http://nuget.sitefinity.com/#/home.

For a full list of the referenced packages and their versions see the packages.config: https://github.com/Sitefinity/Telerik.Sitefinity.Samples.Quantum/blob/master/packages.config.

### **Installation instructions:**

1. In Solution Explorer, navigate to _SitefinityWebApp_ -&gt; _App\_Data_ -&gt; _Sitefinity_ -&gt; _Configuration_ and select the  **DataConfig.config**  file.
2. Modify the  **connectionString**  value to match your server address.
3. Build the solution.

### **Login**

To login to the Sitefinity CMS backend, use the following credentials:

**Username:**  admin@test.test  **Password:**  admin@2

### **Frontend Package**

The design of the starter kit is based on the Bootstrap resource package(http://docs.sitefinity.com/feather-frontend-packages).

### **.NET Renderer Setup**

1. To setup [the .NET Renderer with the Quantum project](https://github.com/Sitefinity/sitefinity-aspnetcore-mvc-samples/tree/master/src/quantum) follow the [procedure for setup](https://www.progress.com/documentation/sitefinity-cms/setup-the-asp.net-core-renderer).
2. Download and restore the database as described in the section above(Prerequisites)
3. Change the name of the database in the connection string to SitefinityQuantumNetCore141.
4. Run the renderer and navigate to /quantum on the frontend or open it in the backend.
