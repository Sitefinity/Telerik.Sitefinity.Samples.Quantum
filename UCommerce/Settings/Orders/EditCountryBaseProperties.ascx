<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditCountryBaseProperties.ascx.cs" Inherits="UCommerce.Web.UI.Settings.Orders.EditCountryBaseProperties" %>
<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../../Controls/ValidationSummaryDisplay.ascx" %>

<commerce:ValidationSummary runat="server" />
<div class="propertyPane leftAligned">
    <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourceKey="CountryProperties" /></h2>
    <commerce:PropertyPanel runat="server" meta:resourceKey="CultureProperty">
        <asp:TextBox runat="server" ID="CultureCodeTextBox" Text="<%# SanitizeOutput(View.Country.Culture) %>" Style="margin-left: 0px;"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="CultureCodeTextBox" Display="Static" Text="*" ErrorMessage='<%# GetLocalResourceObject("CultureProperty.Text") %>' CssClass="validator" />
        <asp:CustomValidator ID="CultureCodeExistsCustomValidator" runat="server" ControlToValidate="CultureCodeTextBox" Display="Static" OnServerValidate="CultureCode_ServerValidate" CssClass="validator" ErrorMessage='<%# GetLocalResourceObject("CultureProperty.Text") %>' Text='<%# GetLocalResourceObject("CultureValidator.Text") %>'></asp:CustomValidator>
    </commerce:PropertyPanel>
    
    <commerce:PropertyPanel runat="server" meta:resourceKey="NativeNameProperty">
        <asp:Label runat="server" ID="LocalCountryNameLabel" Text="<%# GetLocalCountryName() %>" />
    </commerce:PropertyPanel>
	<div class="propertyPaneFooter">-</div>
</div>