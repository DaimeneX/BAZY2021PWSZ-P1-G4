using System;
using DevExpress.Web;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Liga_Zawodnicy : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Zawodnicy_BeforePerformDataSelect(object sender, EventArgs e)
    {
        string KeyValue = (sender as ASPxGridView).GetMasterRowKeyValue().ToString();
        Session["zawodnik"] = KeyValue;
    }
}