<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductTop10.ascx.cs" Inherits="UCommerce.Web.UI.Analytics.ProductTop10" %>

<script type="text/javascript">
	$(function () {
		$("#reportTable").dataTable(
			{
				"bPaginate": false,
				// disable initial sort
                "aaSorting": [],
                "fnInitComplete": function (oSettings, json) {
                    $('#reportTable_filter > label > input[type=text]').attr('placeholder', 'Type to search...');
                    $('#reportTable_filter > label').append('<i class="icon icon-search"></i>');
                }
			}
		);
	});
</script>
<div class="propertyPane reportPropertyPane leftAligned">
	<h2 class="propertyPaneTitel"><asp:Localize ID="Localize4" runat="server" meta:resourceKey="Filters" /></h2>
	<asp:DropDownList id="ProductCatalogGroupDropDownList" CssClass="AnalyticsProductCatalogGroupDropDownList" runat="server" DataTextField="Name" DataValueField="ProductCatalogGroupId" />
	<asp:Button id="ReportButton" runat="server" CssClass="ReportButton mediumButton" meta:resourcekey="ReportButton" />
</div>

<asp:panel runat="server" id="ReportPanel" cssclass="propertyPane tablePropertyPane leftAligned" visible="false">
	<h2 class="propertyPaneTitel reportHeader" style="margin:0px;"><asp:Localize runat="server" meta:resourcekey="ReportHeader" /></h2>
	<asp:Repeater runat="server" ID="ProductTop10Repeater">
    <HeaderTemplate>
			<table class="dataList" cellspacing="0" width="100%" id="reportTable">
				<thead>
					<tr>
						<th><asp:Localize ID="Localize2" runat="server" meta:resourceKey="SKU" /></th>
						<th><asp:Localize ID="Localize3" runat="server" meta:resourceKey="ProductName" /></th>
						<th class="rightAligned"><asp:Localize ID="Localize4" runat="server" meta:resourceKey="TotalSales" /></th>
						<th class="rightAligned"><asp:Localize ID="Localize1" runat="server" meta:resourceKey="Currency" /></th>
						<th class="rightAligned"><asp:Localize ID="Localize5" runat="server" meta:resourceKey="TotalRevenue" /></th>
					</tr>
				</thead>
				<tbody>
    </HeaderTemplate>
    <ItemTemplate>
				<tr>
					<td style="padding-right: 15px"><%# SanitizeOutput((string)DataBinder.Eval(Container.DataItem, "SKU")) %> <%# SanitizeOutput((string)DataBinder.Eval(Container.DataItem, "VariantSku")) %></td>
					<td style="padding-right: 15px"><%# SanitizeOutput((string)DataBinder.Eval(Container.DataItem, "ProductName")) %></td>
					<td class="rightAligned"><%# DataBinder.Eval(Container.DataItem, "TotalSales") %></td>
					<td class="rightAligned"><%# SanitizeOutput((string)DataBinder.Eval(Container.DataItem, "Currency")) %></td>
					<td class="rightAligned"><%# ((decimal)DataBinder.Eval(Container.DataItem, "TotalRevenue")).ToString("N") %></td>
				</tr>
    </ItemTemplate>
    <FooterTemplate>
				</tbody>
			</table>
    </FooterTemplate>
</asp:Repeater>
<div class="propertyPaneFooter"></div>
</asp:panel>