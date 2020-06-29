<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditOrderShipments.ascx.cs"Inherits="UCommerce.Web.UI.Orders.EditOrderShipments" %>
<%@ Register tagPrefix="uc" tagName="EditShipment" src="EditShipment.ascx" %>

<asp:Repeater runat="server" ID="ShipmentRepeater">
    <ItemTemplate>
		<div class="orderShipment-<%# Container.ItemIndex % 2 == 0 ? "even" : "odd"%>">
			<uc:EditShipment EnableViewState="True" runat="server" 
				ShipmentIndex="<%# (Container.ItemIndex+1) %>"
				IsEditable="<%# IsEditable %>" 
				Shipment="<%# AsShipment(Container.DataItem) %>"
				ShipmentView="<%# View %>" />
		</div>
    </ItemTemplate>
</asp:Repeater>