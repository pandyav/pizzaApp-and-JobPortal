using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
 

public partial class _Default : System.Web.UI.Page
{    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DateTextBox.Text = DateTime.Now.ToShortDateString();
            InitStates();
            InitCollegeStates();
            InitEmploState();
            Page.Validate("fieldreq");

            string username = Request.QueryString["username"];
            WelcomeLabel.Text = "Welcome " + username;


        }

    }
    private void InitStates()
    {
        StateDropDownList.Items.Add("--Select--");
        StateDropDownList.Items.Add("AR");
        StateDropDownList.Items.Add("NY");
        StateDropDownList.Items.Add("NJ");
        StateDropDownList.Items.Add("MD");
        StateDropDownList.Items.Add("PA");
        StateDropDownList.Items.Add("FL");
        StateDropDownList.Items.Add("VA");
        StateDropDownList.Items.Add("MS");
    }
    private void InitCollegeStates()
    {
        CollegeStateDropDownList.Items.Add("--Select--");
        CollegeStateDropDownList.Items.Add("AR");
        CollegeStateDropDownList.Items.Add("NY");
        CollegeStateDropDownList.Items.Add("NJ");
        CollegeStateDropDownList.Items.Add("MD");
        CollegeStateDropDownList.Items.Add("PA");
        CollegeStateDropDownList.Items.Add("FL");
        CollegeStateDropDownList.Items.Add("VA");
        CollegeStateDropDownList.Items.Add("MS");
    }
    private void InitEmploState()
    {

        EmployerStateDropDownList.Items.Add("--Select--");
        EmployerStateDropDownList.Items.Add("AR");
        EmployerStateDropDownList.Items.Add("NY");
        EmployerStateDropDownList.Items.Add("NJ");
        EmployerStateDropDownList.Items.Add("MD");
        EmployerStateDropDownList.Items.Add("PA");
        EmployerStateDropDownList.Items.Add("FL");
        EmployerStateDropDownList.Items.Add("VA");
        EmployerStateDropDownList.Items.Add("MS");
    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(3000);

        SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
        SqlCommand comm = new SqlCommand(@"Insert Into Applicant_Info (AppDate, LastName, FirstName, MI, StreetAddress, City, State, 
        Zipcode, PhoneNumber, Email, CollegeName, CollegeCity, CollegeState, CollegeZip, Degree, EmployerName, EmployerCity, EmployerState, 
        EmployerZip, JobTitle, StartDate, EndDate) VALUES (@AppDate, @LastName, @Firstname, @MI, @StreetAddress, @City, @State, 
        @Zipcode, @PhoneNumber, @Email, @CollegeName, @CollegeCity, @CollegeState, @CollegeZip, @Degree, @EmployerName, @EmployerCity, @EmployerState, 
        @EmployerZip, @JobTitle, @StartDate, @EndDate)", scon);

        comm.CommandType = CommandType.Text;
        comm.Parameters.AddWithValue("@AppDate", DateTextBox.Text);
        comm.Parameters.AddWithValue("@LastName", LastNameTextBox.Text);
        comm.Parameters.AddWithValue("@FirstName", FirstNameTextBox.Text);
        comm.Parameters.AddWithValue("@MI", MITextBox.Text);
        comm.Parameters.AddWithValue("@StreetAddress", AddressTextBox.Text);
        comm.Parameters.AddWithValue("@City", CityTextBox.Text);
        comm.Parameters.AddWithValue("@State", StateDropDownList.SelectedItem.Text);
        comm.Parameters.AddWithValue("@Zipcode", ZipTextBox.Text);
        comm.Parameters.AddWithValue("@PhoneNumber", PhoneTextBox.Text);
        comm.Parameters.AddWithValue("@Email", EmailTextBox.Text);
        comm.Parameters.AddWithValue("@CollegeName", CollegeTextBox.Text);
        comm.Parameters.AddWithValue("@CollegeCity", CollegeCityTextBox.Text);

        if(CollegeStateDropDownList.SelectedItem.Text=="--Select--")
            comm.Parameters.AddWithValue("@CollegeState", DBNull.Value);
        else
            comm.Parameters.AddWithValue("@CollegeState", CollegeStateDropDownList.SelectedItem.Text);

        comm.Parameters.AddWithValue("@CollegeZip", CollegeZipTextBox.Text);
        comm.Parameters.AddWithValue("@Degree", DegreeTextBox.Text);
        comm.Parameters.AddWithValue("@EmployerName", EmployerNameTextBox.Text);
        comm.Parameters.AddWithValue("@EmployerCity", EmployerCityTextBox.Text);

        if(EmployerStateDropDownList.SelectedItem.Text=="--Select--")
            comm.Parameters.AddWithValue("@EmployerState", DBNull.Value);
        else
            comm.Parameters.AddWithValue("@EmployerState", EmployerStateDropDownList.SelectedItem.Text);

        comm.Parameters.AddWithValue("@EmployerZip", EmployerZipTextBox.Text);
        comm.Parameters.AddWithValue("@JobTitle", JobTitleText.Text);

        if(StartDateTextBox.Text=="")
            comm.Parameters.AddWithValue("@StartDate", DBNull.Value);
        else
            comm.Parameters.AddWithValue("@StartDate", StartDateTextBox.Text);
        if(EndDateTextBox.Text=="")
            comm.Parameters.AddWithValue("@EndDate", DBNull.Value);
        else
            comm.Parameters.AddWithValue("@EndDate", EndDateTextBox.Text);

        scon.Open();
        comm.ExecuteNonQuery();

        Response.Redirect("~/Confirmation.aspx?applicant=" + FirstNameTextBox.Text);

    }

    protected void LogoutLinkButton_Click(object sender, EventArgs e)
    {
        Request.Cookies.Clear();
        Response.Redirect("Welcom.aspx");
    }
}