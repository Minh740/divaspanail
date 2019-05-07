using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_technician_Technician : System.Web.UI.Page
{
    public List<TechnicianTBx> list;
    protected void Page_Load(object sender, EventArgs e)
    {
        TechnicianManager tm = new TechnicianManager();
        list = tm.GetList();
    }
}