package cn.blog.servlet.backend;

import cn.blog.bean.Post;
import cn.blog.util.AlertMessage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by nicholas on 16-12-27.
 */
@WebServlet(name = "DeleteServlet")
public class DeleteServlet extends BackendServlet {
    private static final String IMAGE_FOLDER_PATH = "static/img";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getParameter("path");
        File   file = new File(getServletContext().getRealPath("") + IMAGE_FOLDER_PATH + path);
        if (file.delete()) {
            handleSuccess(request, response, "文件" + file.getName() + "删除成功", "/file.jsp");
        } else {
            handleError(request, response, new Exception("文件删除失败"), "/file.jsp");
        }
    }
}
