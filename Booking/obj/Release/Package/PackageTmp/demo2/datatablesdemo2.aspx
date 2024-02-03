<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datatablesdemo2.aspx.cs" Inherits="movies.DataTablesDemo.datatablesdemo2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script  type="text/javascript" src="/Scripts/clientSide.js"></script>
                <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
            <script src="https://cdn.datatables.net/1.10.25/js/dataTables.bootstrap.min.js"></script>
            <link href="https://cdn.datatables.net/1.10.25/css/dataTables.bootstrap.min.css" rel="stylesheet"/>
            <%--<script src="../Scripts/WebForms/jquery.dataTables.min.js"></script>--%>
            <script>
                    $(document).ready( function () {
                        $('#gvTicketDataAdmin').DataTable({
                            columns: [
                                { 'data': '' },

                            ]
                            

                        });
                    });
            </script>



</head>
<body>
    <form id="form1" runat="server">
        <div>
                            <br />
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
                            <br />
                            asdasdasd<br />
                            <asp:GridView ID="gvTicketDataAdmin" runat="server" AutoGenerateColumns="false" BackColor="#333333" BorderColor="Black" ForeColor="White">
                        <Columns>
                            <asp:BoundField DataField="customerTicketId" HeaderText="Ticket Number" />
                            <asp:BoundField DataField="UserName" HeaderText="Account Name" />
                            <asp:BoundField DataField="customerFullName" HeaderText="Name Under Ticket" />
                            <asp:BoundField DataField="movieName" HeaderText="Movie Title" />
                            <asp:BoundField DataField="ticket" HeaderText="Ticket Type" />
                            <asp:BoundField DataField="cinema" HeaderText="Cinema" />
                            <asp:BoundField DataField="movieInCinemaDate" HeaderText="Showing Date" />
                            <asp:BoundField DataField="movieInCinemaPrice" HeaderText="Ticket Price" />
                            <asp:BoundField DataField="totalTicketsPrice" HeaderText="Total Tickets Price" />

                        </Columns>
                                <HeaderStyle BackColor="#9E4B77" />
                    </asp:GridView>
        </div>
    </form>
</body>
</html>
