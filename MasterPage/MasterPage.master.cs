using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string HeaderTXT = "";
        HeaderTXT = SiteMap.CurrentNode != null ? SiteMap.CurrentNode.Title : "Z-Liga";
        lbHeader.Text = HeaderTXT; // HeaderTXTPar + " - " + HeaderTXT;
        Page.Title = HeaderTXT;
    }

    protected void PasekLinkow_ItemClick(object source, DevExpress.Web.MenuItemEventArgs e)
    {
        String name;
        name = PasekLinkow.SelectedItem.Name;
    }

    protected void PasekLinkow_ItemDataBound(object source, DevExpress.Web.MenuItemEventArgs e)
    {
        if ((e.Item.Parent != null) && (!String.IsNullOrEmpty(e.Item.Parent.NavigateUrl)))
        {
            e.Item.Parent.NavigateUrl = null;
        }
    }
}
