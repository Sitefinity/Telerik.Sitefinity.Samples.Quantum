using System;
using System.Web;
using System.Web.Helpers;
using Telerik.Microsoft.Practices.Unity;
using Telerik.Sitefinity.Abstractions;
using Telerik.Sitefinity.Web.Services.Contracts.Operations;

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
            Bootstrapper.Bootstrapped += (sender, args) =>
            {
                ObjectFactory.Container.RegisterType(typeof(IOperationProvider), typeof(FormsOperationProvider), typeof(FormsOperationProvider).Name);
            };
        }
    }
}
