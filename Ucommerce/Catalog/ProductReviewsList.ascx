<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductReviewsList.ascx.cs" Inherits="Ucommerce.Web.UI.Catalog.ProductReviewList" %>

<script type="text/javascript">

	$(document).ready(function () {
	    $(".commentLink").click(function() {
	        $("#" + this.id + "Comment").slideToggle("normal");
	    });
	    $(".commentNewLink").show(function() {
	        $("#" + this.id + "Comment").slideToggle("normal");
	    });
		$(".commentNewLink").click(function () {
			$("#" + this.id + "Comment").slideToggle("normal");
		}
		);

		function UpdateReview(idValue, action) {
			$.get("ProductReviewHandler.ashx",
				{
					id: idValue,
					action: action
				},
				function (data) {
					$("#reviewStatus_" + idValue).html(action);
				}
			);
		}
		function UpdateReviewComment(idValue, action) {
			$.get("ProductReviewCommentHandler.ashx",
				{
					id: idValue,
					action: action
				},
				function (data) {
					$("#reviewCommentStatus_" + idValue).html(action);
				}
			);
		}
		
		$(document).on("click", ".approved", function() {
	        action = $(this).attr("actionValue");
	        idValue = $(this).attr("idValue");
	        type = $(this).attr("type");
	        $(this).attr("class", "");
	        $("#imageCross" + type + idValue).attr("class", "unapproved");
	        if (action == "Approved") {
	            $("#imageTick" + type + idValue).attr("src", "../images/ui/tick.png");
	            $("#imageCross" + type + idValue).attr("src", "../images/ui/cross_grey.png");

	            if (type == "Review") {
	                UpdateReview(idValue, action);
	            }
	            if (type == "Comment") {
	                UpdateReviewComment(idValue, action);
	            }
	        }
		});
		$(document).on("click", ".unapproved", function() {
	        action = $(this).attr("actionValue");
	        idValue = $(this).attr("idValue");
	        type = $(this).attr("type");
	        $(this).attr("class", "");
	        $("#imageTick" + type + idValue).attr("class", "approved");
	        if (action == "Unapproved") {
	            $("#imageTick" + type + idValue).attr("src", "../images/ui/tick_grey.png");
	            $("#imageCross" + type + idValue).attr("src", "../images/ui/cross.png");

	            if (type == "Review") {
	                UpdateReview(idValue, action);
	            }
	            if (type == "Comment") {
	                UpdateReviewComment(idValue, action);
	            }
	        }
	    });
	});

</script>

