<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchOrders.ascx.cs" Inherits="UCommerce.Web.UI.Orders.SearchOrders" %>

<script type="text/javascript">
	function openOrderView(id) {
		this.document.location.href = 'EditOrder.aspx?id=' + id;
	}

	$(function () {
		$("#orderTable").dataTable(
		{
			"bPaginate": false,
			// disable initial sort
            "aaSorting": [],
            "fnInitComplete": function (oSettings, json) {
                if (UCommerceClientMgr.Shell === "Umbraco8") {
                    $('#orderTable_filter > label > input[type=text]').attr('placeholder', 'Type to search...');
                    $('#orderTable_filter > label').append('<i class="icon icon-search"></i>');

                }
            }
		});
	});	
</script>

<div class="propertyPane leftAligned ">
	<h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourcekey="Search" /></h2>
	<commerce:PropertyPanel runat="server" meta:resourceKey="OrderNumberText">
        <asp:TextBox runat="server" ID="OrderNumberTextBox" CssClass="mediumWidth" />        
    </commerce:PropertyPanel>    
    <commerce:PropertyPanel runat="server" meta:resourceKey="FirstName">
        <asp:TextBox runat="server" ID="CustomerFirstNameTextBox" CssClass="mediumWidth" />        
    </commerce:PropertyPanel>    
    <commerce:PropertyPanel runat="server" meta:resourceKey="LastName">
        <asp:TextBox runat="server" ID="CustomerLastNameTextBox" CssClass="mediumWidth" />
    </commerce:PropertyPanel>
    <commerce:PropertyPanel runat="server" meta:resourceKey="Email">
        <asp:TextBox runat="server" ID="EmailTextBox" CssClass="mediumWidth" />
    </commerce:PropertyPanel>
    <commerce:PropertyPanel runat="server" meta:resourceKey="PhoneNumber">
        <asp:TextBox runat="server" ID="PhoneNumberTextBox" CssClass="mediumWidth" />
    </commerce:PropertyPanel>
    <commerce:PropertyPanel runat="server" meta:resourceKey="OrderStatus">
        <asp:DropDownList runat="server" ID="OrderStatusDropDown" DataValueField="OrderStatusId" DataTextField="Name" CssClass="mediumWidth"></asp:DropDownList>
    </commerce:PropertyPanel>
    <commerce:PropertyPanel runat="server" meta:resourceKey="Group">
        <asp:DropDownList runat="server" ID="GroupDropDown" DataValueField="ProductCatalogGroupId" DataTextField="Name" CssClass="mediumWidth" />
    </commerce:PropertyPanel>
    <commerce:PropertyPanel runat="server" meta:resourceKey="PaymentReference">
        <asp:TextBox runat="server" ID="PaymentReferenceTextBox" CssClass="mediumWidth" />
    </commerce:PropertyPanel>
    <commerce:PropertyPanel runat="server" Text="&nbsp;" WithoutHeader="True">
        <asp:Button runat="server" ID="SearchButton" CssClass="mediumButton" OnClick="SearchButton_Clicked" meta:resourceKey="SearchButton" />
    </commerce:PropertyPanel>
	<div class="propertyPaneFooter"></div>
</div>

<asp:Panel ID="SearchResultsPane" Visible="False" runat="server" cssclass="propertyPane leftAligned tablePropertyPane">
	<h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourcekey="SearchResults" /></h2>

	<asp:Repeater runat="server" ID="OrdersRepeater" EnableViewState="false">
        <HeaderTemplate>
            <table class="dataList" cellspacing="0" width="100%" id="orderTable">
                <thead>
					<tr>
						<th><span><asp:Localize runat="server" meta:resourceKey="Ucommerce_Ordernumber" /></span></th>
						<th><span><asp:Localize runat="server" meta:resourceKey="Ucommerce_CustomerName" /></span></th>
						<th><span><asp:Localize runat="server" meta:resourceKey="Ucommerce_Status" /></span></th>
						<th><span><asp:Localize runat="server" meta:resourceKey="Ucommerce_CompletedDate" /></span></th>
						<th><span><asp:Localize runat="server" meta:resourceKey="Ucommerce_CatalogSetName" /></span></th>
						<th><span><asp:Localize runat="server" meta:resourceKey="Ucommerce_Currency" /></span></th>
						<th class="rightAligned"><span><asp:Localize runat="server" meta:resourceKey="Ucommerce_OrderTotal" /></span></th>
					</tr>
				</thead>
				<tbody>
        </HeaderTemplate>
        <ItemTemplate>
                <tr class="clickable" onclick='openOrderView(<%# DataBinder.Eval(Container.DataItem, "OrderId") %>);return false;'>
                    <td style="padding-right: 15px"><%# SanitizeOutput((string)DataBinder.Eval(Container.DataItem, "OrderNumber")) %></td>
                    <td><%# SanitizeOutput((string)DataBinder.Eval(Container.DataItem, "CustomerName")) %></td>
                    <td><%# SanitizeOutput((string)DataBinder.Eval(Container.DataItem, "Status")) %></td>
                    <td><%# DataBinder.Eval(Container.DataItem, "CompletedDate") %></td>
					<td><%# SanitizeOutput((string)DataBinder.Eval(Container.DataItem, "CatalogSetName"))%></td>
					<td><%# SanitizeOutput((string)DataBinder.Eval(Container.DataItem, "Currency"))%></td>
                    <td class="rightAligned" style="padding-right: 15px"><%#  GetOrderTotal(Container.DataItem) %></td>
                </tr>
        </ItemTemplate>
        <FooterTemplate>
				</tbody>
            </table>
        </FooterTemplate>
    </asp:Repeater>	
	<div class="propertyPaneFooter"></div>
</asp:Panel>