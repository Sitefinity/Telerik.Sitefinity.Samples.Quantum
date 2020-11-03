<%@ control language="C#" autoeventwireup="true" codebehind="DiscountSpecificOrderLineUi.ascx.cs" inherits="Ucommerce.Web.UI.Ucommerce.Marketing.Awards.DiscountSpecificOrderLineUi" %>
<%@ Register TagPrefix="presentation" Assembly="Ucommerce.Presentation" namespace="Ucommerce.Presentation.Web.Controls" %>

<table cellpadding="0" cellspacing="0" style="width: 100%;">
	<tr>
		<td>
			<asp:panel runat="server" id="ReadOnlyPanel" visible="true">
				<asp:Literal ID="ReadOnlyMessageLiteral" runat="server"></asp:Literal>
			</asp:panel>

			<asp:panel runat="server" CssClass="editDiscountSpecificOrderline" id="EditorPanel" visible="false">
				<section>
					<asp:Textbox runat="server" CssClass="AmountTextBox" id="AmountTextBox"></asp:Textbox>
					<asp:RegularExpressionValidator id="DecimalValidator" runat="server" ControlToValidate="AmountTextBox" 
									Style="color:Red;" ValidationExpression="^(\d|-)?(\d|,)*\.?\d*$"
									Display="Dynamic" ErrorMessage="Please enter only numbers" />
					<asp:RequiredFieldValidator id="RequiredValidator" CssClass="validator" runat="server"
									ControlToValidate="AmountTextBox" Display="Dynamic" ErrorMessage="Please enter amount"/>
					<asp:CustomValidator runat="server" CssClass="validator" id="AmountOffBasedOnAmountTypeSelectedValidator" Style="color:Red;" ErrorMessage="*"
									OnServerValidate="AmountOffBasedOnAmountTypeSelectedValidator_Validate" ControlToValidate="AmountTextBox"/>
					<asp:DropDownList runat="server" dataTextField="Key" dataValueField="Value" id="AmountTypeDropDownList"></asp:DropDownList>
					<asp:Localize meta:resourcekey="OffLabel" runat="server">off</asp:Localize>
				</section>
				
				<section>
					<asp:DropDownList runat="server" dataTextField="Key" dataValueField="Value" id="DiscountTargetDropDownList"></asp:DropDownList>
				<asp:Localize meta:resourcekey="OnLabel" runat="server">on</asp:Localize>

				</section>
				<Section>
					
					<asp:DropDownList runat="server" dataTextField="Key" dataValueField="Value" id="ProductTargetDropDownList"></asp:DropDownList>
				</section>
			</asp:panel>
		</td>
		<td style="width: 50px; text-align: right; vertical-align: top;">
			<presentation:LabeledImageButton CssClass="edit-image-button" id="EditButton" runat="server" imageurl="../../Images/ui/pencil.png" meta:resourcekey="Edit" onclick="EditButton_Click" />
			<presentation:JavascriptEnabledImageButton CssClass="save-image-button" id="SaveButton" runat="server" imageurl="../../Images/ui/save.gif" meta:resourcekey="Save" visible="false" onclick="SaveButton_Click" />
			<presentation:JavascriptEnabledImageButton CssClass="delete-image-button" id="DeleteButton" runat="server" imageurl="../../Images/ui/cross.png" meta:resourcekey="Delete" onclick="DeleteButton_Click" />
		</td>
	</tr>
</table>
