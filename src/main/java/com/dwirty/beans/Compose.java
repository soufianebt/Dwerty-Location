package com.dwirty.beans;


import javax.persistence.*;

@Entity
@Table(name = "compose")
public class Compose {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idcompose;
    private int id_log_logement;
    private int id_chambre_chambre;

    public Compose(int id_log_logement, int id_chambre_chambre) {

        this.id_log_logement = id_log_logement;
        this.id_chambre_chambre = id_chambre_chambre;
    }

    public int getIdcompose() {
        return idcompose;
    }

    public void setIdcompose(int idcompose) {
        this.idcompose = idcompose;
    }


    public int getId_log_logement() {
        return id_log_logement;
    }

    public void setId_log_logement(int id_log_logement) {
        this.id_log_logement = id_log_logement;
    }

    public int getId_chambre_chambre() {
        return id_chambre_chambre;
    }

    public void setId_chambre_chambre(int id_chambre_chambre) {
        this.id_chambre_chambre = id_chambre_chambre;
    }

}
