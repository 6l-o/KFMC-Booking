<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NowAvailable.aspx.cs" Inherits="Booking.WhatsNew.NowAvailable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div id="TitleContent" style="text-align: center">
        <a runat="server" href="~/">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/IMG_0022.png" alt="logo" BorderStyle="None" />
        </a>
        <br />
        <br />
        <span style="font-size: xx-large"><span style="font-weight: bold">Now Available</span></span>&nbsp;</div>



    <p>
    </p>
    <table class="nav-justified">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="height: 20px"></td>
            <td style="height: 20px"></td>
        </tr>
    </table>

    <div id="moviesMenu" style="text-align: center">


        <asp:ListView ID="moviesLv" runat="server">
            <ItemTemplate>
                <table>
                    <tr>
                        <td>
                            <itemtemplate>

                               <asp:Image ID="Image2" runat="server" Height="300px" Width="200px"
                                 ImageUrl='<%#"data:Image/jpg;base64," + Convert.ToBase64String((byte[])Eval("HotelImage")) %>' />

                            <%--<img src='<%#"data:Image/jpg;base64," + Convert.ToBase64String((byte[])Eval("HotelImage")) %>'--%>

                                </itemtemplate>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <hd1><b style = "font-size: large; font-style: normal"><%#Eval("HotelName") %></hd1>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><%#Eval("HotelDescription") %></p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>Hotel Type : <%#Eval("Type") %></p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>Language: <%#Eval("language") %></p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>Rating: <%#Eval("rating") %></p>
                        </td>
                    </tr>

                    <br />
                    <br />
                </table>
            </ItemTemplate>
            <ItemSeparatorTemplate>________________________________________________________________________ </ItemSeparatorTemplate>
        </asp:ListView>


    </div>



   

                                </ItemTemplate>
                            </td></tr>

                        <tr>
                            <td>
                                <hd1><%#Eval("HotelName") %></hd1>
                            </td>
                        </tr>
    <tr>
        <td>
            <p><%#Eval("HotelDescription") %></p>
        </td>
    </tr>
    <br />
    <br />
    </table>

                </div>
            </ItemTemplate>
        </asp:ListView>


        <br />
    </p>
</asp:Content>
