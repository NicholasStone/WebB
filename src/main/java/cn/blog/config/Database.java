package cn.blog.config;

import javax.xml.crypto.Data;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * Created by nicholas on 16-12-29.
 */
public class Database {
    private static volatile Database INSTANCE = null;

    private static final InputStream configPath = Database.class.getClassLoader().getResourceAsStream("config/db.properties");

    private Map<String, String> configs = new HashMap<>();

    public static Database getInstance() throws IOException {
        if (INSTANCE == null) {
            synchronized (Database.class) {
                if (INSTANCE == null) {
                    INSTANCE = new Database();
                }
            }
        }
        return INSTANCE;
    }

    private Database() throws IOException {
        parseConfigure();
    }

    public String getUrl() {
        return "jdbc:mysql://" + configs.get("host") + ":" + configs.get("port") + "/" + configs.get("name") + "?useUnicode=true&characterEncoding=UTF8";
    }

    public String getUser() {
        return configs.get("user");
    }

    public String getPassword() {
        return configs.get("password");
    }

    private Map<String, String> getConfigs() {
        return configs;
    }

    private void parseConfigure() throws IOException {
        Properties db = getProperties();
        configs.put("host", db.getProperty("DB_HOST"));
        configs.put("user", db.getProperty("DB_USER"));
        configs.put("password", db.getProperty("DB_PASSWORD"));
        configs.put("name", db.getProperty("DB_NAME"));
        configs.put("port", db.getProperty("DB_PORT"));
    }

    private Properties getProperties() throws IOException {
        Properties properties = null;
        if (Database.configPath != null) {
            properties = new Properties();
            properties.load(Database.configPath);
        } else {
            throw new FileNotFoundException(Database.configPath + "Not Found");
        }

        return properties;
    }
}
