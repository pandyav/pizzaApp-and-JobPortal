<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <script type="text/C#" runat="server">
    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod]

    public static AjaxControlToolkit.Slide[] GetSlides()
    {
        AjaxControlToolkit.Slide[] slides = new AjaxControlToolkit.Slide[3];

        slides[0] = new AjaxControlToolkit.Slide("Images/Pizza-Pizza-Food.jpg", "pizzaLine", "goodPizza");
        slides[1]=new AjaxControlToolkit.Slide("Images/pizza_due_pizza_hut.jpg", "pizza", "pizza");
        slides[2]=new AjaxControlToolkit.Slide("Images/Supreme_pizza.jpg", "pizza", "pizza");

        return (slides);       
    
    
    }   

    </script>
    <div id="slider" align="left">
    <asp:Image ID="Image1" runat="server" Height="450px" Width="900px" 
        BorderStyle="Dotted" />
    <asp:SlideShowExtender ID="SlideShowExtender1" runat="server" AutoPlay="true" 
        Loop="true" TargetControlID="Image1" SlideShowServiceMethod="GetSlides" 
        PlayInterval="3000">
    </asp:SlideShowExtender>
    </div>
</asp:Content>
