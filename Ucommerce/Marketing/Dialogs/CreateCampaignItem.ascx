<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreateCampaignItem.ascx.cs" Inherits="Ucommerce.Web.UI.Ucommerce.Marketing.Dialogs.CreateCampaignItem" %>

<div>
    <div>
        <label>
            <asp:Localize meta:resourcekey="NameLabel" runat="server">Name:</asp:Localize>
        </label>
    </div>
    <div>
        <asp:TextBox runat="server" ID="NameTextBox" CssClass="bigInput fontSize"/>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="NameTextBox" CssClass="validationMessage validator" Display="Dynamic" ErrorMessage="Please enter a name(*)" Width="100%" />
        <asp:CustomValidator runat="server" OnServerValidate="ValidateCampaignItem" CssClass="validationMessage validator" Display="Dynamic" ErrorMessage="The name is already in use." Width="100%" />
    </div>
</div>
<div style="margin-top: 10px;">
    <div>
        <div>
            <label>
                <asp:Localize meta:resourcekey="DefinitionLabel" runat="server">Definition:</asp:Localize>
            </label>
        </div>
    </div>
    <div>
        <div>
            <asp:DropDownList runat="server" ID="DefinitionDropDown" DataTextField="Name" DataValueField="Id" cssclass="bigInput fontSize" />
        </div>
    </div>
</div>

<div style="padding-top: 25px">
    <asp:Button runat="server" ID="CreateButton" Width="90px" Text="Create" meta:resourcekey="CreateButton" OnClick="CreateButton_Clicked" />
    <em>
        <asp:Localize meta:resourcekey="OrLabel" runat="server">or</asp:Localize></em>
    <a href="#" onclick="UcommerceClientMgr.closeModalWindow();" style="color: blue; cursor: hand">
        <asp:Localize meta:resourcekey="CancelLabel" runat="server">Cancel</asp:Localize></a>
</div>
