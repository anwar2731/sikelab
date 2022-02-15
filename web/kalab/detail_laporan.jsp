<%-- 
    Document   : detail_laporan
    Created on : Jan 27, 2022, 10:25:53 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("id") == null) response.sendRedirect("../login.jsp");
    else {
        String role = session.getAttribute("role").toString();
        if (!role.equals("kalab")){
            if (role.equals("kajur")) response.sendRedirect("../kajur/dashboard.jsp");
            else if (role.equals("ail")) response.sendRedirect("../ail/dashboard.jsp");
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
