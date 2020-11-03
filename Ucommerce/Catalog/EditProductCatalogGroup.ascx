<%@ Import Namespace="Ucommerce.Presentation.Web"%>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditProductCatalogGroup.ascx.cs" Inherits="Ucommerce.Web.UI.Catalog.EditProductCatalogGroup1" %>
<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../Controls/ValidationSummaryDisplay.ascx" %>
    
<%@ Register tagPrefix="commerce" tagName="AuditInformation" src="../Controls/AuditInformation.ascx" %>
<commerce:ValidationSummary ID="Audit" runat="server" />

<div class="propertyPane">      
    <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourcekey="storeHostName"></asp:Localize></h2> 
    <commerce:PropertyPanel runat="server" meta:resourceKey="Definition">
        <asp:DropDownList runat="server" ID="DefinitionDropDown" DataSource="<%# Definitions %>" DataValueField="DefinitionId" DataTextField="Name" CssClass="mediumWidth"></asp:DropDownList>
    </commerce:PropertyPanel>
    <commerce:PropertyPanel runat="server" meta:resourceKey="Domain">
        <asp:DropDownList runat="server" ID="DomainDropDown" DataSource="<%# Domains %>" DataValueField="DomainId" DataTextField="DomainName" CssClass="mediumWidth"></asp:DropDownList>
    </commerce:PropertyPanel>
    <commerce:PropertyPanel runat="server" meta:resourceKey="Description">
        <asp:TextBox runat="server" ID="DescriptionTextBox" Text="<%# View.ProductCatalogGroup.Description %>" TextMode="MultiLine" CssClass="mediumWidth smallHeight textArea" />
    </commerce:PropertyPanel>
    <div class="propertyPaneFooter">-</div>
</div>

<div class="propertyPane">
    <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourcekey="generalInformation"></asp:Localize></h2>    
	<commerce:PropertyPanel runat="server" meta:resourceKey="Currency">
		<asp:DropDownList runat="server" ID="CurrencyDropDownList" DataSource="<%# View.Currencies %>" DataValueField="CurrencyId" DataTextField="ISOCode" CssClass="mediumWidth" />
	</commerce:PropertyPanel>
	<commerce:PropertyPanel runat="server" meta:resourceKey="EmailProfile">
		<asp:DropDownList runat="server" ID="EmailProfileDropDownList" DataSource="<%# View.EmailProfiles %>" DataValueField="EmailProfileId" DataTextField="Name" CssClass="mediumWidth" />
	</commerce:PropertyPanel>

	<commerce:PropertyPanel runat="server" meta:resourceKey="OrderNumber">
		<asp:DropDownList runat="server" ID="OrderNumberDropDown" DataSource="<%# OrderNumberSeries %>" DataTextField="OrderNumberName" DataValueField="OrderNumberId" CssClass="mediumWidth"></asp:DropDownList>
	</commerce:PropertyPanel>

	<commerce:PropertyPanel runat="server" meta:resourceKey="ProductReviewsRequireApproval">
		<asp:CheckBox runat="server" ID="ProductReviewsRequireApproval" class="Ucommerce-toggle-check-box" Checked="<%# View.ProductCatalogGroup.ProductReviewsRequireApproval %>" />
	</commerce:PropertyPanel>
    <div class="propertyPaneFooter">-</div>
</div>

<div class="propertyPane">
    <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourcekey="customersandmembers"></asp:Localize></h2>    
    
    <commerce:PropertyPanel runat="server" meta:resourceKey="CreateCustomersAsMembers">
        <asp:CheckBox runat="server" ID="CreateCustomersAsMembers" class="Ucommerce-toggle-check-box" Checked="<%# View.ProductCatalogGroup.CreateCustomersAsMembers %>" />
    </commerce:PropertyPanel>
            
    <commerce:PropertyPanel runat="server" meta:resourceKey="MemberGroup">
        <asp:DropDownList runat="server" ID="MemberGroupDropDown"  DataSource="<%# MemberGroups %>" DataValueField="MemberGroupId" DataTextField="Name" CssClass="mediumWidth" />
    </commerce:PropertyPanel>
            
    <commerce:PropertyPanel runat="server" meta:resourceKey="MemberType">
        <asp:DropDownList runat="server" ID="MemberTypeDropDown" DataSource="<%# MemberTypes %>" DataValueField="MemberTypeId" DataTextField="Name" CssClass="mediumWidth" />
    </commerce:PropertyPanel>
    <div class="propertyPaneFooter">-</div>
</div>

<asp:Panel CssClass="propertyPane" ID="DefinitionPropertiesPanel" runat="server">
</asp:Panel>

<commerce:auditinformation Entity="<%# View.ProductCatalogGroup %>" ID="ValidationSummary2" runat="server" />
