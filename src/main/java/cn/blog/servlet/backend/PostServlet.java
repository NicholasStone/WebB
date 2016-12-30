package cn.blog.servlet.backend;

import cn.blog.bean.Post;
import cn.blog.util.AlertMessage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by nicholas on 16-12-24.
 */
@WebServlet(name = "PostServlet")
public class PostServlet extends BackendServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int    id;
        String pathInfo = request.getPathInfo().substring(1);
        request.setCharacterEncoding("UTF-8");
        if (!pathInfo.equals("")) {
            //Edit post already exists
            try {
                id = Integer.parseInt(request.getPathInfo().substring(1));
                new Post().find(id)
                        .setTitle(request.getParameter("title"))
                        .setSubtitle(request.getParameter("subTitle"))
                        .setContent(request.getParameter("content"))
                        .update();
                handleSuccess(request, response, "更新成功");
            } catch (NumberFormatException | SQLException e) {
                handleError(request, response, e);
            }
        } else {
            //Create a new post
            try {
                new Post()
                        .setTitle(request.getParameter("title"))
                        .setSubtitle(request.getParameter("subTitle"))
                        .setContent(request.getParameter("content"))
                        .create();
                handleSuccess(request, response, "创建成功");
            } catch (SQLException e) {
                handleError(request, response, e);
            }

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int  id;
        Post post;
        try {
            id = Integer.parseInt(request.getPathInfo().substring(1));
        } catch (NumberFormatException e) {
            handleError(request, response, e);
            return;
        }

        try {
            post = new Post().find(id);
        } catch (SQLException e) {
            handleError(request, response, e);
            return;
        }

        request.setAttribute("id", post.getId());
        request.setAttribute("title", post.getTitle());
        request.setAttribute("subTitle", post.getSubtitle());
        request.setAttribute("content", post.getContent());

        //传值跳转
        //http://www.programgo.com/article/29573340119/
        getServletContext().getRequestDispatcher("/edit.jsp").forward(request, response);

    }
}
