package cn.blog.bean;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by nicholas on 16-12-18.
 */
public class User extends Model {
    private int    id;
    private String username;
    private String email;
    private String password;

    public User() throws IOException {}

    public User find(String email) throws SQLException {
        this.preparedStatement = this.conn.prepareStatement("SELECT * FROM `users` WHERE `email` = ? LIMIT 1");
        preparedStatement.setString(1, email);
        ResultSet result = preparedStatement.executeQuery();
        if (result.next()) {
            this
                    .setId(result.getInt("id"))
                    .setEmail(result.getString("email"))
                    .setPassword(result.getString("password"))
                    .setUsername(result.getString("username"));
            return this;
        }else {
            return null;
        }
    }

    public int getId() {
        return id;
    }

    public User setId(int id) {
        this.id = id;
        return this;
    }

    public String getUsername() {
        return username;
    }

    public User setUsername(String username) {
        this.username = username;
        return this;
    }

    public String getEmail() {
        return email;
    }

    public User setEmail(String email) {
        this.email = email;
        return this;
    }

    public String getPassword() {
        return password;
    }

    public User setPassword(String password) {
        this.password = password;
        return this;
    }
}
