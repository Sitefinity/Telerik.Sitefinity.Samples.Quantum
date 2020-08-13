<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesTotals.ascx.cs" Inherits="Ucommerce.Web.UI.Analytics.SalesTotals" %>
<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../Controls/ValidationSummaryDisplay.ascx" %>
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
<commerce:validationsummary runat="server" />
<div class="propertyPane leftAligned SalesStrip" ID="SalesStrip" runat="server">
	  <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourcekey="SalesTotalsHeader" /></h2>
</div>
<asp:panel runat="server" cssclass="propertyPane leftAligned" visible="false" id="ReportPanel">
	<h2 class="propertyPaneTitel reportHeader" style="margin:0px;"><asp:Localize runat="server" meta:resourcekey="ReportHeader" /></h2>
    <asp:Repeater runat="server" ID="SalesTotalRepeater">
        <HeaderTemplate>
				<table class="dataList" id="reportTable" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th><asp:Localize ID="Localize1" runat="server" meta:resourceKey="ProductCatalogGroupName" /></th>
							<th><asp:Localize ID="Localize6" runat="server" meta:resourceKey="Currency" /></th>
							<th class="rightAligned"><asp:Localize ID="Localize2" runat="server" meta:resourceKey="Revenue" /></th>
							<th class="rightAligned"><asp:Localize ID="Localize3" runat="server" meta:resourceKey="VATTotal" /></th>
							<th class="rightAligned"><asp:Localize ID="Localize4" runat="server" meta:resourceKey="TaxTotal" /></th>
							<th class="rightAligned"><asp:Localize ID="Localize5" runat="server" meta:resourceKey="Shippingtotal" /></th>
						</tr>
					</thead>
					<tbody>
        </HeaderTemplate>
        <ItemTemplate>
					<tr class="contentRow">
						<td style="padding-right: 15px"><%# SanitizeOutput((string)DataBinder.Eval(Container.DataItem, "Name")) %></td>
						<td style="padding-right: 15px"><%# SanitizeOutput((string)DataBinder.Eval(Container.DataItem, "Currency")) %></td>
						<td class="rightAligned"><%# ((decimal)DataBinder.Eval(Container.DataItem, "Revenue")).ToString("N") %></td>
						<td class="rightAligned"><%# ((decimal)DataBinder.Eval(Container.DataItem, "VATTotal")).ToString("N") %></td>
						<td class="rightAligned"><%# ((decimal)DataBinder.Eval(Container.DataItem, "TaxTotal")).ToString("N") %></td>
						<td class="rightAligned"><%# ((decimal)DataBinder.Eval(Container.DataItem, "ShippingTotal")).ToString("N") %></td>
					</tr>
        </ItemTemplate>
        <FooterTemplate>
				</tbody>
            </table>
        </FooterTemplate>
    </asp:Repeater>
	<div class="propertyPaneFooter"></div>
</asp:panel>