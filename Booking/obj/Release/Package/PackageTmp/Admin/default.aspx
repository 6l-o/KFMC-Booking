<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="movies.Admin._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
    </p>
    <p>
                <ul >
                        <li><a runat="server" href="~/Admin/ChangePassword">Change Password</a></li>
                        <li><a runat="server" href="~/Admin/passwordRecovery">Password Recovery</a></li>
                        <li><a runat="server" href="~/Admin/Register">Register</a></li>
                        <li><a runat="server" href="~/Admin/showRoles">Show Roles</a></li>
                        <li><a runat="server" href="~/Admin/userAcctMgr">User Account Manager</a></li>
                    </ul>
    </p>
</asp:Content>
