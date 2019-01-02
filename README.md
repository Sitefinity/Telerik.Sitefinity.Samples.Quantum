The Quantum sample project showcases all Sitefinity CMS features available out of the box in an aesthetically designed website. This starter kit is designed to help business users get up to speed quickly using Sitefinity CMS and gives developers a way to easily add custom features to it. The Quantum website is perfect for doing Sitefinity CMS demos to project stakeholders.

The main purpose of the Quantum project is to provide a real life example of how users can practically utilize the core features of Sitefinity CMS thus bringing value to organizations by empowering non-technical employees to quickly and efficiently manage their content.

The Quantum project is based on few principles:

• It involves minimum customization done by developers, so that the focus lies on the core features of the CMS 
• Pages are built and assembled with the goal to give maximum power to non-technical content editors 
• It provides styling best practices, so that designers can use it as a reference and styling example

Some of the main highlights of the Quantum project include:

- responsive design
- multilingual environment
- social media features
- personalization
- workflows
- email campaigns
- Google maps usage
- blogging
- forums
- usage of dynamic modules
- usage of add-ons
- full-blown online shop

### **Requirements**

- Sitefinity CMS license
- .NET Framework 4.7.1
- Visual Studio 2012
- Microsoft SQL Server 2008R2 or later versions
- Windows Identity Foundation NOTE: Depending on the Microsoft OS version you are using, the method for downloading and installing or enabling the identity framework differs:
  - **Windows 7**  - download from  Windows Identity Foundation : http://www.microsoft.com/en-us/download/details.aspx?id=17331
  - **Windows 8**  - in the Control Panel, turn on the relevant Windows feature Windows Identity Foundation 3.5

See a complete list of the system requirements for the solution here: http://docs.sitefinity.com/system-requirements.

### **Prerequisites**

Clear the NuGet cache files. To do this:

1. In Windows Explorer, open the  **%localappdata%\NuGet\Cache**  folder.
2. Select all files and delete them.

You need to attach the database backup files to your SQL Server. To do this:

1. Download the database backup file from: [here](https://sitefinitystore.blob.core.windows.net/files/Telerik.Sitefinity.Samples.Quantum/QuantumDB_v_112.zip)
2. Navigate to the _SitefinityWebApp_ -&gt; _App\_Data_ folder.
3. Unzip the  **QuantumDB.zip**  file.
4. In SQL Management Studio, open the context menu of _Databases_ and click _Attach..._
5. Click the _Add..._ button and navigate to the folder where you unzipped the  **QuantumDB.zip**  file.
6. Select the  **SitefinityQuantum.mdf**  file and click _OK_.
7. Click _OK_.

Powershell Execution Policy

Please make sure to set the appropriate  **Powershell**  execution policy in order to avoid build errors. To do this open your _Visual Studio_&#39;s _Package Manager Console_ and execute the following command:
Set-ExecutionPolicy RemoteSigned

### **Nuget package restoration**

The solution in this repository relies on NuGet packages with Nuget Package Restore enabled. Sitefinity&#39;s Nuget Repository and the instructions on how to add the Sitefinity NuGet server are available here : http://nuget.sitefinity.com/#/home.

For a full list of the referenced packages and their versions see the packages.config: https://github.com/Sitefinity-SDK/Telerik.Sitefinity.Samples.Quantum/blob/master/packages.config.
For a history and additional information related to package versions on different releases of this repository, see the Releases page: https://github.com/Sitefinity-SDK/Telerik.Sitefinity.Samples.Quantum/releases.

### **Installation instructions: SDK Samples from GitHub**

1. In Solution Explorer, navigate to _SitefinityWebApp_ -&gt; _App\_Data_ -&gt; _Sitefinity_ -&gt; _Configuration_ and select the  **DataConfig.config**  file.
2. Modify the  **connectionString**  value to match your server address.
3. Build the solution.

### **Login**

To login to the Sitefinity CMS backend, use the following credentials:

**Username:**  admin  **Password:**  admin@2

### **Sample Content**

To import the sample content for the web agency add-on, log into the backend, navigate to Administration-&gt;Add-ons, click on the WebAgency add-on and activate it. During the add-on activation check the _Import sample content and pages_ option, otherwise only the structures of the content items will be imported. You can read more about the Sitefinity add-ons here : http://docs.sitefinity.com/sitefinity-cms-add-ons. All content is imported under the main website in the installation, Quantum International. The add-on contains:

- Modules (dynamic modules built with the Module builder: http://docs.sitefinity.com/dynamic-modules)
  - Locations: used for listing offices, stores, etc. with their title, image, address, working hours, etc.
  - Showcases: used for listing different solutions with associated documents, images, links and additional information
  - Slides: used for building a rotator view of configurable slides with title, subtitle, background image, etc.
  - Testimonials: used for displaying quotes by clients, together with the author&#39;s photo, job title and company details
- Page Templates
  - Quantum: the main template, based on Bootstrap and used for most of the pages of the starter kit
  - Quantum Shop Sidebar: template used for most of the pages in the online store
  - Quantum Shop: template used for some of the pages in the online store section
  - Landing: used for a campaign page
  - Quantum-slider: used on the About us page, where content of varying types is rotated (a call-to-action, a news article and a testimonial)
- Classifications
  - Categories: default hierarchical list
  - Tags: default flat list
  - Departments: default hierarchical list
  - Services: custom flat list
  - Industries: custom flat list
- Forms
  - Request a quote: a standard form
  - Job application: a multipage form with 3 steps
  - Contact us: a standard form
  - Landing form: a standard form
- Custom fields
  - Pages
  - News
  - Blogs
  - Events
  - Libraries
  - Lists
- Web services
  - Locations: a service which exposes a single content type and its related media
  - Quantum Mobile: a service which exposes all content types
- Content items
  - Blogs/Blog posts: the blog posts are listed on the Blog page
  - Classification items: used for classifying different types of content
  - Calendars/Events: events from different calendars are listed and displayed in a calendar view on the Events page
  - Images/Image Libraries: used for building content items and associating thumbnails, etc.
  - Documents/Document Libraries: used on the Downloads page and for associating documents with other content items
  - Videos/Video Libraries: used on the home page as a background
  - Lists/List items: a list of the offered IT services is available on the home page
  - News: articles are listed both on the home page and on the dedicated news page
  - Pages
  - Location: locations are both listed and placed on Google Maps on the Contact us page
  - Showcase: you can view the sample showcase on the /services/development page
  - Slide: the rotator view of the slides is used on the home page
  - Testimonial: a testimonial is available on the home page

### **Frontend Package**

The design of the starter kit is based on the Bootstrap resource package(http://docs.sitefinity.com/feather-frontend-packages).
