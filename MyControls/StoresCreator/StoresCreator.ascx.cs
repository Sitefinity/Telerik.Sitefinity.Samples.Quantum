using System;
using System.Globalization;
using System.Linq;
using System.Threading;
using Telerik.Sitefinity;
using Telerik.Sitefinity.DynamicModules;
using Telerik.Sitefinity.DynamicModules.Model;
using Telerik.Sitefinity.Model;
using Telerik.Sitefinity.Modules.Libraries;
using Telerik.Sitefinity.Security;
using Telerik.Sitefinity.Utilities.TypeConverters;
using Telerik.Sitefinity.Lifecycle;

namespace SitefinityWebApp.MyControls.StoresCreator
{
    public partial class StoresCreator : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public void CreateStore(string storeName, string street, string zip, string city, string countryCode, string stateCode, double latitude, double longitude, int mapZoomLevel, string urlName, string phone, string imageTitle)
        {
            // Set the provider name for the DynamicModuleManager here. All available providers are listed in
            // Administration -> Settings -> Advanced -> DynamicModules -> Providers
            var providerName = String.Empty;

            // Set the culture name for the multilingual fields
            var cultureName = "en";
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(cultureName);

            DynamicModuleManager dynamicModuleManager = DynamicModuleManager.GetManager(providerName);
            Type shopType = TypeResolutionService.ResolveType("Telerik.Sitefinity.DynamicTypes.Model.Stores.Store");
            DynamicContent shopItem = dynamicModuleManager.CreateDataItem(shopType);

            // This is how values for the properties are set
            shopItem.SetString("Title", storeName, cultureName);
            
            LibrariesManager libraryManager = LibrariesManager.GetManager();
            var image = libraryManager.GetImages().FirstOrDefault(i => i.Status == Telerik.Sitefinity.GenericContent.Model.ContentLifecycleStatus.Live && i.Title == imageTitle);
            if (image != null)
            {
                shopItem.AddImage("StoreImage", image.Id);
            }

            Telerik.Sitefinity.GeoLocations.Model.Address myAddress = new Telerik.Sitefinity.GeoLocations.Model.Address();
            myAddress.City = city;
            myAddress.CountryCode = countryCode;
            myAddress.StateCode = stateCode;
            myAddress.MapZoomLevel = mapZoomLevel;
            myAddress.Latitude = latitude;
            myAddress.Longitude = longitude;
            myAddress.Street = street;
            myAddress.Zip = zip;

            shopItem.SetValue("Address", myAddress);

            shopItem.SetString("UrlName", urlName, cultureName);
            shopItem.SetString("Phone", phone, cultureName);
            shopItem.SetValue("Owner", SecurityManager.GetCurrentUserId());
            shopItem.SetValue("PublicationDate", DateTime.Now);

            ILifecycleDataItem publishedFrontendContentItem = dynamicModuleManager.Lifecycle.Publish(shopItem);
            shopItem.SetWorkflowStatus(dynamicModuleManager.Provider.ApplicationName, "Published");

            dynamicModuleManager.SaveChanges();
        }

