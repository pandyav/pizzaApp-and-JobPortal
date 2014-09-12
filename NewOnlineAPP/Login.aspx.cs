using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LoginButton_Click(object sender, EventArgs e)
    {
        SqlConnection cont = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
        SqlCommand comm = new SqlCommand(@"Select UserName from LoginTable where UserName=@UserName and PassWord=@PassWord", cont);

        comm.Parameters.AddWithValue("@UserName", UserNameTextBox.Text);
        comm.Parameters.AddWithValue("@PassWord", PassTextbox.Text);

        cont.Open();

        
        if (String.IsNullOrEmpty(Convert.ToString(comm.ExecuteScalar())))
        {
            IncorrectLabel.Text = "Incorrect Username or Password!";
        }
        else
            Response.Redirect("~/Default.aspx?username="+UserNameTextBox.Text);
        
        

    }
    protected void RegisterLinkButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("RegistrationPage.aspx");
    }
    protected void ForgotpassLinkButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("ForgotPass.aspx");
    }
}