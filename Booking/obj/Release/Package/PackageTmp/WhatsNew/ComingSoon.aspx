<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ComingSoon.aspx.cs" Inherits="movies.WhatsNew.ComingSoon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div id="TitleContent" style="text-align: center">
        <a runat="server" href="~/">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/moviesLogo55.png" alt="logo" BorderStyle="None" />
        </a>
        <br />
        <br />
        <span style="font-size: xx-large"><span style="font-weight: bold">Coming Soon</span></span><br />
    </div>


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
                                 ImageUrl='<%#"data:Image/jpg;base64," + Convert.ToBase64String((byte[])Eval("movieImage")) %>' />

                            <%--<img src='<%#"data:Image/jpg;base64," + Convert.ToBase64String((byte[])Eval("movieImage")) %>'--%>

                                </itemtemplate>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <hd1><b style = "font-size: large; font-style: normal"><%#Eval("movieName") %></hd1>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><%#Eval("movieDescription") %></p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>Genre: <%#Eval("genre") %></p>
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



    <%--        <asp:ListView ID="moviesLv" runat="server">
            <ItemTemplate>
                <div class="list">
                    <table>
                        <tr><td>
                            <ItemTemplate>

                               <asp:Image ID="Image2" runat="server" Height="300px" Width="200px"
                                 ImageUrl='<%#"data:Image/jpg;base64," + Convert.ToBase64String((byte[])Eval("movieImage")) %>' />

                            <%--<img src='<%#"data:Image/jpg;base64," + Convert.ToBase64String((byte[])Eval("movieImage")) %>'--%>

                                </ItemTemplate>
                            </td></tr>

                        <tr>
                            <td>
                                <hd1><%#Eval("movieName") %></hd1>
                            </td>
                        </tr>
    <tr>
        <td>
            <p><%#Eval("movieDescription") %></p>
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
