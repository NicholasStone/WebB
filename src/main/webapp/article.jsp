<%@ page import="java.sql.SQLException" %>
<%@ page import="cn.blog.util.AlertMessage" %><%--
  Created by IntelliJ IDEA.
  User: nicholas
  Date: 17-1-8
  Time: 下午11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="post" class="cn.blog.bean.Post"/>
<%
    String id = request.getParameter("id");
    try {
        post.find(Integer.parseInt(id));
    } catch (SQLException e) {
        AlertMessage.setErrorStackTrace(session, e.getStackTrace());
    }
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title><%=post.getTitle()%>
    </title>

    <link rel="stylesheet" href="//fonts.lug.ustc.edu.cn/icon?family=Material+Icons">
    <link href="//cdn.bootcss.com/material-design-lite/1.3.0/material.grey-orange.min.css" rel="stylesheet">
    <link rel="stylesheet" href="static/css/frontend.css">
</head>
<body>
<div class="blog blog--blogpost mdl-layout mdl-js-layout has-drawer">
    <main class="mdl-layout__content">
        <div class="back">
            <a class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" href="index.jsp" title="go back"
               role="button">
                <i class="material-icons" role="presentation">arrow_back</i>
            </a>
        </div>
        <div class="blog__posts mdl-grid">
            <div class="mdl-card mdl-shadow--4dp mdl-cell mdl-cell--12-col">
                <div class="mdl-card__media mdl-color-text--grey-50">
                    <h3>
                        <%=post.getTitle()%>
                    </h3>
                    <small>
                        <%=post.getSubtitle()%>
                    </small>
                </div>
                <div class="mdl-color-text--grey-700 mdl-card__supporting-text meta">
                    <div>发表于
                        <%=post.getCreated_at()%>
                    </div>
                </div>
                <div class="mdl-color-text--grey-700 mdl-card__supporting-text">
                    <%=post.getContent()%>
                </div>
            </div>
        </div>
    </main>
</div>
</body>
</html>
