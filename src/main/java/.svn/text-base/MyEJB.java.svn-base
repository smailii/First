import org.apache.commons.io.comparator.DirectoryFileComparator;
import org.apache.commons.io.comparator.LastModifiedFileComparator;
import org.apache.commons.io.comparator.NameFileComparator;
import org.apache.commons.io.comparator.SizeFileComparator;

import javax.ejb.Stateless;
import java.io.File;
import java.util.Arrays;
import java.util.List;

@Stateless
public class MyEJB {


    private File file;

    public MyEJB() {
    }

    public void setFileByPath(String path) throws Exception {
        this.file = new File(path);
        if (!this.file.exists()) {
            throw new Exception();
        }
    }

    public List<MyFile> getSortedFilesList(String sortByNameParameter, String sortByDirectoryParameter, String sortBySizeParameter,
                                           String sortByDateCreateParameter) {
        File[] files = file.listFiles();

        if (sortByNameParameter != null) {
            if (Boolean.parseBoolean(sortByNameParameter)) {
                Arrays.sort(files, NameFileComparator.NAME_COMPARATOR);
            } else {
                Arrays.sort(files, NameFileComparator.NAME_REVERSE);
            }
            Arrays.sort(files, DirectoryFileComparator.DIRECTORY_COMPARATOR);
        } else if (sortBySizeParameter != null) {
            if (Boolean.parseBoolean(sortBySizeParameter))
                Arrays.sort(files, SizeFileComparator.SIZE_COMPARATOR);
            else
                Arrays.sort(files, SizeFileComparator.SIZE_REVERSE);
            Arrays.sort(files, DirectoryFileComparator.DIRECTORY_COMPARATOR);
        } else if (sortByDateCreateParameter != null) {
            if (Boolean.parseBoolean(sortByDateCreateParameter))
                Arrays.sort(files, LastModifiedFileComparator.LASTMODIFIED_COMPARATOR);
            else
                Arrays.sort(files, LastModifiedFileComparator.LASTMODIFIED_REVERSE);
            Arrays.sort(files, DirectoryFileComparator.DIRECTORY_COMPARATOR);
        } else if (sortByDirectoryParameter != null) {
            if (Boolean.parseBoolean(sortByDirectoryParameter))
                Arrays.sort(files, DirectoryFileComparator.DIRECTORY_COMPARATOR);
            else
                Arrays.sort(files, DirectoryFileComparator.DIRECTORY_REVERSE);
        } else {
            Arrays.sort(files, DirectoryFileComparator.DIRECTORY_COMPARATOR);
        }

        return new MyFile().getListFile(files);
    }

    public boolean isFileTXT() {
        int dot = file.getName().lastIndexOf(".");
        if (dot == -1) dot = 2;
        String extension = file.getName().substring(dot + 1);

        return "txt".equals(extension);
    }

    public String changeParam(String param) {
        if (param != null)
            if ("true".equals(param)) param = "false";
            else param = "true";

        return param;
    }

    public File getFile() {
        return file;
    }
}
