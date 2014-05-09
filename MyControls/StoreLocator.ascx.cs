using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Text;
using System.Net;
using System.IO;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Telerik.Sitefinity.Security;



namespace SitefinityWebApp.MyControls
{
    public partial class StoreLocator : System.Web.UI.UserControl
    {
        private static string visitorUsername = "frontenduser";
        private static string visitorPassword = "password";

        private string GetStores(double lat, double lng)
        {

            Uri uri = HttpContext.Current.Request.Url;
            String host = uri.Scheme + Uri.SchemeDelimiter + uri.Host;
            if (!uri.Port.Equals(String.Empty))
            {
                host += ":" + uri.Port;
            }
            StringBuilder requestUrl = new StringBuilder();
            requestUrl.Append(host);
            requestUrl.Append("/sitefinity/frontend/services/DynamicModules/Data.svc/live/?");
            requestUrl.Append("provider=");
            requestUrl.Append("&itemType=Telerik.Sitefinity.DynamicTypes.Model.Stores.Store");
            requestUrl.Append("&radius=150");
            requestUrl.Append("&latitude="); requestUrl.Append(lat);
            requestUrl.Append("&longitude="); requestUrl.Append(lng);
            requestUrl.Append("&geoLocationProperty=address");
            requestUrl.Append("&sortExpression=Distance%20ASC");
            if (SecurityManager.GetCurrentUserName().Equals("Anonymous"))
            {
                SecurityManager.AuthenticateUser("Default", visitorUsername, visitorPassword, true);
            }
            var abstractContext = new System.Web.HttpContextWrapper(System.Web.HttpContext.Current);
            SecurityManager.UpdateCookies(abstractContext);
            var cookieCollection = abstractContext.Response.Cookies;

            HttpWebRequest getStores = (HttpWebRequest)WebRequest.Create(requestUrl.ToString());

            CookieContainer cookieJar = new CookieContainer();
            foreach (string cookieKey in cookieCollection.AllKeys)
            {
                HttpCookie oCookie = cookieCollection.Get(cookieKey);
                Cookie oC = new Cookie();

                oC.Domain = uri.Host;
                oC.Expires = oCookie.Expires;
                oC.Name = oCookie.Name;
                oC.Path = oCookie.Path;
                oC.Secure = oCookie.Secure;
                oC.Value = oCookie.Value;

                cookieJar.Add(oC);
            }
            getStores.CookieContainer = cookieJar;
            getStores.Method = "GET";

            HttpWebResponse response = (HttpWebResponse)getStores.GetResponse();
            using (Stream stream = response.GetResponseStream())
            {
                string storesResponse = new StreamReader(stream).ReadToEnd();
                if (SecurityManager.GetCurrentUserName().Equals(visitorUsername))
                {
                    SecurityManager.Logout();
                    SecurityManager.DeleteAuthCookies();
                }
                return storesResponse;
            }
        }

