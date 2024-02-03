<%@ Page Title="User Account Manager" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="userAcctMgr.aspx.cs" Inherits="movies.Admin.userAcctMgr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <br />
            <br />  
                         <br />

    <div>
        <table border="2">
            <tr>
                <td colspan="5" style="text-align: left">
                    Admin can create a new user regardless if user has registered or not</td>
            </tr>
            <tr>
                <td colspan="5" align="center">
                    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>User
                </td>
                <td align="center" class="style4">
                    <asp:TextBox ID="txtUser" runat="server" style="background-color: #333333"></asp:TextBox>
                </td>
                <td align="center" class="style4" style="width: 42px">Role
                </td>
                <td align="center" class="style4" style="width: 61px">
                    <asp:TextBox ID="txtRole" runat="server" TabIndex="4" style="background-color: #333333"></asp:TextBox>
                </td>
                <td style="width: 177px">
                    <asp:Button ID="btnLinkUserRole" runat="server" OnClick="btnLinkUserRole_Click" Text="Link User Role"
                        Width="124px" Style="margin-left: 0px; background-color: #B03939;" TabIndex="5" />
                </td>
            </tr>
            <tr>
                <td>Password
                </td>
                <td style="text-align: center">
                    <asp:TextBox ID="txtPassword" runat="server" TabIndex="1" style="background-color: #333333"></asp:TextBox>
                </td>
                <td></td>
                <td></td>
                <td style="width: 177px">
                    <asp:Button ID="btnUnLinkUserToRole" runat="server" OnClick="btnUnLinkUserToRole_Click"
                        Text="UnlinkUsertoRole" Width="124px" TabIndex="6" style="background-color: #B03939;" />
                </td>
            </tr>
            <tr>
                <td class="style3" style="width: 68px">Email</td>
                <td align="center" class="style4">
                    <asp:TextBox ID="txtEmail" runat="server" TabIndex="2" style="background-color: #333333"></asp:TextBox>
                </td>
                <td align="center" class="style4" style="width: 42px">&nbsp;</td>
                <td align="center">&nbsp;</td>
                <td>
                    <asp:Button ID="btnShowAllUser" runat="server" OnClick="btnShowAllUser_Click" Text="Show All Users"
                        Width="124px" TabIndex="7" style="background-color: #B03939;" />
                </td>
            </tr>
            <tr>
                <td class="style3" style="width: 68px">&nbsp;
                </td>
                <td align="center" class="style4">
                    <asp:Button ID="btnCheckFileNo" runat="server" OnClick="btnCheckFileNo_Click" Text="Check File No" style="background-color: #B03939;" />
                    <asp:Button ID="btnCheckUserRole" runat="server" OnClick="btnCheckUserRole_Click" Text="Check  Role" style="background-color: #B03939;" />
                </td>
                <td align="center" class="style4" style="width: 42px">&nbsp;</td>
                <td align="center">
                    <asp:Button ID="btnCreateRole0" runat="server" OnClick="btnCreateRole_Click"
                        Text="Create Role" Width="98px" TabIndex="10" style="background-color: #B03939;" />
                </td>
                <td>
                    <asp:Button ID="btnShowAllRoles" runat="server" OnClick="btnShowAllRoles_Click"
                        Text="Show All Roles" Width="124px" TabIndex="8" style="background-color: #B03939;" />
                </td>
            </tr>
            <tr>
                <td class="style3">&nbsp;
                </td>
                <td align="center" class="style4">
                    <asp:Button ID="btnCreateUser0" runat="server" OnClick="btnCreateUser_Click" Style="margin-left: 0px; background-color: #B03939;"
                        Text="Create User" TabIndex="3" />
                    <asp:Button ID="btnDeleteUser0" runat="server" OnClick="btnDeleteUser_Click" Text="Delete User" Width="105px" style="background-color: #B03939;" />
                </td>
                <td align="center" class="style4" style="width: 42px"></td>
                <td align="center">

                    <asp:Button ID="btnDeleteRole1" runat="server" OnClick="btnDeleteRole_Click" Text="Delete Role" TabIndex="11" style="background-color: #B03939;" />
                </td>
                <td style="width: 177px">
                    <asp:Button ID="btnUpdateUser" runat="server" OnClick="btnUpdateUser_Click" Text="Update User" Width="125px" TabIndex="9" style="background-color: #B03939;" />
                </td>
            </tr>
        </table>
    </div>
    <div class="myContent">
        <br />
       <asp:ChangePassword
           ID="ChangePassword1"
           DisplayUserName="true"
           runat="server" >
           <CancelButtonStyle BackColor="#B03939" />
           <ChangePasswordButtonStyle BackColor="#B03939" />
           <TextBoxStyle BackColor="#333333" />
        </asp:ChangePassword>
    </div>
    <div class="myContent">
        <p>
            &nbsp;</p>
        <p>
            &nbsp;
            <br />
            <asp:Label ID="lblOutput" runat="server"></asp:Label>
            <br />
        </p>
        <asp:CreateUserWizard
            ID="CreateUserWizard1"
            runat="server" OnCreatedUser="CreateUserWizard1_CreatedUser">
            <CreateUserButtonStyle BackColor="#B03939" />
            <WizardSteps>
                <asp:CreateUserWizardStep runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td align="center" colspan="2">Sign Up for Your New Account</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server" style="background-color: #333333"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required."
                                        ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" style="background-color: #333333"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required."
                                        ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" style="background-color: #333333"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required."
                                        ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Email" runat="server" style="background-color: #333333"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Question" runat="server" style="background-color: #333333"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" ErrorMessage="Security question is required."
                                        ToolTip="Security question is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Answer" runat="server" style="background-color: #333333"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="Security answer is required."
                                        ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic"
                                        ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color: Red;">
                                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td align="center" colspan="2" style="height: 19px">Complete</td>
                            </tr>
                            <tr>
                                <td>Your account has been successfully created.</td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">
                                    <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue" Text="Continue"
                                        ValidationGroup="CreateUserWizard1" />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:CompleteWizardStep>
            </WizardSteps>
            <FinishCompleteButtonStyle BackColor="#B03939" />
        </asp:CreateUserWizard>
    </div>


</asp:Content>
