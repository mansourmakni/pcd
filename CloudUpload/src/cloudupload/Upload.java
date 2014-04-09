package cloudupload;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.images.ImagesService;
import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.images.ServingUrlOptions;

import java.util.Date;
import com.googlecode.objectify.annotation.*;


@Entity
@Cache
public class Upload {
    @Id Long id;
    @Index Date date;
    String url;
    @Index BlobKey key;
    String title;
    String description;
    String descri_d;
    @Index String categorie;
    
    private Upload() {}
    public Upload(BlobKey key, String description,String title,String descri_d,String categorie) {
        ImagesService imagesService = ImagesServiceFactory.getImagesService();
        
        this.date = new Date();
        this.key = key;
        this.url = imagesService.getServingUrl(ServingUrlOptions.Builder.withBlobKey(key));
        this.description = description;
        this.descri_d = descri_d;
        this.title = title;
        this.categorie = categorie;
    }
    

    public String getUrl() {
        return url;
    }
    public BlobKey getKey() {
        return key;
    }
    public String getKeyString() {
        return key.getKeyString();
    }
    public String getcategorie() {
        return categorie;
    }
    public void setcategorie(String categorie) {
        this.categorie = categorie;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    
}