        protected void createBtn_Click(object sender, EventArgs e)
        {
            CreateStore("Quantum Cambridge East", "89 Hancock St", "02139", "Cambridge", "US", "MA", 42.368961, -71.10835099999997, 13, "quantum-cambridge-east", "+1-888-365-2779", "store1");
            CreateStore("Quantum Chicago", "180-182 W Randolph St", "60601", "Chicago", "US", "IL", 41.8845025, -87.63345779999997, 13, "quantum-chicago", "+1-888-365-2779", "store2");
            CreateStore("Quantum Benton Harbor", "772-788 Nate Wells Sr Dr", "49022", "Benton Harbor", "US", "MI", 42.112389, -86.43958399999997, 13, "quantum-benton-harbor", "+1-617-249-2116", "store3");
            CreateStore("Quantum New Lenox", "811 Buckboard Dr", "60451", "New Lenox", "US", "IL", 41.536262, -87.950378, 13, "quantum-new-lenox", "+1-617-249-2116", "store4");
            CreateStore("Quantum Weymouth", "57-65 Center St", "02188", "Weymouth", "US", "MA", 42.219018, -70.937927, 13, "quantum-weymouth", "+1-512-722-7748", "store5");
            CreateStore("Quantum Medford", "2-98 Garden St", "02155", "Medford", "US", "MA", 42.4190832, -71.10622360000002, 13, "quantum-medford", "+1-888-365-2779", "store1");
            CreateStore("Quantum Houston West", "15226 Paseo Del Rey Dr", "77083", "Houston", "US", "TX", 29.704375, -95.65661, 13, "quantum-houston-west", "+1-512-722-7748", "store2");
            CreateStore("Quantum Austin", "1111-1307 Smith Rd", "78721", "Chicago", "US", "TX", 30.2558919, -97.6780761, 13, "quantum-austin", "+1-512-535-2428", "store3");
            CreateStore("Quantum Cambridge West", "12-24 Gibson St", "02138", "Cambridge", "US", "MA", 42.3754764, -71.13272059999997, 13, "quantum-cambridge-west", "+1-888-365-2779", "store4");
            CreateStore("Quantum Houston East", "7522 Crofton St", "77028", "Houston", "US", "TX", 29.844184, -95.29276399999998, 13, "quantum-houston-east", "+1-34234-342-444", "store5");
            CreateStore("Quantum Palo Alto", "1701-1715 Cowper St", "94301", "Palo Alto", "US", "CA", 37.438671, -122.143916, 13, "quantum-palo-alto", "+1-888-365-2779", "store1");
            CreateStore("Quantum San Francisco", "551 Goettingen St", "94134", "San Francisco", "US", "CA", 37.725142, -122.40577, 13, "quantum-san-francisco", "+1-888-365-2779", "store2");
            CreateStore("Quantum San Jose", "279-299 E Santa Clara St", "95112", "San Jose", "US", "CA", 37.33908, -121.884606, 13, "quantum-san-jose", "+1-888-365-2779", "store3");
            CreateStore("Quantum Seattle", "213 Marion St", "98104", "Seattle", "US", "WA", 47.604702, -122.333754, 13, "quantum-seattle", "+1-888-365-2779", "store4");
            CreateStore("Quantum Portland", "2129 NW Northrup St", "97210", "Portland", "US", "OR", 45.531305, -122.695295, 13, "quantum-portland", "+1-888-365-2779", "store4");
            CreateStore("Quantum Los Angeles West", "3611 W 30th St", "90018", "Los Angeles", "US", "CA", 34.027695, -118.333404, 13, "quantum-los-angeles-west", "+1-888-365-2779", "store5");
            CreateStore("Quantum Los Angeles East", "3591-3599 E 1st St", "90063", "Los Angeles", "US", "CA", 34.036017, -118.189291, 13, "quantum-los-angeles-east", "+1-888-365-2779", "store1");
            CreateStore("Quantum Las Vegas", "641 Northrop Ave", "89119", "Las Vegas", "US", "NV", 36.118906, -115.148587, 13, "quantum-las-vegas", "+1-888-365-2779", "store2");
            CreateStore("Quantum Phoenix", "505 E Buckeye Rd", "85004", "Phoenix", "US", "AZ", 33.436813, -112.066966, 13, "quantum-phoenix", "+1-888-365-2779", "store3");
            CreateStore("Quantum Miami", "23 NE 46th St", "33137", "Miami", "US", "FL", 25.817779, -80.195096, 13, "quantum-miami", "+1-888-365-2779", "store4");
            CreateStore("Quantum New Orleans", "201-249 Lasalle St", "70112", "New Orleans", "US", "LA", 29.956459, -90.0762, 13, "quantum-new-orleans", "+1-888-365-2779", "store5");
            CreateStore("Quantum Atlanta", "100-164 Currier St NE", "30308", "Atlanta", "US", "GA", 33.765538, -84.383351, 13, "quantum-atlanta", "+1-888-365-2779", "store1");
            CreateStore("Quantum New York Manhattan", "Park Avenue Plaza", "10022", "New York", "US", "NY", 40.759318, -73.973529, 13, "quantum-new-york", "+1-888-365-2779", "store2");
            CreateStore("Quantum Fresh Meadows", "183-0-183-98 75th Ave", "11366", "Fresh Meadows", "US", "NY", 40.730137, -73.786393, 13, "quantum-fresh-meadows", "+1-888-365-2779", "store3");
            CreateStore("Quantum Bronx", "2767 Morgan Ave", "10469", "Bronx", "US", "NY", 40.867185, -73.845252, 13, "quantum-bronx", "+1-888-365-2779", "store4");
            CreateStore("Quantum Philadelphia", "931-999 Cherry St", "19107", "Philadelphia", "US", "PA", 39.954425, -75.15567, 13, "quantum-Philadelphia", "+1-888-365-2779", "store5");
            CreateStore("Quantum Jacksonville", "617 Jessie St", "32206", "Jacksonville", "US", "FL", 30.333546, -81.645076, 13, "quantum-jacksonville", "+1-888-365-2779", "store1");
            CreateStore("Quantum Richmond", "516 N 2nd St", "23219", "Richmond", "US", "VA", 37.546789, -77.438039, 13, "quantum-richmond", "+1-888-365-2779", "store2");
            CreateStore("Quantum Cleveland", "3628 Community College Ave", "44115", "Cleveland", "US", "OH", 41.493503, -81.662325, 13, "quantum-cleveland", "+1-888-365-2779", "store3");
            CreateStore("Quantum San Antonio West", "800-898 Wall St", "78237", "San Antonio", "US", "TX", 29.420722, -98.560803, 13, "quantum-san-antonio-west", "+1-888-365-2779", "store4");
            CreateStore("Quantum San Antonio East", "325 Maryland St", "78203", "San Antonio", "US", "TX", 29.41676, -98.450511, 13, "quantum-san-antonio-east", "+1-888-365-2779", "store5");
            CreateStore("Quantum San Diego West", "1201-1225 W Brookes Ave", "92103", "San Diego", "US", "CA", 32.743068, -117.174518, 13, "quantum-san-diego-west", "+1-888-365-2779", "store1");
            CreateStore("Quantum San Diego East", "4220 51st St", "92115", "San Diego", "US", "CA", 32.753499, -117.084739, 13, "quantum-san-diego-east", "+1-888-365-2779", "store2");
            CreateStore("Quantum Dallas", "2913-2929 Main St", "75226", "Dallas", "US", "TX", 32.784343, -96.78142, 13, "quantum-dallas", "+1-888-365-2779", "store3");

        }
    }
}