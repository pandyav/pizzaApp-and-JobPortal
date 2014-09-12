using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Twilio;
using System.Data.SqlClient;
using System.Configuration;

public partial class ForgotPass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SendPassButton_Click(object sender, EventArgs e)
    {

        string MyNum = "16093850962";
        string AcctID = "ACfe8686a211342fd1e55bb6654995c77f";
        string AuthTok = "197a4597c18dff5f22208f12151e2d64";

        TwilioRestClient clnt = new TwilioRestClient(AcctID, AuthTok); 

       clnt.SendSmsMessage(MyNum, ForgotTextBox.Text, "Yo What up");

        SqlConnection cont = new SqlConnection(ConfigurationManager.ConnectionStrings["RegConnectionString"].ConnectionString);
        SqlCommand comm = new SqlCommand(@"Select Password from LoginTable where CellPhone=@CellPhone", cont);



        comm.Parameters.AddWithValue("@CellPhone", ForgotTextBox.Text);
        

        cont.Open();

        SqlDataReader DR = comm.ExecuteReader();
        //Response.Write(DR["Password"].ToString());


    }
}