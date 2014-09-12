<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
   
    </style>
    <script type="text/javascript">
        function Refresh() {
           __doPostBack('<%= TextBoxComments.ClientID %>', '');
        };
</script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
    <table class="style1">
        <tr>
            <td class="style9">
                <asp:Label ID="LabelDate" runat="server" Text="Date"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxDate" runat="server" Height="18px" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style9">
                <asp:Label ID="LabeName" runat="server" Text="Full Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxName" runat="server" Height="18px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="NameRequiredFieldValidator" runat="server" 
                    ErrorMessage="Write Your Name" Text="*" ControlToValidate="TextBoxName" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style8">
                <asp:Label ID="LabelEmail" runat="server" Text="Email"></asp:Label>
            </td>
            <td class="style5">
                <asp:TextBox ID="TextBoxEmail" runat="server" Height="18px" Width="250px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="EmailRequiredFieldValidator" runat="server" ErrorMessage="Email Required"
                    Text="*" ControlToValidate="TextBoxEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="EmailRegularExpressionValidator" runat="server"
                    ErrorMessage="Incorrect Email (e.g example@yahoo.com)" ControlToValidate="TextBoxEmail"
                    Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">(e.g example@yahoo.com)</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style9">
                <asp:Label ID="LabelComments" runat="server" Text="Comments"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxComments" runat="server" Height="178px" TextMode="MultiLine" 
                    Width="332px" ontextchanged="TextBoxComments_TextChanged" onkeyup="Refresh();" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="CommentRequiredFieldValidator" runat="server" 
                    ErrorMessage="Write Something!" Text="*" ControlToValidate="TextBoxComments" 
                    ForeColor="Red" Height="15px"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td>
              <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                <ContentTemplate>
                Characters:&nbsp <asp:Label ID="CharacterLabel" runat="server"></asp:Label>

                </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="TextBoxComments" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
    <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" 
        onclick="ButtonSubmit_Click" />
        <asp:Label ID="DoneLabel" runat="server" 
            style="font-size: x-large; font-weight: 700; color: #CC6600"></asp:Label>

    </ContentTemplate>
      
    </asp:UpdatePanel>
    
</asp:Content>

