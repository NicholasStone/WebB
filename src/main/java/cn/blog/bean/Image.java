package cn.blog.bean;

import java.io.File;
import java.io.IOException;

/**
 * Created by nicholas on 16-12-27.
 */
public class Image {
    private String BASE_DIR       = null;
    private String IMAGE_DIR_PATH = "static/img/";
    private File   imageFolder    = null;

    public Image(String base) {
        BASE_DIR = base;
        this.imageFolder = new File(BASE_DIR + IMAGE_DIR_PATH);
    }

    public boolean isExist() {
        return this.imageFolder.exists();
    }

    public File[] getListFiles() {
        if (this.imageFolder.isDirectory()) {
            return this.imageFolder.listFiles();
        } else {
            return null;
        }
    }

    /**
     * @param path   Relative path, compare with image folder
     * @param folder New folder name
     * @return Weather operation is succeed
     * @throws IOException IOException
     */
    public boolean createFolder(String path, String folder) throws IOException {
        File file = new File(BASE_DIR + IMAGE_DIR_PATH + path + folder);
        return file.mkdirs();
    }

    public String getFolderPath() {
        return BASE_DIR + IMAGE_DIR_PATH;
    }
}
