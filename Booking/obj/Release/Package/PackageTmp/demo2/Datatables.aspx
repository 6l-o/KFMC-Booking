<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Datatables.aspx.cs" Inherits="movies.DataTablesDemo.Datatables" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <head runat="server">
    <title></title>
                <script src="../Scripts/WebForms/jquery.dataTables.min.js"></script>
            <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
            <link href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css" rel="stylesheet"/>
    
            <script>
                    $(document).ready( function () {
                     $('#gvTicketData').DataTable();
                     } );
            </script>
</head>

</asp:Content>
