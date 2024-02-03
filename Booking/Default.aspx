<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Booking._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

                 <div id="TitleContent" style="text-align: center">
                     <!--href="~/" on images points to the root page, for example if you want to point to All pages change to href="~/WhatsNew/All.aspx"-->
                     <br />
                     <br />
            <a runat="server" href="~/">
                <asp:Image  ID="Image1" runat="server" ImageUrl="~/Images/booking-com.png" alt="logo" BorderStyle="None" />
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
                    <td>Booking™ is the customer's choice of service.</td>
                </tr>
                <tr>
                    <td class="modal-sm" style="width: 182px">&nbsp;</td>
                    <td style="font-size: medium">Booking is a service that's meant to ease ordering and find your hotel. You can order tickets
                for any available hotel online!</td>
                </tr>
            </table>
                 </h1>
        <h2>&nbsp;</h2>
        <p class="lead">&nbsp;</p>
</asp:Content>