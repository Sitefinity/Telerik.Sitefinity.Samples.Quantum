<%@ control language="C#" autoeventwireup="true" codebehind="ProductUi.ascx.cs" inherits="Ucommerce.Web.UI.Ucommerce.Marketing.Targets.ProductUi" %>
<%@ Register TagPrefix="presentation" Assembly="Ucommerce.Presentation" namespace="Ucommerce.Presentation.Web.Controls" %>

<table cellpadding="0" cellspacing="0" style="width:100%;">
	<tr>
		<td>
			<asp:PlaceHolder runat="server" id="NoProductSelectedPlaceHolder">
				<asp:Localize id="NoProductSelectedLabel" runat="server" meta:resourcekey="NoProductSelected" />
			</asp:PlaceHolder>

			<asp:Repeater runat="server" ID="ProductTargetsRepeater">
			    <ItemTemplate>
			        <div class="productTarget">
                        <asp:Localize id="NameLabel" runat="server" meta:resourcekey="Name"></asp:Localize>: <span><%# SanitizeOutput((string)DataBinder.Eval(Container.DataItem, "FamilyName"))%> <%# SanitizeOutput((string)DataBinder.Eval(Container.DataItem, "Name")) %></span><br />
	                    <asp:Localize id="SkuLabel" runat="server" meta:resourcekey="Sku" />: <span><%# SanitizeOutput((string)DataBinder.Eval(Container.DataItem, "Sku")) %> <%# SanitizeOutput(GetSku(DataBinder.Eval(Container.DataItem, "VariantSku"))) %></span><br />
                    </div>
			    </ItemTemplate>
			</asp:Repeater>
		</td>
		<td style="width:50px; text-align:right; vertical-align:top;">
			<presentation:LabeledImageButton CssClass="edit-image-button" id="SelectProductButton" runat="server" ImageUrl="../../Images/ui/pencil.png" meta:resourcekey="Edit" />
			<presentation:LabeledImageButton CssClass="delete-image-button" id="DeleteTargetButton" runat="server" ImageUrl="../../Images/ui/cross.png" meta:resourcekey="Delete" onclick="DeleteTargetButton_Click" /><br />
		</td>
	</tr>
</table>