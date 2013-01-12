import org.apache.commons.lang.StringUtils;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@WebServlet(name = "FileFolders", urlPatterns = "/fileFolders")
public class FileFolders extends HttpServlet {

    @EJB
    MyEJB myEJB;

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String pathParameter = req.getParameter("path");
        if (StringUtils.isBlank(pathParameter))
            pathParameter = "/";
        try {
            myEJB.setFileByPath(pathParameter);
        } catch (Exception e) {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/page500.jsp");
            dispatcher.forward(req, res);
        }

        if (myEJB.getFile().isDirectory()) {
            String sortByNameParameter = req.getParameter("sortByName");
            String sortByDirectoryParameter = req.getParameter("sortByDer");
            String sortBySizeParameter = req.getParameter("sortBySize");
            String sortByDateCreateParameter = req.getParameter("sortByDate");


            res.setContentType("text/html; charset=UTF-8");
            req.setAttribute("backUrl", pathParameter.substring(0, pathParameter.lastIndexOf("/")));
            req.setAttribute("sortByNameParameter", myEJB.changeParam(sortByNameParameter));
            req.setAttribute("sortByDirectoryParameter", myEJB.changeParam(sortByDirectoryParameter));
            req.setAttribute("sortBySizeParameter", myEJB.changeParam(sortBySizeParameter));
            req.setAttribute("sortByDateCreateParameter", myEJB.changeParam(sortByDateCreateParameter));
            req.setAttribute("curDirAbsPath", myEJB.getFile().getAbsolutePath());
            req.setAttribute("files", myEJB.getSortedFilesList(sortByNameParameter, sortByDirectoryParameter, sortBySizeParameter,
                    sortByDateCreateParameter));

            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/test.jsp");
            dispatcher.forward(req, res);
        } else if (myEJB.getFile().isFile()) {
            if (myEJB.isFileTXT()) browseTXT(res, myEJB.getFile());
            else download(res, myEJB.getFile());
        }
    }

    public void download(HttpServletResponse res, File file) throws IOException {
        ServletOutputStream out = res.getOutputStream();
        int length = 0;

        res.setContentType("application/octet-stream; charset=UTF-8");
        res.setContentLength((int) file.length());
        res.setHeader("Content-Disposition", "attachment; filename=\"" + file.getName() + "\"");

        byte[] buf = new byte[4096];
        DataInputStream in = new DataInputStream(new FileInputStream(file));
        while (((length = in.read(buf)) != -1)) {
            out.write(buf, 0, length);
        }
        in.close();
        out.flush();
        out.close();
    }

    private void browseTXT(HttpServletResponse res, File file) throws IOException {
        PrintWriter out = res.getWriter();
        BufferedReader bufferedReader = new BufferedReader(new FileReader(file));
        String f;
        while ((f = bufferedReader.readLine()) != null) {
            out.println(new String(f.getBytes(), "utf-8"));
        }
        out.close();
    }
}