<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegistrationPage.aspx.cs" Inherits="RegistrationPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 60%;
        }
        .style3
        {
            width: 362px;
        }
        .style4
        {
            width: 122px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
<h2>Please register if you want to apply or
    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
        onclick="LinkButton1_Click" style="font-size: large">Login</asp:LinkButton>
    </h2>
    <div>
        <table class="style1">
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
    <asp:Label ID="UserNameLabel" runat="server" Text="UserName"/>
                </td>
                <td class="style3">
    <asp:TextBox ID="UserNameText" runat="server" Width="130px" />
                    <asp:RequiredFieldValidator ID="UserNameRequiredFieldValidator" runat="server" 
                        ControlToValidate="UserNameText" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
        <asp:Label ID="PasswordLabel" runat="server" Text="Password"/>
                </td>
                <td class="style3">
    <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" Width="130px" />
                    <asp:RequiredFieldValidator ID="PasswordRequiredFieldValidator" runat="server" 
                        ControlToValidate="PasswordTextBox" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
        <asp:Label ID="RetypePassLabel" runat="server" Text="Retype Password"/>
                </td>
                <td class="style3">
    <asp:TextBox ID="RetypePassTextBox" runat="server" TextMode="Password" Width="130px" />
                    <asp:RequiredFieldValidator ID="RetypepassRequiredFieldValidator" 
                        runat="server" ControlToValidate="RetypePassTextBox" ErrorMessage="*" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="PassCompareValidator" runat="server" 
                        ControlToCompare="PasswordTextBox" ControlToValidate="RetypePassTextBox" 
                        ErrorMessage="Passwords don't match" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
        <asp:Label ID="EmailLabel" runat="server" Text="Email"/>
                </td>
                <td class="style3">
    <asp:TextBox ID="EmailTextBox" runat="server" Width="130px" />
                    <asp:RequiredFieldValidator ID="EmailRequiredFieldValidator" runat="server" 
                        ControlToValidate="EmailTextBox" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="EmailRegularExpressionValidator" 
                        runat="server" ControlToValidate="EmailTextBox" 
                        ErrorMessage="(e.g: eg@usa..com" ForeColor="Red" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
        <asp:Label ID="PhoneLabel" runat="server" Text="Cell Phone Number"/>
                </td>
                <td class="style3">
    <asp:TextBox ID="PhoneTextBox" runat="server" Width="130px" />
                    <asp:RequiredFieldValidator ID="CellRequiredFieldValidator" runat="server" 
                        ControlToValidate="PhoneTextBox" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
                    <asp:Button ID="RegisterButton" runat="server" Text="Register" 
                        onclick="RegisterButton_Click" />
                </td>
                <td class="style3">
                    &nbsp;</td>
            </tr>
        </table>
       
    </div>
    </form>
</body>
</html>
