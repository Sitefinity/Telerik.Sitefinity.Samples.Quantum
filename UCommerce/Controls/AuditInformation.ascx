<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AuditInformation.ascx.cs" Inherits="UCommerce.Web.UI.UCommerce.Controls.AuditInformation" %>
<%@ Import Namespace="UCommerce.EntitiesV2" %>

<div class="propertyPane">
    <h2 class="propertyPaneTitel"><asp:Localize ID="Localize1" runat="server" meta:resourceKey="Audit"></asp:Localize></h2>
    <div class="propertyItem">
        <div class="propertyItemHeader"><asp:Localize ID="Localize4" runat="server" meta:resourceKey="CreatedDate" /></div>
        <div class="propertyItemContent">
            <asp:Label runat="server" CssClass="audit-label" ID="CreateDateLabel" Text="<%# Entity.CreatedOn %>" />
        </div>
    </div>
    <div class="propertyItem">
        <div class="propertyItemHeader"><asp:Localize ID="Localize5" runat="server" meta:resourceKey="CreatedBy"></asp:Localize></div>
        <div class="propertyItemContent">
            <asp:Label runat="server" CssClass="audit-label" ID="LastModifiedLabel" Text="<%# SanitizeOutput(Entity.CreatedBy) %>" />
        </div>
    </div>
    <div class="propertyItem" runat="server" Visible="<%# Entity as IAuditModifiedEntity != null %>">
        <div class="propertyItemHeader"><asp:Localize ID="Localize2" runat="server" meta:resourceKey="ModifiedOn"></asp:Localize></div>
        <div class="propertyItemContent">
            <asp:Label runat="server" ID="Label1" CssClass="audit-label" Text="<%# GetModifiedOn() %>" />
        </div>
    </div>

    <div class="propertyItem" runat="server" Visible="<%# Entity as IAuditModifiedEntity != null %>">
        <div class="propertyItemHeader"><asp:Localize ID="Localize3" runat="server" meta:resourceKey="ModifiedBy"></asp:Localize></div>
        <div class="propertyItemContent">
            <asp:Label runat="server" ID="Label2" CssClass="audit-label" Text="<%# SanitizeOutput(GetModifiedBy()) %>" />
        </div>
    </div>
</div>
