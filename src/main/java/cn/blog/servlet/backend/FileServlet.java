package cn.blog.servlet.backend;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.nio.file.Paths;

/**
 * Created by nicholas on 16-12-30.
 */
@WebServlet(name = "FileServlet")
@MultipartConfig
public class FileServlet extends BackendServlet {
    private static final String UPLOAD_PATH = "static/img";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        http://stackoverflow.com/questions/2422468/how-to-upload-files-to-server-using-jsp-servlet
//        http://www.codejava.net/java-ee/servlet/java-file-upload-example-with-servlet-30-api
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_PATH;
        File   folder     = new File(uploadPath);
        if (!folder.exists()) {
            folder.mkdirs();
        }

        String fileName = null;
        for (Part part : request.getParts()) {
            fileName = this.getFileName(part);
            part.write(uploadPath + File.separator + fileName);
        }
        handleSuccess(request, response, "文件上传成功" + uploadPath + File.separator + fileName);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("file.jsp");
    }

    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        System.out.println("content-disposition header= " + contentDisp);
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }
}
