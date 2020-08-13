<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreateCountry.ascx.cs" Inherits="Ucommerce.Web.UI.Settings.Orders.CreateCountry" %>
Name:
<asp:TextBox runat="server" ID="NameTextBox" CssClass="bigInput fontSize" Width="350px"/>
<asp:RequiredFieldValidator runat="server" ControlToValidate="NameTextBox" CssClass="validationMessage validator" Display="Static" ErrorMessage="Please enter a name" Width="100%" />
<asp:CustomValidator runat="server" ErrorMessage="The name already exist." CssClass="validationMessage validator" OnServerValidate="NameValidator_ServerValidate" />
    
<div style="padding-top: 25px">
    <asp:Button runat="server" ID="CreateButton" Width="90px" Text="Create" OnClick="CreateButton_Clicked" />
    <em>or</em>
    <a href="#" onclick="UcommerceClientMgr.closeModalWindow();" style="color: blue; cursor: hand">Cancel</a>    
</div>