        private void ParseStores(string response)
        {
            StringBuilder builder = new StringBuilder();
            int i = 0;
            //char orderLetter = (char)65;
            foreach (var item in JObject.Parse(response)["Items"])
            {



                string itemUrl = ((JProperty)item["UrlName"].First).Value.ToString();
                string linkToFullItemFromatted = String.Format("<a href={0}/stores/{1}>View Store Details</a>", HttpContext.Current.Request.Url.AbsoluteUri, itemUrl);
                string linkToFullItem = String.Format("{0}/stores/{1}", HttpContext.Current.Request.Url.AbsoluteUri, itemUrl);

                string storeName = ((JProperty)item["Title"].First).Value.ToString();
                string storeLat = ((JValue)item["Address"]["Latitude"]).Value.ToString();
                string storeLng = ((JValue)item["Address"]["Longitude"]).Value.ToString();

                var addressForInfoWindow = ((JValue)item["Address"]["Street"]).Value.ToString() + "<br>" +
                                           ((JValue)item["Address"]["City"]).Value.ToString() + ", " +
                                           ((JValue)item["Address"]["StateCode"]).Value.ToString() + " " +
                                           ((JValue)item["Address"]["Zip"]).Value.ToString();

                string imageLink = "";
                try
                {
                    if (item["StoreImage"].Any())
                        imageLink = item["StoreImage"].First["ChildItemAdditionalInfo"].ToString();
                }
                catch { }

                string comment = "<div id=\"comment-wrapper\"><div id=\"comment-img\"><img src=\"" + imageLink + "\" height=\"60\" width=\"80\"></img></div><div id=\"comment-meta\"><strong>" + storeName + "</strong><br>" + addressForInfoWindow + "<br><br>" + linkToFullItemFromatted + "</div></div>";


                builder.Append(String.Format("showAddress('{0}', '{1}', '{2}', '{3}', '{4}'); ", storeName, storeLat, storeLng, comment, (char)(65 + i)));


                string labelText = String.Format("<li onclick=\"changeBckgr(this);\" class=\"sfstoreitem sfClearfix\"><h4 class=\"sfitemTitle\"><a>{0}</a><img class=\"map-marker\" src=\"http://www.google.com/mapfiles/marker{1}.png\"></img></h4><div id=\"storeAddress\">{2}<br><a href=\"{3}\">View Store Details</a></div></li>", storeName, (char)(65 + i), addressForInfoWindow, linkToFullItem);

                Label lbl = new Label();
                lbl.ID = "Label" + i;
                lbl.Text = labelText;
                lbl.Attributes.Add("onclick", "myclick(" + i + ");");
                lbl.Attributes.Add("onmouseover", "myhover(" + i + ");");
                lbl.Attributes.Add("onmouseout", "mymouseout(" + i + ");");

                this.Panel1.Controls.Add(lbl);
                i++;
            }

            showAddress = builder.ToString();
            DataBind();
        }

        private KeyValuePair<double, double> GetLocation()
        {
            string url = "http://maps.googleapis.com/maps/api/geocode/" +
                    "json?address=" + tbZip.Text + "&sensor=false";

            double latCurrent = 0;
            double lngCurrent = 0;

            WebResponse response = null;
            try
            {
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
                request.Method = "GET";
                response = request.GetResponse();
                if (response != null)
                {
                    string str = null;
                    using (Stream stream = response.GetResponseStream())
                    {
                        using (StreamReader streamReader = new StreamReader(stream))
                        {
                            str = streamReader.ReadToEnd();
                        }
                    }

                    GeoResponse geoResponse = JsonConvert.DeserializeObject<GeoResponse>(str);

                    if (geoResponse.Status == "OK")
                    {
                        latCurrent = Double.Parse(geoResponse.Results[0].Geometry.Location.Lat.ToString());
                        lngCurrent = Double.Parse(geoResponse.Results[0].Geometry.Location.Lng.ToString());
                    }
                    else
                    {
                        Console.WriteLine("JSON response failed, status is '{0}'", geoResponse.Status);
                    }
                }
            }
            catch (Exception ex)
            {
            }
            finally
            {
                if (response != null)
                {
                    response.Close();
                    response = null;
                }
            }

            return new KeyValuePair<double, double>(latCurrent, lngCurrent);
        }

        protected void tbZip_TextChanged(object sender, EventArgs e)
        {
            double lat = GetLocation().Key;
            double lon = GetLocation().Value;
            var stores = GetStores(lat, lon);
            ParseStores(stores);

        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
        public string showAddress;

    }

    //Helper Classes
    public class GeoGeometry
    {
        public GeoLocation Location { get; set; }
    }

    public class GeoLocation
    {
        public decimal Lat { get; set; }
        public decimal Lng { get; set; }
    }

    public class GeoResponse
    {
        public string Status { get; set; }
        public GeoResult[] Results { get; set; }
    }

    public class GeoResult
    {
        public GeoGeometry Geometry { get; set; }
    }
}