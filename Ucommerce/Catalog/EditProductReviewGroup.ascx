<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditProductReviewGroup.ascx.cs" Inherits="Ucommerce.Web.UI.Catalog.EditProductReviewGroup" %>
<%@ Register TagPrefix="commerce" TagName="ProductReview" Src="ProductReviewsList.ascx" %>


<div style="text-align: left;">
	<div class="propertyPane" runat="server">
		<h2 class="propertyPaneTitel">
			<asp:Localize runat="server" meta:resourcekey="EditReviews"/>
		</h2>
		<div class="propertyPaneUcommerce pending-reviews" style="padding: 10px">
			<div>
				<commerce:productreview runat="server" id="ProductReviewList" displayproductname="true" newcomments="true" displayonlycommentswithstatusnewandreported="true" NoReviewText="<%# NoReviewText %>" />
			</div>
		</div>
	</div>
</div>


