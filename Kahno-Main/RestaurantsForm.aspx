<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RestaurantsForm.aspx.cs" Inherits="Kahno_Main.RestaurantsForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        body{
        background: linear-gradient( rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2) ), url('Assets/14.jpg');
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="header">     
         
</div>


<div class="floatingdiv">    
    <h1>Restaurants</h1> 
    
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RestaurantID" DataSourceID="RestaurantList" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="310px">
           <Columns>
               <asp:BoundField DataField="RestaurantID" HeaderText="RestaurantID" InsertVisible="False" ReadOnly="True" SortExpression="RestaurantID" Visible="False" />
               <asp:BoundField DataField="RestaurantName" SortExpression="RestaurantName" >
               <HeaderStyle Width="10%" />
               <ItemStyle Width="40%" />
               </asp:BoundField>
               <asp:TemplateField ShowHeader="False">
                   <ItemTemplate>
                        <asp:Button class="addbutton" ID="lnkSelect" Text="Select Restaurant" runat="server" CommandArgument='<%# Eval("RestaurantID") %>' OnClick="lnkSelect_Click"/>
                    </ItemTemplate>
               </asp:TemplateField>
           </Columns>
       </asp:GridView>
       <asp:SqlDataSource ID="RestaurantList" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\KahnoDB.mdf;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [RestaurantID], [RestaurantName] FROM [RESTAURANT]"></asp:SqlDataSource>
    </p>
</div>

</asp:Content>
