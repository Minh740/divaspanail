using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
public partial class cp_do_technician_delete_technician : System.Web.UI.Page
{
    public TechnicianTBx delete;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int id = Convert.ToInt32(Request["id"]);
           TechnicianManager tm = new TechnicianManager();
            delete = tm.GetByID(id);
            delete.Status = -1;
            tm.Save();
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