<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditOrderAddress.ascx.cs" Inherits="UCommerce.Web.UI.UCommerce.Orders.EditOrderAddress" %>

<asp:PlaceHolder runat="server" ID="EditableFields" Visible="False">
    <div><asp:TextBox CssClass="hintText smallWidthInput" data-placeholder="<%$ Resources:FirstName %>" runat="server" ID="BillingFirstName" Text='<%#OrderAddress.FirstName %>' /></div>
    <div><asp:TextBox CssClass="hintText smallWidthInput" data-placeholder="<%$ Resources:LastName %>" runat="server" ID="BillingLastName" Text='<%#OrderAddress.LastName %>' /></div>
    <div><asp:TextBox CssClass="hintText smallWidthInput" data-placeholder="<%$ Resources:AddressLine1 %>" runat="server" ID="AddressLine1" Text='<%#OrderAddress.Line1 %>' /></div>
    <div><asp:TextBox CssClass="hintText smallWidthInput" data-placeholder="<%$ Resources:AddressLine2 %>" runat="server" ID="AddressLine2" Text='<%#OrderAddress.Line2 %>' /></div>
    <div><asp:TextBox CssClass="hintText smallWidthInput" data-placeholder="<%$ Resources:PostalCode %>" runat="server" ID="PostalCode" Text='<%#OrderAddress.PostalCode %>' /></div>
    <div><asp:TextBox CssClass="hintText smallWidthInput" data-placeholder="<%$ Resources:City %>" runat="server" ID="City" Text='<%#OrderAddress.City %>' /></div>
    <div><asp:TextBox CssClass="hintText smallWidthInput" data-placeholder="<%$ Resources:State %>" runat="server" ID="State" Text='<%#OrderAddress.State %>' /></div>
    
	<div><asp:DropDownList CssClass="mediumWidth" style="width:150px; margin-top: 4px;" runat="server" EnableViewState="True" ID="CountryDropDown" /></div>
	
	<div>
        <asp:TextBox CssClass="hintText smallWidthInput" data-placeholder="<%$ Resources:EmailAddress %>" runat="server" ID="EmailAddress" Text='<%#OrderAddress.EmailAddress %>' />
        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" 
            ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
            ControlToValidate="EmailAddress"
            ErrorMessage="Invalid Email Format" />
    </div>
    <div><asp:TextBox CssClass="hintText smallWidthInput" data-placeholder="<%$ Resources:PhoneNumber %>" runat="server" ID="PhoneNumber" Text='<%#OrderAddress.PhoneNumber %>' /></div>
    <div><asp:TextBox CssClass="hintText smallWidthInput" data-placeholder="<%$ Resources:MobilePhoneNumber %>" runat="server" ID="MobilePhoneNumber" Text='<%#OrderAddress.MobilePhoneNumber %>' /></div>
    <div>
        <asp:TextBox runat="server" CssClass="hintText smallWidthInput" data-placeholder="<%$ Resources:CompanyName %>" ID="CompanyName" Text='<%#OrderAddress.CompanyName %>' />
        
        <span style="margin-left: 10px; padding-top: 5px; display: inline-block;">
            <asp:LinkButton runat="server" ID="CancelEditLink" CssClass="hintTextCancelLink" OnClick="ToggleEditable" Text="<%$ Resources:Cancel %>" CausesValidation="false" />
        </span>
    </div>
</asp:PlaceHolder>

<asp:PlaceHolder runat="server" ID="NotEditableFields" Visible="True">
    <div><%# TextSanitizer.SanitizeOutput(OrderAddress.FirstName) %> <span>&nbsp;</span><%# TextSanitizer.SanitizeOutput(OrderAddress.LastName) %></div>
	<div><%# TextSanitizer.SanitizeOutput(OrderAddress.Line1) %></div>
	<div><%# TextSanitizer.SanitizeOutput(OrderAddress.Line2) %></div>	
	<div><%# TextSanitizer.SanitizeOutput(OrderAddress.PostalCode) %> <span>&nbsp;</span> <%# TextSanitizer.SanitizeOutput(OrderAddress.City) %></div>
	<div><%# TextSanitizer.SanitizeOutput(OrderAddress.State) %></div>
	<div><%# TextSanitizer.SanitizeOutput(OrderAddress.Country.Name) %></div>
	<div><%# TextSanitizer.SanitizeOutput(OrderAddress.EmailAddress) %></div>
	<div><%# TextSanitizer.SanitizeOutput(OrderAddress.PhoneNumber) %></div>
	<div><%# TextSanitizer.SanitizeOutput(OrderAddress.MobilePhoneNumber) %></div>
    <div>
        <%# TextSanitizer.SanitizeOutput(OrderAddress.CompanyName) %>
        
        <span style="margin-left:120px;">
            <asp:LinkButton runat="server" ID="EditAddressLink" OnClick="ToggleEditable" Text="<%$ Resources:Edit %>" />
        </span>
    </div>
</asp:PlaceHolder>