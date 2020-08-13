<%@ control language="C#" autoeventwireup="True" codebehind="EditPaymentMethodPricing.ascx.cs" inherits="Ucommerce.Web.UI.Settings.Orders.EditPaymentMethodPricing" %>
<%@ Import Namespace="Ucommerce.EntitiesV2" %>
<%@ Register tagPrefix="commerce" tagName="ValidationSummary" src="../../Controls/ValidationSummaryDisplay.ascx" %>

<commerce:ValidationSummary runat="server" />
<div class="propertyPane leftAligned">
	<h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourceKey="PaymentMethodPricingFee" /></h2>
	<div>
		<div class="propertyItem">
			<div class="propertyItemHeader"><asp:Localize runat="server" meta:resourcekey="FeePercentage" /> %</div>
			<div class="propertyItemContent">
				<asp:TextBox runat="server" style="text-align: right;" id="FeePercentageTextBox" text="<%# View.PaymentMethod.FeePercent %>"
					cssclass="smallWidth" />
				
				<asp:RequiredFieldValidator runat="server" controltovalidate="FeePercentageTextBox"
					errormessage="*" cssclass="validator" />
				<asp:RangeValidator runat="server" controltovalidate="FeePercentageTextBox" type="Double"
					minimumvalue="0" maximumvalue="100" errormessage="*" cssclass="validator" />
			</div>
		</div>
	</div>
	<div class="propertyPaneFooter">
		-</div>
</div>
<div class="propertyPane leftAligned tablePropertyPane">
	<h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourceKey="PaymentMethodPricing" /></h2>
	<div>
		<div class="">
			<div class="" id="pricingDescription"><asp:Localize runat="server" meta:resourcekey="Description" /></div>
            <div class="" style="width: 100%;">
				<commerce:BulkEditGridView bulkedit="true" runat="server" id="PaymentMethodPricesGridView" CssClass="dataList customDataList paymentMethodPrices" Style="margin-top: 20px;"
					datasource="<%# PaymentMethodFees %>" showheader="true" datakeynames="PaymentMethodFeeId"
					autogeneratecolumns="false" gridlines="None">
                <columns>
                    <asp:TemplateField meta:resourceKey="EnabledHeader" ControlStyle-Width="50px">
                        <EditItemTemplate>
                            <asp:CheckBox runat="server" 
                                ID="EnabledCheckBox" 
								style="text-align: center;"
                                Checked="<%# ((PaymentMethodFee)Container.DataItem).Id > 0 %>" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField meta:resourceKey="PriceGroupHeader">
                        <EditItemTemplate>  
                            <asp:HiddenField runat="server" ID="PaymentMethodFeeId" Value="<%# ((PaymentMethodFee)Container.DataItem).PaymentMethodFeeId %>" />
                            <asp:HiddenField runat="server" ID="PriceGroupId" Value="<%# ((PaymentMethodFee)Container.DataItem).PriceGroup.PriceGroupId %>" />
                            <%# SanitizeOutput(((PaymentMethodFee)Container.DataItem).PriceGroup.Name) %>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField meta:resourceKey="PriceHeader" ItemStyle-Wrap="false">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="PriceTextBox" Text="<%# ((PaymentMethodFee)Container.DataItem).Fee %>" CssClass="amountInput"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="PriceTextBox" ErrorMessage="*" CssClass="validator" />
                            <asp:RangeValidator runat="server" ControlToValidate="PriceTextBox" Type="Double" MinimumValue="0" MaximumValue="<%# decimal.MaxValue %>" ErrorMessage="*" CssClass="validator" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </commerce:BulkEditGridView>
			</div>
		</div>
	</div>
	<div class="propertyPaneFooter">
		-</div>
</div>
