<%@ Page Title="Order Pizza Online" Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeFile="OrderPage.aspx.cs" Inherits="OrderPage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style6
        {
            width: 223px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="Panel1" runat="server" BorderStyle="Double" Height="550px" 
    HorizontalAlign="Left" ScrollBars="Vertical">
     
    <h2>
        Place Order Online</h2>
    <h3>
        Personal Information</h3>
    <table id="tbl1" class="tbl1">
        <tr>
            <td class="style6">
                <asp:Label ID="DateLabel" runat="server" Text="Date/Time  of Order"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="DateTextBox" runat="server" ReadOnly="True" Width="159px" 
                    Height="19px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style6">
                <asp:Label ID="NameLabel" runat="server" Text="Last Name, First Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="LastNameTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="LastNameRequiredFieldValidator" runat="server" ErrorMessage="Last Name Required"
                    Text="*" ControlToValidate="LastNameTextBox" ForeColor="Red" SetFocusOnError="True" ></asp:RequiredFieldValidator>
                <asp:TextBox ID="FirstNameTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="FirstNameRequiredFieldValidator" runat="server" ErrorMessage="First Name Required"
                    Text="*" ControlToValidate="FirstNameTextBox" ForeColor="Red" Display="Dynamic"
                    SetFocusOnError="True" ></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                <asp:Label ID="AddressLabel" runat="server" Text="Street Address"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="AddressTextBox" runat="server" Width="250px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="AddressRequiredFieldValidator" runat="server" ErrorMessage="Address Required"
                    ForeColor="Red" Text="*" ControlToValidate="AddressTextBox" ></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                <asp:Label ID="CityStateZipLabel" runat="server" Text="City, State, Zipcode"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="CityTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="CityRequiredFieldValidator" runat="server" ErrorMessage="City Required"
                    Text="*" ControlToValidate="CityTextBox" ForeColor="Red" ></asp:RequiredFieldValidator>
                <asp:DropDownList ID="StateDropDownList" runat="server">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="StateRequiredFieldValidator" runat="server" ErrorMessage="State Required"
                    Text="*" ControlToValidate="StateDropDownList" ForeColor="Red" InitialValue="--Select--" ></asp:RequiredFieldValidator>
                <asp:TextBox ID="ZipTextBox" runat="server" Width="100px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ZipRequiredFieldValidator" runat="server" ErrorMessage="Zipcode Required"
                    Text="*" ControlToValidate="ZipTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="ZipRegularExpressionValidator" runat="server"
                    ControlToValidate="ZipTextBox" Display="Dynamic" ErrorMessage="Zipcode incorrect(e.g 08330)"
                    ForeColor="Red" ValidationExpression="^\d{5}(-\d{4})?$">! (e.g 08330)</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                <asp:Label ID="PhoneLabel" runat="server" Text="Contact Phone"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="PhoneTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PhoneRequiredFieldValidator" runat="server" ErrorMessage="Phone Number Required"
                    Text="*" ControlToValidate="PhoneTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="PhoneRegularExpressionValidator" runat="server"
                    ControlToValidate="PhoneTextBox" Display="Dynamic" ErrorMessage="Phone Incorrect"
                    ForeColor="Red" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">! (e.g 609-484-8484)</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                <asp:Label ID="EmailLabel" runat="server" Text="Email Address"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="EmailTextBox" runat="server" Width="250"></asp:TextBox>
                <asp:RequiredFieldValidator ID="EmailRequiredFieldValidator" runat="server" ErrorMessage="Email Required"
                    Text="*" ControlToValidate="EmailTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="EmailRegularExpressionValidator" runat="server"
                    ErrorMessage="Incorrect Email (e.g example@yahoo.com)" ControlToValidate="EmailTextBox"
                    Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">! (e.g example@yahoo.com)</asp:RegularExpressionValidator>
            </td>
        </tr>
    </table>
    <h3>
        Order Information</h3>
        <asp:Label ID="Pizza1Label" runat="server" Text="Pizza 1"></asp:Label>
    <table class="style1">
        <tr>
            <td>
                <strong>Choose Your Size:&nbsp;&nbsp;
            </strong>
                <asp:RequiredFieldValidator ID="SizeRequiredFieldValidator" runat="server" 
                    ControlToValidate="RadioButtonListSize1" ErrorMessage="Choose Your Pizza Size" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
                <strong>&nbsp;</strong><asp:RadioButtonList ID="RadioButtonListSize1" runat="server" 
                    RepeatDirection="Horizontal" style="text-align: left">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                <strong>Choose Your Toppings:</strong>
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatDirection="Horizontal">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td>
                <strong>Choose Pizza Type: 
                </strong>
                <asp:RequiredFieldValidator ID="TypeRequiredFieldValidator" runat="server" 
                    ControlToValidate="RadioButtonListType1" ErrorMessage="Choose Your Pizza Type" 
                    ForeColor="Red"></asp:RequiredFieldValidator>
                <strong>&nbsp;</strong><asp:RadioButtonList ID="RadioButtonListType1" runat="server" 
                    RepeatDirection="Horizontal">
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
        <asp:CheckBox ID="CheckBoxAddMore" runat="server" Text="Add More" 
            style="color: #0000FF" />
            <br />
        <asp:Panel ID="Panel2" runat="server">
        
    <asp:Label ID="Pizza2Label" runat="server" Text="Pizza 2"></asp:Label>
    <table class="style1">
        <tr>
            <td>
                <strong>Choose Your Size:
            </strong><asp:RadioButtonList ID="RadioButtonListSize2" runat="server" 
                    RepeatDirection="Horizontal" style="text-align: left">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                <strong>Choose Your Toppings:</strong>
                <asp:CheckBoxList ID="CheckBoxList2" runat="server" RepeatDirection="Horizontal">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td>
                <strong>Choose Pizza Type: 
                </strong>
                <asp:RadioButtonList ID="RadioButtonListType2" runat="server" 
                    RepeatDirection="Horizontal">
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    </asp:Panel>
        <asp:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="server" 
            TargetControlID="Panel2" CollapseControlID="CheckBoxAddMore" 
            ExpandControlID="CheckBoxAddMore" Collapsed="True">
        </asp:CollapsiblePanelExtender>
        <br />
        <asp:Button ID="ContinueButton" runat="server" Text="Continue" 
            CausesValidation="true" onclick="ContinueButton_Click" />
    </asp:Panel>
</asp:Content>
