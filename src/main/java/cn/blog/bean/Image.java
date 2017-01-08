package cn.blog.bean;

import java.io.File;
import java.io.IOException;

/**
 * Created by nicholas on 16-12-27.
 */
public class Image {
    private String BASE_DIR       = null;
    private String IMAGE_DIR_PATH = "static/img/";

    public File getFolder() {
        return folder;
    }

    private File folder = null;

    public Image(String base, String folderPath) {
        BASE_DIR = base;
        this.folder = new File(BASE_DIR + File.separator + IMAGE_DIR_PATH + File.separator + folderPath);
    }

    public boolean isExist() {
        return this.folder.exists();
    }

    public File[] getListFiles() {
        if (this.folder.isDirectory()) {
            return this.folder.listFiles();
        } else {
            return null;
        }
    }

    /**
     * @return Weather operation is succeed
     * @throws IOException IOException
     */
    public boolean createFolder() throws IOException {
        return this.folder.mkdirs();
    }

    public String getFolderPath() {
        return BASE_DIR + IMAGE_DIR_PATH;
    }
}
