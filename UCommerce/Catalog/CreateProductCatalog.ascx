<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreateProductCatalog.ascx.cs" Inherits="Ucommerce.Web.UI.Catalog.CreateProductCatalog" %>
<div>
    <asp:Localize meta:resourcekey="NameLabel" runat="server">Name:(*)</asp:Localize>
</div>
<div>
    <asp:TextBox runat="server" ID="NameTextBox" CssClass="bigInput fontSize" Width="350px"/>
</div>
<div>
    <asp:Localize meta:resourcekey="DefinitionLabel" runat="server">Definition:</asp:Localize>
</div>
<div>
    <asp:DropDownList runat="server" ID="DefinitionDropDown" DataTextField="Name" DataValueField="Id" CssClass="bigInput fontSize" />
</div>

<asp:RequiredFieldValidator runat="server" ControlToValidate="NameTextBox" CssClass="validationMessage validator" Display="Dynamic" meta:ResourceKey="RequiredNameValidator" ErrorMessage="Please enter a name" Width="100%" />
<asp:CustomValidator runat="server" ID="UniqueNameValidator"
    CssClass="validationMessage validator"
    Display="Dynamic"
	meta:ResourceKey="UniqueNameValidator"
    ErrorMessage="The name is already in use.(*)"
    Width="100%"
    ControlToValidate="NameTextBox"
    OnServerValidate="UniqueNameValidator_ServerValidate" />

<asp:CustomValidator runat="server" ID="CustomValidator1"
    CssClass="validationMessage validator"
    Display="Dynamic"
	meta:ResourceKey="LicenseCustomValidator"
    ErrorMessage="Your license does not allow you to create any more.(*)"
    Width="100%"
    OnServerValidate="LicenseCheckValidator_ServerValidate" />

<div style="padding-top: 25px">
    <asp:Button runat="server" ID="CreateButton" Width="90px" meta:ResourceKey="CreateButton" Text="Create(*)" OnClick="CreateButton_Clicked" />
    <em><asp:Localize meta:resourcekey="OrLabel" runat="server">or</asp:Localize></em>
    <a href="#" onclick="UcommerceClientMgr.closeModalWindow()" style="color: blue; cursor: hand">
        <asp:Localize meta:resourcekey="CancelLabel" runat="server">Cancel(*)</asp:Localize></a>    
</div>