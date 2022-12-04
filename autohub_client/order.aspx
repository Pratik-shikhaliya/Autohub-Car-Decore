<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.master" AutoEventWireup="true" CodeFile="order.aspx.cs" Inherits="order" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <style>
        .order {
            padding-top: 150px;
            padding-bottom: 100px;
        }
        td, th {
            height:80px;
            text-align:center;           
        }
        td a{
            text-decoration: none;
            color: blue;
        }
    </style>
    <%
        SqlConnection con = new SqlConnection("Data Source=PRATIK-PC\\SQLEXPRESS; initial catalog=db_autohub;Integrated Security=True");
            SqlCommand cmd= new SqlCommand("select * from tbl_order where o_user_id='"+Session["userdata"]+"'", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();              
        %>
    <section class="order">
    <center>
        <h3 align="center">--------Order Detail--------</h3>
        <table style="color:black; width:700px; height:auto; margin-top: 50px;" border="1">
                            <tr>
                                
                                <th>Order Id</th>                                
                                <th>Amount</th>
                                <th>Date</th>                                                    
                                <th>Order Detail</th>                                
                            </tr> 
        <%while(dr.Read()) { %>                                             
                            <tr>                               
                                <td><%Response.Write(dr["o_id"]); %></td>                                                       
                                <td>&#8377;<%Response.Write(dr["o_amount"]); %></td>
                                <td><%Response.Write(((DateTime)dr["o_date"]).ToString("dd-MM-yyyy"));  %></td>                                          
								<td><a href="order_detail.aspx?order_id=<%Response.Write(dr["o_id"].ToString()); %>">-->Order Detail</a></td>
							</tr>	
        <%} %>																             						                       
                    </table></center>
    </section>
</asp:Content>

