<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AmountOffOrderTotalUi.ascx.cs" Inherits="UCommerce.Web.UI.UCommerce.Marketing.Awards.AmountOffOrderTotalUi" %>
<%@ Register TagPrefix="presentation" Assembly="UCommerce.Presentation" namespace="UCommerce.Presentation.Web.Controls" %>

<table cellpadding="0" cellspacing="0" style="width:100%;">
	<tr>
		<td>
			<asp:PlaceHolder runat="server" id="NonEditModePlaceHolder">
				<asp:Label runat="server" id="AmountOffOrderTotalLabel" />
			</asp:PlaceHolder>

			<asp:PlaceHolder runat="server" id="EditModePlaceHolder"  visible="false">
				<asp:TextBox runat="server" id="AmountOffOrderTotalText" cssClass="width100" /><br/>
				<asp:RegularExpressionValidator id="DecimalValidator" runat="server" ControlToValidate="AmountOffOrderTotalText" 
								Style="color:Red;" ValidationExpression="^(\d|-)?(\d|,)*\.?\d*$" ValidationGroup="AmountOffOrderTotal"
								Display="Dynamic" />
				<asp:RequiredFieldValidator id="RequiredValidator" runat="server" ValidationGroup="AmountOffOrderTotal"
								ControlToValidate="AmountOffOrderTotalText" Display="Dynamic" CssClass="validator"/>
			</asp:PlaceHolder>
		</td>
		<td style="width:50px; text-align:right; vertical-align:top;">
			<presentation:LabeledImageButton CssClass="edit-image-button" id="EditButton" runat="server" imageurl="../../Images/ui/pencil.png" meta:resourcekey="Edit" onclick="EditButton_Click" />
			<presentation:JavascriptEnabledImageButton CssClass="save-image-button" id="SaveButton" runat="server" imageurl="../../Images/ui/save.gif" meta:resourcekey="Save" visible="false" onclick="SaveButton_Click" ValidationGroup="AmountOffOrderTotal" />
			<presentation:JavascriptEnabledImageButton CssClass="delete-image-button" id="DeleteButton" runat="server" imageurl="../../Images/ui/cross.png" meta:resourcekey="Delete" onclick="DeleteButton_Click" /><br />
		</td>
	</tr>
</table>