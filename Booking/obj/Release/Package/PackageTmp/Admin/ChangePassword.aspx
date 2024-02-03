<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <div class="myContent">
        &nbsp;<asp:ChangePassword
            ID="ChangePassword1"
            DisplayUserName="true"
            runat="server">
            <CancelButtonStyle BackColor="#B03939" />
            <ChangePasswordButtonStyle BackColor="#B03939" />
            <TextBoxStyle BackColor="#333333" />
        </asp:ChangePassword>
    </div>


</asp:Content>

