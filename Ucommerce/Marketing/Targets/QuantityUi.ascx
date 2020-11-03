<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuantityUi.ascx.cs" Inherits="Ucommerce.Web.UI.Umbraco.Ucommerce.Marketing.Targets.QuantityUi" %>
<%@ Register TagPrefix="presentation" Assembly="Ucommerce.Presentation" namespace="Ucommerce.Presentation.Web.Controls" %>
<table cellpadding="0" cellspacing="0" style="width:100%;">
	<tr>
		<td>
			<asp:placeholder runat="server" id="NonEditModePlaceHolder">
				<asp:Literal runat="server" id="ReadOnlyMessage"></asp:Literal>
			</asp:placeholder>
			

			<asp:placeholder runat="server" id="EditModePlaceHolder"  visible="false">
				<asp:TextBox runat="server" id="MinQuantityText" />
				<asp:rangevalidator id="QuantityValidator" runat="server" ControlToValidate="MinQuantityText" 
								Style="color:Red;" type="Integer" minimumvalue="1" maximumvalue="9999999" Display="Dynamic" CssClass="validator" />
				<asp:RequiredFieldValidator id="RequiredValidator" runat="server"
								ControlToValidate="MinQuantityText" Display="Dynamic" CssClass="validator" />&nbsp;
			    <asp:localize runat="server" meta:resourcekey="OnLabel" /><br />
				<asp:DropDownList runat="server" id="TargetOrderLineOrOrderDropDownList" cssclass="targetOrderOrLine" />&nbsp;
			</asp:placeholder>
		</td>
		<td style="width:50px; text-align:right; vertical-align:top;">
			<presentation:LabeledImageButton CssClass="edit-image-button" id="EditButton" runat="server" imageurl="../../Images/pencil.png" meta:resourcekey="Edit" onclick="EditButton_Click" />
			<presentation:JavascriptEnabledImageButton CssClass="save-image-button" id="SaveButton" runat="server" imageurl="../../Images/save.gif" meta:resourcekey="Save" visible="false" onclick="SaveButton_Click" ValidationGroup="MinOrderAmountGroup" />
			<presentation:JavascriptEnabledImageButton CssClass="delete-image-button" id="DeleteButton" runat="server" imageurl="../../Images/ui/cross.png" meta:resourcekey="Delete" onclick="DeleteButton_Click" /><br />
		</td>
	</tr>
</table>