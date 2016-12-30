package cn.blog.bean;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by nicholas on 16-12-18.
 */
public class Post extends Model {
    private int    id;
    private String title;
    private String subtitle;
    private String content;
    private String created_at;
    private String updated_at;

    public Post() throws IOException {
    }

    public Post find(String id) throws SQLException {
        return getPost(id);
    }

    public Post find(int id) throws SQLException {
        return getPost(Integer.toString(id));
    }

    private Post getPost(String id) throws SQLException {
        this.preparedStatement = this.conn.prepareStatement("SELECT * FROM posts WHERE `id` = ? LIMIT 1");
        preparedStatement.setString(1, id);
        ResultSet result = preparedStatement.executeQuery();
        if (result.next()) {
            this
                    .setId(result.getInt("id"))
                    .setTitle(result.getString("title"))
                    .setSubtitle(result.getString("subtitle"))
                    .setContent(result.getString("content"))
                    .setCreated_at(result.getString("created_at"))
                    .setUpdated_at(result.getString("updated_at"));
            return this;
        } else {
            return null;
        }
    }

    public ArrayList<Post> getCatalog() throws SQLException, NullPointerException, IOException {
        ArrayList<Post> posts = new ArrayList<>();

        this.preparedStatement = this.conn.prepareStatement("SELECT `id`, `title`, `subtitle`, `content`,`created_at` FROM posts");
        ResultSet result = preparedStatement.executeQuery();

        if (result == null) {
            throw new NullPointerException("Result set is empty");
        }

        while (result.next()) {
            posts.add(
                    new Post()
                            .setId(result.getInt("id"))
                            .setTitle(result.getString("title"))
                            .setSubtitle(result.getString("subtitle"))
                            .setContent(result.getString("content"))
                            .setCreated_at(result.getString("created_at"))
            );
        }

        return posts;
    }

    public int create() throws SQLException {
        this.preparedStatement = this.conn.prepareStatement("INSERT INTO posts(`title`,`subtitle`,`content`,`created_at`,`updated_at`) VALUE (?,?,?,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP)");
        this.preparedStatement.setString(1, this.title);
        this.preparedStatement.setString(2, this.subtitle);
        this.preparedStatement.setString(3, this.content);

        return this.preparedStatement.executeUpdate();
    }

    public int update() throws SQLException {
        this.preparedStatement = this.conn.prepareStatement("UPDATE posts SET`title`=?,`subtitle`=?,`content`=?,`updated_at`=CURRENT_TIMESTAMP WHERE `id` = ?");
        this.preparedStatement.setString(1, this.title);
        this.preparedStatement.setString(2, this.subtitle);
        this.preparedStatement.setString(3, this.content);
        this.preparedStatement.setInt(4, this.id);

        return this.preparedStatement.executeUpdate();
    }

    public int delete() throws SQLException {
        this.preparedStatement = this.conn.prepareStatement("DELETE FROM posts WHERE `id` = ?");
        this.preparedStatement.setInt(1, this.id);
        return this.preparedStatement.executeUpdate();
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public String getContent() {
        return content;
    }

    public String getCreated_at() {
        return created_at;
    }

    public String getUpdated_at() {
        return updated_at;
    }

    private Post setId(int id) {
        this.id = id;
        return this;
    }

    public Post setTitle(String title) {
        this.title = title;
        return this;
    }

    public Post setSubtitle(String subtitle) {
        this.subtitle = subtitle;
        return this;
    }

    public Post setContent(String content) {
        this.content = content;
        return this;
    }

    private Post setCreated_at(String created_at) {
        this.created_at = created_at;
        return this;
    }

    private Post setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
        return this;
    }
}
