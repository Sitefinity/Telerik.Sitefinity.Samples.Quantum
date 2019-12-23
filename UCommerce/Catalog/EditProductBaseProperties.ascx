<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditProductBaseProperties.ascx.cs" Inherits="UCommerce.Web.UI.Catalog.EditProductBaseProperties" %>
<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../Controls/ValidationSummaryDisplay.ascx" %>

<%@ Register tagPrefix="commerce" tagName="AuditInformation" src="../Controls/AuditInformation.ascx" %>
<commerce:ValidationSummary ID="ValidationSummary1" runat="server" />

<div class="propertyPane">
    <h2 class="propertyPaneTitel"><asp:Localize ID="Localize2" runat="server" meta:resourceKey="GeneralInformation" /></h2>
    <div class="propertyItem">
        <div class="propertyItemHeader"><asp:Localize ID="Localize1" runat="server" meta:resourceKey="Sku" /></div>
        <div class="propertyItemContent">
            <asp:TextBox runat="server" ID="SkuTextBox" CssClass="propertyText" Text="<%# View.Product.Sku %>" MaxLength="30"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="SkuTextBox" Display="Dynamic" Text="*" ErrorMessage='<%# GetLocalResourceObject("Sku.Text") %>' CssClass="validator" />
            <asp:CustomValidator ID="UniqueSkuValildator" runat="server" CssClass="validator" ControlToValidate="SkuTextBox" Display="Dynamic" Text="A product with the SKU already exists*" ErrorMessage='<%# GetLocalResourceObject("Sku.Text") %>' meta:resourceKey="UniqueSkuValildator" OnServerValidate="UniqueSkuValidator_ServerValidate"></asp:CustomValidator>
        </div>
    </div>
	<div class="propertyItem">
		<div class="propertyItemHeader"><asp:Localize ID="ProductDefinitionChangeLabel" runat="server" meta:resourceKey="ProductDefinition" /></div>
		<div class="propertyItemContent">
            <asp:DropDownList runat="server" ID="ProductDefinitionDropDown" CssClass="mediumWidth propertyItemDropDown" DataSource="<%# View.ProductDefinitions %>" DataValueField="ProductDefinitionId" DataTextField="Name"/>
        </div>
	</div>
    <div class="propertyItem">
        <div class="propertyItemHeader"><asp:Localize ID="Localize7" runat="server" meta:resourceKey="DisplayOnSite" /></div>
        <div class="propertyItemContent">
            <asp:CheckBox runat="server" ID="DisplayOnWebSiteCheckBox" class="ucommerce-toggle-check-box" Checked="<%# View.Product.DisplayOnSite %>" />
        </div>
    </div>
    <div class="propertyItem">
        <div class="propertyItemHeader"><asp:Localize ID="Localize8" runat="server" meta:resourceKey="AllowOrdering" /></div>
        <div class="propertyItemContent">
             <asp:CheckBox runat="server" ID="AllowOrderingCheckBox" class="ucommerce-toggle-check-box" Checked="<%# View.Product.AllowOrdering %>" />
        </div>
    </div>
    <div class="propertyPaneFooter"></div>
</div>

<asp:panel runat="server" class="propertyPane" ID="CustomProperties" visible="true">
    <h2 class="propertyPaneTitel"><asp:Localize ID="Localize3" runat="server" meta:resourceKey="Properties" /></h2>
    <asp:panel runat="server" id="PropertyPanel">
    </asp:panel>
</asp:panel>

<commerce:auditinformation Entity="<%# View.Product %>" ID="ValidationSummary2" runat="server" />
