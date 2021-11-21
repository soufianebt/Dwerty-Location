package com.dwirty.beans;

import javax.persistence.*;

@Entity
@Table(name = "logement")

public class Logement {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private int id_log_logement;

    private int is_hotel_logement, persone_capacite_logement, nbr_lit, nbr_lit_double, nbr_chambre_total;

    private String disponibilite_log_logement;

    private double prix_log_logement;

    private String titre_log_logement, desc_general_logement, CIN_prop_proprietaire, adress_log_logement;


    public int getNbr_lit_double() {
        return nbr_lit_double;
    }

    public void setNbr_lit_double(int nbr_lit_double) {
        this.nbr_lit_double = nbr_lit_double;
    }

    public int getNbr_chambre_total() {
        return nbr_chambre_total;
    }

    /* public Logement(int id_log_logement, int disponibilite_log_logement, int is_hotel_logement, int persone_capacite_logement, double prix_log_logement, String titre_log_logement, String desc_general_logement, String CIN_prop_proprietaire) {
    this.id_log_logement = id_log_logement;
    this.disponibilite_log_logement = disponibilite_log_logement;
    this.is_hotel_logement = is_hotel_logement;
    this.persone_capacite_logement = persone_capacite_logement;
    this.prix_log_logement = prix_log_logement;
    this.titre_log_logement = titre_log_logement;
    this.desc_general_logement = desc_general_logement;
    this.CIN_prop_proprietaire = CIN_prop_proprietaire;
    }*/
    public void setNbr_chambre_total(int nbr_chambre_total) {
        this.nbr_chambre_total = nbr_chambre_total;
    }

    public String getAdress_log_logement() {
        return adress_log_logement;
    }

    public void setAdress_log_logement(String adress_log_logement) {
        this.adress_log_logement = adress_log_logement;
    }

    public int getNbr_lit() {
        return nbr_lit;
    }

    public void setNbr_lit(int nbr_lit) {
        this.nbr_lit = nbr_lit;
    }

    public int getId_log_logement() {
        return id_log_logement;
    }

    public void setId_log_logement(int id_log_logement) {
        this.id_log_logement = id_log_logement;
    }

    public String getDisponibilite_log_logement() {
        return disponibilite_log_logement;
    }

    public void setDisponibilite_log_logement(String disponibilite_log_logement) {
        this.disponibilite_log_logement = disponibilite_log_logement;
    }

    public int getIs_hotel_logement() {
        return is_hotel_logement;
    }

    public void setIs_hotel_logement(int is_hotel_logement) {
        this.is_hotel_logement = is_hotel_logement;
    }

    public int getPersone_capacite_logement() {
        return persone_capacite_logement;
    }

    public void setPersone_capacite_logement(int persone_capacite_logement) {
        this.persone_capacite_logement = persone_capacite_logement;
    }

    public double getPrix_log_logement() {
        return prix_log_logement;
    }

    public void setPrix_log_logement(double prix_log_logement) {
        this.prix_log_logement = prix_log_logement;
    }

    public String getTitre_log_logement() {
        return titre_log_logement;
    }

    public void setTitre_log_logement(String titre_log_logement) {
        this.titre_log_logement = titre_log_logement;
    }

    public String getDesc_general_logement() {
        return desc_general_logement;
    }

    public void setDesc_general_logement(String desc_general_logement) {
        this.desc_general_logement = desc_general_logement;
    }

    public String getCIN_prop_proprietaire() {
        return CIN_prop_proprietaire;
    }

    public void setCIN_prop_proprietaire(String CIN_prop_proprietaire) {
        this.CIN_prop_proprietaire = CIN_prop_proprietaire;
    }
}
