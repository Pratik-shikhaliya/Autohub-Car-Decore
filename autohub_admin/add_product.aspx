<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="add_product.aspx.cs" Inherits="add_product" %>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    
<style>
    h2 {
        padding: 20px;
    }
    p {
        padding: 5px;
    }
</style>
    <section style="margin-left: 350px; padding-top: 120px;">
       <h2> Add Product</h2>
    <p>
        Category</p>
    <p>
        <asp:DropDownList ID="DropDownList1" runat="server" Height="38px" Width="682px" DataSourceID="SqlDataSource1" DataTextField="cat_name" DataValueField="cat_id">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:autohubConnectionString5 %>" SelectCommand="SELECT * FROM [tbl_category]"></asp:SqlDataSource>
    </p>
    <p>
        &nbsp;Product Name</p>
    <p>
        <asp:TextBox ID="txtpname" runat="server" Width="682px"></asp:TextBox>
    </p>
    <p>
        &nbsp;Image</p>
    <p>
        <asp:FileUpload ID="FileUpload1" runat="server" Width="682px" />
    </p>
    <p>
        &nbsp;Product Price</p>
    <p>
        <asp:TextBox ID="txtprice" runat="server" Width="682px"></asp:TextBox>
    </p>
    <p>
        Product Description</p>
    <p>
        <asp:TextBox ID="txtdis" runat="server" TextMode="MultiLine" Width="682px"></asp:TextBox>
    </p>
    <p>
        Product Stock</p>
    <p>
        <asp:TextBox ID="txtstock" runat="server" Width="682px"></asp:TextBox>
    </p>
<p>
        <asp:Button ID="btnsubmit" class="button" runat="server" Text="Submit" OnClick="btnsubmit_Click" />
    </p>
<p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
        </section>
</asp:Content>

