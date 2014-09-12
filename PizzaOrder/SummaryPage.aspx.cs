using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Xml;

public partial class SummaryPage : System.Web.UI.Page
{
    string name, address, CityStateZip, phone, email, size, type, topps, size2, type2, topps2;
    bool check;

    List<String> lit2;
    List<String> lit3;

    protected void Page_Load(object sender, EventArgs e)
    {
        lit2 = (List<String>)Session["lit2"];
        check=Convert.ToBoolean(Session["test"]);
        if (check == true)
        {
            lit3 = (List<String>)Session["top2"];

            size2 = (string)(Session["siz"]);
            type2 = (string)(Session["typ"]);
            for (int i = 0; i < lit3.Count; i++)
            {
                topps2 += lit3[i].ToString() + " ";

            }
        }





        name = Request.QueryString["name"];
        address = Request.QueryString["address"];
        CityStateZip = Request.QueryString["CityStateZip"];
        phone = Request.QueryString["phone"];
        email = Request.QueryString["email"];
        size = Request.QueryString["size"];
        type = Request.QueryString["type"];
        for (int i = 0; i < lit2.Count; i++)
        {
            topps += lit2[i].ToString() + " ";

        }
        if (!IsPostBack)
        {
            LabelName.Text = name;
            LabelAddress.Text = address;
            LabelCityStateZip.Text = CityStateZip;
            LabelPhone.Text = phone;
            LabelEmail.Text = email;

            LabelSize.Text = "Pizza Size: " + size;
            LabelToppings.Text = "Pizza Toppings: ";
            LabelType.Text = "Pizza Type: " + type;

            if (lit2.Count.Equals(0))
                LabelToppings.Text += "[NONE]";
            else
            {

                for (int i = 0; i < lit2.Count; i++)
                {
                    LabelToppings.Text += lit2[i].ToString() + "|";
                }
            }

            if (check == true)
            {
                LabelPizza2.Text = "Pizza 2";



                LabelSize2.Text = "Pizza Size: " + size2;
                LabelToppings2.Text = "Pizza Toppings: ";
                LabelType2.Text = "Pizza Type: " + type2;

                if (lit3.Count.Equals(0))
                    LabelToppings2.Text += "[NONE]";
                else
                {

                    for (int i = 0; i < lit3.Count; i++)
                    {
                        LabelToppings2.Text += lit3[i].ToString() + "|";
                    }
                }
            }


        }


    }
    protected void ButtonPlace_Click(object sender, EventArgs e)
    {
        
            XmlDocument doc = new XmlDocument();

            doc.Load(Server.MapPath("Orders.xml"));

            XmlElement Customers = doc.CreateElement("Customers");

            XmlElement Customer = doc.CreateElement("Customer");

            XmlElement datetime = doc.CreateElement("DateTime");

            XmlText datetext = doc.CreateTextNode(DateTime.Now.ToString());

            XmlElement nameElement = doc.CreateElement("Name");

            XmlText nametext = doc.CreateTextNode(name);

            XmlElement addressElement = doc.CreateElement("Address");

            XmlText addtext = doc.CreateTextNode(address);

            XmlElement phoneElement = doc.CreateElement("Phone");

            XmlText phonetext = doc.CreateTextNode(phone);

            XmlElement emailElement = doc.CreateElement("Email");

            XmlText emailtext = doc.CreateTextNode(email);

            XmlElement sizeElement = doc.CreateElement("Size");

            XmlText sizetext = doc.CreateTextNode(size);

            XmlElement typeElement = doc.CreateElement("Type");

            XmlText typeText = doc.CreateTextNode(type);

            XmlElement topElement = doc.CreateElement("Toppings");

            XmlText topptext = doc.CreateTextNode(topps);

            
            

            datetime.AppendChild(datetext);
            nameElement.AppendChild(nametext);
            addressElement.AppendChild(addtext);
            phoneElement.AppendChild(phonetext);
            emailElement.AppendChild(emailtext);
            sizeElement.AppendChild(sizetext);
            topElement.AppendChild(topptext);
            typeElement.AppendChild(typeText);
       
           

            Customer.AppendChild(datetime);
            Customer.AppendChild(nameElement);
            Customer.AppendChild(addressElement);
            Customer.AppendChild(phoneElement);
            Customer.AppendChild(emailElement);
            Customer.AppendChild(sizeElement);
            Customer.AppendChild(topElement);
            Customer.AppendChild(typeElement);

            if (check == true)
            {
                XmlElement size2Element = doc.CreateElement("Pizza2Size");

                XmlText size2text = doc.CreateTextNode(size2);

                XmlElement type2Element = doc.CreateElement("Pizza2Type");

                XmlText type2Text = doc.CreateTextNode(type2);

                XmlElement top2Element = doc.CreateElement("Pizza2Toppings");

                XmlText topp2text = doc.CreateTextNode(topps2);

                size2Element.AppendChild(size2text);
                top2Element.AppendChild(topp2text);
                type2Element.AppendChild(type2Text);

                Customer.AppendChild(size2Element);
                Customer.AppendChild(top2Element);
                Customer.AppendChild(type2Element);
            }

         

            doc.DocumentElement.AppendChild(Customer);


            doc.Save(Server.MapPath("Orders.xml"));

            System.Threading.Thread.Sleep(3000);

            Response.Redirect("Done.aspx?name=" + name);



    }
   
}