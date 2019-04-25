using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Detail_Coupons : System.Web.UI.Page
{
    public CouponsTBx detail;

    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request["id"]);
        CouponsManager cm = new CouponsManager();
        detail = cm.GetByID(id);
    }
}