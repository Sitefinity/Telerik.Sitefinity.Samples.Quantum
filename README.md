The Quantum sample project showcases all Sitefinity CMS features available out of the box in an aesthetically designed website. This starter kit is designed to help business users get up to speed quickly using Sitefinity CMS and gives developers a way to easily add custom features to it. The Quantum website is perfect for doing Sitefinity CMS demos to project stakeholders.

The main purpose of the Quantum project is to provide a real life example of how users can practically utilize the core features of Sitefinity CMS thus bringing value to organizations by empowering non-technical employees to quickly and efficiently manage their content.

The Quantum project is based on few principles:

• It involves minimum customization done by developers, so that the focus lies on the core features of the CMS 
• Pages are built and assembled with the goal to give maximum power to non-technical content editors 
• It provides styling best practices, so that designers can use it as a reference and styling example

Some of the main highlights of the Quantum project include:

- Responsive design
- Multilingual environment
- Social media features
- Personalization
- Workflows
- Email campaigns
- Google maps usage
- Blogs
- Forums
- Usage of dynamic modules
- Online shop

### **Requirements**

- Sitefinity CMS license
- .NET Framework 4.7.2
- Visual Studio 2015 or later
- Microsoft SQL Server 2012R2 or later versions
- Windows Identity Foundation NOTE: Depending on the Microsoft OS version you are using, the method for downloading and installing or enabling the identity framework differs:
  - **Windows 7**  - download from  Windows Identity Foundation : http://www.microsoft.com/en-us/download/details.aspx?id=17331
  - **Windows 8**  - in the Control Panel, turn on the relevant Windows feature Windows Identity Foundation 3.5

See a complete list of the system requirements for the solution here: http://docs.sitefinity.com/system-requirements.

### **Prerequisites**

You need to attach the database backup files to your SQL Server. To do this:

1. Download the database backup file from: [here](https://sitefinitystore.blob.core.windows.net/files/Telerik.Sitefinity.Samples.Quantum/QuantumDB_v_131.zip)
2. Navigate to the _SitefinityWebApp_ -&gt; _App\_Data_ folder.
3. Unzip the  **QuantumDB_version.zip**  file.
4. In SQL Management Studio, open the context menu of _Databases_ and click _Attach..._
5. Click the _Add..._ button and navigate to the folder where you unzipped the  **QuantumDB_version.zip**  file.
6. Select the  **Sitefinity.mdf**  file and click _OK_.
7. Click _OK_.

### **Nuget package restoration**

The solution in this repository relies on NuGet packages with Nuget Package Restore enabled. Sitefinity&#39;s Nuget Repository and the instructions on how to add the Sitefinity NuGet server are available here : http://nuget.sitefinity.com/#/home.

For a full list of the referenced packages and their versions see the packages.config: https://github.com/Sitefinity/Telerik.Sitefinity.Samples.Quantum/blob/master/packages.config.

### **Installation instructions:**

1. In Solution Explorer, navigate to _SitefinityWebApp_ -&gt; _App\_Data_ -&gt; _Sitefinity_ -&gt; _Configuration_ and select the  **DataConfig.config**  file.
2. Modify the  **connectionString**  value to match your server address.
3. Build the solution.

### **Login**

To login to the Sitefinity CMS backend, use the following credentials:

**Username:**  admin  **Password:**  admin@2

### **Frontend Package**

The design of the starter kit is based on the Bootstrap resource package(http://docs.sitefinity.com/feather-frontend-packages).
