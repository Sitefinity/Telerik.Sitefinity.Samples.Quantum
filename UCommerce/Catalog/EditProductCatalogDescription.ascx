<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditProductCatalogDescription.ascx.cs" Inherits="UCommerce.Web.UI.Catalog.EditProductCatalogDescription" %>
<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../Controls/ValidationSummaryDisplay.ascx" %>

<commerce:ValidationSummary runat="server" />

<div class="propertyPane">
    <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourcekey="LanguageProperties"></asp:Localize></h2>
    <div class="propertyItem">
        <div class="propertyItemHeader"><asp:Localize ID="Localize1" runat="server" meta:resourceKey="DisplayName" /></div>
        <div class="propertyItemContent">
            <asp:TextBox runat="server" ID="DisplayNameTextBox" Text="<%# OutputSanitize(Description.DisplayName) %>" Width="200px" CssClass="mediumWidth multiLingualDisplayName" />
            <asp:RequiredFieldValidator 
                ID="RequiredFieldValidator1" 
                runat="server" 
                ControlToValidate="DisplayNameTextBox" 
                Display="Static" 
                Text="*" 
                ErrorMessage='<%# GetLocalResourceObject("DisplayName.Text") + string.Format(" ({0})", CultureCode) %>' 
                CssClass="validator" />
        </div>
    </div>
    <div class="propertyPaneFooter"></div>
</div>

<div class="contentPane">
	<asp:Panel ID="PropertyPanel" runat="server" CssClass="propertyPane propertyItems" />
</div>
