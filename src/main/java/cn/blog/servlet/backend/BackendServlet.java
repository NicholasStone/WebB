package cn.blog.servlet.backend;

import cn.blog.util.AlertMessage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by nicholas on 16-12-27.
 */
@WebServlet(name = "BackendServlet")
public abstract class BackendServlet extends HttpServlet {
    protected abstract void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

    protected abstract void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;


    protected void handleError(HttpServletRequest request, HttpServletResponse response, Exception e) throws IOException {
        AlertMessage.setErrorMessage(request.getSession(), e.getMessage());
        AlertMessage.setErrorStackTrace(request.getSession(), e.getStackTrace());
        response.sendRedirect("/edit.jsp");
    }

    protected void handleError(HttpServletRequest request, HttpServletResponse response, Exception e, String redirect) throws IOException {
        AlertMessage.setErrorMessage(request.getSession(), e.getMessage());
        AlertMessage.setErrorStackTrace(request.getSession(), e.getStackTrace());
        response.sendRedirect(redirect);
    }

    protected void handleSuccess(HttpServletRequest request, HttpServletResponse response, String message) throws IOException {
        AlertMessage.setSuccessMessage(request.getSession(), message);
        response.sendRedirect("/post.jsp");
    }
}
