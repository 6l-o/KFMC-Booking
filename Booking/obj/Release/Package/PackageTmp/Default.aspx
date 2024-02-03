<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="movies._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

                 <div id="TitleContent" style="text-align: center">
                     <!--href="~/" on images points to the root page, for example if you want to point to All pages change to href="~/WhatsNew/All.aspx"-->
            <a runat="server" href="~/">
                <asp:Image  ID="Image1" runat="server" ImageUrl="~/Images/moviesLogo11.png" alt="logo" BorderStyle="None" />
            </a>
                         <br />
            <br />  
                         <br />
        </div>

        <h1><%: Title %>
            <table class="nav-justified">
                <tr>
                    <td class="modal-sm" style="width: 182px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="modal-sm" style="width: 182px">&nbsp;</td>
                    <td>Movies™ is the customer's choice of service.</td>
                </tr>
                <tr>
                    <td class="modal-sm" style="width: 182px">&nbsp;</td>
                    <td style="font-size: medium">Movies is a service that's meant to ease ordering your tickets. You can order tickets
                for any movie online!</td>
                </tr>
            </table>
                 </h1>
        <h2>&nbsp;</h2>
        <p class="lead">&nbsp;</p>
</asp:Content>