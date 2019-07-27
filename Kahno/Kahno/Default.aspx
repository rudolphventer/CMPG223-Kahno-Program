<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Kahno._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="userID" DataSourceID="MainDataSource">
                <Columns>
                    <asp:BoundField DataField="userID" HeaderText="userID" InsertVisible="False" ReadOnly="True" SortExpression="userID" />
                    <asp:BoundField DataField="customerName" HeaderText="customerName" SortExpression="customerName" />
                    <asp:BoundField DataField="phoneNum" HeaderText="phoneNum" SortExpression="phoneNum" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="physicalAddress" HeaderText="physicalAddress" SortExpression="physicalAddress" />
                    <asp:BoundField DataField="areaName" HeaderText="areaName" SortExpression="areaName" />
                    <asp:BoundField DataField="nameUsername" HeaderText="nameUsername" SortExpression="nameUsername" />
                    <asp:BoundField DataField="passwordHash" HeaderText="passwordHash" SortExpression="passwordHash" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="DBSource" runat="server"></asp:SqlDataSource>
            <asp:Image ID="Image1" runat="server" />
            <asp:SqlDataSource ID="MainDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:kahnoDatabaseAccessConnectionString %>" ProviderName="<%$ ConnectionStrings:kahnoDatabaseAccessConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [customers]" OnSelecting="MainDataSource_Selecting"></asp:SqlDataSource>
        </p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
