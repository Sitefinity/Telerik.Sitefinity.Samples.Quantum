<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditCategoryProducts.ascx.cs" Inherits="Ucommerce.Web.UI.Catalog.EditCategoryProducts" %>

<div class="propertyPane leftAligned" data-role="productsInCategory">
    <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourcekey="ProductsspeeInCategory"></asp:Localize></h2>
    <asp:Repeater runat="server" ID="ProductRepeater" EnableViewState="false">
        <HeaderTemplate>
            <table class="dataList" cellspacing="0" width="100%" id="productTable">
                <thead>
					<tr>
						<th><span><asp:Localize runat="server" meta:resourceKey="Sku" /></span></th>
						<th><span><asp:Localize runat="server" meta:resourceKey="Name" /></span></th>
						<th><span><asp:Localize runat="server" meta:resourceKey="ProductType" /></span></th>
						<th><span><asp:Localize runat="server" meta:resourceKey="Currency" /></span></th>
						<th class="rightAligned"><span><asp:Localize runat="server" meta:resourceKey="Price" /></span></th>
					</tr>
				</thead>
				<tbody>
        </HeaderTemplate>
        <ItemTemplate>
                <tr class="clickable" onclick='openProductView(<%# DataBinder.Eval(Container.DataItem, "ProductId") %>, <%# View.Category.CategoryId %>);return false;'>
                    <td style="padding-right: 15px"><%# SanitizeOutput(DataBinder.Eval(Container.DataItem, "Sku")) %></td>
                    <td><%# SanitizeOutput(DataBinder.Eval(Container.DataItem, "Name")) %></td>
                    <td><%# SanitizeOutput(DataBinder.Eval(Container.DataItem, "ProductDefinitionDisplayName")) %></td>
					<td><%# Currency %></td>
                    <td class="rightAligned" ><%# DataBinder.Eval(Container.DataItem, "PriceAmount", "{0:n}")%></td>
                </tr>
        </ItemTemplate>
        <FooterTemplate>
				</tbody>
            </table>
        </FooterTemplate>
    </asp:Repeater>
	<div class="propertyPaneFooter"></div>
</div>     

<script type="text/javascript">
    function openProductView(productId, parentCategoryId) {
        this.document.location.href = 'editproduct.aspx?id=' + productId + '&parentcategoryId=' + parentCategoryId;
    }

    $(function () {
        $("#productTable").dataTable(
			{
                "bPaginate": false,
                "oLanguage": {
                    "sSearch": "Start typing to search for products"
                },
			    // disable initial sort
                "aaSorting": [],
                "fnInitComplete": function(oSettings, json) {
                    $('#productTable_filter > label > input[type=text]').attr('placeholder', 'Type to search...');
                    $('#productTable_filter > label').append('<i class="icon icon-search"></i>');
                    $('div[data-role="productsInCategory"]').parent().parent().addClass('position-relative');
                }
			}
		);
    });
</script>