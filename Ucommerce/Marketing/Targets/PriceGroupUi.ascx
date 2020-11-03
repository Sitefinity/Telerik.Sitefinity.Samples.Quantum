<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PriceGroupUi.ascx.cs" Inherits="Ucommerce.Web.UI.Ucommerce.Marketing.Targets.PriceGroupUi" %>
<%@ Register tagPrefix="uc" namespace="Ucommerce.Presentation.Web.Controls" %>
<%@ Register TagPrefix="presentation" Assembly="Ucommerce.Presentation" namespace="Ucommerce.Presentation.Web.Controls" %>
<table cellpadding="0" cellspacing="0" style="width:100%;">
    <tr>
        <td>
            <asp:PlaceHolder runat="server" ID="SelectedPriceGroupPlaceHolder" Visible="true">
                <asp:Label ID="SelectedPriceGroupLabel" runat="server" style="padding-left: 5px;"></asp:Label>
            </asp:PlaceHolder>
            <asp:PlaceHolder runat="server" ID="SelectPriceGroupPlaceHolder" Visible="false">
                <commerce:SafeDropDownList CssClass="priceGroupDropDown" runat="server" id="PriceGroupDropDownList" style="padding-left: 5px;" DataSource="<%# GetPriceGroups() %>" OnDataBound="PriceGroup_DataBound" D="Name" DataValueField="Name"/>
            </asp:PlaceHolder>
        </td>
        <td style="width:50px; text-align:right; vertical-align:top;">
            <presentation:LabeledImageButton CssClass="edit-image-button" id="EditButton" runat="server" ImageUrl="../../Images/ui/pencil.png" OnClick="EditButton_Click" />
			<presentation:JavascriptEnabledImageButton CssClass="save-image-button" id="SaveButton" runat="server" imageurl="../../Images/ui/save.gif" visible="false" onclick="SaveButton_Click" />
			<presentation:JavascriptEnabledImageButton CssClass="delete-image-button" id="DeleteTargetButton" runat="server" ImageUrl="../../Images/ui/cross.png" onclick="DeleteTargetButton_Click" />
        </td>
    </tr>
</table>