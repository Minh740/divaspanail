﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_service_search_service : System.Web.UI.Page
{
    public List<ServicesTBx> result = new List<ServicesTBx>();
    public ServicesTBx service = new ServicesTBx();
    public int serviceid;
    protected void Page_Load(object sender, EventArgs e)
    {
        ServicesManager SM = new ServicesManager();
        string name = Request["name"];
        ServicesManager r = new ServicesManager();
        service = SM.GetServiceByServiceName(name);
        serviceid = service.ID;
        result = r.GetListServiceBySerciceId(serviceid);


    }
}