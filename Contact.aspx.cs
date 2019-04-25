using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : System.Web.UI.Page
{
    protected PageTBx contact;
    protected void Page_Load(object sender, EventArgs e)
    {
        PageManager PM = new PageManager();
        contact = PM.GetByName("contact");

    }
    //protected void SendMail()
    //{
    //    // Gmail Address from where you send the mail
    //    var fromAddress = "Gmail@gmail.com";
    //    // any address where the email will be sending
    //    var toAddress = YourEmail.Text.ToString();
    //    //Password of your gmail address
    //    const string fromPassword = "Password";
    //    // Passing the values and make a email formate to display
    //    string subject = YourSubject.Text.ToString();
    //    string body = "From: " + YourName.Text + "\n";
    //    body += "Email: " + YourEmail.Text + "\n";
    //    body += "Subject: " + YourSubject.Text + "\n";
    //    body += "Question: \n" + Comments.Text + "\n";
    //    // smtp settings
    //    var smtp = new System.Net.Mail.SmtpClient();
    //    {
    //        smtp.Host = "smtp.gmail.com";
    //        smtp.Port = 587;
    //        smtp.EnableSsl = true;
    //        smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
    //        smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
    //        smtp.Timeout = 20000;
    //    }
    //    // Passing values to smtp object
    //    smtp.Send(fromAddress, toAddress, subject, body);
    //}
}