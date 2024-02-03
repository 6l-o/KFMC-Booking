using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Security.Principal;
using System.Threading;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet;

namespace Booking.Account
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (this.User != null && this.User.Identity.IsAuthenticated)
            {
                //auto assign role to recently registered user
                var userName = HttpContext.Current.User.Identity.Name;
                Roles.AddUserToRole(userName, "user");




                //codes for sending recently registered user email notification after registration
                // Get current logged-in user username
                string uname = HttpContext.Current.User.Identity.Name.ToString();
                // Get current user UserId in asp.net membership
                MembershipUser user = Membership.GetUser(uname);
                string userId = user.ProviderUserKey.ToString();
                //this will be used to get ther currently logged in user email address to send SMTP email relays to user email after every sucessful ticket operation
                string userEmail = Membership.GetUser(uname).Email;
                string emailSubject = "Thank you for signing up on Booking!";
                string emailBody = "Your account has been registered and authenticated. Thank you for signing up!";
                sendEmailViaGmail(userEmail, emailSubject, emailBody);
            }

        }

        protected void ContinueButton_Command(object sender, CommandEventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        public string sendEmailViaGmail(string userEmail, string emailSubject, string emailBody) // worked 100%, this is a nice one use it with  properties
        {
            string myFrom = "movieskfmca@gmail.com"; //Email: movieskfmca@gmail.com Pass: summ2021

            string myTo = userEmail;
            string mySubject = emailSubject;
            string myBody = emailBody;

            string myHostsmtpAddress = "smtp.gmail.com";//"smtp.mail.yahoo.com";  //mail.wdbcs.com 
            int myPortNumber = 587;
            bool myEnableSSL = true;
            string myUserName = "movieskfmca@gmail.com";//"movieskfmca@gmail.comm"
            string myPassword = "summ2021";//"summ2021"


            //string visitorUserName = Page.User.Identity.Name;
            using (MailMessage m = new MailMessage(myFrom, myTo, mySubject, myBody)) // .............................1
            {
                SmtpClient sc = new SmtpClient(myHostsmtpAddress, myPortNumber); //..................................2
                try
                {
                    sc.Credentials = new System.Net.NetworkCredential(myUserName, myPassword);  //.................3
                    sc.EnableSsl = true;
                    sc.Send(m);
                    return "Email Send successfully";
                    //lblMsg.Text = ("Email Send successfully");
                    //lblMsg.ForeColor = Color.Green; // using System.Drawing above 2/2018
                }
                catch (SmtpFailedRecipientException ex)
                {
                    SmtpStatusCode statusCode = ex.StatusCode;
                    if (statusCode == SmtpStatusCode.MailboxBusy || statusCode == SmtpStatusCode.MailboxUnavailable || statusCode == SmtpStatusCode.TransactionFailed)
                    {   // wait 5 seconds, try a second time
                        Thread.Sleep(5000);
                        sc.Send(m);
                        return ex.Message.ToString();
                    }
                    else
                    {
                        throw;
                    }
                }
                catch (Exception ex)
                {
                    return ex.ToString();
                }
                finally
                {
                    m.Dispose();
                }
            }// end using 
        }

    }
}