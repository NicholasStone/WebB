<%@ page import="cn.blog.bean.Post" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="cn.blog.util.AlertMessage" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: nicholas
  Date: 17-1-8
  Time: 下午10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="posts" class="cn.blog.bean.Post"/>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" href="//fonts.lug.ustc.edu.cn/icon?family=Material+Icons">
    <link href="//cdn.bootcss.com/material-design-lite/1.3.0/material.grey-orange.min.css" rel="stylesheet">
    <link rel="stylesheet" href="static/css/frontend.css">
</head>
<body>
<div class="blog mdl-layout mdl-js-layout has-drawer">
    <main class="mdl-layout__content">
        <div class="blog__posts mdl-grid">
            <%
                Iterator<Post> postIterator = null;
                Post post;
                try {
                    postIterator = posts.getCatalog().iterator();
                } catch (SQLException e) {
                    AlertMessage.setErrorStackTrace(session, e.getStackTrace());
                }
                if (postIterator != null)
                    while (postIterator.hasNext()) {
                        post = postIterator.next();
            %>
            <div class="mdl-card mdl-cell mdl-cell--12-col">
                <div class="mdl-card__title mdl-color-text--gery-50">
                    <h3>
                        <a href="article.jsp?id=<%=post.getId()%>">
                            <%=post.getTitle()%>
                        </a>
                        <small>
                            <%=post.getSubtitle()%>
                        </small>
                    </h3>
                </div>
                <div class="mdl-card__supporting-text mdl-color-text--grey-600">
                    <p class="content"><%=post.getContent()%></p>
                </div>
                <div class="mdl-card__supporting-text mdl-color-text--grey-600">
                    <div>
                        <strong>发表于 <%=post.getCreated_at()%>
                        </strong>
                    </div>
                </div>
            </div>
            <%
                    }
            %>
        </div>
    </main>
</div>
<script src="//cdn.bootcss.com/shave/1.0.3/shave.min.js"></script>
<script src="//cdn.bootcss.com/material-design-lite/1.3.0/material.min.js"></script>
<script>
    shave('.content', 200);
</script>
</body>
</html>
