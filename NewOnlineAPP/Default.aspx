<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Online Job Application</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript"></script>
    <script type="text/javascript">
        function validateForm() {
            Page_ClientValidate();

            if (Page_IsValid) {
                return true;

            }
            else
                return false;
        };                
 
    </script>
</head>
<body>
    <h2  id="titlehead" class="titlehead">
        Job Application</h2>
    <hr width="800px" />
    <form id="form1" runat="server" class="form">
    <asp:Label ID="WelcomeLabel" runat="server" ></asp:Label>
    <asp:LinkButton ID="LogoutLinkButton" runat="server" 
        onclick="LogoutLinkButton_Click">Logout</asp:LinkButton>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <script type="text/javascript">
        //
        var get = Sys.WebForms.PageRequestManager.getInstance();
        get.add_beginRequest(BeginRequestHandler);

        function BeginRequestHandler(sender, args) {
            var popup = $find('<%= ModalPop.ClientID %>');
            if (popup != null) {
                popup.show();
            }
        }
       
    </script>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RegConnectionString %>"
        DeleteCommand="DELETE FROM [Applicant_Info] WHERE [ApplicantID] = @ApplicantID"
        InsertCommand="INSERT INTO [Applicant_Info] ([AppDate], [LastName], [FirstName], [MI], [StreetAddress], [City], [State], [Zipcode], [PhoneNumber], [Email], [CollegeName], [CollegeCity], [CollegeState], [CollegeZip], [Degree], [EmployerName], [EmployerCity], [EmployerState], [EmployerZip], [JobTitle], [StartDate], [EndDate]) VALUES (@AppDate, @LastName, @FirstName, @MI, @StreetAddress, @City, @State, @Zipcode, @PhoneNumber, @Email, @CollegeName, @CollegeCity, @CollegeState, @CollegeZip, @Degree, @EmployerName, @EmployerCity, @EmployerState, @EmployerZip, @JobTitle, @StartDate, @EndDate)"
        SelectCommand="SELECT * FROM [Applicant_Info]" UpdateCommand="UPDATE [Applicant_Info] SET [AppDate] = @AppDate, [LastName] = @LastName, [FirstName] = @FirstName, [MI] = @MI, [StreetAddress] = @StreetAddress, [City] = @City, [State] = @State, [Zipcode] = @Zipcode, [PhoneNumber] = @PhoneNumber, [Email] = @Email, [CollegeName] = @CollegeName, [CollegeCity] = @CollegeCity, [CollegeState] = @CollegeState, [CollegeZip] = @CollegeZip, [Degree] = @Degree, [EmployerName] = @EmployerName, [EmployerCity] = @EmployerCity, [EmployerState] = @EmployerState, [EmployerZip] = @EmployerZip, [JobTitle] = @JobTitle, [StartDate] = @StartDate, [EndDate] = @EndDate WHERE [ApplicantID] = @ApplicantID">
        <DeleteParameters>
            <asp:Parameter Name="ApplicantID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Date" Name="AppDate" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="MI" Type="String" />
            <asp:Parameter Name="StreetAddress" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="Zipcode" Type="String" />
            <asp:Parameter Name="PhoneNumber" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="CollegeName" Type="String" />
            <asp:Parameter Name="CollegeCity" Type="String" />
            <asp:Parameter Name="CollegeState" Type="String" />
            <asp:Parameter Name="CollegeZip" Type="String" />
            <asp:Parameter Name="Degree" Type="String" />
            <asp:Parameter Name="EmployerName" Type="String" />
            <asp:Parameter Name="EmployerCity" Type="String" />
            <asp:Parameter Name="EmployerState" Type="String" />
            <asp:Parameter Name="EmployerZip" Type="String" />
            <asp:Parameter Name="JobTitle" Type="String" />
            <asp:Parameter DbType="Date" Name="StartDate" />
            <asp:Parameter DbType="Date" Name="EndDate" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="AppDate" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="MI" Type="String" />
            <asp:Parameter Name="StreetAddress" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="Zipcode" Type="String" />
            <asp:Parameter Name="PhoneNumber" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="CollegeName" Type="String" />
            <asp:Parameter Name="CollegeCity" Type="String" />
            <asp:Parameter Name="CollegeState" Type="String" />
            <asp:Parameter Name="CollegeZip" Type="String" />
            <asp:Parameter Name="Degree" Type="String" />
            <asp:Parameter Name="EmployerName" Type="String" />
            <asp:Parameter Name="EmployerCity" Type="String" />
            <asp:Parameter Name="EmployerState" Type="String" />
            <asp:Parameter Name="EmployerZip" Type="String" />
            <asp:Parameter Name="JobTitle" Type="String" />
            <asp:Parameter DbType="Date" Name="StartDate" />
            <asp:Parameter DbType="Date" Name="EndDate" />
            <asp:Parameter Name="ApplicantID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Names="Bell MT"
        Font-Strikeout="False" ForeColor="Red" HeaderText="oops....." CssClass="validsum"/>
    <h4>
        *Required Fields</h4>
    <h3>
        Personal Information</h3>
    <table id="tbl1" class="tbl1">
        <tr>
            <td width="190">
                <asp:Label ID="DateLabel" runat="server" Text="Date of Application"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="DateTextBox" runat="server" ReadOnly="True" Width="100px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="190">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td width="190">
                <asp:Label ID="NameLabel" runat="server" Text="Last Name, First Name, MI"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="LastNameTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="LastNameRequiredFieldValidator" runat="server" ErrorMessage="Last Name Required"
                    Text="*" ControlToValidate="LastNameTextBox" ForeColor="Red" 
                    SetFocusOnError="True" ValidationGroup="fieldreq"></asp:RequiredFieldValidator>
                <asp:TextBox ID="FirstNameTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="FirstNameRequiredFieldValidator" runat="server" ErrorMessage="First Name Required"
                    Text="*" ControlToValidate="FirstNameTextBox" ForeColor="Red" Display="Dynamic"
                    SetFocusOnError="True" ValidationGroup="fieldreq"></asp:RequiredFieldValidator>
                <asp:TextBox ID="MITextBox" runat="server" Width="50px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="AddressLabel" runat="server" Text="Street Address"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="AddressTextBox" runat="server" Width="250px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="AddressRequiredFieldValidator" runat="server" ErrorMessage="Address Required"
                    ForeColor="Red" Text="*" ControlToValidate="AddressTextBox" 
                    ValidationGroup="fieldreq"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="CityStateZipLabel" runat="server" Text="City, State, Zipcode"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="CityTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="CityRequiredFieldValidator" runat="server" ErrorMessage="City Required"
                    Text="*" ControlToValidate="CityTextBox" ForeColor="Red" 
                    ValidationGroup="fieldreq"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="StateDropDownList" runat="server">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="StateRequiredFieldValidator" runat="server" ErrorMessage="State Required"
                    Text="*" ControlToValidate="StateDropDownList" ForeColor="Red" 
                    InitialValue="--Select--" ValidationGroup="fieldreq"></asp:RequiredFieldValidator>
                <asp:TextBox ID="ZipTextBox" runat="server" Width="100px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ZipRequiredFieldValidator" runat="server" ErrorMessage="Zipcode Required"
                    Text="*" ControlToValidate="ZipTextBox" ForeColor="Red" 
                    ValidationGroup="fieldreq"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="ZipRegularExpressionValidator" runat="server"
                    ControlToValidate="ZipTextBox" Display="Dynamic" ErrorMessage="Zipcode incorrect(e.g 08330)"
                    ForeColor="Red" ValidationExpression="^\d{5}(-\d{4})?$">! (e.g 08330)</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="PhoneLabel" runat="server" Text="Contact Phone"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="PhoneTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PhoneRequiredFieldValidator" runat="server" ErrorMessage="Phone Number Required"
                    Text="*" ControlToValidate="PhoneTextBox" ForeColor="Red" 
                    ValidationGroup="fieldreq"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="PhoneRegularExpressionValidator" runat="server"
                    ControlToValidate="PhoneTextBox" Display="Dynamic" ErrorMessage="Phone Incorrect"
                    ForeColor="Red" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">! (e.g 609-484-8484)</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="EmailLabel" runat="server" Text="Email Address"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="EmailTextBox" runat="server" Width="250"></asp:TextBox>
                <asp:RequiredFieldValidator ID="EmailRequiredFieldValidator" runat="server" ErrorMessage="Email Required"
                    Text="*" ControlToValidate="EmailTextBox" ForeColor="Red" 
                    ValidationGroup="fieldreq"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="EmailRegularExpressionValidator" runat="server"
                    ErrorMessage="Incorrect Email (e.g example@yahoo.com)" ControlToValidate="EmailTextBox"
                    Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">! (e.g example@yahoo.com)</asp:RegularExpressionValidator>
            </td>
        </tr>
    </table><br />
    <h3>
        Education Information</h3>
    <table class="tbl1">
        <tr>
            <td width="190">
                <asp:Label ID="CollegeLabel" runat="server" Text="College Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="CollegeTextBox" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="CollegeCityStateZipLabel" runat="server" Text="City, State, Zipcode"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="CollegeCityTextBox" runat="server"></asp:TextBox>
                <asp:DropDownList ID="CollegeStateDropDownList" runat="server">
                </asp:DropDownList>
                <asp:TextBox ID="CollegeZipTextBox" runat="server" Width="100px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="CollegeZipRegularExpressionValidator" runat="server"
                    ControlToValidate="CollegeZipTextBox" Display="Dynamic" ErrorMessage="College Zipcode incorrect(e.g 08330)"
                    ForeColor="Red" ValidationExpression="^\d{5}(-\d{4})?$">!</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="DegreeLabel" runat="server" Text="Degree"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="DegreeTextBox" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
    </table><br />
    <h3>
        Work Experience</h3>
    <table class="tbl1">
        <tr>
            <td width="190">
                <asp:Label ID="EmployerNameLabel" runat="server" Text="Employer Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="EmployerNameTextBox" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="EmployerCityStateLabel" runat="server" Text="City, State, Zipcode"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="EmployerCityTextBox" runat="server"></asp:TextBox>
                <asp:DropDownList ID="EmployerStateDropDownList" runat="server">
                </asp:DropDownList>
                <asp:TextBox ID="EmployerZipTextBox" runat="server" Width="100px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="EmployerZipRegularExpressionValidator" runat="server"
                    ControlToValidate="EmployerZipTextBox" Display="Dynamic" ErrorMessage="Employer Zipcode incorrect(e.g 08330)"
                    ForeColor="Red" ValidationExpression="^\d{5}(-\d{4})?$">!</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="JobTitleLabel" runat="server" Text="Job Title"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="JobTitleText" runat="server" Width="208px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="StartEndDateLabel" runat="server" Text="Start Date, End Date"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="StartDateTextBox" runat="server" Width="100px"></asp:TextBox>
                <asp:CompareValidator ID="StartDateCompareValidator" runat="server" ErrorMessage="Incorrect Start Date(e.g m/d/yyyy)"
                    ControlToValidate="StartDateTextBox" ForeColor="Red" Display="Dynamic" Text="!"
                    Operator="DataTypeCheck" Type="Date">!</asp:CompareValidator>
                <asp:TextBox ID="EndDateTextBox" runat="server" Width="100px"></asp:TextBox>
                <asp:CompareValidator ID="EndDateCompareValidator" runat="server" ErrorMessage="Incorrect End Date(e.g m/d/yyyy)"
                    ControlToValidate="EndDateTextBox" ForeColor="Red" Display="Dynamic" Text="!"
                    Operator="DataTypeCheck" Type="Date">!</asp:CompareValidator>
                <asp:CalendarExtender ID="StartDateCalendarExtender" runat="server" TargetControlID="StartDateTextBox">
                </asp:CalendarExtender>
                <asp:CalendarExtender ID="EndDateCalendarExtender" runat="server" TargetControlID="EndDateTextBox">
                </asp:CalendarExtender>
            </td>
        </tr>
    </table>
    <hr  width="800px"/>
    <br />
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <asp:Image ID="Image1" ImageUrl="~/waiting.gif" runat="server" />
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:ModalPopupExtender ID="ModalPop" runat="server" TargetControlID="UpdateProgress1"
        PopupControlID="UpdateProgress1" BackgroundCssClass="modalBackground">
    </asp:ModalPopupExtender>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Button ID="SubmitButton" runat="server" Text="Submit Application" OnClientClick="if(validateForm()) {if(!confirm('Do you really want to submit?')) return false;} else return false;"
                OnClick="SubmitButton_Click" CausesValidation="true"  CssClass="button1"/>    
            <asp:Button ID="ResetButton" runat="server" Text="Reset" OnClientClick="this.form.reset();return false;" CssClass="button2"/>
        </ContentTemplate>
    </asp:UpdatePanel>

    </form>
</body>
</html>
