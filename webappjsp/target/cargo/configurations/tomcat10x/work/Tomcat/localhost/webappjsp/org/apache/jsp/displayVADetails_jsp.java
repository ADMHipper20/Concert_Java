/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.18
 * Generated at: 2025-05-29 15:33:26 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;

public final class displayVADetails_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes = null;
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

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\">\r\n");
      out.write("    <title>Virtual Account Payment - SIZZLING CONCERT</title>\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/style.css\">\r\n");
      out.write("    <link rel=\"icon\" href=\"Images/Logo/CoNEX.svg\" type=\"image/svg+xml\">\r\n");
      out.write("    <style>\r\n");
      out.write("        body {\r\n");
      out.write("            font-family: Arial, sans-serif;\r\n");
      out.write("            margin: 0;\r\n");
      out.write("            padding: 0;\r\n");
      out.write("            background-color: #f4f4f4; /* Fallback background color */\r\n");
      out.write("            color: #333;\r\n");
      out.write("            line-height: 1.6;\r\n");
      out.write("            display: flex;\r\n");
      out.write("            flex-direction: column;\r\n");
      out.write("            min-height: 100vh;\r\n");
      out.write("            text-align: center;\r\n");
      out.write("        }\r\n");
      out.write("         .bg.fill {\r\n");
      out.write("            position: fixed;\r\n");
      out.write("            top: 0;\r\n");
      out.write("            left: 0;\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            height: 100%;\r\n");
      out.write("            overflow: hidden;\r\n");
      out.write("            z-index: -1;\r\n");
      out.write("        }\r\n");
      out.write("        #video-bg {\r\n");
      out.write("            position: absolute;\r\n");
      out.write("            top: 50%;\r\n");
      out.write("            left: 50%;\r\n");
      out.write("            min-width: 100%;\r\n");
      out.write("            min-height: 100%;\r\n");
      out.write("            width: auto;\r\n");
      out.write("            height: auto;\r\n");
      out.write("            transform: translate(-50%, -50%);\r\n");
      out.write("            background-size: cover;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /* Added padding-top to content to account for fixed header */\r\n");
      out.write("        .content {\r\n");
      out.write("             padding-top: 100px; /* Adjust based on header height */\r\n");
      out.write("             flex: 1; /* Allow content to grow */\r\n");
      out.write("             display: flex;\r\n");
      out.write("             justify-content: center;\r\n");
      out.write("             align-items: center; /* Center content vertically within its area */\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .payment-container {\r\n");
      out.write("            background: rgba(255, 255, 255, 0.95);\r\n");
      out.write("            border-radius: 10px;\r\n");
      out.write("            padding: 30px;\r\n");
      out.write("            margin: auto;\r\n");
      out.write("            box-shadow: 0 4px 8px rgba(0,0,0,0.1);\r\n");
      out.write("            max-width: 500px; /* Adjusted max-width */\r\n");
      out.write("        }\r\n");
      out.write("        .payment-container h1 {\r\n");
      out.write("            color: #333;\r\n");
      out.write("            margin-bottom: 20px;\r\n");
      out.write("            border-bottom: 2px solid #ff4d4d; /* Accent color line */\r\n");
      out.write("            padding-bottom: 10px;\r\n");
      out.write("        }\r\n");
      out.write("        .payment-details {\r\n");
      out.write("            margin: 20px 0;\r\n");
      out.write("            padding: 20px;\r\n");
      out.write("            background: #f9f9f9;\r\n");
      out.write("            border-radius: 10px;\r\n");
      out.write("            text-align: left;\r\n");
      out.write("        }\r\n");
      out.write("        .payment-details p {\r\n");
      out.write("            margin: 10px 0;\r\n");
      out.write("            font-size: 1.1em;\r\n");
      out.write("            color: #555;\r\n");
      out.write("        }\r\n");
      out.write("        .payment-details strong {\r\n");
      out.write("            color: #e44d26;\r\n");
      out.write("        }\r\n");
      out.write("        .instructions {\r\n");
      out.write("            text-align: left;\r\n");
      out.write("            margin: 20px 0;\r\n");
      out.write("            padding: 20px;\r\n");
      out.write("            background: #f9f9f9; /* Light background for instructions */\r\n");
      out.write("            border-radius: 10px;\r\n");
      out.write("            border: 1px solid #eee; /* Subtle border */\r\n");
      out.write("        }\r\n");
      out.write("        .instructions h3 {\r\n");
      out.write("             margin-top: 0;\r\n");
      out.write("             color: #555;\r\n");
      out.write("        }\r\n");
      out.write("        .instructions ol {\r\n");
      out.write("            margin-left: 20px;\r\n");
      out.write("            padding-left: 0;\r\n");
      out.write("        }\r\n");
      out.write("        .instructions li {\r\n");
      out.write("            margin-bottom: 8px;\r\n");
      out.write("            color: #666;\r\n");
      out.write("        }\r\n");
      out.write("        .timer {\r\n");
      out.write("            color: #e44d26; /* Accent color for timer */\r\n");
      out.write("            font-weight: bold;\r\n");
      out.write("            margin: 20px 0;\r\n");
      out.write("            font-size: 1.1em;\r\n");
      out.write("        }\r\n");
      out.write("         /* Basic footer styling to match other pages */\r\n");
      out.write("        .footer {\r\n");
      out.write("            background-color: rgba(0, 0, 0, 0.7); /* Semi-transparent background */\r\n");
      out.write("            color: #fff; /* White text */\r\n");
      out.write("            padding: 20px 0;\r\n");
      out.write("            text-align: center;\r\n");
      out.write("            margin-top: auto; /* Push footer to the bottom */\r\n");
      out.write("        }\r\n");
      out.write("        .footer ul {\r\n");
      out.write("            list-style: none;\r\n");
      out.write("            padding: 0;\r\n");
      out.write("            margin: 0 0 20px 0;\r\n");
      out.write("        }\r\n");
      out.write("        .footer ul li {\r\n");
      out.write("            display: inline-block;\r\n");
      out.write("            margin: 0 15px;\r\n");
      out.write("        }\r\n");
      out.write("        .footer ul li a {\r\n");
      out.write("            text-decoration: none;\r\n");
      out.write("            color: #fff;\r\n");
      out.write("            transition: color 0.3s ease;\r\n");
      out.write("        }\r\n");
      out.write("        .footer ul li a:hover {\r\n");
      out.write("            color: #e44d26;\r\n");
      out.write("        }\r\n");
      out.write("        .footer-copyright {\r\n");
      out.write("            font-size: 0.9em;\r\n");
      out.write("            color: #ccc; /* Light grey for copyright text */\r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"bg fill bg-fill bg-loaded\">\r\n");
      out.write("        <video autoplay muted loop id=\"video-bg\">\r\n");
      out.write("            <source src=\"videos/Honkai Star Rail Serval Trailer -  The Cusp of Ignition!.mp4\" type=\"video/mp4\">\r\n");
      out.write("            Your browser does not support the video tag.\r\n");
      out.write("        </video>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <!-- Standard Header -->\r\n");
      out.write("    <div class=\"navbar-pg\">\r\n");
      out.write("        <div class=\"header\">\r\n");
      out.write("            <img src=\"Images/Logo/CoNEX.svg\" alt=\"CoNEX Logo\" class=\"logo\">\r\n");
      out.write("            <ul class=\"ul-header-list\">\r\n");
      out.write("                <li><a href=\"index.jsp\">Home</a></li>\r\n");
      out.write("                <li><a href=\"Concert.jsp\">Concert</a></li>\r\n");
      out.write("                <li><a href=\"News.jsp\">News</a></li>\r\n");
      out.write("                <li><a href=\"About-Us.jsp\">About Us</a></li>\r\n");
      out.write("                <li><a href=\"Order.jsp\" id=\"buy-now\">Buy one now!</a></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"content\">\r\n");
      out.write("        <div class=\"payment-container\">\r\n");
      out.write("            <h1>Complete Your Payment</h1>\r\n");
      out.write("            <p>Event: ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${title}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</p>\r\n");
      out.write("\r\n");
      out.write("            <div class=\"payment-details\">\r\n");
      out.write("                <h3>Virtual Account Details</h3>\r\n");
      out.write("                <p><strong>Bank:</strong> ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${bankCode}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</p>\r\n");
      out.write("                <p><strong>Virtual Account Number:</strong> ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${vaNumber}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</p>\r\n");
      out.write("                <p><strong>Amount:</strong> Rp ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${amount}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</p>\r\n");
      out.write("                ");
      out.write("\r\n");
      out.write("                ");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <div class=\"instructions\">\r\n");
      out.write("                <h3>How to Pay:</h3>\r\n");
      out.write("                <p>Please make a transfer to the Virtual Account details provided above.</p>\r\n");
      out.write("                <ol>\r\n");
      out.write("                    <li>Log in to your banking portal or mobile app.</li>\r\n");
      out.write("                    <li>Select the transfer or payment option.</li>\r\n");
      out.write("                    <li>Choose transfer to Virtual Account.</li>\r\n");
      out.write("                    <li>Enter the Virtual Account number and the exact amount.</li>\r\n");
      out.write("                    <li>Follow the prompts to complete the payment.</li>\r\n");
      out.write("                </ol>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <div class=\"timer\">\r\n");
      out.write("                <p>Please complete the payment within the specified time.</p>\r\n");
      out.write("                ");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <p>After successful payment, you will receive a confirmation email with your ticket details.</p>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <!-- Standard Footer -->\r\n");
      out.write("    <div class=\"footer\">\r\n");
      out.write("        <ul class=\"ul-footer-list\">\r\n");
      out.write("            <li class=\"name-category\">\r\n");
      out.write("                <h4>Developer</h4>\r\n");
      out.write("                <ul class=\"name-list\">\r\n");
      out.write("                    <li>Dani Adinugroho (FE/Server)</li>\r\n");
      out.write("                    <li>I Gede Hermawan (FE)</li>\r\n");
      out.write("                    <li>I Gede Fender (BE)</li>\r\n");
      out.write("                    <li>Rio Firman (BE)</li>\r\n");
      out.write("                    <li>Farandio Al-Khalid (BE)</li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </li>\r\n");
      out.write("            <li class=\"name-category\">\r\n");
      out.write("                <h4>GitHub</h4>\r\n");
      out.write("                <ul class=\"name-list\">\r\n");
      out.write("                    <li><a href=\"https://github.com/ADMHipper20\" target=\"_blank\">Dani</a></li>\r\n");
      out.write("                    <li><a href=\"https://github.com/ADMHipper20\" target=\"_blank\">Hermawan</a></li>\r\n");
      out.write("                    <li><a href=\"https://github.com/ADMHipper20\" target=\"_blank\">Fender</a></li>\r\n");
      out.write("                    <li><a href=\"https://github.com/ADMHipper20\" target=\"_blank\">Rio</a></li>\r\n");
      out.write("                    <li><a href=\"https://github.com/ADMHipper20\" target=\"_blank\">Farandio</a></li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </li>\r\n");
      out.write("            <li class=\"name-category\">\r\n");
      out.write("                <h4>Support</h4>\r\n");
      out.write("                <ul class=\"name-list\">\r\n");
      out.write("                    <li>\r\n");
      out.write("                        <a href=\"https://trakteer.id/HOTTORU\" target=\"_blank\">\r\n");
      out.write("                            <img src=\"Images/BGtest/Trakteer.png\" alt=\"Trakteer\"> Hottoru\r\n");
      out.write("                        </a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </li>\r\n");
      out.write("        </ul>\r\n");
      out.write("        <div class=\"footer-copyright\">\r\n");
      out.write("             <p>&copy; 2025 CoNEX. All rights reserved.</p>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <script>\r\n");
      out.write("        // Get the ticketId from the request attribute\r\n");
      out.write("        var ticketId = '");
      out.print( request.getAttribute("ticketId") );
      out.write("';\r\n");
      out.write("        var contextPath = '");
      out.print( request.getContextPath() );
      out.write("';\r\n");
      out.write("\r\n");
      out.write("        console.log('Ticket ID:', ticketId);\r\n");
      out.write("        console.log('Context Path:', contextPath);\r\n");
      out.write("\r\n");
      out.write("        // Function to check payment status\r\n");
      out.write("        function checkPaymentStatus() {\r\n");
      out.write("            console.log('Checking payment status for ticket:', ticketId);\r\n");
      out.write("            fetch(contextPath + '/check-payment-status?ticketId=' + ticketId)\r\n");
      out.write("                .then(response => {\r\n");
      out.write("                    console.log('Received response from check-payment-status:', response);\r\n");
      out.write("                    return response.json();\r\n");
      out.write("                })\r\n");
      out.write("                .then(data => {\r\n");
      out.write("                    console.log('Payment status data:', data);\r\n");
      out.write("                    // Assuming both VA and QRIS payment status in DB is updated to 'PAID' on success\r\n");
      out.write("                    if (data.status === 'success' && data.paymentStatus === 'PAID') {\r\n");
      out.write("                        // Payment is completed, redirect to success page\r\n");
      out.write("                        console.log('Payment is PAID, redirecting...');\r\n");
      out.write("                        clearInterval(pollingInterval);\r\n");
      out.write("                        // Pass order details as parameters to the success page\r\n");
      out.write("                        window.location.href = contextPath + '/paymentComplete.jsp?ticketId=' + ticketId;\r\n");
      out.write("                    } else if (data.status === 'success' && data.paymentStatus === 'EXPIRED') {\r\n");
      out.write("                        // Payment expired, handle accordingly (e.g., show a message)\r\n");
      out.write("                        clearInterval(pollingInterval);\r\n");
      out.write("                        console.log('Payment for ticket ' + ticketId + ' expired.');\r\n");
      out.write("                        // You might want to redirect to an error/expired page\r\n");
      out.write("                    }\r\n");
      out.write("                    // Optionally handle other statuses or errors\r\n");
      out.write("                })\r\n");
      out.write("                .catch(error => {\r\n");
      out.write("                    console.error('Error checking payment status:', error);\r\n");
      out.write("                    // Handle errors during polling\r\n");
      out.write("                });\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        // Poll for payment status every 10 seconds (adjust as needed)\r\n");
      out.write("        console.log('Starting payment status polling...');\r\n");
      out.write("        var pollingInterval = setInterval(checkPaymentStatus, 10000);\r\n");
      out.write("\r\n");
      out.write("        // Clear the interval if the user leaves the page\r\n");
      out.write("        window.addEventListener('beforeunload', function() {\r\n");
      out.write("            clearInterval(pollingInterval);\r\n");
      out.write("        });\r\n");
      out.write("\r\n");
      out.write("    </script>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
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
