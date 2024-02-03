<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Hotels.aspx.cs" Inherits="Booking.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!--Ajax AsyncPostBackTrigger implementation on btnMoviesAvailable button-->
    <div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <div id="TitleContent" style="text-align: center">
                    <a runat="server" href="~/">
                         <td></td> 
                    </a>
                    <br />
                    <br />
                    <a runat="server" href="~/">
                    <asp:Image ID="Image1" runat="server" alt="logo" BorderStyle="None" ImageUrl="~/Images/Hotel.png" />
                    </a>
                    <br />
                    <br />
                    <br />
                </div>

                <h2><%: Title %><span style="font-size: x-large">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hotels Near Your Location</span></h2>
                <table class="nav-justified">
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <table class="nav-justified">
                    <tr>
                        <td style="width: 492px" align="right" class="modal-sm"><strong>Choose a Hotel &nbsp; </strong></td>
                        <td>
                            <asp:DropDownList ID="ddlCinema" runat="server" Style="background-color: #666666">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 492px" align="right" class="modal-sm">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 492px" class="modal-sm">&nbsp;</td>
                        <td>
                            <asp:Button ID="btnMoviesAvailable" runat="server" OnClick="btnMoviesAvailable_Click" Text="Show All Hotels Available" Style="background-color: #6fa8dc" BorderColor="#6fa8dc" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 492px" class="modal-sm">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">


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
                                                    <p>Genre: <%#Eval("Type") %></p>
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
                                            <tr>
                                                <td>
                                                    <p>Showing Times: <%#Eval("HotelInBookingDate") %></p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <p>Ticket Price: <%#Eval("HotelInBookingPrice") %>$</p>
                                                </td>
                                            </tr>

                                            <br />
                                            <br />
                                        </table>
                                    </ItemTemplate>
                                    <ItemSeparatorTemplate>________________________________________________________________________ </ItemSeparatorTemplate>
                                </asp:ListView>


                            </div>



                        </td>
                    </tr>
                </table>


            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnMoviesAvailable" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>

    </div>


</asp:Content>