using movies.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Booking.Admin
{
    public partial class userAcctMgr : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void insertInernUserAccount(string myUserName, string myEmail)
        {
            try
            {
                CRUD myCrud = new CRUD();
                string mySql = @"update intern set userName =@userName where email =@email";
                Dictionary<string, object> myPara = new Dictionary<string, object>();
                myPara.Add("@userName", myUserName);
                myPara.Add("@email", myEmail);
                int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
                if (rtn >= 1)
                { Session["userName"] = myUserName; }
                else
                {
                    lblOutput.Text = "User name was not created in Intern Profile !";
                    return;
                }
            }

            catch (Exception ex)
            {
                lblOutput.Text = ex.Message.ToString(); ;
            }
        }
        /// <summary>
        /// This method will fire as soon as the user account is created
        /// </summary>
        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            string UserName = CreateUserWizard1.UserName.ToString();
            string UserEmail = CreateUserWizard1.Email.ToString();
            insertInernUserAccount(UserName, UserEmail);
            if (!Roles.RoleExists("intern"))
            {
                Roles.CreateRole("intern");
            }
            if (!Roles.IsUserInRole(UserName, "intern"))
                Roles.AddUserToRole(UserName, "intern");
            FormsAuthentication.SetAuthCookie(CreateUserWizard1.UserName, true);   // ?
            Response.Redirect("~/internship/default.aspx");
        }
        protected void btnUnLinkUserToRole_Click(object sender, EventArgs e)
        {  // to unlink a role, the user should be in same role to unlink it
           // todo: how to secify  a user 
           // if (Roles.RoleExists(txtRole.Text) && User.IsInRole(txtRole.Text))
            if (Roles.IsUserInRole(txtUser.Text, txtRole.Text))
            {
                Roles.RemoveUserFromRole(txtUser.Text, txtRole.Text);
                lblMsg.Text = "Unlinked Successfully";
            }
            else
            {
                lblMsg.Text = "Unlinked Failed: User is not in the specified role";
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Unlinked Failed: User is not in the specified role')", true);
                return;
            }
        }
        protected void btnLinkUserRole_Click(object sender, EventArgs e)
        {// todo... enhance this code WITH SWITCH 
            if (string.IsNullOrEmpty(txtUser.Text) || string.IsNullOrEmpty(txtRole.Text))
            {
                lblMsg.Text = "Fill both User and Role fields";
                return;
            }
            // 
            if (Membership.FindUsersByName(txtUser.Text).Count == 0)
            {
                lblMsg.Text = "User Does not Exists";
                return;
            }
            if (!Roles.RoleExists(txtRole.Text))
            {
                lblMsg.Text = "Role Does not Exists";
                return;
            }
            //  if (Roles.RoleExists(txtRole.Text) && Membership.FindUsersByName(txtUser.Text).Count >= 1) // OLD 
            if (Roles.RoleExists(txtRole.Text) && !Roles.IsUserInRole(txtUser.Text, txtRole.Text)) // BETTER
            {
                Roles.AddUserToRole(txtUser.Text, txtRole.Text);
                lblMsg.Text = "Linked Successful";
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('User already assigned a role')", true);
                postMsg("User already assigned a role");
                return;
            }
        }
        protected void btnDeleteRole_Click(object sender, EventArgs e)
        {
            if (!Roles.RoleExists(txtRole.Text))
            {
                lblMsg.Text = "Role Does not Exist";
                return;
            }
            // check if any roles has users
            if (Roles.RoleExists(txtRole.Text) && Roles.GetUsersInRole(txtRole.Text).Length == 0)
            {
                Roles.DeleteRole(txtRole.Text);
                lblMsg.Text = "Role Deleted";
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Role is in use by other users')", true);
                postMsg("Role is in use by other users");
                //return;
            }
            //populateCheckBoxListRolesUsers();
            //populateGvAllUsers();
        }
        protected void btnDeleteUser_Click(object sender, EventArgs e)
        { // check if user exists, there is two ways 
          //  if (Membership.FindUsersByName(txtUser.Text).Count != 0)  // one way

            // is to create an instance of MembershipUser and check to fill it from db, if not null means user exists, 
            MembershipUser existingUser = null;  // second way 
            existingUser = Membership.GetUser(txtUser.Text);
            if (existingUser != null)  // if user exists, then delete him
            {
                if (Membership.DeleteUser(txtUser.Text))
                {
                    postMsg("Was Deleted");
                 //   populateGvAllUsers();
                }
                else
                    postMsg("Was Not Deleted");
            }
            else
            {
                postMsg("User does not exists!!");
            }
           // populateCheckBoxListRolesUsers();
        }
        protected void btnCreateUser_Click(object sender, EventArgs e)
        {
            // if user does not exist, create a new user
            //if (Membership.GetUser(txtUser.Text) != null)
            //{
            try
            {
                string vUser = txtUser.Text.ToString();
                string vPassword = txtPassword.Text.ToString();
                string vEmail = txtEmail.Text.ToString();
                if (!Membership.ValidateUser(vUser, vPassword)) // if user not valid, then create it
                {
                    Membership.CreateUser(vUser, vPassword, vEmail);
                    postMsg("User Created Successfuly");
                  //  populateGvAllUsers();
                    insertInernUserAccount(vUser, vEmail);  // added Dec 5/2020   to update intern record with userName
                }

                else
                {
                    postMsg("User already exists!!");
                    return;
                }
              //  populateCheckBoxListRolesUsers();
            }

            catch (Exception ex)
            {
                postMsg(ex.Message.ToString());  // to do , log the errors  rtn
                                                 // postMsgClient(ex.Message);
            }
        }
        protected void postMsg(string msg)
        {
            lblMsg.Text = msg.ToString();
        }
        protected void btnShowAllUser_Click(object sender, EventArgs e)
        {
            //MembershipUserCollection users = Membership.GetAllUsers();
            //gvUsers.DataSource = users;
            //gvUsers.DataBind();
        }
        protected void btnCreateRole_Click(object sender, EventArgs e)
        {
            if (!Roles.RoleExists(txtRole.Text))
            {
                createRole(txtRole.Text);
             //   populateGvAllUsers();

            }
            else
            {
                postMsg("Role already exists!!");
            }
          //  populateCheckBoxListRolesUsers();
        }
        void createRole(string myRole)
        {
            if (!Roles.RoleExists(myRole))
            {
                Roles.CreateRole(myRole);
                postMsg("New Role Created");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('Role already Exists')", true);
                postMsg("Role already exists");
                return;
            }
        }
        protected void btnShowAllRoles_Click(object sender, EventArgs e)
        {
            Page_Load(this, null);
        }
        protected void btnUpdateUser_Click(object sender, EventArgs e)
        {
        }

        protected void btnCheckFileNo_Click(object sender, EventArgs e)
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select refno from intern where userName =@userName";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("userName",txtUser.Text);
            string  rtn = myCrud.getNameExecuteScalar(mySql, myPara);
            lblMsg.Text = rtn;
        }

        protected void btnCheckUserRole_Click(object sender, EventArgs e)
        {
            string strAppName = Membership.ApplicationName;  //u.username ,
            CRUD myCrud = new CRUD();
            string mySql = @" select r.rolename  
                      from dbo.aspnet_Users u, dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur, dbo.aspnet_Applications ap
                               where u.UserId = ur.UserId
                              and ur.RoleId = r.RoleId
                              and applicationname = @appName
                               and u.username = @userName";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@appName", strAppName);
            myPara.Add("@userName", txtUser.Text);
            SqlDataReader dr = myCrud.getDrPassSql(mySql, myPara);
            string strRoles = "";
            if (dr.HasRows)
                while (dr.Read())
                {
                    strRoles += dr["rolename"].ToString() + " " ;
                }
                    lblMsg.Text = strRoles;
        }
    }
}