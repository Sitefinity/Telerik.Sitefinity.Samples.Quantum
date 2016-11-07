using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Telerik.Sitefinity.Modules.Pages.Configuration;
using Telerik.Sitefinity.Mvc;

namespace SitefinityWebApp.Mvc.Controllers
{

    [ControllerToolboxItem(Name = "Error500", Title = "500 Error", SectionName = "CustomErrorWidgets")]
    public class Error500Controller : Controller
    {
        public ActionResult Index()
        {
            Response.Status = "500 Internal server error";
            Response.StatusCode = 500;
            Response.StatusDescription = "Internal server error!";

            return View("Default");
        }
    }
}