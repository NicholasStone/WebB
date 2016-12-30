<%@ page import="java.io.File" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="cn.blog.bean.Image" %>
<%--
  Created by IntelliJ IDEA.
  User: nicholas
  Date: 16-12-27
  Time: 下午2:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="WEB-INF/partial/auth-check.jsp" %>
<%
    Image image = new Image(request.getServletContext().getRealPath("/"));
%>
<html>
<head>
    <title>Posts</title>
    <%@include file="WEB-INF/partial/styles.jsp" %>
    <link rel="stylesheet" href="static/css/post.css">
</head>
<body>
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
    <%@include file="WEB-INF/partial/posts/header-and-drawer.jsp" %>
    <main class="mdl-layout__content mdl-color--grey-100">
        <div class="mdl-grid">
            <%@include file="WEB-INF/partial/alert.jsp" %>
            <div class="mdl-cell mdl-cell--8-col mdl-cell--2-offset-desktop mdl-card mdl-shadow--2dp">
                <div class="mdl-card__title">
                    <h2 class="mdl-card__title-text">文章管理</h2>
                </div>
                <div class="mdl-card__actions">
                    <table class="mdl-data-table mdl-js-data-table mdl-cell mdl-cell--12-col">
                        <thead>
                        <tr>
                            <th class="mdl-data-table__cell--non-numeric">名称</th>
                            <th class="mdl-data-table__cell--non-numeric">大小</th>
                            <th class="mdl-data-table__cell--non-numeric">最后修改日期</th>
                            <th class="mdl-data-table__cell--non-numeric" width="20">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            for (File file : image.getListFiles()) {
                        %>
                        <tr>
                            <td class="mdl-data-table__cell--non-numeric">
                                <%if (file.isDirectory()) {%>
                                <i class="material-icons">folder</i>
                                <%} else {%>
                                <i class="material-icons">image</i>
                                <%}%>
                                <%=file.getName()%>
                            </td>
                            <td class="mdl-data-table__cell--non-numeric">
                                <%if (file.isDirectory()) {%>
                                -
                                <%} else {%>
                                <%=file.length()/1024%>kB
                                <%}%>
                            </td>
                            <td class="mdl-data-table__cell--non-numeric">
                                <%=file.lastModified()%>
                            </td>
                            <td class="mdl-data-table__cell--non-numeric">
                                <%if (!file.isDirectory()) {%>
                                <a href="#" class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
                                    <i class="material-icons">search</i>
                                </a>
                                <%}%>
                                <a href="#" class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
                                    <i class="material-icons">delete</i>
                                </a>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>
</div>
<a id="new-post" href="edit.jsp"
   class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--fab mdl-color--accent">
    <i class="material-icons">add</i>
</a>
<%@include file="WEB-INF/partial/scripts.jsp" %>
</body>
</html>
