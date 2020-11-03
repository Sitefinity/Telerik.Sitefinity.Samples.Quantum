<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ViewOrderGroupOrders.ascx.cs" Inherits="Ucommerce.Web.UI.Orders.ViewOrderGroupOrders" %>
<style type="text/css">
	.orderClickable
	{
	}
</style>

<script type="text/javascript">
	function openOrderView(id) {
		this.document.location.href = 'EditOrder.aspx?id=' + id;
	}

	function toggleAllCheckboxes(toggle) {
		
		$('.orderSelect input').each(function () {
			var element = $(this);
			if (element == null) {
				alert('error');
			}

			element.prop('checked', toggle);

		});
	}

	$(function () {
		$("#orderTable").dataTable(
            {
            	"bPaginate": false,
            	// disable initial sort
            	"aaSorting": [],
            	// disable sorting on first column
            	"aoColumnDefs": [
					{ 'bSortable': false, 'aTargets': [0] },
                    { 'iDataSort': 5, 'aTargets': [4] },
	                { 'bVisible': false, 'aTargets': [5] }
                ],
                "fnInitComplete": function (oSettings, json) {
                    if (UcommerceClientMgr.Shell === "Umbraco8") {
                        $('#orderTable_filter > label > input[type=text]').attr('placeholder', 'Type to search...');
                        $('#orderTable_filter > label').append('<i class="icon icon-search"></i>');

                    }
                }
            });

		$(".orderClickable").click(function () {
			openOrderView($(this).parent().data('orderid'));
		});
	});
</script>



<div class="propertyPane tablePropertyPane">
	<h2 class="propertyPaneTitel orderDiscountsTitel"><asp:Literal runat="server" meta:resourcekey="OrderHeader"></asp:Literal></h2>
    <div class="orders-filter-panel">
        <asp:DropDownList class="mediumWidth" runat="server" ID="FilterOrdersDropDownList" style="margin-top: 20px;" AutoPostBack="True" OnSelectedIndexChanged="FilterOrdersDropDownList_Changed" ClientIDMode="Static">
		    <asp:ListItem Value="day" meta:resourcekey="Today"></asp:ListItem>
		    <asp:ListItem Value="week" meta:resourcekey="ThisWeek"></asp:ListItem>
		    <asp:ListItem Value="month" meta:resourcekey="ThisMonth"></asp:ListItem>
		    <asp:ListItem Value="3months" meta:resourcekey="Last3Months"></asp:ListItem>
		    <asp:ListItem Value="year" meta:resourcekey="ThisYear"></asp:ListItem>
		    <asp:ListItem Value="all" meta:resourcekey="All"></asp:ListItem>
		    <asp:ListItem Value="custom" meta:resourcekey="Custom"></asp:ListItem>
	    </asp:DropDownList>
	
	    <asp:Panel runat="server" Visible="False" ID="CustomFilterPanel" CssClass="customFilter">
    	    <asp:PlaceHolder runat="server" ID="StartsOnDatePicker" />
		    <span class="customFilterDivider">-</span>
		    <asp:PlaceHolder runat="server" ID="EndsOnDatePicker" />
		    <asp:Button runat="server" meta:resourcekey="Filter" ID="customFilterButton" onclick="FilterOrdersDropDownList_Changed" CssClass="mediumButton" /> 
	    </asp:Panel>
    </div>

	<asp:Repeater runat="server" ID="OrdersRepeater" EnableViewState="false">
		<HeaderTemplate>
			<table class="dataList" cellspacing="0" id="orderTable">
				<thead>
					<tr>
						<th><asp:CheckBox runat="server" ID="CheckAll" OnClick="toggleAllCheckboxes($(this).is(':checked'));" /></span></th>
						<th><span><asp:Localize runat="server" meta:resourceKey="Ucommerce_Ordernumber" /></span></th>
						<th><span><asp:Localize runat="server" meta:resourceKey="Ucommerce_CustomerName" /></span></th>
						<th><span><asp:Localize runat="server" meta:resourceKey="Ucommerce_Status" /></span></th>
						<th><span><asp:Localize runat="server" meta:resourceKey="Ucommerce_CompletedDate" /></span></th>
						<th><span><asp:Localize runat="server" meta:resourceKey="Ucommerce_CompletedDate" /></span></th>
						<th><span><asp:Localize runat="server" meta:resourceKey="Ucommerce_CatalogSetName" /></span></th>
						<th><span><asp:Localize runat="server" meta:resourceKey="Ucommerce_Currency" /></span></th>
						<th class="rightAligned" ><span><asp:Localize runat="server" meta:resourceKey="Ucommerce_OrderTotal" /></span></th>
					</tr>
				</thead>
				<tbody>
		</HeaderTemplate>
		<ItemTemplate>
			<tr data-orderid="<%# DataBinder.Eval(Container.DataItem, "OrderId") %>" class="clickable">
				<td class="orderSelect">
				    <asp:HiddenField runat="server" ID="orderId" Value='<%# Eval("OrderId") %>' />
                    <asp:CheckBox runat="server" ID="purchaseOrders" Visible='<%# CanChangeOrderStatusForProductCatalogGroup((int)DataBinder.Eval(Container.DataItem, "ProductCatalogGroupId")) %>' />
				</td>
				<td style="padding-right: 20px" class="orderClickable"><%# SanitizeOutput((string)DataBinder.Eval(Container.DataItem, "OrderNumber")) %></td>
				<td class="orderClickable"><%# SanitizeOutput((string)DataBinder.Eval(Container.DataItem, "CustomerName")) %></td>
				<td class="orderClickable"><%# SanitizeOutput(View.OrderStatus.Name) %></td>
				<td class="orderClickable"><%# DataBinder.Eval(Container.DataItem, "CompletedDate") %></td>
				<td class="orderClickable"><%# GetCompletedDateTicks(Container.DataItem) %></td>
				<td class="orderClickable"><%# SanitizeOutput((string)DataBinder.Eval(Container.DataItem, "ProductCatalogGroupName"))%></td>
				<td class="orderClickable"><%# SanitizeOutput((string)DataBinder.Eval(Container.DataItem, "BillingCurrencyIsoCode"))%></td>
				<td style="padding-right: 15px" align="right" class="rightAligned orderClickable"><%# Format((decimal)DataBinder.Eval(Container.DataItem, "OrderTotal"))%></td>
			</tr>
		</ItemTemplate>
		<FooterTemplate>
			</tbody>
            </table>
		</FooterTemplate>
	</asp:Repeater>
	<div class="propertyPaneFooter">-</div>
</div>
