<%@ Control Language="C#" %>
<%@ Register Assembly="Telerik.Sitefinity" TagPrefix="sf" Namespace="Telerik.Sitefinity.Web.UI" %>
<%@ Register Assembly="Telerik.Sitefinity.Dashboard" TagPrefix="sitefinity" Namespace="Telerik.Sitefinity.Web.UI" %>
<%@ Register Assembly="Telerik.Sitefinity" TagPrefix="lic" Namespace="Telerik.Sitefinity.Licensing.Web.UI" %>

<sf:ResourceLinks ID="resourcesLinks" runat="server">
    <sf:ResourceFile JavaScriptLibrary="JQuery"></sf:ResourceFile>
    <sf:ResourceFile Name="Styles/Ajax.css" />
    <sf:ResourceFile Name="Styles/Dashboard.css" />
</sf:ResourceLinks>

<lic:LicenseExpirationWidget runat="server" ID="LicenseExpirationWidget" />

<div id="newContentEditingAnnouncement" class="sfDashboardNewThemeWidgetWrp sfDashboardWidgetWrp">
    <h2 class="sfBlack"><asp:Literal ID="newContentEditingLblTitle" runat="server" Text="<%$ Resources: DashboardResources, NewContentEditingWidgetTitle %>" /></h2>
    <div class="sfDashboardNewThemeWidgetColsWrp sfClearfix">
        <div class="sfDashColLeft40 sfMTop20">
            <asp:Image ImageUrl="~/SFRes/images/Telerik.Sitefinity.Resources/Images.NewContentEditingAnnouncement.png" id="Image1" runat="server" AlternateText="New content editing preview screenshot" />
        </div>
        <sf:SitefinityLabel ID="SitefinityLabel2" WrapperTagName="div" CssClass="sfMTop20 sfDashColRight60" runat="server" Text="<%$ Resources: DashboardResources, NewContentEditingWidgetDescription %>" />
    </div>

    <div class="sfSep">
        <sf:SitefinityHyperLink  CssClass=" sfGoto" Target="_blank" Text="<%$ Resources: DashboardResources, NewContentEditingLinkLabel %>" NavigateUrl="<%$ Resources: DashboardResources, ExternalLinkSitefinityNewContentEditing %>" runat="server" />
    </div>

    <a href="javascript:void(0);" class="sfXItm" title="Close">Close</a>
</div>

<script type="text/javascript">
    jQuery(document).ready(
        function () {
            var cookie = jQuery.cookie("newContentEditingNotificationHidden");
            var newContentEditingWidget = jQuery("#newContentEditingAnnouncement");
            if (cookie != null) {
                newContentEditingWidget.hide();
            }

            newContentEditingWidget.find(".sfXItm").click(function () {
                newContentEditingWidget.hide();
                jQuery.cookie("newContentEditingNotificationHidden", "true");
            });
        });
</script>