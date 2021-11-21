package com.dwirty.beans;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "proprietaire")
public class Proprietaire {

    @Id
    String CIN_prop_proprietaire;

    String nom_prop_proprietaire, prenom_prop_proprietaire, tele_prop_proprietaire, email_prop_proprietaire, password_prop_proprietaire;


    int valide_email_proprietaire;
    String imgId_prop_proprietaire;
    int address_id_address_address;

    public String getCIN_prop_proprietaire() {
        return CIN_prop_proprietaire;
    }

    public void setCIN_prop_proprietaire(String CIN_prop_proprietaire) {
        this.CIN_prop_proprietaire = CIN_prop_proprietaire;
    }

    public String getNom_prop_proprietaire() {
        return nom_prop_proprietaire;
    }

    public void setNom_prop_proprietaire(String nom_prop_proprietaire) {
        this.nom_prop_proprietaire = nom_prop_proprietaire;
    }

    public String getPrenom_prop_proprietaire() {
        return prenom_prop_proprietaire;
    }

    public void setPrenom_prop_proprietaire(String prenom_prop_proprietaire) {
        this.prenom_prop_proprietaire = prenom_prop_proprietaire;
    }

    public String getTele_prop_proprietaire() {
        return tele_prop_proprietaire;
    }

    public void setTele_prop_proprietaire(String tele_prop_proprietaire) {
        this.tele_prop_proprietaire = tele_prop_proprietaire;
    }

    public String getEmail_prop_proprietaire() {
        return email_prop_proprietaire;
    }

    public void setEmail_prop_proprietaire(String email_prop_proprietaire) {
        this.email_prop_proprietaire = email_prop_proprietaire;
    }

    public String getPassword_prop_proprietaire() {
        return password_prop_proprietaire;
    }

    public void setPassword_prop_proprietaire(String password_prop_proprietaire) {
        this.password_prop_proprietaire = password_prop_proprietaire;
    }

    public int getValide_email_proprietaire() {
        return valide_email_proprietaire;
    }

    public void setValide_email_proprietaire(int valide_email_proprietaire) {
        this.valide_email_proprietaire = valide_email_proprietaire;
    }

    public String getImgId_prop_proprietaire() {
        return imgId_prop_proprietaire;
    }

    public void setImgId_prop_proprietaire(String imgId_prop_proprietaire) {
        this.imgId_prop_proprietaire = imgId_prop_proprietaire;
    }

    public int getAddress_id_address_address() {
        return address_id_address_address;
    }

    public void setAddress_id_address_address(int address_id_address_address) {
        this.address_id_address_address = address_id_address_address;
    }


}
