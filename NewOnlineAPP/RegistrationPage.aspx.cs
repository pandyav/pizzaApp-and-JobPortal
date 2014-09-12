using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class RegistrationPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void RegisterButton_Click(object sender, EventArgs e)
    {
        SqlConnection cont = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);

        SqlCommand comm = new SqlCommand(@"Insert Into LoginTable (UserName, PassWord,Email, CellPhone) VALUES (@UserName, @PassWord, @Email, @CellPhone)",cont);
        comm.CommandType = CommandType.Text;
        comm.Parameters.AddWithValue("@UserName", UserNameText.Text);
        comm.Parameters.AddWithValue("@PassWord", PasswordTextBox.Text);
        comm.Parameters.AddWithValue("@Email", EmailTextBox.Text);
        comm.Parameters.AddWithValue("@CellPhone", PhoneTextBox.Text);
        cont.Open();

        comm.ExecuteNonQuery();

        Response.Redirect("~/Default.aspx?username=" + UserNameText.Text);

    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
}