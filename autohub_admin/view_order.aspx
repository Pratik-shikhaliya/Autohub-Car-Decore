<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="view_order.aspx.cs" Inherits="view_order" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <section class="all_section">
    <%
        SqlConnection con = new SqlConnection("Data Source=PRATIK-PC\\SQLEXPRESS; initial Catalog=db_autohub;Integrated Security=True");
            SqlCommand cmd= new SqlCommand("select * from tbl_order", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();              
        %>
     <h1 style="text-align:center;">View Order</h1>
    <center><table style="color:black; width:700px; height:auto;" border="1">
                            <tr style="height:80px; text-align:center;">
                                
                                <th>Order Id</th>                                
                                <th>Amount</th>
                                <th>Date</th>                                                    
                                <th>Order Detail</th>                                
                            </tr> 
        <%while(dr.Read()) { %>                                             
                            <tr style="height:80px; text-align:center;">                               
                                <td><%Response.Write(dr["o_id"]); %></td>                                                       
                                <td><%Response.Write(dr["o_amount"]); %></td>
                                <td><%Response.Write(((DateTime)dr["o_date"]).ToString("dd-MM-yyyy")); %></td>                                          
								<td><a href="order_detail.aspx?order_id=<%Response.Write(dr["o_id"].ToString()); %>" style="color:blueviolet;">-->Order Detail</a></td>
							</tr>	
        <%} %>																             						                       
                    </table></center>
    </section>
    </asp:Content>

