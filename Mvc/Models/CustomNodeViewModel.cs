using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Sitefinity.Frontend.Navigation.Mvc.Models;
using Telerik.Sitefinity.Model;
using Telerik.Sitefinity.Web;
using Telerik.Sitefinity.Libraries.Model;

namespace SitefinityWebApp.Mvc.Models
{
    public class CustomNodeViewModel : NodeViewModel
    {
        public CustomNodeViewModel()
            : base()
        {
            this.description = this.GetDescription();
            this.image = this.GetImage();
        }

        public CustomNodeViewModel(SiteMapNode node, string url, string target, bool isCurrentlyOpened, bool hasChildOpen)
            : base(node, url, target, isCurrentlyOpened, hasChildOpen)
        {
            this.description = this.GetDescription();
            this.image = this.GetImage();
        }

        public string Description
        {
            get
            {
                return this.description;
            }
        }

        public Image Image
        {
            get
            {
                return this.image;
            }
        }


        private string GetDescription()
        {
            var pageNode = this.OriginalSiteMapNode as PageSiteNode;
            if (pageNode != null)
            {
                return pageNode.Description ?? string.Empty;
            }
            else
            {
                return string.Empty;
            }
        }

        private Image GetImage()
        {
            var pageNode = this.OriginalSiteMapNode as PageSiteNode;            
            if (pageNode != null)
            {
                var imageField = pageNode.GetCustomFieldValue("Image");
                return imageField!=null ? (Image)imageField : null;
            }
            else
            {
                return null;
            }
        }

        private readonly string description;
        private readonly Image image;
    }
}