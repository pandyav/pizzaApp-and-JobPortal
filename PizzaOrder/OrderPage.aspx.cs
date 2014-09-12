using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class OrderPage : System.Web.UI.Page
{
    bool check;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DateTextBox.Text = DateTime.Now.ToString();
            InitStates();
            InitRadioSize();
            InitCheck();
            InitRadioType();
           // Page.Validate("FieldReq");

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
    private void InitRadioSize()
    {
        RadioButtonListSize1.Items.Add("Small");
        RadioButtonListSize1.Items.Add("Medium");
        RadioButtonListSize1.Items.Add("Large");

        RadioButtonListSize2.Items.Add("Small");
        RadioButtonListSize2.Items.Add("Medium");
        RadioButtonListSize2.Items.Add("Large");
    }
    private void InitCheck()
    {
        CheckBoxList1.Items.Add("Pepperoni");
        CheckBoxList1.Items.Add("Sausage");
        CheckBoxList1.Items.Add("Jalepeno");
        CheckBoxList1.Items.Add("Onion");
        CheckBoxList1.Items.Add("Black Olives");
        CheckBoxList1.Items.Add("Extra Cheese");

        CheckBoxList2.Items.Add("Pepperoni");
        CheckBoxList2.Items.Add("Sausage");
        CheckBoxList2.Items.Add("Jalepeno");
        CheckBoxList2.Items.Add("Onion");
        CheckBoxList2.Items.Add("Black Olives");
        CheckBoxList2.Items.Add("Extra Cheese");
    }
    private void InitRadioType()
    {
        RadioButtonListType1.Items.Add("Pan");
        RadioButtonListType1.Items.Add("Hand-Toss");
        RadioButtonListType1.Items.Add("Thin-Crust");

        RadioButtonListType2.Items.Add("Pan");
        RadioButtonListType2.Items.Add("Hand-Toss");
        RadioButtonListType2.Items.Add("Thin-Crust");

    }





    public void ContinueButton_Click(object sender, EventArgs e)
    {
        List<String> lit1=new List<String>();

        foreach(ListItem itm in CheckBoxList1.Items)
        {
            if(itm.Selected)
            {
                lit1.Add(itm.Value);
            }
        }

        Session["lit2"] = lit1;

        if (CheckBoxAddMore.Checked == true)
        {
            check = true;
            Session["test"] = check;
           
            List<String> lit3 = new List<String>();

            foreach (ListItem itm in CheckBoxList2.Items)
            {
                if (itm.Selected)
                {
                    lit3.Add(itm.Value);
                }
            }


            Session["siz"] = RadioButtonListSize2.SelectedItem.Text;
            Session["Typ"] = RadioButtonListType2.SelectedItem.Text;
            Session["top2"] = lit3;
        }
        else
        {
            check = false;
            Session["test"] = check;
        }



        Response.Redirect("~/SummaryPage.aspx?name=" + FirstNameTextBox.Text + " " +
            LastNameTextBox.Text + "&address=" + AddressTextBox.Text + "&CityStateZip=" + CityTextBox.Text + " , "
            + StateDropDownList.SelectedItem.Text + " " + ZipTextBox.Text + "&phone=" + PhoneTextBox.Text + "&email=" 
            + EmailTextBox.Text+"&size="+RadioButtonListSize1.SelectedItem.Text+"&type="+RadioButtonListType1.SelectedItem.Text);
    }
    
}