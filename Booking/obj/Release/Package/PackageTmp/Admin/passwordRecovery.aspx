<%@ Page Title="Password Recovery" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="passwordRecovery.aspx.cs" Inherits="movies.Admin.passwordRecovery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <br />
            <br />  
                         <br />
        <div class="myContent">

    <asp:PasswordRecovery ID="PasswordRecovery1" runat="server">
            
             <MailDefinition From="aalhussein63@gmail.com" Subject="Forgetton Password" Priority="High" >
                 
                </MailDefinition>
            
                <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                <SuccessTextStyle Font-Bold="True" ForeColor="#5D7B9D" />
                <TextBoxStyle Font-Size=Medium />
                <UserNameTemplate>
                    <span style="text-align:center">
                    <font face="Verdana">
                    <h3>Forgot Password </h3>
                    UserName:
                        <asp:TextBox ID="UserName" runat="server" 
                        Width="236px" style="background-color: #333333"></asp:TextBox>&nbsp;

                        
                        <asp:Button ID="SubmitButton" runat="server" 
                        Text="SEND" CommandName="Submit" Style="background-color: #B03939" BorderColor="#8F1A1A" BorderStyle="Solid" Font-Bold="True" Font-Names="sans-serif" Font-Size="13px" /><br />
                    <span  style="color: #FF0000">
                    <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                    </span>
                    </font> 
                    </span>                    
                </UserNameTemplate>
                <QuestionTemplate>
                <h2>Forgot Password</h2>
                Hello <asp:Literal ID="UserName" runat="server"></asp:Literal><br />
                Please answer your password question : <br />
                <asp:Literal ID="Question" runat="server"></asp:Literal>
                <asp:TextBox ID="Answer" runat="server"></asp:TextBox><br />
                 <asp:Button ID="SubmitButton" runat="server" Text="Send Answer By Mail" 
CommandName="Submit"/><br />
                  <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                </QuestionTemplate>
                <SuccessTemplate>
                Your password has been sent to your email addres
                <asp:Label ID="EmailLabel" runat="server"></asp:Label>
                </SuccessTemplate>
                <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" 
                    ForeColor="White" />
                <SubmitButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" 
                    BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" 
                    ForeColor="#284775" />
        </asp:PasswordRecovery>

</div>
</asp:Content>


