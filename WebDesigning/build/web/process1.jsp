<%-- 
    Document   : process1
    Created on : 14 Jan, 2020, 12:41:45 AM
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
        
        String login=request.getParameter("signin");
        out.println(login);
        String username="";
        if(login.equals("signin"))
        {
            username=request.getParameter("name");
            String pass=request.getParameter("password"); 
            out.print(username+" "+pass);
            try
            {
                out.print("hello");
                Class.forName("com.mysql.jdbc.Driver");
                out.print(("select * from login where username='"+username+"' and password='"+pass+"'"));
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspproject","root","");
                out.print("hello");
                Statement st=conn.createStatement();
                out.print("hello");
                ResultSet rs=st.executeQuery("select * from login where name='"+username+"' and password='"+pass+"'");
                out.print("hello");
                if(rs.next())
                {
                    //it creates session to store value of username so it can be furthur used by process.jsp file for fetching data from curresponding file
                   session.setAttribute("username", username);
                   RequestDispatcher dispatcher = request.getRequestDispatcher("/index.html");
                   dispatcher.forward( request, response );
                }
                else
                {
                    response.sendRedirect("./login.html");
                }
            }
            catch(Exception e)
            {
                out.print("\nsome exception has occured !!!!! "+e);
            }
//            if(str.equals("rakesh")&&pass.equals("System"))
//            {
//                response.sendRedirect("./index.html");
//            }
//            else
//            {
//                out.print("invalid username/password");
//            }
        }
        else if(login.equals("register"))
        {
            response.sendRedirect("./register.html");
        }
        
        %>
    </body>
</html>
