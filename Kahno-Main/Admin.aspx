<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Kahno_Main.Admin" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body{
        background: linear-gradient( rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2) ), url('Assets/1.jpg');
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="floatingdiv" style="width: 80%; left: 10%; display:none;">

        
        <table style="width: 100%;">
            <tr>
                <td>
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>

        </div>
    <div class="floatingdiv3">
        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
        </div>
    <div class="floatingdiv3"></div>
    <div class="floatingdiv3">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Expr1" HeaderText="Expr1" ReadOnly="True" SortExpression="Expr1" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KahnoDBConnectionString %>" SelectCommand="SELECT AVG(CUSTOMERFEEDBACK.UserFeedbackScore) AS Expr1 FROM CUSTOMERFEEDBACK INNER JOIN [ORDER] ON CUSTOMERFEEDBACK.OrderID = [ORDER].OrderNumber WHERE ([ORDER].restaurantID = @RID)">
            <SelectParameters>
                <asp:Parameter Name="RID" />
            </SelectParameters>
        </asp:SqlDataSource>
        </div>
</asp:Content>
