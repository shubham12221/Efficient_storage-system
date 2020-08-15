<%-- 
    Document   : newupload
    Created on : 22 Jan, 2020, 10:02:53 AM
    Author     : Rakesh
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.nio.channels.FileChannel"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.io.File"%>
<%@ page import="java.sql.*"%>
<%@page import="com.MajorProject.jsp.compress"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page import="com.oreilly.servlet.MultipartRequest" %>  
        <%  
            String filePath=request.getParameter("fname");
            
            String filepathsplit[]=filePath.split("\\\\");
            String filename=filepathsplit[filepathsplit.length-1];
            
            String username=(String)(session.getAttribute("username"));
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspproject","root","");
            Statement st=conn.createStatement();
            Path path=Paths.get(filePath);
            

            //for getting file size
            FileChannel fileChannel = FileChannel.open(path);
            long fileSize = fileChannel.size();
            out.print("successfully uploaded"+request+filePath+" "+fileSize);  
            fileChannel.close();
                      
            
            //getting current time of uploading file
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
            LocalDateTime now = LocalDateTime.now();  
            
            out.print(("insert into `"+username+"` values"+"( '"+filename+"', "+fileSize+" , '"+now+"')"));
            //inserting file information to user's table
            int u=st.executeUpdate("insert into `"+username+"` values"+"( '"+filename+"', "+fileSize+" , '"+now+"')");
            
            
            //for compressing the given file and store it to specified place
            compress c=new compress();
            c.doCompress(filePath,username);
        %> 
    </body>
</html>
