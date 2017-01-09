package cn.blog.servlet;

import cn.blog.bean.User;
import cn.blog.util.Encrypt;
import cn.blog.util.AlertMessage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Date;

/**
 * Created by nicholas on 16-12-18.
 */
@WebServlet(name = "AuthServlet")
public class AuthServlet extends BackendServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session  = request.getSession();
        String      email    = request.getParameter("email");
        String      password = request.getParameter("password");
        User        user;
        try {
            user = new User().find(email);
        } catch (SQLException e) {
            e.printStackTrace();
            AlertMessage.setErrorMessage(session, Arrays.toString(e.getStackTrace()));
            response.sendRedirect("/admin.jsp");
            return;
        }
        if (user == null){
            AlertMessage.setErrorMessage(session, "User not found");
            response.sendRedirect("/admin.jsp");
            return;
        }
        if (user.getPassword().equals(Encrypt.stringMD5(password))) {
            authorization(session, user);
            response.sendRedirect("/post.jsp");
        } else {
            AlertMessage.setErrorMessage(session, "请输入正确的帐号密码");
            response.sendRedirect("/admin.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/admin.jsp");
    }

    private void authorization(HttpSession session, User user) {
        session.setAttribute("user.name", user.getUsername());
        session.setAttribute("user.id", user.getId());
        session.setAttribute("user.email", user.getEmail());
        session.setAttribute("user.sign_in_at", new Date().getTime());
    }

}
