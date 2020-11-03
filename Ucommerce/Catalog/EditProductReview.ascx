<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditProductReview.ascx.cs" Inherits="Ucommerce.Web.UI.Catalog.EditProductReview" %>
<%@ Register TagPrefix="commerce" TagName="ProductReview" Src="ProductReviewsList.ascx" %>

<div class="propertyPane productReviews propertyPaneUcommerce" runat="server">
    <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourcekey="EditProductReviews"></asp:Localize></h2>
    <commerce:ProductReview runat="server" ID="ProductReviewList" DataSource="<%# View.Product.ProductReviews %>" 
        DisplayProductName="false" NewComments="false" DisplayOnlyCommentsWithStatusNewAndReported="false" NoReviewText="<%# NoReviewText %>" />
</div>