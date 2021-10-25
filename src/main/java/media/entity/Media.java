package media.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Media {
    private String mediaid;
    private String mediatitle;
    private int typeid;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date uploaddate;
    private String description;
    private String Mediatype;
    private String mediaurl;
    private String typename;

    public String getMediaid() {
        return mediaid;
    }

    public void setMediaid(String mediaid) {
        this.mediaid = mediaid;
    }

    public String getMediatitle() {
        return mediatitle;
    }

    public void setMediatitle(String mediatitle) {
        this.mediatitle = mediatitle;
    }

    public int getTypeid() {
        return typeid;
    }

    public void setTypeid(int typeid) {
        this.typeid = typeid;
    }

    public Date getUploaddate() {
        return uploaddate;
    }

    public void setUploaddate(Date uploaddate) {
        this.uploaddate = uploaddate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    public String getMediatype() {
        return Mediatype;
    }

    public void setMediatype(String mediatype) {
        Mediatype = mediatype;
    }

    public String getMediaurl() {
        return mediaurl;
    }

    public void setMediaurl(String mediaurl) {
        this.mediaurl = mediaurl;
    }


    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    public Media() {
    }

    public Media(String mediaid, String mediatitle, int typeid, Date uploaddate, String description, String mediatype, String mediaurl, String typename) {
        this.mediaid = mediaid;
        this.mediatitle = mediatitle;
        this.typeid = typeid;
        this.uploaddate = uploaddate;
        this.description = description;
        Mediatype = mediatype;
        this.mediaurl = mediaurl;
        this.typename = typename;
    }

    @Override
    public String toString() {
        return "Media{" +
                "mediaid='" + mediaid + '\'' +
                ", mediatitle='" + mediatitle + '\'' +
                ", typeid=" + typeid +
                ", uploaddate=" + uploaddate +
                ", description='" + description + '\'' +
                ", Mediatype='" + Mediatype + '\'' +
                ", mediaurl='" + mediaurl + '\'' +
                ", typename='" + typename + '\'' +
                '}';
    }
}
