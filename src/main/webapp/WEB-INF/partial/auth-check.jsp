<%--
  Created by IntelliJ IDEA.
  User: nicholas
  Date: 16-12-24
  Time: 上午12:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("user.name") == null || session.getAttribute("user.name") == "") {
        response.sendRedirect("/admin.jsp");
    }
%>