package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.mysql.jdbc.Statement;
import com.mysql.jdbc.Connection;
import java.util.zip.GZIPOutputStream;
import java.io.*;
import com.oreilly.servlet.MultipartRequest;
import com.MajorProject.jsp.compress;
import com.MajorProject.jsp.Decompression;

public final class process_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
 
          String upload=request.getParameter("Upload");
          out.println("u"+upload);
          String string=request.getParameter("viewpage");
          out.println(string);
//        if(upload.equals("Upload"))
//        {
//            out.print("enter valid file name");
//        }
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
        if(string.equals("view"))
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

        
      out.write("\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
