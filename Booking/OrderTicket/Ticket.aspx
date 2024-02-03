<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ticket.aspx.cs" Inherits="Booking.Ticket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <div id="TitleContent" style="text-align: center">
        <a runat="server" href="~/">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/BookingTicket.png" alt="logo" BorderStyle="None" />
        </a>
        <br />
        <br />
    </div>



    <table class="nav-justified">
        <tr>
            <td class="modal-sm" style="width: 511px" align="right">
                <asp:Label ID="lblOutput" runat="server"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 511px" align="right"><strong>Name Of Passenger&nbsp; </strong></td>
            <td>
                <asp:TextBox ID="txtFullName" runat="server" Style="background-color: #333333"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 511px" align="right">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 511px; height: 20px" align="right"><strong>City&nbsp; </strong></td>
            <td style="height: 20px">
                <asp:DropDownList ID="ddlCinema" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCinema_SelectedIndexChanged" Style="background-color: #666666">
                </asp:DropDownList>

            </td>
        </tr>

         <tr>
            <td class="modal-sm" style="width: 511px; height: 20px" align="right">&nbsp;</td>
            <td style="height: 20px">&nbsp;</td>
        </tr>

        <tr>
            <td class="modal-sm" style="width: 511px; height: 11px;" align="right"><strong>Hotel Title&nbsp; </strong></td>
            <td style="height: 11px">
                <asp:DropDownList ID="ddlMovie" runat="server" Style="background-color: #666666">
                </asp:DropDownList>
            </td>
        </tr>

        <tr>
                <td class="modal-sm" style="width: 512px" align="right">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px; height: 26px;" align="right"><strong>Date Coming To Hotel&nbsp; </strong></td>
                <td style="height: 26px">
                    <asp:TextBox type="datetime-local" ID="txtcustomerDateCome" runat="server" Style="background-color: #333333">01/01/1990</asp:TextBox>
                    &nbsp;</td>
            </tr>
            

        <tr>
                <td class="modal-sm" style="width: 512px" align="right">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px; height: 26px;" align="right"><strong>Date Leave From Hotel&nbsp; </strong></td>
                <td style="height: 26px">
                    <asp:TextBox type="datetime-local" ID="txtcustomerDateLeave" runat="server" Style="background-color: #333333">01/01/1990</asp:TextBox>
                    &nbsp;</td>
            </tr>
            

       
        <tr>
            <td class="modal-sm" style="width: 511px" align="right">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 511px; height: 20px;" align="right"><strong>Ticket Type&nbsp; </strong></td>
            <td rowspan="3">
                <asp:RadioButtonList ID="rbtlTicket" runat="server">
                    <asp:ListItem Value="1">Child Entry Ticket</asp:ListItem>
                    <asp:ListItem Value="2">Adult Entry Ticket</asp:ListItem>
                    <asp:ListItem Value="3">Senior Entry Ticket</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 511px" align="right">&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 511px" align="right">&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 511px" align="right">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 511px; height: 27px;"></td>
            <td style="height: 27px">
                <asp:Button ID="btnOrderTicket" runat="server" Text="Order Ticket" OnClick="btnOrderTicket_Click" Style="background-color: #6fa8dc" BorderColor="#6fa8dc" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 511px; height: 27px;">&nbsp;</td>
            <td style="height: 27px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="height: 27px;" colspan="2">
            __________________________________________________________________________________________________________________________________________________________________
        </tr>
        <tr>
            <td class="modal-sm" style="width: 511px; height: 27px;">&nbsp;</td>
            <td style="height: 27px">&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 511px; height: 27px;" align="right"><strong>Ticket Number&nbsp; </strong></td>
            <td style="height: 27px">
                <asp:TextBox ID="txtTicketId" runat="server" Style="background-color: #333333"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 511px; height: 27px;" align="right">&nbsp;</td>
            <td style="height: 27px"></td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 511px; height: 27px;">&nbsp;</td>
            <td style="height: 27px">
                <asp:Button ID="btnUpdateTicket" runat="server" OnClick="btnUpdateTicket_Click" Text="Update Ticket" Style="background-color: #6fa8dc" BorderColor="#6fa8dc" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                <asp:Button ID="btnCancelTicket" runat="server" OnClick="btnCancelTicket_Click" Text="Cancel Ticket" Style="background-color: #6fa8dc" BorderColor="#6fa8dc" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />

            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 511px; height: 27px;">&nbsp;</td>
            <td style="height: 27px">&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 511px; height: 27px;"></td>
            <td style="height: 27px">

                <asp:Button ID="btnUpdateAdmin" runat="server" OnClick="btnUpdateAdmin_Click" Text="Force Update Ticket" Visible="False" Style="background-color: #6fa8dc" BorderColor="#6fa8dc" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                <asp:Button ID="btnDeleteAdmin" runat="server" OnClick="btnDeleteAdmin_Click" Text="Force Delete Ticket" Visible="False" Style="background-color: #6fa8dc" BorderColor="#6fa8dc" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />

            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="height: 27px;" colspan="2">__________________________________________________________________________________________________________________________________________________________________</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 511px; height: 27px;">&nbsp;</td>
            <td style="height: 27px">&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 511px; height: 27px;"></td>
            <td style="height: 27px">
                <asp:Button ID="btnShowMyTickets" runat="server" OnClick="btnShowMyTickets_Click" Text="Show All My Ticket" Style="background-color: #6fa8dc" BorderColor="#6fa8dc" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                <asp:Button ID="btnShowAllTickets" runat="server" OnClick="btnShowAllTickets_Click" Text="Show All My Customer Ticket" Visible="False" Style="background-color: #6fa8dc" BorderColor="#6fa8dc" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />

            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 511px; height: 27px;">&nbsp;</td>
            <td style="height: 27px">&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 511px">&nbsp;</td>
            <td>
                <asp:Button ID="btnExportPDF" runat="server" Text="Export Ticket As PDF" OnClick="btnExportPDF_Click" Style="background-color: #6fa8dc" BorderColor="#6fa8dc" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />

            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 511px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="gvTicketDataAdmin" runat="server" CssClass="table table-boarded" AutoGenerateColumns="false" BackColor="#333333" BorderColor="Black" ForeColor="White">
                    <Columns>
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center"
                            HeaderText="Ticket Number">

                            <ItemTemplate>
                                <asp:LinkButton ID="gvLinkButton" runat="server"
                                    OnClick="gvAdminLinkButton_Click"
                                    CommandArgument='<%# Bind("customerTicketId") %>'
                                    Text='<%# Eval("customerTicketId")  %>'></asp:LinkButton>

                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="UserName" HeaderText="Account Name" />
                        <asp:BoundField DataField="customerFullName" HeaderText="Name Under Ticket" />
                        <asp:BoundField DataField="HotelName" HeaderText="Hotel Title" />
                        <asp:BoundField DataField="ticket" HeaderText="Ticket Type" />
                        <asp:BoundField DataField="Booking" HeaderText="City" />
                        <asp:BoundField DataField="customerDateCome" HeaderText="Date Coming" />
                        <asp:BoundField DataField="customerDateLeave" HeaderText="Date Leave" />
                        <asp:BoundField DataField="HotelInBookingPrice" HeaderText="Ticket Price" />
                        <asp:BoundField DataField="totalTicketsPrice" HeaderText="Total Tickets Price" />

                    </Columns>
                    <HeaderStyle BackColor="#6fa8dc" />
                    <RowStyle BackColor="#333333" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <%--<td colspan="2"><asp:GridView ID="gvTicketData" runat="server"></asp:GridView></td>--%>

            <%-- This gridview is better, can assign header text instead of table names --%>
            <asp:GridView ID="gvTicketData" runat="server" CssClass="table table-boarded" DataKeyNames="customerTicketId"
                AutoGenerateColumns="false" BackColor="#333333" BorderColor="Black" ForeColor="White" OnRowCommand="gvTicketData_RowCommand">
                <Columns>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center"
                        HeaderText="Ticket Number">
                        <ItemTemplate>

                            <asp:LinkButton ID="gvLinkButton" runat="server"
                                OnClick="gvLinkButton_Click"
                                CommandArgument='<%# Bind("customerTicketId") %>'
                                Text='<%# Eval("customerTicketId")  %>'></asp:LinkButton>

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="customerFullName" HeaderText="Name Under Ticket" />
                    <asp:BoundField DataField="HotelName" HeaderText="Hotel Title" />
                    <asp:BoundField DataField="ticket" HeaderText="Ticket Type" />
                    <asp:BoundField DataField="Booking" HeaderText="City" />
                    <asp:BoundField DataField="customerDateCome" HeaderText="Date Coming" />
                    <asp:BoundField DataField="customerDateLeave" HeaderText="Date Leave" />
                    <asp:BoundField DataField="HotelInBookingPrice" HeaderText="Ticket Price" />
                    <asp:BoundField DataField="totalTicketsPrice" HeaderText="Total Tickets Price" />

                </Columns>

                <HeaderStyle BackColor="#6fa8dc" />
                <RowStyle BackColor="#333333" />




            </asp:GridView>

        </tr>
    </table>

    <!--DataTables implementation-->

    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%=gvTicketData.ClientID%>').DataTable();
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%=gvTicketDataAdmin.ClientID%>').DataTable();
                    });</script>

    
    <!--DataTables implementation-->


    <table class="nav-justified">
        <tr>
            <td style="width: 208px" class="modal-sm">



                <asp:GridView ID="gvNoColors" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="customerTicketId" HeaderText="Ticket Number" />
                        <asp:BoundField DataField="customerFullName" HeaderText="Name Under Ticket" />
                        <asp:BoundField DataField="HotelName" HeaderText="Movie Title" />
                        <asp:BoundField DataField="ticket" HeaderText="Ticket Type" />
                        <asp:BoundField DataField="Booking" HeaderText="Cinema" />
                        <asp:BoundField DataField="HotelInBookingDate" HeaderText="Showing Date" />
                        <asp:BoundField DataField="HotelInBookingPrice" HeaderText="Ticket Price" />
                        <asp:BoundField DataField="totalTicketsPrice" HeaderText="Total Tickets Price" />

                    </Columns>
                </asp:GridView>



            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 208px" class="modal-sm">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 208px" class="modal-sm">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 208px" align="right" class="modal-sm">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 208px"></td>
            <td>&nbsp;</td>
        </tr>
    </table>



</asp:Content>
