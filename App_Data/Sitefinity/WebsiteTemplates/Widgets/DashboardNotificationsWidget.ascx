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
