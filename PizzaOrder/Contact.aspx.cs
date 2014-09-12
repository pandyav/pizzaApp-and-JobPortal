using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            TextBoxDate.Text = DateTime.Now.ToShortDateString();
        }

    }
    protected void TextBoxComments_TextChanged(object sender, EventArgs e)
    {
        string ch = TextBoxComments.Text;
        int count = 0;

        foreach (char g in ch)
        {
            count++;
        }
      CharacterLabel.Text = count.ToString();

    }
    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        XmlDocument doc = new XmlDocument();

        doc.Load(Server.MapPath("Messages.xml"));

        XmlElement Customers = doc.CreateElement("Customers");

        XmlElement Customer = doc.CreateElement("Customer");

        XmlElement datetime = doc.CreateElement("DateTime");

        XmlText datetext = doc.CreateTextNode(DateTime.Now.ToString());

        XmlElement nameE = doc.CreateElement("Name");

        XmlText nameT = doc.CreateTextNode(TextBoxName.Text);

        XmlElement EmailE = doc.CreateElement("Email");

        XmlText EmailT = doc.CreateTextNode(TextBoxEmail.Text);

        XmlElement CommentE = doc.CreateElement("Comments");

        XmlText CommentT = doc.CreateTextNode(TextBoxComments.Text);

        datetime.AppendChild(datetext);
        nameE.AppendChild(nameT);
        EmailE.AppendChild(EmailT);
        CommentE.AppendChild(CommentT);

        Customer.AppendChild(datetime);
        Customer.AppendChild(nameE);
        Customer.AppendChild(EmailE);
        Customer.AppendChild(CommentE);

        

        doc.DocumentElement.AppendChild(Customer);


        doc.Save(Server.MapPath("Messages.xml"));

        DoneLabel.Text = "Thank You For Your Comments!!";
    }
}