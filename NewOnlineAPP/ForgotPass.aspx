<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPass.aspx.cs" Inherits="ForgotPass" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Your Password?</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 154px;
        }
    </style>
</head>
<body>
<h3>Forgot your password? </h3>
    <h3>Just enter your cellphone number that you used to register and we will text you your password</h3>
    <form id="form1" runat="server">
    <div>

    
        <table class="style1">
            <tr>
                <td class="style2">
                    Cellphone Number</td>
                <td>
                    <asp:TextBox ID="ForgotTextBox" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Button ID="SendPassButton" runat="server" Text="Send Password" 
                        onclick="SendPassButton_Click" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>

    
    </div>
    </form>
</body>
</html>
