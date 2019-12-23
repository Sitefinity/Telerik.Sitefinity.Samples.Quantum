<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditProductCatalogBaseProperties.ascx.cs" Inherits="UCommerce.Web.UI.Catalog.EditProductCatalogBaseProperties" %>
<%@ Import Namespace="UCommerce.EntitiesV2" %>
<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../Controls/ValidationSummaryDisplay.ascx" %>
<%@ Register tagPrefix="commerce" tagName="AuditInformation" src="../Controls/AuditInformation.ascx" %>

<commerce:validationsummary runat="server" />

<div class="propertyPane">
    <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourcekey="CatalogPricing"></asp:Localize></h2>
    <div class="propertyItem">
        <div class="propertyItemHeader"><asp:Localize ID="Localize1" runat="server" meta:resourceKey="ProductCatalogDefinition" /></div>
        <div class="propertyItemContent">
            <asp:DropDownList runat="server" ID="DefinitionDropDown" DataSource="<%# Definitions %>" DataValueField="DefinitionId" DataTextField="Name" CssClass="mediumWidth"/>
        </div>
    </div>
    <div class="propertyItem">
		<div class="propertyItemHeader"><asp:Localize ID="Localize2" runat="server" meta:resourceKey="PriceGroup" /></div>
		<div class="propertyItemContent">
			<asp:DropDownList runat="server" ID="PriceGroupDropDown" DataSource="<%# View.PriceGroups %>" DataTextField="Name" DataValueField="PriceGroupId" OnDataBound="PriceGroup_DataBound" CssClass="mediumWidth" />
            <asp:CustomValidator runat="server" ControlToValidate="PriceGroupDropDown" Display="Dynamic" id="LicenseValidator" ErrorMessage="Your license does not support creating any more." CssClass="validator" OnServerValidate="LicenseCheckValidator_ServerValidate" />
		</div>
	</div>
	<div class="propertyItem">
		<div class="propertyItemHeader"><asp:Localize ID="Localize3" runat="server" meta:resourceKey="ShowPricesWithVat" /></div>
		<div class="propertyItemContent">
			<asp:CheckBox runat="server" class="ucommerce-toggle-check-box" ID="ShowPriceInclVatCheckBox" Checked="<%# View.Catalog.ShowPricesIncludingVAT %>" />
		</div>
	</div>

	<div class="propertyItem">
		<div class="propertyItemHeader"><asp:Localize ID="Localize4" runat="server" meta:resourceKey="AllowedPriceGroups" /></div>
		<div class="propertyItemContent">
			<asp:CheckBoxList runat="server" CssClass="multiCheckBoxList ucommerce-toggle-check-box" id="AllowedPriceGroupsCheckBoxList" SelectionMode="Multiple" DataTextField="Name" DataValueField="PriceGroupId" DataSource="<%# View.PriceGroups %>" OnDataBound="AllowedPriceGroupsCheckBoxList_DataBound"/>
		</div>
	</div>
	<div class="propertyPaneFooter"></div>
</div>

<asp:Panel CssClass="propertyPane" ID="DefinitionPropertiesPanel" runat="server">
</asp:Panel>

<commerce:auditinformation Entity="<%# View.Catalog %>" ID="ValidationSummary2" runat="server" />