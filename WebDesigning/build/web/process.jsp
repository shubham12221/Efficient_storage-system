<%-- 
    Document   : process
    Created on : 13 Jan, 2020, 12:21:19 PM
    Author     : Rakesh
--%>

<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="java.util.zip.GZIPOutputStream"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.MajorProject.jsp.compress" %>
<%@page import="com.MajorProject.jsp.Decompression" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
          String upload=request.getParameter("press");
          out.println("u"+upload);
          String string=request.getParameter("viewpage");
          out.println(string);
        if(upload!=null&&upload.equals("Upload"))
        {
           session.setAttribute("usernames", session.getAttribute("username"));
            RequestDispatcher dispatcher = request.getRequestDispatcher("/newupload.html");
            dispatcher.forward( request, response );
        }
//        else if(str!=null&&str.equals("compress"))
//        {
//            compress c=new compress();
//            c.doCompress(upload);
//        }
//        else if(str!=null&&str.equals("decompress"))
//        {
//            Decompression c=new Decompression();
//            c.dodecompress(upload);
//        }
        else if(string!=null&&string.equals("view"))
        {
//            response.sendRedirect("table.jsp");
            
            request.setAttribute("usernames", session.getAttribute("username"));
            RequestDispatcher dispatcher = request.getRequestDispatcher("/table.jsp");
            dispatcher.forward( request, response );
        }
//        
//        String upload=request.getParameter("upload");
//          out.print(upload);
//          //starting changes
//          String rt=request.getContentType();
//          out.println(rt);
//          out.print(rt.indexOf("multipart/form-data"));
//           String str=request.getParameter("press");
//        out.print(str);

        %>
        
    </body>
</html>

