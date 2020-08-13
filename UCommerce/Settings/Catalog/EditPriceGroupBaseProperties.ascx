<%@ Import Namespace="Ucommerce.Presentation.Web"%>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditPriceGroupBaseProperties.ascx.cs" Inherits="Ucommerce.Web.UI.Settings.Catalog.EditPriceGroupBaseProperties" %>
<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../../Controls/ValidationSummaryDisplay.ascx" %>

<commerce:ValidationSummary ID="ValidationSummary1" runat="server" />
<div class="propertyPane leftAligned">
    <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourceKey="PriceGroupProperties" /></h2>
    <div class="propertyItem">
	    <div class="propertyItemHeader"><asp:Localize runat="server" meta:resourceKey="Description" /></div>
        <div class="propertyItemContent">
            <asp:TextBox runat="server" ID="DescriptionTextBox" Text="<%# SanitizeOutput(View.PriceGroup.Description) %>" TextMode="MultiLine" CssClass="mediumWidth smallHeight" />
            <asp:CustomValidator runat="server" ControlToValidate="DescriptionTextBox" Display="Dynamic" id="LicenseValidator" ErrorMessage="Your license does not support creating any more." CssClass="validator" OnServerValidate="LicenseCheckValidator_ServerValidate"/>
        </div>
    </div>        
    <div class="propertyItem">
	    <div class="propertyItemHeader"><asp:Localize runat="server" meta:resourceKey="LastModifiedOn" /></div>
        <div class="propertyItemContent">
            <asp:Label runat="server" Text="<%# View.IsNew ? String.Empty : View.PriceGroup.ModifiedOn.ToString() %>" />
        </div>
    </div>        
    <div class="propertyItem">
	    <div class="propertyItemHeader"><asp:Localize runat="server" meta:resourceKey="LastModifiedBy" /></div>
        <div class="propertyItemContent">
            <asp:Label runat="server" Text="<%# SanitizeOutput(View.PriceGroup.ModifiedBy) %>" />
        </div>
    </div>
    <div class="propertyPaneFooter">-</div>
</div>

<div class="propertyPane leftAligned">
    <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourceKey="PriceGroupPricing" /></h2>
    <div class="propertyItem">
	    <div class="propertyItemHeader"><asp:Localize runat="server" meta:resourceKey="Currency" /></div>
        <div class="propertyItemContent">
            <commerce:SafeDropDownList CssClass="mediumWidth" runat="server" ID="CurrencyDropDownList" DataSource="<%# View.Currencies %>" DataValueField="CurrencyId" DataTextField="ISOCode"></commerce:SafeDropDownList>
			<asp:CustomValidator runat="server" ErrorMessage="*" CssClass="validator" OnServerValidate="LicenseValidator_ServerValidate" meta:ResourceKey="LicenseValidator" />
        </div>
    </div>
    <div class="propertyItem">
	    <div class="propertyItemHeader"><asp:Localize runat="server" meta:resourceKey="VatRate" />&nbsp;%</div>
        <div class="propertyItemContent">
            <asp:TextBox runat="server" CssClass="VatRateTextBox" ID="VatRateTextBox" Text="<%# View.PriceGroup.VATRate * 100 %>" />
            <asp:RangeValidator runat="server" ControlToValidate="VatRateTextBox" Type="Double" MinimumValue="0" MaximumValue="<%# 999 %>" ErrorMessage="*" CssClass="validator" />
        </div>
    </div>
    <div class="propertyPaneFooter">-</div>
</div>