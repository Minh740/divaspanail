using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
public partial class cp_do_technician_add_new_technician : System.Web.UI.Page
{
    public string ok = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
           
            string name = Request["name"];
            string phone = Request["phone"];
            string address = Request["address"];
            TechnicianManager TM = new TechnicianManager();
            TechnicianTBx tech = new TechnicianTBx();
            tech.Name = name;
            tech.Phone = phone;
            tech.Address = address;
            tech.Status = 1;
            TM.AddNew(tech);
            Response.Write(JsonConvert.SerializeObject(new
            {
                success = 1
            }));
        }
        catch (Exception ex)
        {
            Response.Write(JsonConvert.SerializeObject(new
            {
                success = -1,
                error = ex
            }));
        }
    }
}