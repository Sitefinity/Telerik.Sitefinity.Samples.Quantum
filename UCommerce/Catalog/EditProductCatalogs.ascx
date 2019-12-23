<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditProductCatalogs.ascx.cs" Inherits="UCommerce.Web.UI.Catalog.EditProductCatalogs" %>
<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../Controls/ValidationSummaryDisplay.ascx" %>

<commerce:ValidationSummary runat="server" />
<div class="propertyPane leftAligned categoriesForProducts">
    <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourcekey="Productcategories"></asp:Localize></h2>
    <div class="propertyItem">
        <div class="propertyItemHeader"><asp:Localize runat="server" meta:resourcekey="Productcategories"></asp:Localize></div>
        <div class="propertyItemContent">                
            <div style="height: 100%;">
                <asp:PlaceHolder ID="CategoriesPlaceHolder" runat="server"></asp:PlaceHolder>                    
            </div>
            <asp:CustomValidator runat="server" CssClass="validator" ID="ProductCategoriesValidator" ErrorMessage='<%# GetLocalResourceObject("ProductCategories") %>' Display="None" OnServerValidate="OnServerValidate"></asp:CustomValidator>
        </div>
        <div class="propertyPaneFooter"></div>
    </div>
</div> 
