<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreateProductDefinitionField.ascx.cs" Inherits="Ucommerce.Web.UI.Settings.Definitions.CreateProductDefinitionField" %>
<table>
	<tr>
		<td><asp:Localize ID="Localize2" runat="server" meta:ResourceKey="Name" /></td>
		<td>
			<asp:TextBox runat="server" ID="NameTextBox" CssClass="bigInput fontSize" /><br />
			<asp:RequiredFieldValidator meta:ResourceKey="RequiredNameValidator" ID="RequiredFieldValidator1" runat="server" CssClass="validationMessage validator" ControlToValidate="NameTextBox" ErrorMessage="Please enter a name.(*)" Width="100%" Display="Dynamic"/>
			<asp:RegularExpressionValidator meta:ResourceKey="NameValidator" ID="NameValidator" ControlToValidate="NameTextBox" CssClass="validationMessage validator" ValidationExpression="^(?!(xml|[_\W]))[^ \s\W]+$" ErrorMessage="Name can contain only letters and numbers(*)." Display="Dynamic" runat="server" />
			<asp:CustomValidator meta:ResourceKey="UniqueNameCustomValidator" ID="UniqueFieldNameCustomValidatator" ControlToValidate="NameTextBox" CssClass="validationMessage validator" ErrorMessage="The field already exists for product definition. Please select another name.(*)" OnServerValidate="UniqueFieldNameCustomValidatator_ValidateUniqueName" runat="server" Display="Dynamic" />
		</td>
	</tr>
	<tr>
		<td><asp:Localize ID="Localize1" runat="server" meta:resourceKey="DataType" /></td>
		<td>
			<asp:DropDownList runat="server" ID="DataTypeDropDownList" CssClass="bigInput fontSize" DataTextField="TypeName" DataValueField="DataTypeId"></asp:DropDownList>
		</td>
	</tr>
</table>
    
<div style="padding-top: 25px">
    <asp:Button runat="server" ID="CreateButton" Width="90px" Text="Create" OnClick="CreateButton_Clicked" />
    <em>or</em>
    <a href="#" onclick="UcommerceClientMgr.closeModalWindow();" style="color: blue; cursor: hand">Cancel</a>    
</div>