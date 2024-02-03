using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Booking
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // this code hide admin menu from all other users
            //if (!Roles.IsUserInRole("admin"))
            //{
            //    MenuItemCollection menuItems = NavigationMenu.Items;
            //    MenuItem adminItem = new MenuItem();
            //    foreach (MenuItem menuItem in menuItems)
            //    {
            //        if (menuItem.Text == "Admin")// to hide specific menu put  the name here ... Warning, case sensitive 
            //            adminItem = menuItem;
            //    }
            //    menuItems.Remove(adminItem);
            //}

            if (HttpContext.Current.User.IsInRole("admin"))
            {
                adminLink.Visible = true;
            }

            if (HttpContext.Current.User.IsInRole("user"))
            {
                ticketLink.Visible = true;
            }

            if (HttpContext.Current.User.IsInRole("admin"))
            {
                ticketLink.Visible = true;
            }

            if (HttpContext.Current.User.IsInRole("admin"))
            {
                loginLink.Visible = false;
            }

            if (HttpContext.Current.User.IsInRole("admin"))
            {
                signupLink.Visible = false;
            }

            if (HttpContext.Current.User.IsInRole("user"))
            {
                loginLink.Visible = false;
            }

            if (HttpContext.Current.User.IsInRole("user"))
            {
                signupLink.Visible = false;
            }


        }
    }
}