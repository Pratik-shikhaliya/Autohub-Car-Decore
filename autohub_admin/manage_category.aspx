﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="manage_category.aspx.cs" Inherits="manage_category" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <section class="all_section">
     <h1 style="text-align:center;">Manage Category</h1>
   <center> <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" DataKeyNames="cat_id" DataSourceID="SqlDataSource1"  Width="726px" BackColor="#CCCCCC" >
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="cat_id" HeaderText="Category Id" InsertVisible="False" ReadOnly="True" SortExpression="cat_id" />
            <asp:BoundField DataField="cat_name" HeaderText="Category Name" SortExpression="cat_name" />
        </Columns>
    </asp:GridView></center>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:autohubConnectionString %>" SelectCommand="SELECT cat_id, cat_name FROM tbl_category" UpdateCommand="update tbl_category set cat_name=@cat_name where cat_id=@cat_id;" DeleteCommand="delete from tbl_category where cat_id=@cat_id;">
        <DeleteParameters>
            <asp:Parameter Name="cat_id" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="cat_name" />
            <asp:Parameter Name="cat_id" />
        </UpdateParameters>
</asp:SqlDataSource>
    <br />
    </section>
    </asp:Content>
