package media.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Type {
    private int typeid;
    private String typename;
    private String description;
    private String Typeimage;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date builddate;

    public int getTypeid() {
        return typeid;
    }

    public void setTypeid(int typeid) {
        this.typeid = typeid;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTypeimage() {
        return Typeimage;
    }

    public void setTypeimage(String typeimage) {
        Typeimage = typeimage;
    }

    public Date getBuilddate() {
        return builddate;
    }

    public void setBuilddate(Date builddate) {
        this.builddate = builddate;
    }
}
