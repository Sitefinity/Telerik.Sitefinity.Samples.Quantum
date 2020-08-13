<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PercentOffOrderLinesUi.ascx.cs" Inherits="Ucommerce.Web.UI.Ucommerce.Marketing.Awards.PercentOffOrderLinesUi" %>
<%@ Register TagPrefix="presentation" Assembly="Ucommerce.Presentation" namespace="Ucommerce.Presentation.Web.Controls" %>

<table cellpadding="0" cellspacing="0" style="width:100%;">
	<tr>
		<td>
			<asp:PlaceHolder runat="server" id="NonEditModePlaceHolder">	
				<asp:Label runat="server" id="PercentOffOrderLinesLabel" /><br />
			</asp:PlaceHolder>

			<asp:PlaceHolder runat="server" id="EditModePlaceHolder"  visible="false">
				<asp:TextBox runat="server" id="PercentOffOrderLinesText" /><br />
				<asp:RangeValidator id="PercentOffRangeValidator" runat="server"
								  ControlToValidate="PercentOffOrderLinesText"
								  ValidationGroup="PercentOffOrderLines"
								  Type="Double"
								  MinimumValue="-100"
								  MaximumValue="100"
                                  Display="Dynamic" />
				<asp:RequiredFieldValidator id="RequiredValidator" runat="server" ValidationGroup="PercentOffOrderLines"
								ControlToValidate="PercentOffOrderLinesText" Display="Dynamic" CssClass="validator" ErrorMessage="Please enter percentage"/>
			</asp:PlaceHolder>
		</td>
		<td style="width:50px; text-align:right; vertical-align:top;">
			<presentation:LabeledImageButton CssClass="edit-image-button" id="EditButton" runat="server" imageurl="../../Images/ui/pencil.png" meta:resourcekey="Edit" onclick="EditButton_Click" />
			<presentation:JavascriptEnabledImageButton CssClass="save-image-button" id="SaveButton" runat="server" imageurl="../../Images/ui/save.gif" meta:resourcekey="Save" visible="false" onclick="SaveButton_Click" ValidationGroup="PercentOffOrderLines" />
			<presentation:JavascriptEnabledImageButton CssClass="delete-image-button" id="DeleteButton" runat="server" imageurl="../../Images/ui/cross.png" meta:resourcekey="Delete" onclick="DeleteButton_Click" /><br />
		</td>
	</tr>
</table>