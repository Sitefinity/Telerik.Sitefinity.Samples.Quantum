<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreatePriceGroup.ascx.cs" Inherits="Ucommerce.Web.UI.Settings.Catalog.CreatePriceGroup" %>
<table>
	<tr>
		<td>
			<asp:Localize meta:resourcekey="NameLabel" runat="server">Name:</asp:Localize>
		</td>
		<td>
			<asp:TextBox runat="server" ID="NameTextBox" CssClass="bigInput fontSize" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:Localize meta:resourcekey="CurrencyLabel" runat="server">Currency:</asp:Localize>
		</td>
		<td>
			<asp:DropDownList runat="server" id="CurrencyDropDownList" CssClass="bigInput fontSize" DataTextField="ISOCode" DataValueField="CurrencyId" />
		</td>
	</tr>
</table>

<asp:RequiredFieldValidator runat="server" ControlToValidate="NameTextBox" CssClass="validationMessage validator" ErrorMessage="Please enter a name" Width="100%" meta:ResourceKey="RequiredNameValidator" Display="Dynamic"/>
<asp:CustomValidator runat="server" CssClass="validationMessage validator" ErrorMessage="The name is already in use" OnServerValidate="NameValidator_ServerValidate" meta:ResourceKey="UniqueNameValidator" Display="Dynamic"/>
<asp:CustomValidator runat="server" ID="PriceGroupCountLicenseValidator"
    CssClass="validationMessage validator" 
    Display="Dynamic"
    ErrorMessage="Your license does not allow you to create any more"
    Width="100%"
    OnServerValidate="LicenseCheckValidator_ServerValidate"
	meta:ResourceKey="LicenseCheckValidator"
	></asp:CustomValidator>
<asp:CustomValidator runat="server" ID="DifferentialPricingLicenseValidator"
    CssClass="validationMessage validator" 
    Display="Dynamic"
    ErrorMessage="Your license does not allow you to create any more"
    Width="100%"
    OnServerValidate="DifferentialPricingLicenseValidator_ServerValidate"
	meta:ResourceKey="DifferentialPricingLicenseValidator"
	></asp:CustomValidator>

<div style="padding-top: 25px">
    <asp:Button runat="server" ID="CreateButton" Width="90px" Text="Create" OnClick="CreateButton_Clicked" meta:ResourceKey="CreateButton" />
    <em><asp:Localize meta:resourcekey="OrLabel" runat="server">or</asp:Localize></em>
    <a href="#" onclick="UcommerceClientMgr.closeModalWindow();" style="color: blue; cursor: hand"><asp:Localize meta:resourcekey="CancelLabel" runat="server">Cancel</asp:Localize></a>    
</div>