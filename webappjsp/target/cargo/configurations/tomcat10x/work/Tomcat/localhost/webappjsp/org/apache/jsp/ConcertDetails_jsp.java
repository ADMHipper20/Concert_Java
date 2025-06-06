/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.18
 * Generated at: 2025-05-29 12:57:58 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import java.net.URLEncoder;

public final class ConcertDetails_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports,
                 org.apache.jasper.runtime.JspSourceDirectives {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.net.URLEncoder");
  }

  private volatile jakarta.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public boolean getErrorOnELNotFound() {
    return false;
  }

  public jakarta.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final jakarta.servlet.http.HttpServletRequest request, final jakarta.servlet.http.HttpServletResponse response)
      throws java.io.IOException, jakarta.servlet.ServletException {

    if (!jakarta.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final jakarta.servlet.jsp.PageContext pageContext;
    jakarta.servlet.http.HttpSession session = null;
    final jakarta.servlet.ServletContext application;
    final jakarta.servlet.ServletConfig config;
    jakarta.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    jakarta.servlet.jsp.JspWriter _jspx_out = null;
    jakarta.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Concert Details</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/style.css\">\n");
      out.write("    <link rel=\"icon\" href=\"Images/Logo/CoNEX.svg\" type=\"image/svg+xml\">\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div class=\"bg fill bg-fill bg-loaded\">\n");
      out.write("        <video autoplay muted loop id=\"video-bg\">\n");
      out.write("            <source src=\"videos/Honkai Star Rail Serval Trailer -  The Cusp of Ignition!.mp4\" type=\"video/mp4\">\n");
      out.write("            Your browser does not support the video tag.\n");
      out.write("        </video>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"navbar-pg\">\n");
      out.write("        <div class=\"header\">\n");
      out.write("            <img src=\"Images/Logo/CoNEX.svg\" alt=\"CoNEX Logo\" class=\"logo\">\n");
      out.write("            <ul class=\"ul-header-list\">\n");
      out.write("                <li><a href=\"index.jsp\">Home</a></li>\n");
      out.write("                <li><a href=\"Concert.jsp\">Concert</a></li>\n");
      out.write("                <li><a href=\"News.jsp\">News</a></li>\n");
      out.write("                <li><a href=\"About-Us.jsp\">About Us</a></li>\n");
      out.write("                <li><a href=\"Order.jsp\" id=\"buy-now\">Buy one now!</a></li>\n");
      out.write("            </ul>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"content\">\n");
      out.write("        <div class=\"flex-content\">\n");
      out.write("            <h1 class=\"event-title\" style=\"font-family: 'Segoe UI', Geneva, Verdana, sans-serif;\">Concert Details</h1>\n");
      out.write("            \n");
      out.write("            <div class=\"concert-details-container\" style=\"color: white; text-align: left; max-width: 800px; margin: 20px auto; background: rgba(0, 0, 0, 0.7); padding: 20px; border-radius: 10px;\">\n");
      out.write("                ");
 String imageUrl = request.getParameter("imageUrl"); 
      out.write("\n");
      out.write("                <div style=\"display: flex; gap: 20px; align-items: start;\">\n");
      out.write("                    ");
 if (imageUrl != null && !imageUrl.isEmpty()) { 
      out.write("\n");
      out.write("                         <img src=\"");
      out.print( imageUrl );
      out.write("\" alt=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.title}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\" style=\"width: 300px; height: 300px; object-fit: cover; border-radius: 8px;\">\n");
      out.write("                    ");
 } 
      out.write("\n");
      out.write("                    <div>\n");
      out.write("                        <h2>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.title}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</h2>\n");
      out.write("                        <p><strong>Artist:</strong> ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.artist}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</p>\n");
      out.write("                        <p><strong>Genre:</strong> ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.genre}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</p>\n");
      out.write("                        <p><strong>Date:</strong> ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.date}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</p>\n");
      out.write("                        <p><strong>Location:</strong> ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.location}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</p>\n");
      out.write("                        <p><strong>Description:</strong> ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.description}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</p>\n");
      out.write("                        <p><strong>Starting Price:</strong> Rp ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.price}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</p>\n");
      out.write("                        \n");
      out.write("                        <!-- Form to pass data to Order.jsp -->\n");
      out.write("                        <form action=\"Order.jsp\" method=\"GET\" style=\"text-align: center; margin-top: 20px;\">\n");
      out.write("                            <input type=\"hidden\" name=\"title\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.title}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                            <input type=\"hidden\" name=\"date\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.date}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                            <input type=\"hidden\" name=\"location\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.location}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                            <input type=\"hidden\" name=\"description\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.description}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                            <input type=\"hidden\" name=\"price\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.price}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                            <input type=\"hidden\" name=\"imageUrl\" value=\"");
      out.print( imageUrl != null ? imageUrl : "" );
      out.write("\">\n");
      out.write("                            <input type=\"hidden\" name=\"artist\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.artist}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                            <input type=\"hidden\" name=\"genre\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.genre}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                            <button type=\"submit\" class=\"buy-now-button\" style=\"padding: 10px 20px; background-color: #ff4d4d; color: white; border: none; border-radius: 5px; cursor: pointer; font-size: 16px;\">\n");
      out.write("                                Order Tickets\n");
      out.write("                            </button>\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"footer\">\n");
      out.write("        <ul class=\"ul-footer-list\">\n");
      out.write("            <li class=\"name-category\">\n");
      out.write("                <h4>Developer</h4>\n");
      out.write("                <ul class=\"name-list\">\n");
      out.write("                    <li>Dani Adinugroho (FE/Server)</li>\n");
      out.write("                    <li>I Gede Hermawan (FE)</li>\n");
      out.write("                    <li>I Gede Fender (BE)</li>\n");
      out.write("                    <li>Rio Firman (BE)</li>\n");
      out.write("                    <li>Farandio Al-Khalid (BE)</li>\n");
      out.write("                </ul>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"name-category\">\n");
      out.write("                <h4>GitHub</h4>\n");
      out.write("                <ul class=\"name-list\">\n");
      out.write("                    <li><a href=\"https://github.com/ADMHipper20\" target=\"_blank\">Dani</a></li>\n");
      out.write("                    <li><a href=\"https://github.com/ADMHipper20\" target=\"_blank\">Hermawan</a></li>\n");
      out.write("                    <li><a href=\"https://github.com/ADMHipper20\" target=\"_blank\">Fender</a></li>\n");
      out.write("                    <li><a href=\"https://github.com/ADMHipper20\" target=\"_blank\">Rio</a></li>\n");
      out.write("                    <li><a href=\"https://github.com/ADMHipper20\" target=\"_blank\">Farandio</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"name-category\">\n");
      out.write("                <h4>Support</h4>\n");
      out.write("                <ul class=\"name-list\">\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"https://trakteer.id/HOTTORU\" target=\"_blank\">\n");
      out.write("                            <img src=\"Images/BGtest/Trakteer.png\" alt=\"Trakteer\"> Hottoru\n");
      out.write("                        </a>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("            </li>\n");
      out.write("        </ul>\n");
      out.write("        <div class=\"footer-copyright\">\n");
      out.write("            <p>&copy; 2025 SZLConcert Org. All rights reserved.</p>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <script type=\"text/javascript\" src=\"js/response.js\"></script>\n");
      out.write("</body>\n");
      out.write("</html> ");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof jakarta.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
