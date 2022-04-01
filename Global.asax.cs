using System;
using System.Web;
using System.Web.Helpers;
using System.IO;
using System.Linq;
using Telerik.Sitefinity.Abstractions;

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
		}
	}
}
