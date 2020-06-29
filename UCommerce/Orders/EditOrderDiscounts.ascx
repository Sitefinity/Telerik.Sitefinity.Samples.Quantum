<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditOrderDiscounts.ascx.cs" Inherits="UCommerce.Web.UI.Orders.EditOrderDiscounts" %>
<%@ Import Namespace="UCommerce.EntitiesV2"%>

<div class="propertyPane leftAligned">
	<h2 class="propertyPaneTitel orderDiscountsTitel"><asp:Literal runat="server" meta:resourcekey="OrderDiscounts"></asp:Literal></h2>
    <table class="dataList clickable ordersTable discountList" id="discountList" cellspacing="0" cellpadding="0" width="100%">
		<thead>
			<tr>
				<th style="width:31px;"><span></span></th>
				<th style="width:25px;"><span></span></th>
				<th><span><%= GetLocalResourceObject("Campaign.Text") %></span></th>
				<th><span><%= GetLocalResourceObject("CampaignItem.Text") %></span></th>
				<th><span><%= GetLocalResourceObject("Description.Text") %></span></th>
				<th class="amountCell"><span><%= GetLocalResourceObject("Total.Text") %></span></th>
			</tr>
		</thead>
		<tbody>
			<asp:Repeater runat="server" ID="DiscountRepeater" DataSource="<%# Discounts %>" OnItemCommand="DiscountRepeater_ItemCommand" OnItemDataBound="DiscountRepeater_DataBound">
				<ItemTemplate>
					<tr class="<%# GetRowClass() %> orderLineRow">
						<td class="imageButton" >
							<% if (IsEditable){ %>
							<asp:ImageButton ID="imbDelete" runat="server" ImageUrl="../Images/ui/delete.png" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "DiscountId") %>'  />
							<% } %>
						</td>
						<td class="imageButton" >
							<a class="propertyLink" href="#" rel="<%# ((Discount)Container.DataItem).DiscountId %>"><img src="../Images/ui/expand.png" alt="" /></a>
						</td>
						<td class="textCell">
							<% if (IsEditable) { %>
								<asp:TextBox runat="server" ID="CampaignNameTextBox" Text='<%# TextSanitizeOutput((string)Eval("CampaignName")) %>' />
							<% } else { %>
								<%# TextSanitizeOutput((string)DataBinder.Eval(Container.DataItem, "CampaignName")) %>
							<% } %>
						</td>
						<td class="textCell">
							<% if (IsEditable) { %>
								<asp:TextBox runat="server" ID="CampaignItemNameTextBox" Text='<%# TextSanitizeOutput((string)Eval("CampaignItemName")) %>' />
							<% } else { %>
								<%# TextSanitizeOutput((string)DataBinder.Eval(Container.DataItem, "CampaignItemName")) %>
							<% } %>
						</td>
						<td class="textCell">
							<% if (IsEditable) { %>
								<asp:TextBox runat="server" ID="DescriptionTextBox" Text='<%# TextSanitizeOutput((string) Eval("Description")) %>' />
							<% } else { %>
								<%# TextSanitizeOutput((string)DataBinder.Eval(Container.DataItem, "Description")) %>
							<% } %>
						</td>
						<td class="amountCell" >
							<% if (IsEditable)
							   { %>
								<asp:TextBox ID="AmountOffTotal" CssClass="discount" style="width:70px; text-align:right;" runat="server" Text='<%# Eval("AmountOffTotal") %>'></asp:TextBox>
                                <asp:HiddenField ID="DiscountId" runat="server" Value='<%# Eval("DiscountId") %>'></asp:HiddenField>
							<% }
							   else
							   { %>
								<%# ((decimal)DataBinder.Eval(Container.DataItem, "AmountOffTotal")).ToString("N") %>
							<% } %>
						</td>
					</tr>
					<asp:Repeater runat="server" ID="OrderLineDiscountRepeater" DataSource="<%# ((Discount)Container.DataItem).OrderLines %>">
						<ItemTemplate>
							<tr class="orderLineRow_<%# ((Discount)((RepeaterItem)Container.Parent.Parent).DataItem).DiscountId %>" style="display:none;">
								<td></td>
								<td></td>
								<td>
									<%# TextSanitizeOutput((string)DataBinder.Eval(Container.DataItem, "Sku")) %>
									<%# TextSanitizeOutput((string)GetVariantSku(Container.DataItem)) %>
								</td>
								<td colspan="5">
									<%# TextSanitizeOutput((string)DataBinder.Eval(Container.DataItem, "ProductName")) %>
								</td>
							</tr>
						</ItemTemplate>
					</asp:Repeater>
						<tr class="orderLineRow_<%# VisibleOrderDiscountText(((Discount)Container.DataItem).DiscountId) %>" style="display:none;">
							<td></td>
							<td></td>
							<td colspan="6">
								<%= GetLocalResourceObject("DiscountAppliedDirectlyToOrder.Text") %>
							</td>
						</tr>	
				</ItemTemplate>
			</asp:Repeater>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="6">&nbsp;</td>
			</tr>            
			<tr>
				<td colspan="4"></td>
				<td class="rightAligned"><%= GetLocalResourceObject("DiscountTotal.Text") %></td>
				<td class="amountCell"><%# FormatDiscount(View.Order.DiscountTotal) %></td>
			</tr>  
			<tr>
				<td colspan="4"></td>
				<td class="rightAligned"><%= GetLocalResourceObject("OrderTotal.Text") %></td>
				<td class="amountCell"><%# Format(View.Order.OrderTotal) %></td>
			</tr>            
		</tfoot>                                                                                              
	</table>
</div>

<script type="text/javascript">

	$(document).ready(function () {
		updateVisibleRowsColors("discountList", "listOdd", "listEven");

		$("a.propertyLink").click(function (event) {
			event.preventDefault();
			var id = $(this).attr("rel");
			$(".orderLineRow_" + id).toggle();
			updateVisibleRowsColors("discountList", "listOdd", "listEven");
		});

		function updateVisibleRowsColors(tableId, evenClass, oddClass) {
			$('table#' + tableId + ' tbody tr:visible').each(function (index) {
				$(this).removeClass(evenClass).removeClass(oddClass);
				var rowClass = (index % 2 == 0) ? evenClass : oddClass;
				$(this).addClass(rowClass);
			});
		}
	});

</script>