<%--
  Created by IntelliJ IDEA.
  User: nicholas
  Date: 16-12-23
  Time: 下午11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="cn.blog.util.AlertMessage" %>
<%
    if (AlertMessage.hasErrors(session) || AlertMessage.hasSuccess(session)) {
%>
<div class="mdl-card mdl-cell--12-col <%if (AlertMessage.hasErrors(session)){%> mdl-color--red mdl-text-color--white <%}else{%> mdl-color--green <%}%>">
    <div class="mdl-card__title">
        <i class="material-icons md-48">warning</i>
        <h2 class="mdl-card__title-text">
            <%if (AlertMessage.hasErrors(session)) {%>
            抱歉，发生了一些意外
            <%} else {%>
            操作成功
            <%}%>
        </h2>
    </div>
    <div class="mdl-card__supporting-text">
        <p><%=AlertMessage.getMessage(session)%></p>
        <%=AlertMessage.getStackTrace(session)%>
    </div>
</div>
<%
        AlertMessage.unsetErrorMessage(session);
        AlertMessage.unsetSuccessMessage(session);
    }
%>