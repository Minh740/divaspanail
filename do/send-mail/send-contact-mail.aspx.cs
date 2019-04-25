using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class do_send_mail_send_contact_mail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string email = Request["email"];

            string mailBody = Request.Unvalidated["mailBody"];

            string mailSubject = "New contact message - Diva";

            // Send email to Dearmom
            List<string> listClientEmail = new List<string>();
            listClientEmail.Add("huynhthinhuy1297@gmail.com");

            UTIL_SENDMAIL.SendMail("", listClientEmail, true, mailSubject, mailBody, "noreply@diva.com", "Diva");

            Response.Write(1);
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
}