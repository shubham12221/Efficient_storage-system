<%-- 
    Document   : table
    Created on : 21 Jan, 2020, 6:51:35 PM
    Author     : Rakesh
--%>

<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" media="all" href="CSS/table.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form>
            <div class="outer" >
                <%
                    try
                    {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspproject","root","");
                        Statement st=conn.createStatement();
//                        ResultSet rs=st.executeQuery("select * from '"+request.getAttribute("temp")+"'");
//                        ResultSet rs=st.executeQuery("select * from 'sohel1234'");
                        //query to fetch client's detail
                        ResultSet rs=st.executeQuery("select * from `"+request.getAttribute("usernames")+"`");
                        //it is getting request.getAttribute("usernames") username from process.jsp file
                        boolean flag=false;
                 %>
                 <table border=1px>
                     <thead>
                         <th>
                             File Name
                         </th>
                         <th>
                             File size
                         </th>
                         <th>
                             Date of upload
                         </th>
                     </thead>
                     <%
                        while(rs.next())
                        {
                            flag=true;
                            %>
                            <tr>
                                <td>
                                    <%=rs.getString("fname")%>
                                </td>
                                <td>
                                    <%=(rs.getString("fsize")+" Bytes")%>
                                </td>
                                <td>
                                    <%=rs.getString("date")%>
                                </td>
                            </tr>
                             <%
                        }
                        if(!flag)
                        {
                         %>
                            <h2>Nothing to Display !!!<h2>
                          <%
                        }
                      %>
                    </table>
                    <%
                    }
                    catch(Exception e)
                    {
                        out.print("iughw"+e);
                    }
                %>
         </div>
        </form>
    </body>
</html>
