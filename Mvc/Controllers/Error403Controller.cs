using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Telerik.Sitefinity.Modules.Pages.Configuration;
using Telerik.Sitefinity.Mvc;

namespace SitefinityWebApp.Mvc.Controllers
{

    [ControllerToolboxItem(Name = "Error403", Title = "403 Error", SectionName = "CustomErrorWidgets")]
    public class Error403Controller : Controller
    {
        public ActionResult Index()
        {
            Response.Status = "403 Forbidden";
            Response.StatusCode = 403;
            Response.StatusDescription = "Forbidden!";

            return View("Default");
        }
    }
}