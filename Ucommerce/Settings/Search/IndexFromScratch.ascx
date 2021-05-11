<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="IndexFromScratch.ascx.cs" Inherits="Ucommerce.Web.UI.Ucommerce.Settings.Search.IndexFromScratch" %>

<meta id="metaAutoRefresh" http-equiv="refresh" content="10" xmlns="http://www.w3.org/1999/html" runat="server" Visible="False"/>

<div class="propertyPane">
    <h2 class="propertyPaneTitel">
        <asp:Localize runat="server" meta:resourcekey="ScratchIndexer"></asp:Localize>
    </h2>
    
    <div style="display: flex">
        <asp:Button runat="server" CssClass="mediumButton" style="margin: 12px" meta:resourcekey="IndexFromScratch" ID="BeginIndexFromScratch" OnClick="BeginIndexFromScratch_OnClick"/>
        <asp:Label ID="ImageLabel" style="display: flex; align-items: center; margin-left: 8px" runat="server" Text=""></asp:Label>
    </div>
    
    <hr/>
    <h4 class="index progress message" style="height: auto">
        <asp:Label ID="IndexerStartedLabel" Visible="False" runat="server"></asp:Label> 
        <asp:Label ID="IndexerErrorWrapper" Visible="False" runat="server">
            <br> <br>
            <asp:Label ID="IndexerErrorLabel" Visible="False" runat="server"></asp:Label>
        </asp:Label>
    </h4>
    <div class="propertyPaneFooter">-</div>
</div>