<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditShipment.ascx.cs" Inherits="UCommerce.Web.UI.UCommerce.Orders.EditShipment" %>
<%@ Import Namespace="UCommerce.EntitiesV2" %>
<%@ Register tagPrefix="uc" tagName="EditOrderAddress" src="EditOrderAddress.ascx" %>
<%@ Register tagPrefix="uc" tagName="EditShipmentInfo" src="EditShipmentInfo.ascx" %>
<%@ Register tagPrefix="uc" tagName="EditOrderLines" src="EditOrderLines.ascx" %>

<div class="propertyPane leftAligned shippingPane" style="overflow: hidden;">
    <div>
        <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourcekey="Shipment" /> #<%# ShipmentIndex %></h2>
        <asp:ImageButton style="display: inline-block; float: right; margin-top: 10px;" ToolTip="" runat="server" ID="DeleteShipment" Visible="<%# CanDeleteShipment %>" ImageUrl="../Images/ui/cross.png" OnClick="DeleteShipment_Click" />    
    </div>
    <div class="shippingPaneContent">
        <div style="float: left; width: 50%; margin-left: auto; margin-right: auto;" class="shippingPaneContentAddress">
            <uc:EditOrderAddress ID="EditOrderAddress" runat="server" OrderAddress="<%# Shipment.ShipmentAddress %>" IsEditable="<%# IsEditable %>" />
        </div>
        <div style="float: right; width: 50%; margin-left: auto; margin-right: auto;">
            <uc:EditShipmentInfo runat="server" ID="ShipmentInfo" Shipment="<%# Shipment %>" IsEditable="<%# IsEditable %>" />
        </div>
        <div style="padding-top:15px; clear:both;">
            <uc:EditOrderLines runat="server" id="OrderLines"
                               IsEditable="<%# IsEditable %>" 
                               OrderLines="<%# Shipment.OrderLines %>"
                               ShipmentView="<%# ShipmentView %>"
                               ShipmentId="<%# Shipment.ShipmentId %>"
                               Shipment="<%# Shipment %>" />
        </div>
    </div>
</div>