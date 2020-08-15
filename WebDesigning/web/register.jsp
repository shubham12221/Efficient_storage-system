<%-- 
    Document   : register
    Created on : 14 Jan, 2020, 4:20:47 PM
    Author     : Rakesh
--%>
<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
        
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String username=request.getParameter("username");
            String name=request.getParameter("name");
            String pass=request.getParameter("password"); 
            String email=request.getParameter("email"); 
            int mobile_no=Integer.parseInt(request.getParameter("mobile_no")); 
            String age=request.getParameter("age"); 
            
            //out.print("insert into login values(\""+username+"\" , \""+pass+"\" );");
            
            
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspproject","root","");
                Statement st=conn.createStatement();
                int u=st.executeUpdate("insert into login values(\""+username+"\",\""+pass+"\")");
                int v=st.executeUpdate("insert into registration values(\""+username+"\",\""+name+"\",\""+age+"\",\""+email+"\",\""+mobile_no+"\")");
                int z=st.executeUpdate("create table "+username+" ("+"fname varchar(100), fsize double,date varchar(40))");
                
                //JOptionPane.showMessageDialog(null,"You are registered successfully");
                //swal("good job" ,"you are registered successfully","success");
                response.sendRedirect("./login.html");
            }
            catch(SQLException e)
            {
                out.print("username exist please try later"+e);
            }
           %>
               
    </body>
</html>
