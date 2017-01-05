package cn.blog.servlet.backend;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by nicholas on 16-12-30.
 */
@WebServlet(name = "FileServlet")
public class FileServlet extends HttpServlet {
    private static final String UPLOAD_PATH = "static/img";
    private static final long   MAX_SIZE    = 1024 * 1024 * 10;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/plain;charset=utf-8");
        PrintWriter writer = response.getWriter();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("file.jsp");
    }
}
