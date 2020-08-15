package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class process1_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
 
        
        String login=request.getParameter("signin");
        out.print(login+" "+(login.equals("signin")));
        if(login.equals("signin"))
        {
            String username=request.getParameter("name");
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
                    response.sendRedirect("./index.html");
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
            response.sendRedirect("./login.html");
        }
        
        
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
