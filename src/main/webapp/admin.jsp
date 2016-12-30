<%--
  Created by IntelliJ IDEA.
  User: nicholas
  Date: 16-12-18
  Time: 上午10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
    <%@include file="WEB-INF/partial/styles.jsp" %>
    <link rel="stylesheet" href="static/css/sign-in.css" type="text/css">
</head>
<body>
<div class="mdl-layout__container">
    <div class="mdl-layout mdl-js-layout">
        <main class="mdl-layout__content">
            <div class="mdl-grid">
                <div class="mdl-cell mdl-cell--4-offset mdl-cell--4-col-desktop">
                    <h2 class="title mdl-typography--display-2">后台管理</h2>
                    <%@ include file="WEB-INF/partial/alert.jsp" %>
                    <div class="mdl-card mdl-shadow--2dp mdl-cell--12-col sign-in-card">
                        <h4 class="subtitle mdl-typography--display-handling">请输入电子邮箱及密码</h4>
                        <div class="mdl-card__actions">
                            <form action="/auth" method="post">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input type="email" name="email" id="email" class="mdl-textfield__input">
                                    <label for="email" class="mdl-textfield__label">邮箱</label>
                                    <span class="mdl-textfield__error">ErrorMessage</span>
                                </div>
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input type="password" name="password" id="password" class="mdl-textfield__input">
                                    <label for="password" class="mdl-textfield__label">密码</label>
                                    <span class="mdl-textfield__error">ErrorMessage</span>
                                </div>
                                <p>
                                    <button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent"
                                            type="submit">登陆
                                    </button>
                                </p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
<%@include file="WEB-INF/partial/scripts.jsp" %>
</body>
</html>
