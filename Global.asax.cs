using System;
using System.IO;
using System.Net;
using System.Web;
using System.Web.Helpers;
using Telerik.Microsoft.Practices.Unity;
using Telerik.Sitefinity.Abstractions;
using Telerik.Sitefinity.Frontend.Mvc.Infrastructure.Routing;
using Telerik.Sitefinity.Mvc;
using Telerik.Sitefinity.Services;
using Telerik.Sitefinity.Web.Services;

namespace SitefinityWebApp
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            HttpContext.Current.Response.AddHeader("X-Frame-Options", "SAMEORIGIN");
        }

        protected void Application_Start()
        {
            AntiForgeryConfig.SuppressXFrameOptionsHeader = true;

            Bootstrapper.Bootstrapped += Bootstrapper_Bootstrapped;
        }

        private void Bootstrapper_Bootstrapped(object sender, EventArgs e)
        {
            EventHub.Subscribe<RequestEndEvent>(this.RequestEnd);
        }

        private void RequestEnd(RequestEndEvent @event)
        {
            var response = SystemManager.CurrentHttpContext?.Response;

            if (null == response || response.HeadersWritten)
                return;

            if (response.StatusCode != (int)HttpStatusCode.OK)
                return;

            if (bool.Parse(SystemManager.CurrentHttpContext.Items[SystemManager.IsBackendRequestKey].ToString()))
                return;

            if (!response.ContentType.StartsWith("text/html"))
                return;

            var watermarkFileLocation = SystemManager.CurrentHttpContext.Server.MapPath(WatermarkFileName);
            if (File.Exists(watermarkFileLocation))
            {
                ServiceUtility.DisableCache();

                string watermarkHtml = null;
                using (var stream = File.OpenRead(watermarkFileLocation))
                {
                    using (StreamReader reader = new StreamReader(stream, true))
                        watermarkHtml = reader.ReadToEnd();
                }

                response.Write(watermarkHtml);
            }
        }

        private readonly string WatermarkFileName = "~/App_Data/Sitefinity/WebsiteTemplates/Widgets/Watermark.sfhtml";
    }
}
