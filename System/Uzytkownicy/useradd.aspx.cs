using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class admin_access_useradd : System.Web.UI.Page
{
    MembershipUser user;

    private void Page_Load()
    {
        if (IsPostBack)
        {
            try
            {
                AddUser();

                Response.Redirect("useradd.aspx");
            }
            catch (Exception ex)
            {
                ConfirmationMessage.InnerText = "Błąd: " + ex.Message;
            }
        }
    }

    protected void AddUser()
    {
        // Add User.
        MembershipUser newUser = Membership.CreateUser(username.Text, password.Text, email.Text);
        newUser.Comment = comment.Text;
        Membership.UpdateUser(newUser);

        // Add Roles.
        foreach (ListItem rolebox in UserRoles.Items)
        {
            if (rolebox.Selected)
            {
                Roles.AddUserToRole(username.Text, rolebox.Text);
            }
        }
    }

    private void Page_PreRender()
    {
        UserRoles.DataSource = Roles.GetAllRoles();
        UserRoles.DataBind();
    }
}
