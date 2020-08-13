<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditCampaignOverview.ascx.cs" Inherits="Ucommerce.Web.UI.Marketing.EditCampaignOverview" %>
<%@ Register TagPrefix="commerce" Namespace="Ucommerce.Presentation.UI" Assembly="Ucommerce.Presentation" %>
<%@ Register TagPrefix="commerce" TagName="ValidationSummary" Src="../Controls/ValidationSummaryDisplay.ascx" %>

<commerce:ValidationSummary ID="ValidationSummary1" runat="server" />

<div class="propertyPane">
    <div>
        <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourcekey="CampaignHeader" /></h2>
    </div>
    <commerce:PropertyPanel runat="server" meta:resourcekey="StartDate">
    	<commerce:DateTimePicker runat="server" id="StartsOnDatePicker" datetime="<%# View.Campaign.StartsOn.ToLocalTime() %>" cssclass="mediumWidth"/>
    </commerce:PropertyPanel>
    <commerce:PropertyPanel runat="server" meta:resourcekey="EndDate">
        <commerce:DateTimePicker runat="server" id="EndsOnDatePicker" datetime="<%# View.Campaign.EndsOn.ToLocalTime() %>" cssclass="mediumWidth" />
    </commerce:PropertyPanel>
	<commerce:PropertyPanel runat="server" meta:resourcekey="ProductCatalogGroup">
        <asp:DropDownList runat="server" ID="ProductCatalogGroupsDropDownList" CssClass="mediumWidth" DataTextField="Name" DataValueField="ProductCatalogGroupId"/>
    </commerce:PropertyPanel>
    <commerce:PropertyPanel runat="server" meta:resourcekey="Enabled">
        <asp:CheckBox runat="server" ID="EnabledCheckBox" class="Ucommerce-toggle-check-box" Checked="<%# View.Campaign.Enabled %>"/>
		<asp:CustomValidator runat="server" CssClass="validator" id="LicenseValidator" OnServerValidate="LicenseValidator_ServerValidate" meta:ResourceKey="LicenseValidator" ErrorMessage="Marketing Foundation not available with current license.(*)"/>
    </commerce:PropertyPanel>
	<div class="propertyPaneFooter">-</div>
</div>