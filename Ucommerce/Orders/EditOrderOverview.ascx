<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditOrderOverview.ascx.cs" Inherits="Ucommerce.Web.UI.Orders.EditOrderOverview" %>
<%@ Import Namespace="Ucommerce.EntitiesV2"%>
<%@ Register tagPrefix="uc" tagName="EditOrderAddress" src="EditOrderAddress.ascx" %>

<script type="text/javascript">
	function openOrderView(id) {
		this.document.location.href = 'EditOrder.aspx?id=' + id;
	}
</script>


<div class="propertyPane order-overview">
	<h2 class="propertyPaneTitel orderOverViewTitel"><asp:Localize ID="Localize1" runat="server" meta:resourceKey="OrderOverview" /></h2>    
	<div style="float: left; width: 50%; margin-left: auto; margin-right: auto;">
		<table style="width: 100%">
			<tr class="sold-to">
				<th  style="width: 110px">Sold to</th>
				<td>
					<uc:EditOrderAddress runat="server" ID="EditOrderAddress" />
				</td>
			</tr>
		</table>
	</div>
	<div style="float: right; width: 50%; margin-left: auto; margin-right: auto;">
		<table style="width: 100%" class="orderInfo">
			<tr>
				<th>Order number</th>
				<td><%# SanitizeOutput(View.Order.OrderNumber) %></td>
			</tr>             
			<tr>
				<th>Status</th>
				<td><%# SanitizeOutput(View.Order.OrderStatus.Name) %></td>
			</tr>
			<tr>
				<th>Created</th>
				<td><%# SanitizeOutput(View.Order.CreatedDate.ToString()) %></td>
			</tr>
			<tr>
				<th>Completed</th>
				<td><%# SanitizeOutput(View.Order.CompletedDate.HasValue ? View.Order.CompletedDate.Value.ToString() : "-") %></td>
			</tr>
			<tr>
				<th>Currency</th>
				<td><%# SanitizeOutput(View.Order.BillingCurrency.ISOCode) %></td>
			</tr>
			<asp:Repeater runat="server" ID="OrderPropertyRepeater" DataSource="<%# OrderProperties %>">
				<ItemTemplate>
					<tr>
						<th><%# SanitizeOutput((string)DataBinder.Eval(Container.DataItem, "Key")) %></th>
						<td><%# SanitizeOutput((string)DataBinder.Eval(Container.DataItem, "Value")) %></td>
					</tr>   
				</ItemTemplate>
			</asp:Repeater>
		</table>
	</div>      
		
	<div style="clear: both"  >
		<table style="width: 100%" class="note">
			<tr>
				<th style="width: 110px! important">Note</th>
				<td class="leftAligned"><%# SanitizeOutput(View.Order.Note) %></td>
			</tr>
		</table>
	</div>                
</div>