<asp:Repeater id="ProductReviewRepeater" runat="server" EnableViewState="true" 
	onitemdatabound="ProductReviewRepeater_ItemDataBound">

    <HeaderTemplate>
        <table style="width:100%;" cellspacing="0" class="reviewList">
            <tr style="background-color:inherit;">
                <th style="width:29px;"></th>
                <th class="iconWidth"></th>
            </tr>
    </HeaderTemplate>

    <ItemTemplate>
			<tr>
				<td colspan="6">
					<table cellspacing="0" style="width:100%; margin-bottom:10px; padding:5px;">
						<% if(DisplayProductName){ %>
						<tr style="background-color:inherit;">
							<td colspan="6" class="headlineText">
								<h3 class="product-name <%# ClassForProductName(AsProductReview(Container.DataItem)) %>"><%# ProductName(AsProductReview(Container.DataItem)) %>
								</h3>
							</td>
						</tr>
						<% } %>
						<tr style="background-color:inherit; border-bottom:solid 1px #f8f8f8; padding-bottom:10px; padding-top:10px;">
							<% if(CanEditProduct()){ %>
							<td class="iconWidth" style="border-bottom:solid 1px #f8f8f8;">
									<img id="imageTickReview<%# AsProductReview(Container.DataItem).ProductReviewId %>" alt="Approve" idValue="<%# AsProductReview(Container.DataItem).ProductReviewId %>" class="<%# SetImageClass(AsProductReview(Container.DataItem).ProductReviewStatus.Name, "Approve")%>" type="Review" actionValue="Approved" src="<%#SetImageSrc(AsProductReview(Container.DataItem).ProductReviewStatus.Name,"Approve")%>" />
							</td>
							<td class="iconWidth" style="border-bottom:solid 1px #f8f8f8;">
								<img id="imageCrossReview<%# AsProductReview(Container.DataItem).ProductReviewId %>" alt="Unapprove" idValue="<%# AsProductReview(Container.DataItem).ProductReviewId %>"  class="<%# SetImageClass(AsProductReview(Container.DataItem).ProductReviewStatus.Name, "Unapprove")%>" type="Review" actionValue="Unapproved" src="<%#SetImageSrc(AsProductReview(Container.DataItem).ProductReviewStatus.Name,"Unapprove")%>"  />
							</td>
							<% } else { %>
							<td class="iconWidth" style="border-bottom:solid 1px #f8f8f8;">
									<img alt="Approve" class="<%# SetImageClass(AsProductReview(Container.DataItem).ProductReviewStatus.Name, "Approve")%>" type="Review" actionValue="Approved" src="<%#SetImageSrc(AsProductReview(Container.DataItem).ProductReviewStatus.Name,"Approve")%>" />
							</td>
							<td class="iconWidth" style="border-bottom:solid 1px #f8f8f8;">
								<img alt="Unapprove" class="<%# SetImageClass(AsProductReview(Container.DataItem).ProductReviewStatus.Name, "Unapprove")%>" type="Review" actionValue="Unapproved" src="<%#SetImageSrc(AsProductReview(Container.DataItem).ProductReviewStatus.Name,"Unapprove")%>"  />
							</td>
							<% } %>
							<td colspan="3" style="border-bottom:solid 1px #f8f8f8;">
								<asp:Label runat="server"><b><%# TextSanitizer.SanitizeOutput(AsProductReview(Container.DataItem).ReviewHeadline) %></b></asp:Label>
								<asp:Label runat="server"><%#GetResourceKey("By") %></asp:Label>
								<asp:Label runat="server"><b><%# GetFullName(AsProductReview(Container.DataItem)) %></b></asp:Label>
				    			<asp:Label runat="server"><%# AsProductReview(Container.DataItem).CreatedOn %></asp:Label>	
							</td>
							<td class="ratingWidth" style="text-align:right; border-bottom:solid 1px #f8f8f8;">
								<asp:Label runat="server"><%# RatingImages(AsProductReview(Container.DataItem)) %></asp:Label>
							</td>
						</tr>
						<tr style="background-color:inherit; padding-top:10px">
							<td></td>
							<td></td>
							<td style="padding-top:10px;" colspan="3"><asp:Label runat="server" text="<%# TextSanitizer.SanitizeOutput(AsProductReview(Container.DataItem).ReviewText) %>" /> <br /><br /></td>
							<td></td>
						</tr>
						<tr style="background-color:inherit;">
							<td></td>
							<td></td>
							<td colspan="3">
								<span id="reviewStatus_<%# AsProductReview(Container.DataItem).ProductReviewId %>">
									<asp:Label runat="server" text="<%# GetResourceKey(AsProductReview(Container.DataItem).ProductReviewStatus.Name) %>" />,
								</span>
								<asp:Label runat="server" text="<%# HelpfulVotesVsTotalVotes(AsProductReview(Container.DataItem))  %>" />
							</td>
							<td style="text-align:right;">
								<%if(!NewComments) { %>	
									<asp:Label id="<%# AsProductReview(Container.DataItem).ProductReviewId  %>_ProductReview" class="commentLink">
									<img runat="server" style="margin-bottom:-5px"  src="../images/ui/comment.png" />

									<a href="#"><%# GetResourceKey("Comments") %> (<%# AsProductReview(Container.DataItem).Comments.Count  %>)</a>
									</asp:Label>
								<% } %>
								<%if (NewComments) { %>
									<asp:Label id="<%# AsProductReview(Container.DataItem).ProductReviewId  %>_ProductReview" class="commentNewLink">
									<img runat="server" style="margin-bottom:-5px"  src="../images/ui/comment.png" />

									<a href="#"><%# GetResourceKey("Comments") %> (<%# AsProductReview(Container.DataItem).Comments.Count %>)</a>
									</asp:Label>
								<% } %>
							</td>
						</tr>
						<tr style="background-color:inherit;">
							<td colspan="6">
							<div style="display:none;" id="<%# AsProductReview(Container.DataItem).ProductReviewId  %>_ProductReviewComment">
								<asp:Repeater runat="server" id="ProductReviewCommentRepeater" EnableViewState="true" DataSource="<%# GetComments(AsProductReview(Container.DataItem)) %>">
                
									<HeaderTemplate>
										
									</HeaderTemplate>

									<ItemTemplate>
										<table cellspacing="0" padding="0px" class="<%#ReviewItemCounter%2==0?"commentList":"commentListOdd" %>" style="width:100%;">
											<tr>
												<td style="padding-left:40px;">
													<table cellspacing="0" class="maxWidth">
														<tr style="background-color:inherit;">
															<td class="iconWidth">
																<img id="imageTickComment<%# AsProductReviewComment(Container.DataItem).ProductReviewCommentId %>" idValue="<%# AsProductReviewComment(Container.DataItem).ProductReviewCommentId %>" actionValue="Approved" class="<%# SetImageClass(AsProductReviewComment(Container.DataItem).ProductReviewStatus.Name, "Approve")%>" type="Comment" src="<%#SetImageSrc(AsProductReviewComment(Container.DataItem).ProductReviewStatus.Name,"Approve")%>"  />
															</td>
															<td class="iconWidth">
																<img id="imageCrossComment<%# AsProductReviewComment(Container.DataItem).ProductReviewCommentId %>" idValue="<%# AsProductReviewComment(Container.DataItem).ProductReviewCommentId %>" actionValue="Unapproved" class="<%# SetImageClass(AsProductReviewComment(Container.DataItem).ProductReviewStatus.Name, "Unapprove")%>" type="Comment" src="<%#SetImageSrc(AsProductReviewComment(Container.DataItem).ProductReviewStatus.Name,"Unapprove")%>"  />
														
															</td>
															<td>
																<b>
																	<asp:Label runat="server" text="<%# GetFullName(AsProductReviewComment(Container.DataItem)) %>" />
																</b>
																	<asp:Label runat="server" text="<%# AsProductReviewComment(Container.DataItem).CreatedOn  %>" />
															</td>
															<td class="ratingWidth" style="text-align:right;">
																<asp:Image id="HelpfulImage" runat="server" visible="<%# AsProductReviewComment(Container.DataItem).Helpful || AsProductReviewComment(Container.DataItem).Unhelpful %>" ImageUrl="<%# GetHelpfulImage(AsProductReviewComment(Container.DataItem)) %>"></asp:Image>
															</td>
														</tr>
														<tr style="background-color:inherit;">
															<td></td>
															<td></td>
															<td>
																<asp:Label runat="server" text="<%# TextSanitizer.SanitizeOutput(AsProductReviewComment(Container.DataItem).Comment)  %>" /><br /><br />
															</td>
															<td></td>
														</tr>
														<tr style="background-color:inherit;">
															<td></td>
															<td></td> 
															<td>
																<span id="reviewCommentStatus_<%# AsProductReviewComment(Container.DataItem).ProductReviewCommentId %>">
																	<asp:Label runat="server" text="<%# GetResourceKey(AsProductReviewComment(Container.DataItem).ProductReviewStatus.Name) %>" />
																</span>
															</td>
															<td></td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</ItemTemplate>
									<FooterTemplate>
									</FooterTemplate>
                
								</asp:Repeater>
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
    </ItemTemplate>

    <FooterTemplate>
		</table>
       <asp:Label ID="NoReviewsLabel" CssClass="NoReviewsLabel" runat="server" Text="<%# NoReviewText %>" Visible="false"/>
    </FooterTemplate>

</asp:Repeater>