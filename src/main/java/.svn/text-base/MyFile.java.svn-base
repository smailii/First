import java.io.File;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class MyFile {

    private File file;

    public MyFile() {
    }

    public MyFile(File file) {
        this.file = file;
    }

    public File getFile() {
        return file;
    }

    public Date getDate() {
        return new Time(file.lastModified());
    }

    public double getSize() {
        return (file.length() / 1024);
    }

    public List<MyFile> getListFile(File[] files) {
        List<MyFile> myFiles = new ArrayList<MyFile>();

        for (File file : files) {
            myFiles.add(new MyFile(file));
        }

        return myFiles;
    }
}
