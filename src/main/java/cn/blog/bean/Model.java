package cn.blog.bean;

import cn.blog.config.Database;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by nicholas on 16-12-18.
 */
public abstract class Model {
    private   Database          database          = Database.getInstance();
    protected Connection        conn              = null;
    protected PreparedStatement preparedStatement = null;

    Model() throws IOException {
        this.connect();
    }

    private void connect() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            this.conn = DriverManager.getConnection(database.getUrl(), database.getUser(), database.getPassword());
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void finalize() throws Throwable {
        if (conn != null) {
            conn.close();
        }

        if (preparedStatement != null) {
            preparedStatement.close();
        }

        super.finalize();
    }
}
