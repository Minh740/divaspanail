using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
public partial class cp_do_technician_edit_technician : System.Web.UI.Page
{
    public TechnicianTBx edit;
    protected void Page_Load(object sender, EventArgs e)
    {


        try
        {
            int id = Convert.ToInt32(Request["id"]);
            string name = Request["name"];
            string phone = Request["phone"];
            string address = Request["address"];
            TechnicianManager tm = new TechnicianManager();
            edit = tm.GetByID(id);
            edit.Name = name;
            edit.Phone = phone;
            edit.Address = address;
            tm.Save();
            Response.Write(1);
        }
        catch (Exception ex)
        {

            Response.Write(ex);
        }
    }
}
