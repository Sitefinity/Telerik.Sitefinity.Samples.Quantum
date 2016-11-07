using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using Telerik.Sitefinity;
using Telerik.Sitefinity.Modules.Pages;
using Telerik.Sitefinity.Security.Claims;
using Telerik.Sitefinity.Services;
using Telerik.Sitefinity.Security;

namespace SitefinityWebApp.Sitefinity.Primer
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            var currPrincipal = ClaimsManager.GetCurrentPrincipal();
            if (!UserManager.GetManager().GetUser(currPrincipal.Identity.Name).IsBackendUser || !currPrincipal.Identity.IsAuthenticated)
            {
                Response.Redirect("~/", true);
            }
            if (Request.QueryString["prime"] == null || Request.QueryString["reloadevery"] == null || Request.QueryString["timerenabled"] == null)
            {
                //If these are not in the querystring redirect over
                Response.Redirect("~/Sitefinity/Primer/?prime=pages&reloadevery=30000&timerenabled=false");
            }

            if (Request.QueryString["prime"] != null)
            {
                var text = String.Empty;

                foreach (var item in Request.QueryString["prime"].Split(','))
                {
                    text += String.Format("'{0}',", item.Trim().ToLower());
                }

                clientStateLiteral.Text = String.Format("{0}", text);
            }

            enableTimerLiteral.Text = Request.QueryString["timerenabled"];
            intervalLiteral.Text = Request.QueryString["reloadevery"].Replace("ms", "").Replace("MS", "");
            this.GetPages();

        }

        public void GetPages()
        {
            PageManager pManager = PageManager.GetManager();

            var pageSource = App.WorkWith()
                            .Pages()
                            .Where(p => p.IsBackend == false).Where(p => p.NodeType == Telerik.Sitefinity.Pages.Model.NodeType.Standard).ThatArePublished().Get().GroupBy(p => p.GetFullUrl()).Select(p => p.First());

            var pages = pageSource.Select(x => new SimplePageItem()
                            {
                                name = x.Title,
                            	url = x.GetFullUrl().Replace("~",""),
                                status = 0
                            }).ToArray();

            pagesStateLiteral.Text = Newtonsoft.Json.JsonConvert.SerializeObject(pages.OrderBy(x => x.url));
        }
    }

    public class SimplePageItem
    {
        public string name { get; set; }
        public string url { get; set; }
        public int status { get; set; }
    }
}