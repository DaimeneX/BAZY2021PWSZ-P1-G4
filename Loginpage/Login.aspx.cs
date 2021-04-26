using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Loginpage_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Login_LoggedIn(object sender, EventArgs e)
    {
        
    }

    SqlConnection CreateDBSConnection()
    {
        return new SqlConnection(ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString);
    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        return;
    }
}