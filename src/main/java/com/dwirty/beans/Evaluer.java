package com.dwirty.beans;

import javax.persistence.*;

@Entity
@Table(name = "evaluer")
public class Evaluer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id_evaluer;
    int id_log_logement;
    String CIN_client_client;
    int etoiles_evaluer;
    String commentaire_evaluer;


    public int getId_evaluer() {
        return id_evaluer;
    }

    public void setId_evaluer(int id_evaluer) {
        this.id_evaluer = id_evaluer;
    }

    public int getId_log_logement() {
        return id_log_logement;
    }

    public void setId_log_logement(int id_log_logement) {
        this.id_log_logement = id_log_logement;
    }

    public String getCIN_client_client() {
        return CIN_client_client;
    }

    public void setCIN_client_client(String CIN_client_client) {
        this.CIN_client_client = CIN_client_client;
    }

    public int getEtoiles_evaluer() {
        return etoiles_evaluer;
    }

    public void setEtoiles_evaluer(int etoiles_evaluer) {
        this.etoiles_evaluer = etoiles_evaluer;
    }

    public String getCommentaire_evaluer() {
        return commentaire_evaluer;
    }

    public void setCommentaire_evaluer(String commentaire_evaluer) {
        this.commentaire_evaluer = commentaire_evaluer;
    }

}

