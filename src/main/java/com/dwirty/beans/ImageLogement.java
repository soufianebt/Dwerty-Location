package com.dwirty.beans;


import javax.persistence.*;

@Entity
@Table(name = "image")
public class ImageLogement {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    int id_image_Image;

    int id_log_logement;

    String url_img_Image, legende_Image;


    public int getId_image_Image() {
        return id_image_Image;
    }

    public void setId_image_Image(int id_image_Image) {
        this.id_image_Image = id_image_Image;
    }

    public int getId_log_logement() {
        return id_log_logement;
    }

    public void setId_log_logement(int id_log_logement) {
        this.id_log_logement = id_log_logement;
    }

    public String getUrl_img_Image() {
        return url_img_Image;
    }

    public void setUrl_img_Image(String url_img_Image) {
        this.url_img_Image = url_img_Image;
    }

    public String getLegende_Image() {
        return legende_Image;
    }

    public void setLegende_Image(String legende_Image) {
        this.legende_Image = legende_Image;
    }


}
