<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage/MasterPage.master"%>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<script runat="server">
	string username;
	
	MembershipUser user;
	
	private void Page_Load()
	{
		username = Request.QueryString["username"];
		if (username == null || username == "")
		{
            Response.Redirect("Uzytkownicy.aspx");
		}
		user = Membership.GetUser(username);
		UserUpdateMessage.Text = "";
	}

	protected void UserInfo_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
	{
		//Need to handle the update manually because MembershipUser does not have a
		//parameterless constructor  

		user.Email = (string)e.NewValues[0];
		user.Comment = (string)e.NewValues[1];
		user.IsApproved = (bool)e.NewValues[2];

		try
		{
			// Update user info:
			Membership.UpdateUser(user);
			
			// Update user roles:
			UpdateUserRoles();
			
			UserUpdateMessage.Text = "Update Successful.";
			
			e.Cancel = true;
			UserInfo.ChangeMode(DetailsViewMode.ReadOnly);
		}
		catch (Exception ex)
		{
			UserUpdateMessage.Text = "Update Failed: " + ex.Message;

			e.Cancel = true;
			UserInfo.ChangeMode(DetailsViewMode.ReadOnly);
		}
	}

	private void Page_PreRender()
	{
		// Load the User Roles into checkboxes.
		UserRoles.DataSource = Roles.GetAllRoles();
		UserRoles.DataBind();

		// Disable checkboxes if appropriate:
		if (UserInfo.CurrentMode != DetailsViewMode.Edit)
		{
			foreach (ListItem checkbox in UserRoles.Items)
			{
				checkbox.Enabled = false;
			}
		}
		
		// Bind these checkboxes to the User's own set of roles.
		string[] userRoles = Roles.GetRolesForUser(username);
		foreach (string role in userRoles)
		{
			ListItem checkbox = UserRoles.Items.FindByValue(role);
			checkbox.Selected = true;
		}
	}
	
	private void UpdateUserRoles()
	{
		foreach (ListItem rolebox in UserRoles.Items)
		{
			if (rolebox.Selected)
			{
				if (!Roles.IsUserInRole(username, rolebox.Text))
				{
					Roles.AddUserToRole(username, rolebox.Text);
				}
			}
			else
			{
				if (Roles.IsUserInRole(username, rolebox.Text))
				{
					Roles.RemoveUserFromRole(username, rolebox.Text);
				}
			}
		}
	}

	private void DeleteUser(object sender, EventArgs e)
	{
		//Membership.DeleteUser(username, false); // DC: My apps will NEVER delete the related data.
		Membership.DeleteUser(username, true); // DC: except during testing, of course!
		Response.Redirect("Uzytkownicy.aspx");
	}

    private void BackUser(object sender, EventArgs e)
    {
        //Membership.DeleteUser(username, false); // DC: My apps will NEVER delete the related data.
        //Membership.DeleteUser(username, true); // DC: except during testing, of course!
        Response.Redirect("Uzytkownicy.aspx");
    }

	private void UnlockUser(object sender, EventArgs e)
	{
		// Dan Clem, added 5/30/2007 post-live upgrade.
		
		// Unlock the user.
		user.UnlockUser();
		
		// DataBind the GridView to reflect same.
		UserInfo.DataBind();
	}

    private void PassUser(object sender, EventArgs e)
    {
        string password = "COC*I#=o6%J5";
        //string password = "Holpol@3!1";

        user.ChangePassword(user.ResetPassword(), password);

        // DataBind the GridView to reflect same.
        UserInfo.DataBind();
    }        
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="MasterPageBody" Runat="Server">

<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" 
                     HeaderText="Edycja danych użytkownika" Width="800px">
<PanelCollection>
<dx:PanelContent runat="server">

<table class="webparts">
	<tr>
		<td class="details_u" valign="top" width="350">
		
<h3>Dane użytkownika:</h3>
<asp:DetailsView AutoGenerateRows="False" DataSourceID="MemberData"
  ID="UserInfo" runat="server" OnItemUpdating="UserInfo_ItemUpdating"
  >
  
<Fields>
	<asp:BoundField DataField="UserName" HeaderText="Nazwa użytkownika" ReadOnly="True" HeaderStyle-CssClass="detailheader" ItemStyle-CssClass="detailitem">
	</asp:BoundField>
	<asp:BoundField DataField="Email" HeaderText="Email" HeaderStyle-CssClass="detailheader" ItemStyle-CssClass="detailitem"></asp:BoundField>
	<asp:BoundField DataField="Comment" HeaderText="Notka" HeaderStyle-CssClass="detailheader" ItemStyle-CssClass="detailitem"></asp:BoundField>
	<asp:CheckBoxField DataField="IsApproved" HeaderText="Aktywny" HeaderStyle-CssClass="detailheader" ItemStyle-CssClass="detailitem" />
	<asp:CheckBoxField DataField="IsOnline" HeaderText="Online" ReadOnly="True" HeaderStyle-CssClass="detailheader" ItemStyle-CssClass="detailitem" />
	<asp:CheckBoxField DataField="IsLockedOut" HeaderText="Zablokowany" ReadOnly="true" HeaderStyle-CssClass="detailheader" ItemStyle-CssClass="detailitem" />
	<asp:BoundField DataField="LastLoginDate" HeaderText="Data ostatniego logowania" ReadOnly="True" HeaderStyle-CssClass="detailheader" ItemStyle-CssClass="detailitem"></asp:BoundField>

	<asp:CommandField ButtonType="button" ShowEditButton="true" EditText="Edit User Info" />
</Fields>
</asp:DetailsView>
<div class="alert" style="padding: 5px;">
<asp:Literal ID="UserUpdateMessage" runat="server">&nbsp;</asp:Literal>
</div>


<div style="text-align: left; width: 100%; margin: 20px 0px;">
<asp:Button ID="Button1" runat="server" Width="150px" Text="Lista użytkowników" OnClick="BackUser" />
<br />
<asp:Button ID="Button2" runat="server" Width="150px" Text="Odblokuj użytkownika" OnClick="UnlockUser" OnClientClick="return confirm('Kliknij OK aby odblokować użytkownika.')" />
<br />
<asp:Button ID="ButtonPass" runat="server" Width="150px" Text="Reset Hasła" OnClick="PassUser" OnClientClick="return confirm('Kliknij OK aby Skasowac Haslo użytkownika.')" />
<br />
<asp:Button ID="Button3" runat="server" Width="150px" Text="Skasuj użytkownika" OnClick="DeleteUser" OnClientClick="return confirm('Czy skasować użytkownika ?')" />
</div>


<asp:ObjectDataSource ID="MemberData" runat="server" DataObjectTypeName="System.Web.Security.MembershipUser" SelectMethod="GetUser" UpdateMethod="UpdateUser" TypeName="System.Web.Security.Membership">
	<SelectParameters>
		<asp:QueryStringParameter Name="username" QueryStringField="username" />
	</SelectParameters>
</asp:ObjectDataSource> 
		
		
		</td>
		<td class="details" valign="top">
		<h4>Role:</h4>
			<asp:CheckBoxList ID="UserRoles" runat="server" />
		</td>
	</tr>
</table>



</dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>
</asp:Content>