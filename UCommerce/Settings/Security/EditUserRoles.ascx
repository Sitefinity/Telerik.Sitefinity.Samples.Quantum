<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditUserRoles.ascx.cs" Inherits="UCommerce.Web.UI.UCommerce.Settings.Security.EditUserRoles" %>
<div class="propertyPane leftAligned securityEditor">
	 <h2 class="propertyPaneTitel"><asp:Localize runat="server" meta:resourceKey="UserAccess" /></h2>
	<div class="propertyItem">
		<div class="propertyItemHeader" style="min-width: 100px;"><asp:Localize ID="Localize4" runat="server" meta:resourceKey="EditUserRoles" /></div>
        <div class="propertyItemContent">
		    <asp:xmldatasource id="XmlRoleSource" runat="server" enablecaching="false"></asp:xmldatasource>                
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