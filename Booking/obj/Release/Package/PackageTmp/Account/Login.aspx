<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="movies.Account.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="TitleContent" style="text-align: center">
        <a runat="server" href="~/">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/moviesLogo11.png" alt="logo" BorderStyle="None" />
        </a>
        <br />
        <br />
        <br />
    </div>
    <p>
        <table class="nav-justified">
            <tr>
                <td style="height: 20px; width: 407px"></td>
                <td style="height: 20px; width: 80px"></td>
                <td style="height: 20px; width: 266px">&nbsp;</td>
                <td style="height: 20px"></td>
                <td style="height: 20px"></td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 407px">&nbsp;</td>
                <td style="width: 80px">&nbsp;</td>
                <td class="modal-sm" style="width: 266px">
                    <strong>Welcome back!</strong></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 407px">&nbsp;</td>
                <td class="text-left" style="width: 80px">
                    <strong>User Name</strong></td>
                <td class="modal-sm" style="width: 266px">
                    <asp:TextBox ID="txtUserName" runat="server" Style="background-color: #333333"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 407px">&nbsp;</td>
                <td style="width: 80px">&nbsp;</td>
                <td class="modal-sm" style="width: 266px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 407px">&nbsp;</td>
                <td style="width: 80px">
                    <strong>Password</strong></td>
                <td class="modal-sm" style="width: 266px">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Style="background-color: #333333"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 407px">&nbsp;</td>
                <td style="width: 80px">&nbsp;</td>
                <td class="modal-sm" style="width: 266px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 407px">&nbsp;</td>
                <td style="width: 80px">&nbsp;</td>
                <td class="modal-sm" style="width: 266px">
                    <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click"
                        Text="LOGIN" Style="background-color: #B03939" BorderColor="#8F1A1A" BorderStyle="Solid" Font-Names="sans-serif" Font-Size="13px" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 407px">&nbsp;</td>
                <td style="width: 80px">&nbsp;</td>
                <td class="modal-sm" style="width: 266px">
                    <asp:Label ID="lblOutput" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 407px">&nbsp;</td>
                <td style="width: 80px">&nbsp;</td>
                <td class="modal-sm" style="width: 266px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 407px">&nbsp;</td>
                <td style="width: 80px">&nbsp;</td>
                <td class="modal-sm" style="width: 266px">Don't have an account? <a runat="server" href="~/Account/Signup">Sign up here!</a>
                    <td colspan="2">&nbsp;</td>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        <div>
        </div>
    </p>
    <p>
    </p>
</asp:Content>
