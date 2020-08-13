using System;
using System.IO;
using System.Linq;
using Telerik.Sitefinity.Abstractions;

namespace SitefinityWebApp
{
	public class Global : System.Web.HttpApplication
	{
		protected void Application_Start(object sender, EventArgs e)
		{
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
