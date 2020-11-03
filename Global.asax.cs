using System;
using System.Web;
using System.Web.Helpers;
using Telerik.Microsoft.Practices.Unity;
using System.IO;
using System.Linq;
using Telerik.Sitefinity.Abstractions;
using Telerik.Sitefinity.Frontend.Mvc.Infrastructure.Routing;
using Telerik.Sitefinity.Mvc;
using Telerik.Sitefinity.Services;

namespace SitefinityWebApp
{
	public class Global : System.Web.HttpApplication
	{
        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            HttpContext.Current.Response.AddHeader("X-Frame-Options", "SAMEORIGIN");
        }

		protected void Application_Start(object sender, EventArgs e)
		{
        	AntiForgeryConfig.SuppressXFrameOptionsHeader = true;
			Bootstrapper.Bootstrapped += Bootstrapper_Bootstrapped;
		}

		private void Bootstrapper_Bootstrapped(object sender, EventArgs e)
		{
			// NOTE: It is not recommended you do this in production as it will block the website loading
			var ravenDir = System.Web.Hosting.HostingEnvironment.MapPath("~/App_Data/RavenDatabases/uCommerce");

			if (Directory.Exists(ravenDir) && Directory.GetFiles(ravenDir).Any()) return;

			var scratchIndexer = Ucommerce.Infrastructure.ObjectFactory.Instance.Resolve<Ucommerce.Search.Indexers.IScratchIndexer>();
			scratchIndexer.Index();
		}
	}
}
