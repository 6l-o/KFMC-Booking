<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CitiesManagement.aspx.cs" Inherits="Booking.Admin.CitiesManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <p class="text-center">
        <table class="nav-justified">
            <tr>
                <td class="modal-sm" style="width: 512px">
                    <asp:Label ID="lblOutput" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px" align="right"><strong>Add City By Name&nbsp; </strong></td>
                <td>
                    <asp:TextBox ID="txtAddCinema" runat="server" Style="background-color: #333333"></asp:TextBox>
                    <asp:Button ID="btnAddCinema" runat="server" Text="Add" OnClick="btnAddCinema_Click" Style="background-color: #6fa8dc" BorderColor="#6fa8dc" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px" align="right">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px" align="right"><strong>Delete City By ID&nbsp; </strong></td>
                <td>
                    <asp:TextBox ID="txtDeleteCinema" runat="server" Style="background-color: #333333"></asp:TextBox>
                    <asp:Button ID="btnDeleteCinema" runat="server" Text="Delete" OnClick="btnDeleteCinema_Click" Style="background-color: #6fa8dc" BorderColor="#6fa8dc" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px" align="right">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px" align="right">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px" align="right">&nbsp;</td>
                <td>
                    <asp:Button ID="btnExportToExcelCinemas" runat="server" OnClick="btnExportToExcelCinemas_Click" Text="Export To Excel" Style="background-color: #6fa8dc" BorderColor="#6fa8dc" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                    <asp:Button ID="btnExportToWordCinemas" runat="server" OnClick="btnExportToWordCinemas_Click" Text="Export To Word" Style="background-color: #6fa8dc" BorderColor="#6fa8dc" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                    <asp:Button ID="btnExportToPDFCinemas" runat="server" OnClick="btnExportToPDFCinemas_Click" Text="Export To PDF" Style="background-color: #6fa8dc" BorderColor="#6fa8dc" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px" align="right">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px" align="right">&nbsp;</td>
                <td>
                    <asp:Button ID="btnShowAllCinema" runat="server" Text="Show All City" OnClick="btnShowAllCinema_Click" Style="background-color: #6fa8dc" BorderColor="#6fa8dc" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px" align="right">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">

                    <asp:GridView ID="cinemasGv" runat="server" CssClass="table table-boarded" AutoGenerateColumns="false" BackColor="#333333" BorderColor="Black" ForeColor="White">
                        <Columns>

                            <asp:TemplateField ItemStyle-HorizontalAlign="Center"
                                HeaderText="City ID">
                                <ItemTemplate>
                                    <asp:LinkButton ID="gvLinkButton" runat="server"
                                        OnClick="gvAdminLinkButton1_Click"
                                        CommandArgument='<%# Bind("BookingId") %>'
                                        Text='<%# Eval("BookingId")  %>'></asp:LinkButton>

                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:BoundField DataField="Booking" HeaderText="City Name" />

                        </Columns>
                        <HeaderStyle BackColor="#6fa8dc" />
                        <RowStyle BackColor="#333333" />
                    </asp:GridView>
                    <!--DataTables implementation-->
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $('#<%=cinemasGv.ClientID%>').DataTable();
                        });
                    </script>
                    <!--DataTables implementation-->

                </td>
            </tr>
            <tr>
                <td style="height: 20px;" align="right" colspan="2">_______________________________________________________________________________________________________________________________________________________________________________</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px" align="right">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px" align="right"><strong>Add Hotel to City</strong></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px" align="right">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px" align="right"><strong>City Name&nbsp; </strong></td>
                <td>
                    <asp:DropDownList ID="ddlCinema" runat="server" Style="background-color: #666666">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px" align="right">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px" align="right"><strong>Hotel Title&nbsp; </strong></td>
                <td>
                    <asp:DropDownList ID="ddlMovie" runat="server" Style="background-color: #666666">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px" align="right">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px; height: 26px;" align="right"><strong>Date Add Hotel To City&nbsp; </strong></td>
                <td style="height: 26px">
                    <asp:TextBox type="datetime-local" ID="txtDate" runat="server" Style="background-color: #333333">01/01/1990</asp:TextBox>
                    &nbsp;</td>
            </tr>
            
            
            <tr>
                <td class="modal-sm" style="width: 512px; height: 26px;" align="right">&nbsp;</td>
                <td style="height: 26px">&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px" align="right"><strong>Ticket Price&nbsp; </strong></td>
                <td>
                    <asp:TextBox ID="txtTicketPrice" runat="server" Style="background-color: #333333"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px" align="right">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px">&nbsp;</td>
                <td>
                    <asp:Button ID="btnAddMovieToCinema" runat="server" Text="Add Hotel To City" OnClick="btnAddMovieToCinema_Click" Style="background-color: #6fa8dc" BorderColor="#6fa8dc" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px" align="right"><strong>Remove Hotel in City By ID </strong></td>
                <td>
                    <asp:TextBox ID="txtHotelInBookingId" runat="server" Style="background-color: #333333"></asp:TextBox>
                    <asp:Button ID="btnRemoveMovieInCinema" runat="server" OnClick="btnRemoveMovieInCinema_Click" Text="Remove Hotel In City" Style="background-color: #6fa8dc" BorderColor="#6fa8dc" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px" align="right">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px">&nbsp;</td>
                <td>
                    <asp:Button ID="btnExportExcelMoviesInCinemas" runat="server" OnClick="btnExportExcelMoviesInCinemas_Click" Text="Export To Excel" Style="background-color: #6fa8dc" BorderColor="#6fa8dc" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                    <asp:Button ID="btnExportWordMoviesInCinemas" runat="server" OnClick="btnExportWordMoviesInCinemas_Click" Text="Export To Word" Style="background-color: #6fa8dc" BorderColor="#6fa8dc" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                    <asp:Button ID="btnExportPDFMoviesInCinemas" runat="server" OnClick="btnExportPDFMoviesInCinemas_Click" Text="Export To PDF" Style="background-color: #6fa8dc" BorderColor="#6fa8dc" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px">&nbsp;</td>
                <td>
                    <asp:Button ID="btnShowAllMoviesInCinemas" runat="server" OnClick="btnShowAllMoviesInCinemas_Click" Text="Show All Hotel In Each City" Style="background-color: #6fa8dc" BorderColor="#6fa8dc" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">

                    <asp:GridView ID="MoviesInCinemasGv" runat="server" CssClass="table table-boarded" AutoGenerateColumns="false" BackColor="#333333" BorderColor="Black" ForeColor="White">
                        <Columns>

                            <asp:TemplateField ItemStyle-HorizontalAlign="Center"
                                HeaderText="Hotel In City ID">
                                <ItemTemplate>
                                    <asp:LinkButton ID="gvLinkButton" runat="server"
                                        OnClick="gvAdminLinkButton2_Click"
                                        CommandArgument='<%# Bind("HotelInBookingId") %>'
                                        Text='<%# Eval("HotelInBookingId")  %>'></asp:LinkButton>

                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="HotelName" HeaderText="Hotel Title" />
                            <asp:BoundField DataField="Booking" HeaderText="City Name" />
                            <asp:BoundField DataField="HotelInBookingDate" HeaderText="Hotel In City Date" />
                            <asp:BoundField DataField="HotelInBookingPrice" HeaderText="Hotel In City Price" />

                        </Columns>
                        <HeaderStyle BackColor="#6fa8dc" />
                        <RowStyle BackColor="#333333" />
                    </asp:GridView>

                    <!--DataTables implementation-->
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $('#<%=MoviesInCinemasGv.ClientID%>').DataTable();
                        });
                    </script>
                    <!--DataTables implementation-->

                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px">&nbsp;</td>
                <td>

                    <asp:GridView ID="MoviesInCinemasGvNoColors" runat="server">
                    </asp:GridView>

                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px">&nbsp;</td>
                <td>

                    <asp:GridView ID="cinemasGvNoColors" runat="server">
                    </asp:GridView>


                </td>
            </tr>
        </table>
        <br />
    </p>




</asp:Content>
