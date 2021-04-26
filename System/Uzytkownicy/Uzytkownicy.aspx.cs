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
using System.Web.Security;

public partial class System_Uzytkownicy : System.Web.UI.Page
{
    private const string CURRENT_USER = "WebAdminCurrentUser";

    protected void Page_Load(object sender, EventArgs e)
    {
        DataBind();
    }

    private void Page_PreRender()
    {
        if (Alphalinks.Letter == "All")
        {
            Users.DataSource = Membership.GetAllUsers();
        }
        else
        {
            Users.DataSource = Membership.FindUsersByName(Alphalinks.Letter + "%");
        }
        Users.DataBind();
    }

    public void LinkButtonClick(object sender, CommandEventArgs e)
    {
        if (e.CommandName.Equals("EditUser"))
        {
            CurrentUser = ((string)e.CommandArgument);
            // do not prepend ~/ to this path since it is not at the root
            
        }
    }

    protected string CurrentUser
    {
        get
        {
            object obj = (string)Session[CURRENT_USER];
            if (obj != null)
            {
                return (string)Session[CURRENT_USER];
            }
            return String.Empty;
        }
        set
        {
            Session[CURRENT_USER] = value;
        }
    }

    private void BackUser(object sender, EventArgs e)
    {
        //Membership.DeleteUser(username, false); // DC: My apps will NEVER delete the related data.
        //Membership.DeleteUser(username, true); // DC: except during testing, of course!
        Response.Redirect("Uzytkownicy.aspx");
    }
}
