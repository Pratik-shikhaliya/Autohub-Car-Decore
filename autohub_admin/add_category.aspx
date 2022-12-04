<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="add_category.aspx.cs" Inherits="add_category" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <section class="all_section">
    <div class="table">
        <center>
        <asp:Panel ID="Panel1" runat="server" class="panel1">
            <h2>Category</h2><br />
            <br />
            Category Name<br /><br />
            <asp:TextBox ID="txtname" runat="server" Height="25px" Width="720px" AutoCompleteType="Disabled"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnsubmit" class="button" runat="server" Text="Submit" OnClick="btnsubmit_Click"/>
        </asp:Panel>
            </center>
    </div>
    </section>
</asp:Content>

