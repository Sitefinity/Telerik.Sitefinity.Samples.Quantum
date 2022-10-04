using System;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Helpers;
using Telerik.Sitefinity.Abstractions;
using Telerik.Sitefinity.Modules.Pages;
using Telerik.Sitefinity.Services;

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
			//NOTE: It is not recommended you do this in production as it will block the website loading
			var indexDir = System.Web.Hosting.HostingEnvironment.MapPath("~/App_Data/Ucommerce/Indexes");

			if (Directory.Exists(indexDir) && Directory.GetFiles(indexDir).Any()) return;

			var scratchIndexer = Ucommerce.Infrastructure.ObjectFactory.Instance.Resolve<Ucommerce.Search.Indexers.IScratchIndexer>();
			scratchIndexer.Index();
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

            if (response.Headers["Content-Type"] == null || !response.Headers["Content-Type"].StartsWith("text/html"))
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
