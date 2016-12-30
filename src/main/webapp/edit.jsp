<%--
  Created by IntelliJ IDEA.
  User: nicholas
  Date: 16-12-24
  Time: 上午12:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="WEB-INF/partial/auth-check.jsp" %>
<html>
<head>
    <title>编辑文章</title>
    <%@include file="WEB-INF/partial/styles.jsp" %>
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
                    <form action="/admin/post/<%if (request.getAttribute("id") != null){%><%=request.getAttribute("id")%><%}%>"
                          method="post">
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
                            <input type="text" name="title" id="title" class="mdl-textfield__input"
                                   value="<%if (request.getAttribute("title") != null){%><%=request.getAttribute("title")%><%}%>">
                            <label for="title" class="mdl-textfield__label">标题</label>
                        </div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
                            <input type="text" name="subTitle" id="subTitle" class="mdl-textfield__input"
                                   value="<%if (request.getAttribute("subTitle") != null){%><%=request.getAttribute("subTitle")%><%}%>">
                            <label for="subTitle" class="mdl-textfield__label">副标题</label>
                        </div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
                            <textarea type="text" name="content" id="content" rows="30" cols="10"
                                      class="mdl-textfield__input"><%if (request.getAttribute("content") != null) {%><%=request.getAttribute("content").toString().trim()%><%}%></textarea>
                            <label for="content" class="mdl-textfield__label">内容</label>
                        </div>
                        <p>
                            <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent"
                                    type="submit">提交
                            </button>
                            <% if (request.getAttribute("id") != null) {%>
                            <a class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-color--red"
                               href="/admin/delete/<%=request.getAttribute("id")%>">删除
                            </a>
                            <%}%>
                        </p>
                    </form>
                </div>
            </div>
        </div>
    </main>
</div>
<%@include file="WEB-INF/partial/scripts.jsp" %>
</body>
</html>
