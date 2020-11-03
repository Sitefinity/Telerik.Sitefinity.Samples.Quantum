<%@ control language="C#" autoeventwireup="true" codebehind="EditDefinitionBaseProperties.ascx.cs" inherits="Ucommerce.Web.UI.Settings.Definitions.EditDefinitionBaseProperties" %>
<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../../Controls/ValidationSummaryDisplay.ascx" %>

<script type="text/javascript">
	function openCategory(id) {
		document.location.href = '../../catalog/editcategory.aspx?id=' + id + '&activeTab=EditCategoryBaseProperties.ascx';
	}
</script>
<commerce:ValidationSummary id="ValidationSummary1" runat="server" />
<div style="text-align: left;">
	<div class="propertyPane leftAligned">
		<h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourceKey="DefinitionProperties" /></h2>
<%--        <commerce:PropertyPanel runat="server" meta:resourcekey="Definition">
		    <asp:DropDownList runat="server" ID="DefinitionDropDown" CssClass="mediumWidth" DataSource="<%# View.Definitions %>" DataValueField="DefinitionId" DataTextField="Name"/>
	    </commerce:PropertyPanel>--%>
        <div class="propertyItem">
	        <div class="propertyItemHeader"><asp:Localize runat="server" meta:resourceKey="Description" /></div>
            <div class="propertyItemContent"><asp:TextBox runat="server" ID="DescriptionTextBox" TextMode="MultiLine" CssClass="mediumWidth smallHeight" Text="<%# SanitizeOutput(View.Definition.Description) %>" /></div>
	    </div>
		<div class="propertyItem">
			<div class="propertyItemHeader"><asp:localize runat="server" meta:resourcekey="InheritedDefinitions" /></div>
			<div class="propertyItemContent">
				
	<asp:CheckboxList runat="server" id="ParentDefinitionCheckboxList" CssClass="ParentDefinitionCheckboxList" />
				<asp:customvalidator id="InheritanceServerValidator" onservervalidate="Inheritance_ServerValidator" runat="server" meta:resourcekey="UniqueSku" errormessage="SKU already exists*" cssclass="validationMessage validator" display="Dynamic" />
			</div>
		</div>
        <div class="propertyPaneFooter"></div>
	</div>
    <asp:Panel CssClass="propertyPane" ID="DefinitionPropertiesPanel"  runat="server"></asp:Panel>
</div>