using System.Web;
using Telerik.Microsoft.Practices.Unity;
using Telerik.Sitefinity.Abstractions;
using Telerik.Sitefinity.Frontend.Mvc.Infrastructure.Routing;
using Telerik.Sitefinity.Mvc;
using Telerik.Sitefinity.Services;

namespace SitefinityWebApp
{
    public class FeatherActionInvokerCustom : FeatherActionInvoker
    {
        protected override void RestoreHttpContext(string output, HttpContext initialContext)
        {
            this.PopulateResponseStatus(System.Web.HttpContext.Current, initialContext);

            base.RestoreHttpContext(output, initialContext);
        }

        private void PopulateResponseStatus(HttpContext httpContext, HttpContext initialContext)
        {

            if (!SystemManager.IsDesignMode && httpContext.Response.StatusCode != 200)
            {
                initialContext.Response.Status = httpContext.Response.Status;
                initialContext.Response.StatusCode = httpContext.Response.StatusCode;
                initialContext.Response.StatusDescription = httpContext.Response.StatusDescription;
            }
        }

        internal static void Register()
        {
            ObjectFactory.Container.RegisterType<IControllerActionInvoker, FeatherActionInvokerCustom>();
        }
    }
}