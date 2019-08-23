<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RestaurantsForm.aspx.cs" Inherits="Kahno_Main.RestaurantsForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            border-style: none;
            border-color: inherit;
            border-width: medium;
/*background-color: #4CAF50; /* Green */background-image: url('SpurLogo.jpg');
            color: white;
            padding: 100px 100px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            z-index: 1;
            left: 296px;
            top: 333px;
            position: absolute;
            width: 192px;
            height: 195px;
            -webkit-transition-duration: 0.4s; /* Safari */;
            transition-duration: 0.4s;
            text-decoration: none;
            overflow: hidden;
            cursor: pointer;
        }
        .auto-style2 {
            border-style: none;
            border-color: inherit;
            border-width: medium;
/*background-color: #4CAF50; /* Green */background-image: url('kfc.jpg');
            color: white;
            padding: 100px 100px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            z-index: 1;
            left: 17px;
            top: 330px;
            position: absolute;
            width: 192px;
            height: 195px;
            -webkit-transition-duration: 0.4s; /* Safari */;
            transition-duration: 0.4s;
            text-decoration: none;
            overflow: hidden;
            cursor: pointer;
        }
        .auto-style3 {
            border-style: none;
            border-color: inherit;
            border-width: medium;
/*background-color: #4CAF50; /* Green */background-image: url('bk.jpg');
            color: white;
            padding: 100px 100px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            z-index: 1;
            left: 563px;
            top: 341px;
            position: absolute;
            width: 192px;
            height: 195px;
            -webkit-transition-duration: 0.4s; /* Safari */;
            transition-duration: 0.4s;
            text-decoration: none;
            overflow: hidden;
            cursor: pointer;
        }
        .auto-style4 {
            border-style: none;
            border-color: inherit;
            border-width: medium;
/*background-color: #4CAF50; /* Green */background-image: url('macdonalds.jpg');
            color: white;
            padding: 100px 100px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            z-index: 1;
            left: 823px;
            top: 347px;
            position: absolute;
            width: 192px;
            height: 195px;
            -webkit-transition-duration: 0.4s; /* Safari */;
            transition-duration: 0.4s;
            text-decoration: none;
            overflow: hidden;
            cursor: pointer;
            right: 512px;
        }
        .auto-style5 {
            border-style: none;
            border-color: inherit;
            border-width: medium;
/*background-color: #4CAF50; /* Green */background-image: url('nandos.jpg');
            color: white;
            padding: 100px 100px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            z-index: 1;
            left: 1085px;
            top: 352px;
            position: absolute;
            width: 192px;
            height: 195px;
            -webkit-transition-duration: 0.4s; /* Safari */;
            transition-duration: 0.4s;
            text-decoration: none;
            overflow: hidden;
            cursor: pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="header">     
   <h1>Restaurants</h1>       
</div>


<div class="card">             
   <p>
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="RestaurantID" DataSourceID="RestaurantList" GridLines="None">
           <Columns>
               <asp:BoundField DataField="RestaurantID" HeaderText="RestaurantID" InsertVisible="False" ReadOnly="True" SortExpression="RestaurantID" Visible="False" />
               <asp:BoundField DataField="RestaurantName" SortExpression="RestaurantName" >
               <HeaderStyle Width="10%" />
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
