<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    
    <style type="text/css">
        .style1
        {
            width: 441px;
        }
    </style>
    
</head>
<body style="width: 561px">

    <form id="form1" runat="server">
<h2>Login to Apply</h2>
    <div>
    
        <table class="style1">
            <tr>
                <td class="style4">
                    <asp:Label ID="UserNameLabel" runat="server" Text="Username"></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="UserNameTextBox" runat="server" style="margin-left: 0px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UserNameRequiredFieldValidator" runat="server" 
                        ErrorMessage="Please type a Username" ControlToValidate="UserNameTextBox" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    <asp:Label ID="PassWordLabel" runat="server" Text="Password"></asp:Label>
                </td>
                <td class="style2">
                    <asp:TextBox ID="PassTextbox" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="PassTextbox" ErrorMessage="Please type a Password" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    <asp:Button ID="LoginButton" runat="server" Text="Login" 
                        onclick="LoginButton_Click" />
                </td>
                <td class="style2">
                    <asp:LinkButton ID="RegisterLinkButton" runat="server" CausesValidation="False" 
                        onclick="RegisterLinkButton_Click">Register</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="style3" colspan="2">
                    <asp:LinkButton ID="ForgotpassLinkButton" runat="server" 
                        CausesValidation="False" onclick="ForgotpassLinkButton_Click">Forgot password?</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="style3" colspan="2">
                    <asp:Label ID="IncorrectLabel" runat="server" Text="" style="color: #FF0000"></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
