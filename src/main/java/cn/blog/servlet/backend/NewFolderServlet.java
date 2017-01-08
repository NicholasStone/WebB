package cn.blog.servlet.backend;

import cn.blog.bean.Image;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

/**
 * Created by nicholas on 17-1-8.
 */
@WebServlet(name = "NewFolderServlet")
public class NewFolderServlet extends BackendServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newFolder = request.getParameter("name");
        String folder    = request.getParameter("folder");
        Image  image     = new Image(getServletContext().getRealPath(""), folder + File.separator + newFolder);
        if (image.isExist()) {
            handleError(request, response, new Exception("文件夹已存在"), "/file.jsp");
            return;
        } else {
            if (image.createFolder()) {
                handleSuccess(request, response, "文件夹建立成功", "/file.jsp");
                return;
            } else {
                handleError(request, response, new Exception("文件夹建立失败"), "/file.jsp");
                return;
            }
        }
    }
}
