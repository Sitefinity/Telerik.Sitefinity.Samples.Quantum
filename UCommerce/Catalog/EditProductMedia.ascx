<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditProductMedia.ascx.cs" Inherits="Ucommerce.Web.UI.Catalog.EditProductMedia" %>
<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../Controls/ValidationSummaryDisplay.ascx" %>
<%@ Register TagPrefix="asp" Namespace="Ucommerce.Web.UI.Controls" Assembly="Ucommerce.Admin" %>

<commerce:ValidationSummary runat="server" />
<div class="propertyPane leftAligned">
    <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourcekey="ProductMedia"></asp:Localize></h2>
    <div class="propertyItem">
        <div class="propertyItemHeader"><asp:Localize runat="server" meta:resourceKey="ThumbnailImage" /></div>
        <div class="propertyItemContent"><asp:PlaceHolder ID="ThumbnailPicker" runat="server"></asp:PlaceHolder></div>
        <div class="propertyPaneFooter"></div>
    </div>
    <div class="propertyItem">
        <div class="propertyItemHeader"><asp:Localize runat="server" meta:resourceKey="PrimaryImage" /></div>
        <div class="propertyItemContent"><asp:PlaceHolder ID="PrimaryImagePicker" runat="server"></asp:PlaceHolder></div>
        <div class="propertyPaneFooter"></div>
    </div>
</div>

<asp:Panel runat="server" id="PropertyPanel" CssClass="propertyPane"></asp:Panel>