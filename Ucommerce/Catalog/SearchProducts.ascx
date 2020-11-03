<%@ control language="C#" autoeventwireup="true" codebehind="SearchProducts.ascx.cs" inherits="Ucommerce.Web.UI.Catalog.SearchProducts" %>

<script type="text/javascript">
    function openProductView(url) {
        this.document.location.href = url;
    }
    $(function () {
        $("#productTable").dataTable(
            {
                "bPaginate": false,
                // disable initial sort
                "aaSorting": [],
                "fnInitComplete": function (oSettings, json) {
                    $('#productTable_filter > label > input[type=text]').attr('placeholder', 'Type to search...');
                    $('#productTable_filter > label').append('<i class="icon icon-search"></i>');
                }
            }
        );
    });		
</script>
<div class="propertyPane">
	 <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourceKey="ProductSearch" /></h2>
    <commerce:propertypanel runat="server" meta:resourcekey="SkuNumber">
		<asp:TextBox runat="server" ID="ProductSkuNumber" CssClass="mediumWidth" />        
	</commerce:propertypanel>
    <commerce:propertypanel runat="server" meta:resourcekey="VariantSkuNumber">
		<asp:TextBox runat="server" ID="ProductVariantSkuNumber" CssClass="mediumWidth" />        
	</commerce:propertypanel>
    <commerce:propertypanel runat="server" meta:resourcekey="DisplayName">
		<asp:TextBox runat="server" ID="ProductName" CssClass="mediumWidth" />        
	</commerce:propertypanel>
    <commerce:propertypanel runat="server" meta:resourcekey="Description">
		<asp:TextBox runat="server" ID="ProductDescription" CssClass="mediumWidth" />        
	</commerce:propertypanel>
    <commerce:propertypanel runat="server" meta:resourcekey="ProductDefinition">
		<asp:DropDownList runat="server" ID="ProductDefinitions" DataTextField="Name" DataValueField="ProductDefinitionId" CssClass="mediumWidth"  />
	</commerce:propertypanel>
    <commerce:propertypanel runat="server" meta:resourcekey="ProductCatalogGroup">
		<asp:DropDownList runat="server" ID="ProductCatalogGroups" DataTextField="Name" DataValueField="ProductCatalogGroupId" CssClass="mediumWidth"  />
	</commerce:propertypanel>
    <commerce:propertypanel runat="server" meta:resourcekey="ProductCatalog">
		<asp:DropDownList runat="server" ID="ProductCatalogs" DataTextField="Name" DataValueField="ProductCatalogId" CssClass="mediumWidth"  />
	</commerce:propertypanel>
    <commerce:propertypanel runat="server" text="&nbsp;" withoutheader="True">
		<asp:Button runat="server" ID="SearchButton" CssClass="mediumButton" OnClick="SearchButton_Clicked" meta:resourceKey="Search" />
	</commerce:propertypanel>
    <div class="propertyPaneFooter">-</div>
</div>
<asp:panel cssclass="propertyPane" id="SearchResults" runat="server">
	<asp:Repeater runat="server" ID="ProductRepeater" EnableViewState="false">
		<HeaderTemplate>
			<table class="dataList" cellspacing="0" width="100%" id="productTable">
				<thead>
					<tr>
						<th><span><asp:Localize runat="server" meta:resourceKey="SkuNumber" /></span></th>
						<th><span><asp:Localize runat="server" meta:resourceKey="Name" /></span></th>
						<th><span><asp:Localize runat="server" meta:resourceKey="DisplayName" /></span></th>
						<th><span><asp:Localize runat="server" meta:resourceKey="DisplayOnSite" /></span></th>
						<th><span><asp:Localize runat="server" meta:resourceKey="Category" /></span></th>
						<th><span><asp:Localize runat="server" meta:resourceKey="ProductDefinition" /></span></th>
						<th><span><asp:Localize runat="server" meta:resourceKey="Currency" /></span></th>
						<th class="rightAligned" ><span><asp:Localize runat="server" meta:resourceKey="Price" /></span></th>
					</tr>
				</thead>
				<tbody>
		</HeaderTemplate>
		<ItemTemplate>
					<tr class="clickable" onclick="openProductView('<%# GetProductLink(Container.DataItem) %>');">
						<td><%# GetSkuAndVariantNumber(Container.DataItem) %></td>
						<td><%# GetName(Container.DataItem) %></td>
						<td><%# GetDisplayName(Container.DataItem) %></td>
						<td><%# DataBinder.Eval(Container.DataItem, "DisplayOnSite") %></td>
						<td><%# GetCategory(Container.DataItem) %></td>
						<td>
							<a href='<%# GetProductDefinitionLink(Container.DataItem) %>'>
								<%# GetProductDefinitionName(Container.DataItem) %>
							</a>
						</td>
						<td>
							<%# GetCurrency(Container.DataItem) %>
						</td>
						<td class="rightAligned"><%# GetPrice(Container.DataItem) %></td>
					</tr>
		</ItemTemplate>
		<FooterTemplate>
				</tbody>
			</table>
		</FooterTemplate>
	</asp:Repeater>
	<div class="propertyPaneFooter">-</div>
</asp:panel>
