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
 * Created by nicholas on 16-12-27.
 */
@WebServlet(name = "DeleteServlet")
public class DeleteServlet extends BackendServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id;
        int row = 0;
        try {
            id = Integer.parseInt(request.getPathInfo().substring(1));
            row = new Post().find(id).delete();
        } catch (NumberFormatException | SQLException e) {
            this.handleError(request, response, e);
        }

        if (row != 0) {
            this.handleSuccess(request, response, "删除成功");
        }

    }
}
