<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SummaryPage.aspx.cs" Inherits="SummaryPage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   


    <style type="text/css">
        .style5
        {
            width: 122px;
        }
    </style>
   


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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

    <h2>Review Your Order</h2>
    
    <div id="txtarea" runat="server">
       

        <table style="width: 100%;">
            <tr>
                <td class="style5">
        <asp:Label ID="LabelName" runat="server" ></asp:Label>&nbsp;
                </td>
            </tr>
            <tr>
                <td class="style5">
        <asp:Label ID="LabelAddress" runat="server"></asp:Label>&nbsp;
                </td>
            </tr>
            <tr>
                <td class="style5">
        <asp:Label ID="LabelCityStateZip" runat="server" ></asp:Label>&nbsp;
                </td>
            </tr>
            <tr>
                <td class="style5">
        <asp:Label ID="LabelPhone" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style5">
        <asp:Label ID="LabelEmail" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style5">
        <asp:Label ID="LabelSize" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style5">
        <asp:Label ID="LabelToppings" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style5">
        <asp:Label ID="LabelType" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    <asp:Label ID="LabelPizza2" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td class="style5">
         <asp:Label ID="LabelSize2" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style5">
        <asp:Label ID="LabelToppings2" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style5">
        <asp:Label ID="LabelType2" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    
    &nbsp;<asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <asp:Image ID="Image1" ImageUrl="Images/waiting.gif" runat="server" />
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:ModalPopupExtender ID="ModalPop" runat="server" TargetControlID="UpdateProgress1" PopupControlID="UpdateProgress1" BackgroundCssClass="modalBackground">
    </asp:ModalPopupExtender>

   
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <input type="button" value="Back" 
    onclick="window.history.back(); return true;"/>
            <asp:Button ID="ButtonPlace" runat="server" onclick="ButtonPlace_Click" 
                OnClientClick="if(!confirm('Place Your Order?')) return false;" 
                Text="Place Order" />
        </ContentTemplate>
    </asp:UpdatePanel>
    
    

</asp:Content>

