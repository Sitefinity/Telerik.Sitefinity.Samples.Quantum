<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditCategoryBaseProperties.ascx.cs" Inherits="Ucommerce.Web.UI.Catalog.EditCategoryBaseProperties" %>
<%@ Register tagPrefix="commerce" tagName="AuditInformation" src="../Controls/AuditInformation.ascx" %>

<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../Controls/ValidationSummaryDisplay.ascx" %>

<script type="text/javascript">
    function openDefinition(id) {
        document.location.href = '../settings/catalog/editdefinition.aspx?id=' + id;
    }
</script>

<commerce:ValidationSummary runat="server" />

<div class="propertyPane leftAligned">      
    <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourcekey="GeneralInformation"></asp:Localize></h2>
	<commerce:PropertyPanel runat="server" meta:resourcekey="CategoryDefinition">
		<asp:DropDownList runat="server" ID="CategoryDefinitionDropDown" CssClass="mediumWidth" DataSource="<%# View.CategoryDefinitions %>" DataValueField="DefinitionId" DataTextField="Name"/>
	</commerce:PropertyPanel>
	<commerce:PropertyPanel runat="server" meta:resourceKey="DisplayOnWebSite">
		<asp:CheckBox runat="server" class="Ucommerce-toggle-check-box" ID="DisplayOnWebSiteCheckBox" Checked="<%# View.Category.DisplayOnSite %>" />
	</commerce:PropertyPanel>
	<div class="propertyPaneFooter">-</div>

</div>

<commerce:auditinformation Entity="<%# View.Category %>" ID="ValidationSummary2" runat="server" />

<asp:Panel CssClass="propertyPane" ID="PropertyPanel" runat="server">
</asp:Panel>