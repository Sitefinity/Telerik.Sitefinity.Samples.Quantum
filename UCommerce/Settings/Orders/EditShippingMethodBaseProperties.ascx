<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditShippingMethodBaseProperties.ascx.cs" Inherits="UCommerce.Web.UI.Settings.Orders.EditShippingMethodBaseProperties" %>
<%@ Import Namespace="UCommerce.Presentation.Web" %>
<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../../Controls/ValidationSummaryDisplay.ascx" %>

<commerce:ValidationSummary  runat="server" />
<div class="propertyPane leftAligned">
    <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourceKey="ShippingMethodProperties" /></h2>
    <div class="propertyItem">
	    <div class="propertyItemHeader"><asp:Localize runat="server" meta:resourceKey="PaymentMethod" /></div>
        <div class="propertyItemContent">
            <asp:DropDownList runat="server" ID="PaymentMethodDropDown" DataSource="<%# View.PaymentMethods %>" DataValueField="PaymentMethodId" DataTextField="Name" CssClass="mediumWidth" />
        </div>
        <div class="propertyPaneFooter"></div>
    </div>
    <div class="propertyItem">
	    <div class="propertyItemHeader"><asp:Localize runat="server" meta:resourceKey="ShippingMethodCalculator" /></div>
        <div class="propertyItemContent">
            <asp:DropDownList runat="server" ID="ShippingMethodCalculatorDropDown" DataSource="<%# View.ShippingMethodServices %>" CssClass="mediumWidth" />
        </div>
        <div class="propertyPaneFooter"></div>
    </div>
</div>

<div class="propertyPane leftAligned">
    <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourceKey="ShippingMethodMedia" /></h2>
    <div class="propertyItem">
	    <div class="propertyItemHeader"><asp:Localize runat="server" meta:resourceKey="Image" /></div>
        <div class="propertyItemContent">
            <asp:PlaceHolder ID="ImagePicker" runat="server"></asp:PlaceHolder>
        </div>
        <div class="propertyPaneFooter"></div>
    </div>
</div>