package com.dwirty.gestion;


public class CompactUser {

    String id;
    String nom_client_client;
    String prenom_client_client;
    String tele_client_client;

    public CompactUser(String id, String nom_client_client, String prenom_client_client, String tele_client_client) {
        this.id = id;
        this.nom_client_client = nom_client_client;
        this.prenom_client_client = prenom_client_client;
        this.tele_client_client = tele_client_client;
    }

    public String getTele_client_client() {
        return tele_client_client;
    }

    public void setTele_client_client(String tele_client_client) {
        this.tele_client_client = tele_client_client;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNom_client_client() {
        return nom_client_client;
    }

    public void setNom_client_client(String nom_client_client) {
        this.nom_client_client = nom_client_client;
    }

    public String getPrenom_client_client() {
        return prenom_client_client;
    }

    public void setPrenom_client_client(String prenom_client_client) {
        this.prenom_client_client = prenom_client_client;
    }


}