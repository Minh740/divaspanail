using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_technician_Edit_Technician : System.Web.UI.Page
{
    public TechnicianTBx edit1;
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Page.RouteData.Values["id"]);
        TechnicianManager tm = new TechnicianManager();
        edit1 = tm.GetByID(id);
    }
}