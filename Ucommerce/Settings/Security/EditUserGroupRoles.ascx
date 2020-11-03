<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditUserGroupRoles.ascx.cs" Inherits="Ucommerce.Web.UI.Ucommerce.Settings.Security.EditUserGroupRoles" %>
<div class="propertyPane leftAligned securityEditor">
	 <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourceKey="UserGroupAccess" /></h2>
	<div class="propertyItem">
		<div class="propertyItemHeader" style="min-width: 100px;"><asp:Localize ID="Localize4" runat="server" meta:resourceKey="EditUserGroupRoles" /></div>
		<div class="propertyItemContent">
		    <asp:xmldatasource id="XmlRoleSource" runat="server" enablecaching="false" ></asp:xmldatasource>              
			<div class="TreeViewWrapper large row-hover">
			    <asp:treeview id="RoleTreeView" runat="server" datasourceid="XmlRoleSource" showcheckboxes="all"
				    ontreenodedatabound="TreeNodeDataBound" NoExpandImageUrl="">
				    <DataBindings>
					    <asp:TreeNodeBinding DataMember="Role" ValueField="id" TextField="name" TargetField="checked"></asp:TreeNodeBinding> 
				    </DataBindings>
			    </asp:treeview>
		    </div>
		</div>
        <div style="clear: both;"></div>
	</div>
</div>