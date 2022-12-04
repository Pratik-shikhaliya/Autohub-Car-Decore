﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="view_feedback.aspx.cs" Inherits="view_feedback" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <section class="all_section">
    <h1 style="text-align:center;">View FeedBack</h1>
   <center> <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" BackColor="Silver" DataKeyNames="id" DataSourceID="SqlDataSource1" Width="500px">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
            <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
            <asp:BoundField DataField="subject" HeaderText="Subject" SortExpression="subject" />
            <asp:BoundField DataField="comment" HeaderText="Comment" SortExpression="comment" />
        </Columns>
    </asp:GridView></center>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:autohubConnectionString3 %>" SelectCommand="SELECT * FROM [tbl_feedback]" DeleteCommand="delete from tbl_feedback where id=@id;">
        <DeleteParameters>
            <asp:Parameter Name="id" />
        </DeleteParameters>
    </asp:SqlDataSource>
    </section>
</asp:Content>
