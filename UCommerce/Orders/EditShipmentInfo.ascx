<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditShipmentInfo.ascx.cs" Inherits="Ucommerce.Web.UI.Ucommerce.Orders.EditShipmentInfo" %>

<asp:PlaceHolder runat="server" ID="ShowInfoPlaceHolder" Visible="True">
		<table width="100%" class="editShipmentMethod">
			<tr>
				<th width="20%"><asp:Localize ID="Localize1" runat="server" meta:resourcekey="ShippingMethod"></asp:Localize></th>
				<td><%# SanitizeOutput(Shipment.ShippingMethod.Name) %></td>
			</tr>
			<tr>
				<th width="20%"><asp:Localize ID="Localize2" runat="server" meta:resourcekey="TrackAndTrace"></asp:Localize></th>
				<td><%# SanitizeOutput(Shipment.TrackAndTrace) %></td>
			</tr>
			<tr>
				<th width="20%"><asp:Localize ID="Localize3" runat="server" meta:resourcekey="Notes"></asp:Localize></th>
				<td></td>
			</tr>
			<tr>
				<td width="20%"></td>
				<td><%# SanitizeOutput(Shipment.DeliveryNote) %><span style="margin-left: 35px;"><asp:LinkButton runat="server" ID="EditLink" OnClick="ToggleEditable" Text="<%$ Resources:Edit.Text %>" CausesValidation="false" /></span></td>
			</tr>
		</table>
</asp:PlaceHolder>

<asp:PlaceHolder runat="server" ID="EditInfoPlaceHolder" Visible="False">
	<table width="100%" class="editShipmentMethod">
		<tr>
			<th width="20%"><asp:Localize ID="Localize4" runat="server" meta:resourcekey="ShippingMethod"></asp:Localize></th>
			<td><asp:DropDownList runat="server" ID="ShippingMethodDropDown" CssClass="smallWidthInput" style="width:150px;" /></td>
		</tr>
		<tr>
			<th width="20%"><asp:Localize ID="Localize5" runat="server" meta:resourcekey="TrackAndTrace"></asp:Localize></th>
			<td><asp:TextBox runat="server" ID="TrackAndTraceTextBox" CssClass="smallWidthInput" /></td>
		</tr>
		<tr>
			<th width="20%"><asp:Localize ID="Localize6" runat="server" meta:resourcekey="Notes"></asp:Localize></th>
			<td><asp:TextBox runat="server" ID="DeliveryNotesTextBox" CssClass="smallWidthInput" /><span style="margin-left: 10px;"><asp:LinkButton runat="server" ID="CancelLink" OnClick="ToggleEditable" Text="<%$ Resources:Cancel.Text %>" CausesValidation="false" /></span></td>
		</tr>
	</table>
</asp:PlaceHolder>