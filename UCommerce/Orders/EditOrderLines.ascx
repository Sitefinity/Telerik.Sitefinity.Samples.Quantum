<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditOrderLines.ascx.cs" Inherits="Ucommerce.Web.UI.Ucommerce.Orders.EditOrderLines" %>
<%@ Import Namespace="Ucommerce.EntitiesV2" %>
<%@ Import Namespace="Ucommerce.Extensions" %>
<%@ Import Namespace="Ucommerce.Web.UI.Ucommerce.Orders" %>

<asp:PlaceHolder runat="server" ID="OrderListPlaceholder">
<table class="dataList connectedSortable ui-sortable clickable ordersTable" id='<%# "ShipmentTable_" + ShipmentId  %>' cellspacing="0" cellpadding="0" width="100%">
	<thead>
		<tr>
			<th><span></span></th>
			<th style="width:31px;"><span></span></th>
			<th><span>Sku</span></th>
			<th><span>Text</span></th>
			<th class="amountCell"><span>Unit price</span></th>
			<th class="quantityCell"><span>Quantity</span></th>
			<th class="amountCell"><span>VAT</span></th>
			<th class="amountCell"><span>Total</span></th>
		</tr>
	</thead>
	<tbody>
        <asp:Repeater runat="server" ID="OrderLineRepeater" EnableViewState="True" OnItemCommand="OrderLineRepeateren_ItemCommand" OnItemDataBound="OrderLineRepeateren_DataBound">
	        <ItemTemplate>
		    <% if(IsEditable) { %>		
				<tr class="canSort orderLineRow" style="cursor: move; height: 25px;" data-orderline-id="<%# Eval("OrderLineId") %>">
					<td class="imageButton"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span></td>
			<% } else {%>
				<tr class="orderLineRow" style="height: 25px;" data-orderline-id="<%# Eval("OrderLineId") %>">
					<td></td>
			<% } %>
			        
					<td class="imageButton">
				        <% if (IsEditable) { %>
				        <asp:ImageButton ID="imbDelete" runat="server" ImageUrl="../Images/ui/cross.png" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "OrderLineId") %>'  />
				        <% } %>
			        </td>
			        <td class="textCell">
				        <%# SanitizeOutput((string)DataBinder.Eval(Container.DataItem, "Sku")) %>
				        <%# SanitizeOutput(GetVariantSku(Container.DataItem)) %>
			        </td>
			        <td class="textCell"><%# SanitizeOutput((string)DataBinder.Eval(Container.DataItem, "ProductName")) %></td>

			        <td class="amountCell" style="white-space: nowrap;"><%# GetUnitPriceTdValue(DataBinder.Eval(Container.DataItem, "Price"), DataBinder.Eval(Container.DataItem, "UnitDiscount")) %></td>
		     	        <td class="quantityCell">
				        <% if(IsEditable && false){ %>
					        <asp:HiddenField ID="OrderLineId" runat="server" Value='<%# Eval("OrderLineId") %>'></asp:HiddenField>
					        <asp:TextBox ID="Quantity" CssClass="quantity" Width="30" runat="server" Text='<%# Eval("Quantity") %>'></asp:TextBox>
					        <asp:HiddenField runat="server" ID="OldQuantity" Value='<%# Eval("Quantity") %>' />
							<input name="old-quantity" class="old-quantity" type="hidden" value='<%# Eval("Quantity") %>' />
				        <% }else{ %>
					        <%# DataBinder.Eval(Container.DataItem, "Quantity") %>
				        <% } %>
			        </td>
			        <td class="amountCell"><%# GetPrice((DataBinder.Eval(Container.DataItem, "Vat")))%></td>
			        <td class="amountCell"><%# GetPrice(DataBinder.Eval(Container.DataItem, "Total"))%></td>
		        </tr>

		        <asp:Repeater runat="server" ID="OrderLinePropertyRepeater" DataSource="<%# ((OrderLine)Container.DataItem).OrderProperties %>">
			        <ItemTemplate>
				        <tr class="propertyRow_<%# ((OrderLine)((RepeaterItem)Container.Parent.Parent).DataItem).OrderLineId %>" style="display:none;">
					        <td></td>
					        <td></td>
							<td></td>
					        <td><%# SanitizeOutput((string)DataBinder.Eval(Container.DataItem, "Key")) %>:</td>
					        <td colspan="5"><%# SanitizeOutput((string)DataBinder.Eval(Container.DataItem, "Value")) %></td>
				        </tr>
			        </ItemTemplate>
		        </asp:Repeater>
		        <asp:Repeater runat="server" ID="OrderLineDiscountRepeater" DataSource="<%# ((OrderLine)Container.DataItem).Discounts %>">
			        <ItemTemplate>
				        <tr class="discountRow_<%# ((OrderLine)((RepeaterItem)Container.Parent.Parent).DataItem).OrderLineId %>" style="display:none;">
					        <td></td>
					        <td></td>
							<td></td>
					        <td colspan="6"><%# SanitizeOutput(GetDiscountName((Discount)Container.DataItem)) %></td>
				        </tr>
			        </ItemTemplate>
		        </asp:Repeater>
	        </ItemTemplate>
        </asp:Repeater>
    </tbody>
    <tfoot>
		<tr>
			<td colspan="5"></td>
			<td colspan="2" class="no-wrapping rightAligned">Sub total</td>
			<td class="amountCell"><%# (OrderLines.Any()) ? OrderLines.Sum(x => x.Total).ToCurrencyAmount() : "" %></td>
		</tr>
		<tr>
			<td colspan="5"></td>
			<td colspan="2" class="rightAligned">VAT</td>
			<td class="amountCell"><%# (OrderLines.Any()) ? OrderLines.Sum(x => x.VAT).ToCurrencyAmount() : "" %></td>
		</tr>
    </tfoot>
</table>

<%# GetOrderLineIdsHiddenField() %>

</asp:PlaceHolder>