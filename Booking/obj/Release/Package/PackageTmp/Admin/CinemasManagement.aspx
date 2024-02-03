<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CinemasManagement.aspx.cs" Inherits="movies.Admin.CinemasManagement" %>

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
                <td class="modal-sm" style="width: 512px" align="right"><strong>Add Cinema By Name&nbsp; </strong></td>
                <td>
                    <asp:TextBox ID="txtAddCinema" runat="server" Style="background-color: #333333"></asp:TextBox>
                    <asp:Button ID="btnAddCinema" runat="server" Text="ADD" OnClick="btnAddCinema_Click" Style="background-color: #B03939" BorderColor="#8F1A1A" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px" align="right">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px" align="right"><strong>Delete Cinema By ID&nbsp; </strong></td>
                <td>
                    <asp:TextBox ID="txtDeleteCinema" runat="server" Style="background-color: #333333"></asp:TextBox>
                    <asp:Button ID="btnDeleteCinema" runat="server" Text="DELETE" OnClick="btnDeleteCinema_Click" Style="background-color: #B03939" BorderColor="#8F1A1A" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
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
                    <asp:Button ID="btnExportToExcelCinemas" runat="server" OnClick="btnExportToExcelCinemas_Click" Text="EXPORT TO EXCEL" Style="background-color: #B03939" BorderColor="#8F1A1A" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                    <asp:Button ID="btnExportToWordCinemas" runat="server" OnClick="btnExportToWordCinemas_Click" Text="EXPORT TO WORD" Style="background-color: #B03939" BorderColor="#8F1A1A" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                    <asp:Button ID="btnExportToPDFCinemas" runat="server" OnClick="btnExportToPDFCinemas_Click" Text="EXPORT TO PDF" Style="background-color: #B03939" BorderColor="#8F1A1A" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px" align="right">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px" align="right">&nbsp;</td>
                <td>
                    <asp:Button ID="btnShowAllCinema" runat="server" Text="SHOW ALL CINEMA" OnClick="btnShowAllCinema_Click" Style="background-color: #B03939" BorderColor="#8F1A1A" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
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
                                HeaderText="Cinema ID">
                                <ItemTemplate>
                                    <asp:LinkButton ID="gvLinkButton" runat="server"
                                        OnClick="gvAdminLinkButton1_Click"
                                        CommandArgument='<%# Bind("cinemaId") %>'
                                        Text='<%# Eval("cinemaId")  %>'></asp:LinkButton>

                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:BoundField DataField="cinema" HeaderText="Cinema Name" />

                        </Columns>
                        <HeaderStyle BackColor="#8F1A1A" />
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
                <td class="modal-sm" style="width: 512px" align="right"><strong>Add Movie to Cinema</strong></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px" align="right">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px" align="right"><strong>Cinema Name&nbsp; </strong></td>
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
                <td class="modal-sm" style="width: 512px" align="right"><strong>Movie Title&nbsp; </strong></td>
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
                <td class="modal-sm" style="width: 512px; height: 26px;" align="right"><strong>Date&nbsp; </strong></td>
                <td style="height: 26px">
                    <asp:TextBox ID="txtDate" runat="server" Style="background-color: #333333">01/01/1990</asp:TextBox>
                    &nbsp;Insert in MM/DD/YYYY</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px; height: 26px;" align="right">&nbsp;</td>
                <td style="height: 26px">&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px; height: 26px;" align="right"><strong>Time&nbsp; </strong></td>
                <td style="height: 26px">
                    <asp:TextBox ID="txtTime" runat="server" Style="background-color: #333333">00:00:00</asp:TextBox>
                    &nbsp;Insert in HH:MM:SS format</td>
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
                    <asp:Button ID="btnAddMovieToCinema" runat="server" Text="ADD MOVIE TO CINEMA" OnClick="btnAddMovieToCinema_Click" Style="background-color: #B03939" BorderColor="#8F1A1A" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
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
                <td class="modal-sm" style="width: 512px" align="right"><strong>Remove Movie in Cinema By ID </strong></td>
                <td>
                    <asp:TextBox ID="txtMovieInCinemaId" runat="server" Style="background-color: #333333"></asp:TextBox>
                    <asp:Button ID="btnRemoveMovieInCinema" runat="server" OnClick="btnRemoveMovieInCinema_Click" Text="REMOVE MOVIE IN CINEMA" Style="background-color: #B03939" BorderColor="#8F1A1A" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px" align="right">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px">&nbsp;</td>
                <td>
                    <asp:Button ID="btnExportExcelMoviesInCinemas" runat="server" OnClick="btnExportExcelMoviesInCinemas_Click" Text="EXPORT TO EXCEL" Style="background-color: #B03939" BorderColor="#8F1A1A" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                    <asp:Button ID="btnExportWordMoviesInCinemas" runat="server" OnClick="btnExportWordMoviesInCinemas_Click" Text="EXPORT TO WORD" Style="background-color: #B03939" BorderColor="#8F1A1A" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                    <asp:Button ID="btnExportPDFMoviesInCinemas" runat="server" OnClick="btnExportPDFMoviesInCinemas_Click" Text="EXPORT TO PDF" Style="background-color: #B03939" BorderColor="#8F1A1A" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                </td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="modal-sm" style="width: 512px">&nbsp;</td>
                <td>
                    <asp:Button ID="btnShowAllMoviesInCinemas" runat="server" OnClick="btnShowAllMoviesInCinemas_Click" Text="SHOW ALL MOVIES IN EACH CINEMA" Style="background-color: #B03939" BorderColor="#8F1A1A" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
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
                                HeaderText="Movie In Cinema ID">
                                <ItemTemplate>
                                    <asp:LinkButton ID="gvLinkButton" runat="server"
                                        OnClick="gvAdminLinkButton2_Click"
                                        CommandArgument='<%# Bind("movieInCinemaId") %>'
                                        Text='<%# Eval("movieInCinemaId")  %>'></asp:LinkButton>

                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="movieName" HeaderText="Movie Title" />
                            <asp:BoundField DataField="cinema" HeaderText="Cinema Name" />
                            <asp:BoundField DataField="movieInCinemaDate" HeaderText="Movie In Cinema Date" />
                            <asp:BoundField DataField="movieInCinemaPrice" HeaderText="Movie In Cinema Price" />

                        </Columns>
                        <HeaderStyle BackColor="#8F1A1A" />
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
