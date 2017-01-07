<%@ page import="java.io.File" %>
<%@ page import="cn.blog.bean.Image" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
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
    String folder = request.getParameter("folder") == null ? "" : request.getParameter("folder");
    Image image = new Image(request.getServletContext().getRealPath("/"), folder);
    String path = "";
    SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-DD HH:mm");
%>
<html>
<head>
    <title>Posts</title>
    <%@include file="WEB-INF/partial/styles.jsp" %>
    <link href="//cdn.bootcss.com/dialog-polyfill/0.4.5/dialog-polyfill.min.css" rel="stylesheet">
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
                    <ul class="breadcrumb folder-path">
                        <%
                            if (!folder.equals("")) {
                                String[] paths = folder.split("/");
                                out.print("<li><a href='/file.jsp'>Root</a></li>");
                                for (int i = 0; i < paths.length; i++) {
                                    if (!paths[i].equals("")) {
                                        path += paths[i] + "/";
                                        if (i != paths.length - 1) {
                                            out.print("<li><a href='/file.jsp?folder=" + path + "'>" + paths[i] + "</a></li>");
                                        } else {
                                            out.print("<li>" + paths[i] + "</li>");
                                        }
                                    }
                                }
                            } else {
                                out.print("<li>Root</li>");
                            }
                        %>
                    </ul>
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
                                <a href="${pageContext.request.contextPath}/file.jsp?folder=<%=folder+"/"+file.getName()%>">
                                    <%=file.getName()%>
                                </a>
                                <%} else {%>
                                <i class="material-icons">image</i>
                                <%=file.getName()%>
                                <%}%>
                            </td>
                            <td class="mdl-data-table__cell--non-numeric">
                                <%if (file.isDirectory()) {%>
                                -
                                <%} else {%>
                                <%=file.length() / 1024%>kB
                                <%}%>
                            </td>
                            <td class="mdl-data-table__cell--non-numeric">
                                <%=format.format(new Date(file.lastModified()))%>
                            </td>
                            <td class="mdl-data-table__cell--non-numeric">
                                <%
                                    if (!file.isDirectory()) {
                                %>
                                <button data-image-url="static/img/<%=path+file.getName()%>"
                                        data-image-name="<%=file.getName()%>"
                                        class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon show-dialog">
                                    <i class="material-icons">search</i>
                                </button>
                                <%}%>
                                <a href="${pageContext.request.contextPath}/admin/delete?path=<%=path%>/<%=file.getName()%>"
                                   class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
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
<button id="new-image" class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--fab mdl-color--accent new">
    <i class="material-icons">add</i>
</button>
<dialog class="mdl-dialog show-image" id="show">
    <h4 class="mdl-dialog__title title"></h4>
    <div class="mdl-dialog__content">
        <img src="">
    </div>
    <div class="mdl-dialog__actions">
        <button class="mdl-button close" id="show-close">关闭</button>
    </div>
</dialog>
<dialog class="mdl-dialog" id="upload">
    <h4 class="mdl-dialog__title">图片</h4>
    <div class="mdl-dialog__content">
        <form id="file-upload" enctype="multipart/form-data"
              action="${pageContext.request.contextPath}/admin/file/upload?folder=<%=path%>"
              method="post">
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--file">
                <input class="mdl-textfield__input" placeholder="文件" type="text" id="uploadFile" accept="image/*"
                       readonly/>
                <div class="mdl-button mdl-button--primary mdl-button--icon mdl-button--file">
                    <i class="material-icons">attach_file</i><input type="file" id="uploadBtn" name="file">
                </div>
            </div>
        </form>
    </div>
    <div class="mdl-dialog__actions">
        <button class="mdl-button" form="file-upload">提交</button>
        <button class="mdl-button close">关闭</button>
    </div>
</dialog>
<%@include file="WEB-INF/partial/scripts.jsp" %>
<script src="//cdn.bootcss.com/dialog-polyfill/0.4.5/dialog-polyfill.min.js"></script>
<script>
    var imageDialog = document.querySelector("#show");
    var show = document.querySelectorAll(".show-dialog");
    var uploadDialog = document.querySelector("#upload");
    var newImage = document.querySelector("#new-image");
    if (!imageDialog.showModal) {
        dialogPolyfill.registerDialog(imageDialog);
    }
    if (!uploadDialog.showModal) {
        dialogPolyfill.registerDialog(imageDialog);
    }
    var deployImage = function () {
        imageDialog.querySelector("img").src = this.dataset.imageUrl;
        imageDialog.querySelector(".title").innerHTML = this.dataset.imageName;
        imageDialog.showModal();
    };
    for (var i = 0, len = show.length; i < len; i++) {
        show[i].addEventListener("click", deployImage);
    }
    newImage.addEventListener("click", function () {
        uploadDialog.showModal();
    });
    imageDialog.querySelector(".close").addEventListener("click", function () {
        imageDialog.close();
    });
    uploadDialog.querySelector(".close").addEventListener("click", function () {
        uploadDialog.close();
    });
    document.getElementById("uploadBtn").onchange = function () {
        document.getElementById("uploadFile").value = this.files[0].name;
    };
</script>
</body>
</html>
