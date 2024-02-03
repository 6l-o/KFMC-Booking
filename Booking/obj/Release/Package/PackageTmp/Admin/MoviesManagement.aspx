<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MoviesManagement.aspx.cs" Inherits="movies.Admin.MoviesManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <p>
        <br />
        <table class="nav-justified">
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblOutput" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 521px" align="right"><strong>Movie Title&nbsp; </strong></td>
                <td>
                    <asp:TextBox ID="txtMovieTitle" runat="server" Style="background-color: #333333"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 521px" align="right">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 521px" align="right"><strong>Description&nbsp; </strong></td>
                <td>
                    <asp:TextBox ID="txtMovieDesc" runat="server" Style="background-color: #333333" Height="131px" TextMode="MultiLine" Width="265px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 521px" align="right">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 521px" align="right"><strong>Genre&nbsp; </strong></td>
                <td>
                    <asp:DropDownList ID="ddlGenre" runat="server" Style="background-color: #666666">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 521px" align="right">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 521px" align="right"><strong>Language&nbsp; </strong></td>
                <td>
                    <asp:DropDownList ID="ddlLang" runat="server" Style="background-color: #666666">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 521px" align="right">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 521px; height: 20px" align="right"><strong>Release Year&nbsp; </strong></td>
                <td style="height: 20px">
                    <asp:TextBox ID="txtmovieRelease" runat="server" Style="background-color: #333333"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 521px; height: 20px" align="right">&nbsp;</td>
                <td style="height: 20px">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 521px" align="right"><strong>Status&nbsp; </strong></td>
                <td>
                    <asp:RadioButtonList ID="rbtlStatus" runat="server">
                        <asp:ListItem Value="1"></asp:ListItem>
                        <asp:ListItem Value="2"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td style="width: 521px" align="right">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 521px" align="right"><strong>Rating&nbsp; </strong></td>
                <td>
                    <asp:DropDownList ID="ddlRating" runat="server" Style="background-color: #666666">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 521px" align="right">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 521px" align="right"><strong>Cover&nbsp; </strong></td>
                <td>
                    <asp:FileUpload ID="fileupMovieCover" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="width: 521px" align="right">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 521px">&nbsp;</td>
                <td>
                    <asp:Button ID="btnAddMovie" runat="server" OnClick="btnAddMovie_Click" Text="ADD MOVIE" Style="background-color: #B03939" BorderColor="#8F1A1A" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                </td>
            </tr>
            <tr>
                <td style="width: 521px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">__________________________________________________________________________________________________________________________________________________________________</td>
            </tr>
            <tr>
                <td style="width: 521px; height: 20px;">&nbsp;</td>
                <td style="height: 20px">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 521px; height: 20px;" align="right"><strong>Movie ID&nbsp; </strong></td>
                <td style="height: 20px">
                    <asp:TextBox ID="txtMovieId" runat="server" Style="background-color: #333333"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 521px; height: 20px;" align="right">&nbsp;</td>
                <td style="height: 20px">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 521px; height: 20px;">&nbsp;</td>
                <td style="height: 20px">
                    <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="UPDATE" Style="background-color: #B03939" BorderColor="#8F1A1A" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                    <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="DELETE" Style="background-color: #B03939" BorderColor="#8F1A1A" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                </td>
            </tr>
            <tr>
                <td style="width: 521px; height: 20px;">&nbsp;</td>
                <td style="height: 20px">&nbsp;</td>
            </tr>
            <tr>
                <td style="height: 20px;" colspan="2">__________________________________________________________________________________________________________________________________________________________________</td>
            </tr>
            <tr>
                <td style="width: 521px; height: 20px;">&nbsp;</td>
                <td style="height: 20px">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 521px; height: 20px;">&nbsp;</td>
                <td style="height: 20px">
                    <asp:Button ID="btnExportToExcel_Click" runat="server" OnClick="btnExportToExcel_Click_Click" Text="EXPORT TO EXCEL" Style="background-color: #B03939" BorderColor="#8F1A1A" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                    <asp:Button ID="btnExportToWord_Click" runat="server" OnClick="btnExportToWord_Click_Click" Text="EXPORT TO WORD" Style="background-color: #B03939" BorderColor="#8F1A1A" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                    <asp:Button ID="btnExportToPdf_Click" runat="server" OnClick="btnExportToPdf_Click_Click" Text="EXPORT TO PDF" Style="background-color: #B03939" BorderColor="#8F1A1A" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                </td>
            </tr>
            <tr>
                <td style="width: 521px; height: 20px;">&nbsp;</td>
                <td style="height: 20px">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 521px; height: 20px;">&nbsp;</td>
                <td style="height: 20px">
                    <asp:Button ID="btnDisplayAllMovies" runat="server" Text="DISPLAY ALL MOVIES" OnClick="btnDisplayAllMovies_Click" Style="background-color: #B03939" BorderColor="#8F1A1A" BorderStyle="Solid"    Font-Names="sans-serif" Font-Size="13px" />
                </td>
            </tr>
            <tr>
                <td style="width: 521px; height: 20px;">&nbsp;</td>
                <td style="height: 20px">&nbsp;</td>
            </tr>
            <tr>
                <td style="height: 20px;" colspan="2">

                    <!--this colorlesss gridview is for export buttons-->
                    <asp:GridView ID="moviesGv" runat="server">
                    </asp:GridView>

                </td>
            </tr>
            <tr>
                <td style="height: 20px;" colspan="2">

                    <asp:GridView ID="moviesGvV2" runat="server" CssClass="table table-boarded" AutoGenerateColumns="false" BackColor="#333333" BorderColor="Black" ForeColor="White">
                        <Columns>

                            <asp:TemplateField ItemStyle-HorizontalAlign="Center"
                                HeaderText="ID">
                                <ItemTemplate>
                                    <asp:LinkButton ID="gvLinkButton" runat="server"
                                        OnClick="gvAdminLinkButton_Click"
                                        CommandArgument='<%# Bind("movieId") %>'
                                        Text='<%# Eval("movieId")  %>'></asp:LinkButton>

                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="movieName" HeaderText="Title" />
                            <asp:TemplateField HeaderText="Cover">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Height="300px" Width="200px"
                                        ImageUrl='<%#"data:Image/jpg;base64," + Convert.ToBase64String((byte[])Eval("movieImage")) %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="movieDescription" HeaderText="Description" />
                            <asp:BoundField DataField="genre" HeaderText="Genre" />
                            <asp:BoundField DataField="language" HeaderText="Language" />
                            <asp:BoundField DataField="movieRelease" HeaderText="Movie Year" />
                            <asp:BoundField DataField="movieStatus" HeaderText="Status" />
                            <asp:BoundField DataField="rating" HeaderText="Rating" />

                        </Columns>
                        <HeaderStyle BackColor="#8F1A1A" />
                        <RowStyle BackColor="#333333" />
                    </asp:GridView>




                </td>
            </tr>
            <tr>
                <td style="width: 521px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 521px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 521px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>

        <!--DataTables implementation-->
        <script type="text/javascript">
            $(document).ready(function () {
                $('#<%=moviesGvV2.ClientID%>').DataTable();
            });
        </script>
        <!--DataTables implementation-->

    </p>
    <p>
    </p>
</asp:Content>
