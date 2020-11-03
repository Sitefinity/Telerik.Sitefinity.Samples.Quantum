<%@ control language="C#" autoeventwireup="true" codebehind="EditCampaignItemOverview.ascx.cs"
	inherits="Ucommerce.Web.UI.Ucommerce.Marketing.EditCampaignItemOverview" %>
<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../Controls/ValidationSummaryDisplay.ascx" %>

<commerce:ValidationSummary runat="server" />

<div class="propertyPane leftAligned">
	<div>
        <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourcekey="CampaignItemHeader" /></h2>
    </div>
	<commerce:PropertyPanel runat="server" meta:resourcekey="CampaignItemDefinition">
		<asp:DropDownList runat="server" ID="CampaignItemDefinitionDropDown" CssClass="mediumWidth"/>
		<asp:RequiredFieldValidator runat="server" ControlToValidate="CampaignItemDefinitionDropDown" Text="*" ErrorMessage='<%# GetLocalResourceObject("CampaignItemDefinition.Text") %>' CssClass="validator" ></asp:RequiredFieldValidator>
	</commerce:PropertyPanel>
    <commerce:PropertyPanel runat="server" meta:resourcekey="AllowNextCampaignItems">
        <asp:CheckBox runat="server" ID="AllowNextCampaignItemsCheckBox" class="Ucommerce-toggle-check-box" Checked="<%# View.CampaignItem.AllowNextCampaignItems %>"/>
    </commerce:PropertyPanel>
    <commerce:PropertyPanel runat="server" meta:resourcekey="Enabled">
        <asp:CheckBox runat="server" ID="EnabledCheckBox" class="Ucommerce-toggle-check-box" Checked="<%# View.CampaignItem.Enabled %>"/>
    </commerce:PropertyPanel>
	<div class="propertyPaneFooter">-</div>
</div>

<div class="propertyPane leftAligned">
	<div>
		<h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourcekey="CampaignItemSetupHeader" /></h2>
    </div>
    <asp:HiddenField runat="server" ID="CampaignItemId"/>
	<table class="edittCampaigneItemTable" style="width:100%">
		<tr>
			<th style="width:33%"><asp:Label runat="server" meta:resourcekey="Display" /></th>
			<th style="width:33%"><asp:Label runat="server" meta:resourcekey="Apply" /></th>
			<th style="width:33%"><asp:Label runat="server" meta:resourcekey="Award" /></th>
		</tr>
		<tr>
			<td>
				<asp:DropDownList runat="server" ID="displayTargetDropDown" CssClass="editCampaignItemDropDown" />
				<asp:Button runat="server" meta:resourcekey="Add" ID="addDisplayTargetButton" onclick="AddDisplayButton_Click" CssClass="editCampaignItemButton" />         
			</td>
			<td>
				<asp:DropDownList runat="server" ID="applyTargetDropDown" CssClass="editCampaignItemDropDown" />
				<asp:Button runat="server" meta:resourcekey="Add" ID="addApplyTargetButton" onclick="AddApplyButton_Click" CssClass="editCampaignItemButton" />
			</td>
			<td>
				<asp:DropDownList runat="server" ID="awardDropDown" CssClass="editCampaignItemDropDown" />
				<asp:Button runat="server" meta:resourcekey="Add" ID="addAwardButton" onclick="AddAwardButton_Click" CssClass="editCampaignItemButton" style="vertical-align: top;" />
			</td>
			<td></td>
		</tr>
        <tr class="evaluationRule">
            <td>
                <asp:DropDownList runat="server" ID="AdvertiseTargetEvaluationRuleDropDown"/>                
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ActTargetEvaluationRuleDropDown"/>
            </td>
            <td>
                
            </td>
        </tr>
		<tr>
			<td class="marketing-container" style="vertical-align:top;">
				<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
					<ContentTemplate>
						<asp:PlaceHolder ID="NewDisplayTargetPlaceHolder" runat="server"></asp:PlaceHolder>
					</ContentTemplate>
					<Triggers>
						<asp:AsyncPostBackTrigger ControlID="addDisplayTargetButton" />
					</Triggers>
				</asp:UpdatePanel>
			</td>
			<td class="marketing-container" style="vertical-align:top;">
				<asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
					<ContentTemplate>
						<asp:PlaceHolder ID="NewApplyTargetPlaceHolder" runat="server"></asp:PlaceHolder>
					</ContentTemplate>
					<Triggers>
						<asp:AsyncPostBackTrigger ControlID="addApplyTargetButton" />
					</Triggers>
				</asp:UpdatePanel>
			</td>
			<td class="marketing-container" style="vertical-align:top;">
				<asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
					<ContentTemplate>
						<asp:PlaceHolder ID="NewAwardPlaceHolder" runat="server"></asp:PlaceHolder>
					</ContentTemplate>
					<Triggers>
						<asp:AsyncPostBackTrigger ControlID="addAwardButton" />
					</Triggers>
				</asp:UpdatePanel>
			</td>
		</tr>
	</table>
</div>
