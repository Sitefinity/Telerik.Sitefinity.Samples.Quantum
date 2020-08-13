<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShippingMethodsUI.ascx.cs" Inherits="Ucommerce.Web.UI.Ucommerce.Marketing.Targets.ShippingMethodsUI" %>
<%@ Register tagPrefix="uc" namespace="Ucommerce.Presentation.Web.Controls" %>
<%@ Register TagPrefix="presentation" Assembly="Ucommerce.Presentation" namespace="Ucommerce.Presentation.Web.Controls" %>
<table cellpadding="0" cellspacing="0" style="width:100%;">
    <tr>
        <td>
            <asp:PlaceHolder runat="server" ID="SelectedShippingMethodsPlaceHolder" Visible="true">
                <asp:Localize meta:resourcekey="ShippingMethods" runat="server"></asp:Localize>
                <asp:Label ID="SelectedShippingMethodsLabel" runat="server" style="padding-left: 5px;"></asp:Label>
            </asp:PlaceHolder>
            <asp:PlaceHolder runat="server" ID="SelectShippingMethodsPlaceHolder" Visible="false">
                <asp:Localize meta:resourcekey="ShippingMethods" runat="server"></asp:Localize>                
                <asp:CheckBoxList runat="server" id="ShippingMethodsCheckBoxList" CssClass="checkbox-list" DataSource="<%# GetShippingMethods() %>" OnDataBound="ShippingMethods_DataBound" DataTextField="Name" DataValueField="Name"/>
            </asp:PlaceHolder>
        </td>
        <td style="width:50px; text-align:right; vertical-align:top;">
            <presentation:LabeledImageButton CssClass="edit-image-button" id="EditButton" runat="server" ImageUrl="../../Images/ui/pencil.png" OnClick="EditButton_Click" />
			<presentation:JavascriptEnabledImageButton CssClass="save-image-button" id="SaveButton" runat="server" imageurl="../../Images/ui/save.gif" visible="false" onclick="SaveButton_Click" />
			<presentation:JavascriptEnabledImageButton CssClass="delete-image-button" id="DeleteTargetButton" runat="server" ImageUrl="../../Images/ui/cross.png" onclick="DeleteTargetButton_Click" />
        </td>
    </tr>
</table>