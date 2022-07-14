using System;
using System.IO;
using System.Net;
using System.Web;
using System.Web.Helpers;
using System.Linq;
using Telerik.Microsoft.Practices.Unity;
using Telerik.Sitefinity.Abstractions;
using Telerik.Sitefinity.Frontend.Mvc.Infrastructure.Routing;
using Telerik.Sitefinity.Modules.Pages;
using Telerik.Sitefinity.Mvc;
using Telerik.Sitefinity.Services;
using Telerik.Sitefinity.Web.Services;
using System.Threading.Tasks;
using Telerik.Sitefinity.Data;
using Telerik.Sitefinity.Web;

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

            Task.Run(() =>
            {
                SystemManager.RunWithElevatedPrivilege(x =>
                {
                    var pageManager = PageManager.GetManager();

                    var pageNode = pageManager.GetPageNode(SiteInitializer.BackendRootNodeId);

                    if (pageNode != null && pageNode.DateCreated.Year < DateTime.UtcNow.Year)
                    {
                        pageNode.DateCreated = DateTime.UtcNow;

                        pageManager.SaveChanges();
                    }
                });
            });
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

            response.Write(watermarkHtml);
        }

        private readonly string watermarkHtml =
@"<style>
    .sfWatermark {
        font-family: 'Open Sans Regular';
        font-size: 16px;
        color: #000000;
        text-align: center;
        border: #FFD000;
        background-color: #FFD000;
        height: 45px;
		line-height: 45px;
        position: fixed;
        top: 0px;
        width: 100%;
    } 
    header {
        margin-top:45px;
    }
</style>
<div class='sfWatermark'>
    This is a demo site. All content and functionalities are for demo purposes only. Do not trust your personal data.
</div>";
    }
}
