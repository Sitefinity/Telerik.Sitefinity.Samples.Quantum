<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditProductCatalogAccess.ascx.cs" Inherits="Ucommerce.Web.UI.Catalog.EditProductCatalogAccess" %>
<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../Controls/ValidationSummaryDisplay.ascx" %>

<commerce:ValidationSummary runat="server" />
<div style="text-align: left;">
    <div class="propertyPane leftAligned">
        <div>
            <table>                
                <tr>
                    <th><asp:Localize runat="server" meta:resourceKey="RestrictCatalogAccess" /></th>
                    <td><asp:CheckBox runat="server" ID="RestrictCatalogAccessCheckBox" Checked="<%# View.Catalog.LimitedAccess %>" AutoPostBack="true" OnCheckedChanged="RestrictAccess_Changed" /></td>
                </tr>
                <tr>
                    <th><asp:Localize runat="server" meta:resourceKey="AllowedGroups" /></th>
                    <td><asp:CheckBoxList runat="server" ID="AllowedGroupsCheckBoxList" DataSource="<%# View.MemberGroups %>" DataTextField="Text" DataValueField="Id" OnDataBound="MemberList_DataBound" /></td>
                </tr>
            </table>
        </div>
    </div>
</div> 