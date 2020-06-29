<%@ control language="C#" autoeventwireup="true" codebehind="EditProductDefinitionBaseProperties.ascx.cs" inherits="UCommerce.Web.UI.Settings.Definitions.EditProductDefinitionBaseProperties" %>
<%@ import namespace="UCommerce.EntitiesV2" %>

<%@ register tagprefix="commerce" tagname="ValidationSummary" src="../../Controls/ValidationSummaryDisplay.ascx" %>

<commerce:validationsummary id="ValidationSummary1" runat="server" />
<div style="text-align: left;">
	<div class="propertyPane leftAligned">
		 <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourceKey="ProductDefinitionProperties" /></h2>
		<div class="propertyItem">
			<div class="propertyItemHeader"><asp:localize runat="server" meta:resourcekey="ProductFamily" /></div>
			<div class="propertyItemContent">
				<asp:checkbox runat="server" id="ProductFamilyCheckBox" enabled="false" checked="<%# View.ProductDefinition.IsProductFamily() %>" />
			</div>
		</div>
		<div class="propertyItem">
			<div class="propertyItemHeader"><asp:localize runat="server" meta:resourcekey="Description" /></div>
			<div class="propertyItemContent">
				<asp:textbox runat="server" id="DescriptionTextBox" textmode="MultiLine" cssclass="mediumWidth smallHeight" text="<%# SanitizeOutput(View.ProductDefinition.Description) %>" />
			</div>
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

    <asp:Panel CssClass="propertyPane" ID="DefinitionPropertiesPanel" runat="server"></asp:Panel>
</div>
