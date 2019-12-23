<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="IndexFromScratch.ascx.cs" Inherits="UCommerce.Web.UI.UCommerce.Settings.Search.IndexFromScratch" %>

<div class="propertyPane">
	<h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourcekey="ScratchIndexer"></asp:Localize></h2>
    
    <asp:Button runat="server" CssClass="mediumButton index-from-scratch-button" meta:resourcekey="IndexFromScratch" ID="BeginIndexFromScratch" OnClick="BeginIndexFromScratch_OnClick" />
    <asp:Label ID="IndexerStartedLabel" Visible="False" runat="server"></asp:Label>
    <div class="propertyPaneFooter">-</div>
</div>