using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

public partial class do_account : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string name = Request["name"];

            string email = Request["email"];
            string phone = Request["phone"];

            string notes = Request["notes"];

            ContactManager CM = new ContactManager();
            ContactTBx contact = new ContactTBx();

            contact.Name = name;

            contact.Email = email;
            contact.Phone = phone;

            contact.BodyContent = notes;

            contact.Status = 1;
            contact.Ip = UTIL.GetIPAddress();
            contact.CreateDay = DateTime.Now;

            CM.AddNew(contact);

            string mailBody = string.Format(@"<table>
                                    <thead>
                                        <tr>
                                            <td style='padding-left: 5px; border: 1px solid #ccc;' colspan='2'>Contact messages</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td style='padding-left: 5px; border: 1px solid #ccc;'>Name:</td>
                                            <td style='padding-left: 5px; border: 1px solid #ccc;'>{0}</td>
                                        </tr>
                                        <tr>
                                            <td style='padding-left: 5px; border: 1px solid #ccc;'>Email:</td>
                                            <td style='padding-left: 5px; border: 1px solid #ccc;'>{1}</td>
                                        </tr>
                                        <tr>
                                            <td style='padding-left: 5px; border: 1px solid #ccc;'>Phone number:</td>
                                            <td style='padding-left: 5px; border: 1px solid #ccc;'>{2}</td>
                                        </tr>
                                        <tr>
                                            <td style='padding-left: 5px; border: 1px solid #ccc;'>Notes:</td>
                                            <td style='padding-left: 5px; border: 1px solid #ccc;'>{3}</td>
                                        </tr>
                                    </tbody>
                                </table>", name, email, phone, notes);

            Response.Write(mailBody);
        }
        catch (Exception)
        {
            Response.Write(0);
        }
    }
    
    }