<div class="propertyPane">
	<h2 class="propertyPaneTitel orderLinesTitel"><asp:Localize ID="Localize2" runat="server" meta:resourceKey="OrderLines" /></h2>
    <table class="dataList clickable ordersTable orderLinesTable" id="orderList" cellspacing="0" cellpadding="0" width="100%">
		<thead>
			<tr class="headerRow">
				<th style="width:31px;"><span></span></th>
				<th><span>Sku</span></th>
				<th><span>Text</span></th>
				<% if (IsEditable) { %>
				<th class="amountCell"><span>List Price</span></th>
				<% } %>
				<th class="amountCell"><span>Unit price</span></th>
				<th class="quantityCell"><span>Quantity</span></th>
				<th class="amountCell"><span>VAT</span></th>
				<th class="amountCell"><span>Total</span></th>
			</tr>
		</thead>
		<tbody>
			<asp:Repeater runat="server" ID="OrderLineRepeateren" DataSource="<%# OrderLines %>" OnItemCommand="OrderLineRepeateren_ItemCommand" OnItemDataBound="OrderLineRepeateren_DataBound">
				<ItemTemplate>				
					<tr data-product-url='<%# GetProductUrl((OrderLine)Container.DataItem) %>' class='orderLineRow <%# GetProductUrl((OrderLine)Container.DataItem) != null ? "clickable" : "" %>'>
						<td class="imageButton">
							<% if (IsEditable) { %><asp:ImageButton ID="imbDelete" runat="server" ImageUrl="../Images/ui/cross.png" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "OrderLineId") %>'  /><% } %><a class="propertyLink" href="#" rel="<%# ((OrderLine)Container.DataItem).OrderLineId %>" style='<%# OrderLineDetailsAvailable((OrderLine)Container.DataItem) ? "" : "opacity: 0.3; cursor: default;"%>'><img src="../Images/ui/expand.png" alt="" /></a>
						</td>
						<td class="textCell click-action">
							<%# SanitizeOutput((string) DataBinder.Eval(Container.DataItem, "Sku")) %>
							<%# SanitizeOutput(GetVariantSku(Container.DataItem)) %>
						</td>
						<td class="textCell click-action">
							<%# SanitizeOutput((string)DataBinder.Eval(Container.DataItem, "ProductName")) %>
						</td>
						
						<% if (IsEditable) { %>
						<td class="amountCell no-wrapping" >
							<asp:TextBox  onkeyup='<%# GetCalculateDiscountJsEvent((int)Eval("OrderLineId"), (decimal)(Eval("UnitDiscount") ?? 0m)) %>' runat="server" Width="70" ID="UnitPriceTextBox" CssClass="rightAligned" 
								Text='<%# Format((Decimal)DataBinder.Eval(Container.DataItem, "Price")) %>' />
						</td>
						<td class="amountCell click-action" style="padding-right:20px;">
							<span id="<%# GetUnitPriceSpanId((int)DataBinder.Eval(Container.DataItem, "OrderLineId")) %>"><%# Format(((decimal)DataBinder.Eval(Container.DataItem, "Price")) - (decimal)(DataBinder.Eval(Container.DataItem, "UnitDiscount") ?? 0m)) %></span>
						</td>
						<% } else { %>
						<td class="amountCell click-action no-wrapping" >
							<%# GetUnitPriceTdValue(DataBinder.Eval(Container.DataItem, "Price"), DataBinder.Eval(Container.DataItem, "UnitDiscount")) %>
						</td>
						<% } %>

		     			
						<% if(IsEditable){ %>
						<td class="quantityCell">
								<asp:HiddenField ID="OrderLineId" runat="server" Value='<%# Eval("OrderLineId") %>'></asp:HiddenField>
								<asp:TextBox ID="Quantity" CssClass="quantity centerAligned" Width="30" runat="server" Text='<%# Eval("Quantity") %>'></asp:TextBox>
								<input name="old-quantity" class="old-quantity" type="hidden" value="<%# Eval("Quantity") %>" />
						</td>
							<% }else{ %>
						<td class="quantityCell click-action">
								<%# DataBinder.Eval(Container.DataItem, "Quantity") %>
						</td>
							<% } %>
						<td class="amountCell click-action" style="margin:none;"><%# GetPrice((DataBinder.Eval(Container.DataItem, "Vat")))%></td>
						<td class="amountCell click-action"><%# GetPrice(DataBinder.Eval(Container.DataItem, "Total"))%></td>
					</tr>

					<asp:Repeater runat="server" ID="OrderLinePropertyRepeater" DataSource="<%# getOrderLinesProperties((OrderLine)Container.DataItem) %>">
						<ItemTemplate>
							<tr class="propertyRow_<%# ((OrderLine)((RepeaterItem)Container.Parent.Parent).DataItem).OrderLineId %>" style="display:none;">
								<% if (IsEditable) { %> <td></td> <% } %>
								<td></td>
								<td><%# SanitizeOutput((string)DataBinder.Eval(Container.DataItem, "Key")) %></td>
								<td colspan="5"><%# SanitizeOutput((string)DataBinder.Eval(Container.DataItem, "Value")) %></td>
							</tr>
						</ItemTemplate>
					</asp:Repeater>
					<asp:Repeater runat="server" ID="OrderLineDiscountRepeater" DataSource="<%# ((OrderLine)Container.DataItem).Discounts %>">
						<ItemTemplate>
							<tr class="discountRow_<%# ((OrderLine)((RepeaterItem)Container.Parent.Parent).DataItem).OrderLineId %>" style="display:none;">
								<% if (IsEditable) { %> <td></td> <% } %>
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
				<% if (IsEditable) { %> <td></td> <% } %>
				<td colspan="4"></td>
				<td colspan="2" class="rightAligned no-wrapping">Sub total</td>
				<td class="amountCell"><%# Format(View.Order.SubTotal) %></td>
			</tr>
			<tr>
				<% if (IsEditable) { %> <td></td> <% } %>
				<td colspan="4"></td>
				<td colspan="2" class="rightAligned">VAT</td>
				<td class="amountCell"><%# Format(View.Order.VAT) %></td>
			</tr>
			<tr>
				<% if (IsEditable) { %> <td></td> <% } %>
				<td colspan="4"></td>
				<td colspan="2" class="rightAligned no-wrapping">Shipping fee</td>
				<td class="amountCell"><%# Format(View.Order.ShippingTotal) %></td>
			</tr>               
			<tr>
				<% if (IsEditable) { %> <td></td> <% } %>
				<td colspan="4"></td>
				<td colspan="2" class="rightAligned no-wrapping">Payment fee</td>
				<td class="amountCell"><%# Format(View.Order.PaymentTotal) %></td>
			</tr>
			<tr>
				<% if (IsEditable) { %> <td></td> <% } %>
				<td colspan="4"></td>
				<td colspan="2" class="rightAligned no-wrapping discountExpander">
					<a class="propertyLink" href="#" rel="<%# View.Order.OrderGuid %>" style='<%# View.Order.Discounts.Count == 0 ? "display:none" : "" %>'>
                        <img src="../Images/ui/expand.png" alt="" />
                   </a>Order discounts
				</td>
				<td class="amountCell"><%# FormatDiscount(View.Order.Discount) %></td>
			</tr>
			<asp:Repeater runat="server" ID="OrderDiscountRepeater" DataSource="<%# GetOrderDiscount(View.Order.Discounts) %>">
				<ItemTemplate>
					<tr class="discount discountRow_<%# View.Order.OrderGuid %>" style="display:none;">
						<td colspan="7" class="rightAligned"><%# SanitizeOutput(GetDiscountName((Discount)Container.DataItem)) %></td>
						<td class="amountCell"></td>
					</tr>
				</ItemTemplate>
			</asp:Repeater>
			<tr>
				<% if (IsEditable) { %> <td></td> <% } %>
				<td colspan="4"></td>
				<td colspan="2" class="rightAligned no-wrapping">Order total</td>
				<td class="amountCell"><%# Format(View.Order.OrderTotal) %></td>
			</tr>
			<tr>
				<% if (IsEditable) { %> <td></td> <% } %>
				<td colspan="4"></td>
				<td colspan="2" class="rightAligned border-bottom no-wrapping">Discount total</td>
				<td class="amountCell border-bottom"><%# FormatDiscount(View.Order.DiscountTotal) %></td>
			</tr>            
		</tfoot>                                                                                              
	</table>
