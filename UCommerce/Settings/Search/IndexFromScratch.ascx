<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="IndexFromScratch.ascx.cs" Inherits="Ucommerce.Web.UI.Ucommerce.Settings.Search.IndexFromScratch" %>

<div class="propertyPane">
    <h2 class="propertyPaneTitel">
        <asp:Localize runat="server" meta:resourcekey="ScratchIndexer"></asp:Localize>
    </h2>

    <asp:Button runat="server" CssClass="mediumButton index-from-scratch-button" meta:resourcekey="IndexFromScratch" ID="BeginIndexFromScratch" OnClick="BeginIndexFromScratch_OnClick"/>
    <hr/>
    <h4 class="index progress message">
        <asp:Label ID="IndexerStartedLabel" Visible="False" runat="server"></asp:Label>
    </h4>
    <div class="propertyPaneFooter">-</div>
</div>