<%--
  Created by IntelliJ IDEA.
  User: nicholas
  Date: 16-12-23
  Time: 下午10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="mdl-layout__header">
    <div class="mdl-layout__header-row">
        <span class="mdl-layout__title">后台管理</span>
        <div class="mdl-layout-spacer"></div>
        <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="hdrbtn">
            <i class="material-icons">more_vert</i>
        </button>
        <ul class="mdl-menu mdl-js-menu mdl-js-ripple-effect mdl-menu--bottom-right" for="hdrbtn">
            <li class="mdl-menu__item">注销</li>
        </ul>
    </div>
</header>
<div class="mdl-layout__drawer">
    <header class="mdl-layout-title mdl-color--grey-600 drawer-header">
        <img src="/static/img/Overwatch_logo.jpg" class="avatar" width="48" height="48">
        <span>您好，<%=session.getAttribute("user.name")%></span>
    </header>
    <nav class="mdl-navigation">
        <a class="mdl-navigation__link" href="/post.jsp">文章管理</a>
        <a class="mdl-navigation__link" href="/file.jsp">文件管理</a>
    </nav>
</div>