</div>

<script type="text/javascript">

	function IsNumeric(input) {
		return (input - 0) == input && input.length > 0;
	}
	
	function calculateDiscount(listPrice, discountValue, unitPriceElementId) {
		var unitPriceElement = $(unitPriceElementId);

		var fListPrice = parseFloat(listPrice);
		var fDiscountValue = parseFloat(discountValue);

		if (!isNaN(fListPrice))
			unitPriceElement.text((fListPrice - fDiscountValue).toFixed(2));
		else
			unitPriceElement.text('0.00');
	}

	$(function () {
		$("td.click-action").each(function () {
			if ($(this).parent().data("product-url") != "") {
				$(this).click(function () {
					window.location = $(this).parent().data("product-url");
				});
			}
		});
	});
	
	$(function () {
		updateVisibleRowsColors("orderList", "listOdd", "listEven");

		$("a.propertyLink").click(function (event) {
			event.preventDefault();
			var id = $(this).attr("rel");
			$(".propertyRow_" + id).toggle();
			$(".discountRow_" + id).toggle();
			updateVisibleRowsColors("orderList", "listOdd", "listEven");
			return false;
		});

		function updateVisibleRowsColors(tableId, evenClass, oddClass) {
			$('table#' + tableId + ' tbody tr:visible').each(function (index) {
				$(this).removeClass(evenClass).removeClass(oddClass);
				var rowClass = (index % 2 == 0) ? evenClass : oddClass;
				$(this).addClass(rowClass);
			});
		}

		$(document).submit(function () {

			var changed = false;

			$("#OrderBody tr").each(function () {
				if (changed)
					return;

				var quantity = $('.quantity[type="text"]', this).first();
				var oldQuantity = $('.old-quantity[type="hidden"]', this).first();

				if (quantity.size() == 0)
					return;

				if (oldQuantity.size() == 0)
					return;

				if (!IsNumeric(quantity.val()) || !IsNumeric(oldQuantity.val()))
					return;

				if (parseInt(quantity.val()) > parseInt(oldQuantity.val())) {
					changed = true;
					return;
				}
			});

			if (changed) {
				return confirm('<% =GetLocalResourceObject("ConfirmQuantityChange").ToString() %>');
			}

			return true;
		});
	});
</script>