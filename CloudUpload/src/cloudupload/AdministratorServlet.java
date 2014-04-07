package cloudupload;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.blobstore.*;
import com.googlecode.objectify.ObjectifyService;

@SuppressWarnings("serial")
public class AdministratorServlet extends HttpServlet {
    static {
        ObjectifyService.register(Upload.class);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {
        BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();

        // RŽcup�re les derniers uploads
        List<Upload> uploads = ofy().load().type(Upload.class).order("-date").limit(9).list();
        req.setAttribute("uploads", uploads);

        // Supprime un upload si on l'a demandŽ
        if (req.getParameter("delete") != null) {
            BlobKey deleteUploadData = new BlobKey(req.getParameter("delete"));
            Upload deleteUploadInfos = ofy().load().type(Upload.class).filter("key", deleteUploadData).first().now();
            if (deleteUploadInfos != null) {
                blobstoreService.delete(deleteUploadData);
                ofy().delete().entity(deleteUploadInfos).now();
            }
        }

        this.getServletContext().getRequestDispatcher("/WEB-INF/admin.jsp").forward(req, resp);
        
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();

        Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(req);
        List<BlobKey> blobKeys = blobs.get("uploadedFile");

        Upload upload = new Upload(blobKeys.get(0), req.getParameter("description"),req.getParameter("title"),req.getParameter("descri_d"));

        ofy().save().entity(upload).now();

        resp.sendRedirect("/");

    }
}

