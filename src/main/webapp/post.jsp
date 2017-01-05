<%@ page import="cn.blog.bean.Post" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="cn.blog.util.AlertMessage" %>
<%--
  Created by IntelliJ IDEA.
  User: nicholas
  Date: 16-12-18
  Time: 下午12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="WEB-INF/partial/auth-check.jsp" %>
<jsp:useBean id="post" class="cn.blog.bean.Post" scope="page"/>
<%
    ArrayList<Post> catalog = null;
    try {
        catalog = post.getCatalog();
    } catch (SQLException | NullPointerException e) {
        AlertMessage.setErrorStackTrace(session, e.getStackTrace());
    }
%>
<html>
<head>
    <title>Posts</title>
    <%@include file="WEB-INF/partial/styles.jsp" %>
    <link rel="stylesheet" href="static/css/backend.css">
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
                            <th width="10%" style="text-align: center">ID</th>
                            <th class="mdl-data-table__cell--non-numeric" width="40%">标题</th>
                            <th class="mdl-data-table__cell--non-numeric" width="30%">副标题</th>
                            <th class="mdl-data-table__cell--non-numeric" width="20%">发布日期</th>
                            <th class="mdl-data-table__cell--non-numeric" width="10%" style="text-align: center">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            for (Post item : catalog) {
                        %>
                        <tr>
                            <td style="text-align: center"><%=item.getId()%>
                            </td>
                            <td class="mdl-data-table__cell--non-numeric">
                            <%=item.getTitle()%>
                            </td>
                            <td class="mdl-data-table__cell--non-numeric">
                            <%=item.getSubtitle()%>
                            </td>
                            <td class="mdl-data-table__cell--non-numeric">
                            <%=item.getCreated_at()%>
                            </td>
                            <td class="mdl-data-table__cell--non-numeric">
                            <a href="admin/post/<%=item.getId()%>"
                            class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
                            <i class="material-icons">create</i>
                            </a>
                            <a href="blog/<%=item.getId()%>"
                            class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
                            <i class="material-icons">search</i>
                            </a>
                            </td>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>
</div>
<a href="edit.jsp" class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--fab mdl-color--accent new">
    <i class="material-icons">add</i>
</a>
<%@include file="WEB-INF/partial/scripts.jsp" %>
</body>
</html>
