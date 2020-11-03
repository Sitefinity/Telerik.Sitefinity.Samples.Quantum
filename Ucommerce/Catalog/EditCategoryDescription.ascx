<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditCategoryDescription.ascx.cs" Inherits="Ucommerce.Web.UI.Catalog.EditCategoryDescription" %>
<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../Controls/ValidationSummaryDisplay.ascx" %>

<commerce:ValidationSummary runat="server" />

<div class="propertyPane">
    <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourcekey="MultiLingualProperties"></asp:Localize></h2>
    <div class="propertyItem">
        <div class="propertyItemHeader"><asp:Localize ID="Localize1" runat="server" meta:resourceKey="DisplayName" /></div>
        <div class="propertyItemContent">
            <asp:TextBox runat="server" CssClass="multiLingualDisplayName maxWidth" ID="DisplayNameTextBox" Text="<%# Description.DisplayName %>" />
        </div>
    </div>
    <div class="propertyItem">
        <div class="propertyItemHeader"><asp:Localize ID="Localize2" runat="server" meta:resourceKey="Description" /></div>
        <div class="propertyItemContent"><asp:PlaceHolder ID="LongDescriptionPlaceHolder" runat="server" /></div>
    </div>
    <div class="propertyPaneFooter">-</div>
</div>

<asp:Panel runat="server" id="PropertyPanel" CssClass="propertyPane"></asp:Panel>