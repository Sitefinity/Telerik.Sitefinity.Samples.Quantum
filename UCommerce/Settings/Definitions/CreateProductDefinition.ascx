<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreateProductDefinition.ascx.cs" Inherits="UCommerce.Web.UI.Settings.Definitions.CreateProductDefinition" %>
<div>
    <asp:Localize meta:resourcekey="NameLabel" runat="server">Name:</asp:Localize>
</div>
<div>
    <asp:TextBox runat="server" ID="NameTextBox" CssClass="bigInput fontSize" Width="350px"/>
</div>

<asp:RequiredFieldValidator runat="server" CssClass="validationMessage validator" ControlToValidate="NameTextBox" ErrorMessage="Please enter a name.(*)" Width="100%" meta:ResourceKey="RequiredNameValidator" Display="Dynamic" />
<asp:CustomValidator runat="server" ID="UniqueNameCustomValidator" 
    CssClass="validationMessage validator" 
    Display="Dynamic"
    meta:ResourceKey="UniqueNameValidator" 
    ErrorMessage="The product definition already exists. Please select another name.(*)" 
    ControlToValidate="NameTextBox" 
    OnServerValidate="UniqeNameCustomVallidator_ServerValidate" />

<asp:CustomValidator runat="server" ID="LicenseCustomValidator" 
    CssClass="validationMessage validator" 
    Display="Dynamic"
    meta:ResourceKey="LicenseCustomValidator" 
    ErrorMessage="You will exceed your license if you create any more.(*)" 
    ControlToValidate="NameTextBox" 
    OnServerValidate="LicenseCustomValidator_ServerValidate" />
    
<div style="padding-top: 25px">
    <asp:Button runat="server" ID="CreateButton" Width="90px" Text="Create" OnClick="CreateButton_Clicked" />
    <em>or</em>
    <a href="#" onclick="UCommerceClientMgr.closeModalWindow();" style="color: blue; cursor: hand">Cancel</a>    
</div>