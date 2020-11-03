<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreateCategoryOrProduct.ascx.cs" Inherits="Ucommerce.Web.UI.Catalog.CreateCategoryOrProduct" %>
<div>
	<div>
		<label><asp:localize id="NameLocalize" runat="server" meta:resourcekey="Name">Name:(*)</asp:localize></label>
	</div>
	<div>
		<asp:TextBox runat="server" id="NameTextBox" cssclass="bigInput fontSize"/>
	</div>
    <div>
   		<asp:RequiredFieldValidator id="NameRequiredFieldValidator" ControlToValidate="NameTextBox" runat="server" ErrorMessage="*" CssClass="validationMessage validator" Display="Dynamic" />
		<asp:CustomValidator id="UniqueNameServerValidator" OnServerValidate="UniqueName_ServerValidate" ControlToValidate="NameTextBox" runat="server" meta:resourceKey="UniqueName" ErrorMessage="Name already exists*" CssClass="validationMessage validator" Display="Dynamic" />
		<asp:CustomValidator id="UniqueSkuServerValidator" OnServerValidate="UniqueSku_ServerValidate" ControlToValidate="NameTextBox" runat="server" meta:resourceKey="UniqueSku" ErrorMessage="SKU already exists*" CssClass="validationMessage validator" Display="Dynamic" />
		<asp:CustomValidator id="SkuLengthValidator" OnServerValidate="SkuLength_ServerValidate" ControlToValidate="NameTextBox" runat="server" meta:resourceKey="SkuLength" ErrorMessage="SKU already exists*" CssClass="validationMessage validator" Display="Dynamic" />
    </div>
</div>

<div>
	<asp:RadioButtonList CssClass="radioList" runat="server" ID="CreateType" AutoPostBack="true" OnSelectedIndexChanged="CreateType_Changed"/>
</div>

<div style="margin-top:10px;">
	<div>
		<label><asp:Localize meta:resourcekey="Definition" runat="server">Definition:(*)</asp:Localize></label>
	</div>
	<div>
		<asp:DropDownList runat="server" ID="DefinitionDropDown" DataTextField="Name" DataValueField="Id" cssclass="bigInput fontSize" />
	</div>
</div>

<div style="clear: both">
    <asp:RequiredFieldValidator runat="server" ControlToValidate="CreateType" Display="Dynamic" ErrorMessage="No type selected" CssClass="validationMessage validator"  />
</div>

<div style="padding-top: 25px">
    <asp:Button runat="server" ID="CreateButton" Width="90px" meta:resourcekey="CreateButton" Text="Create(*)" OnClick="CreateButton_Clicked" />
    <em><asp:Localize meta:resourcekey="Or" runat="server">or</asp:Localize></em>
    <a href="#" onclick="UcommerceClientMgr.closeModalWindow();" style="color: blue;"><asp:Localize meta:resourcekey="Cancel" runat="server">Cancel</asp:Localize></a>
</div>