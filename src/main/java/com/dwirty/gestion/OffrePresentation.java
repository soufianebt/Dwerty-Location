package com.dwirty.gestion;

public class OffrePresentation {
    private String titre, ville, url;
    private int nbrNote;
    private double prix;
    private int avgNote;
    private int nbrLit;

    public OffrePresentation(String titre, String ville, String url, double prix, int nbrNote, int avgNote) {
        this.titre = titre;
        this.ville = ville;
        this.url = url;
        this.nbrNote = nbrNote;
        this.prix = prix;
        this.avgNote = avgNote;
    }

    public OffrePresentation(String titre, String ville, String url, double prix) {
        this.titre = titre;
        this.ville = ville;
        this.url = url;
        this.prix = prix;
    }

    public OffrePresentation(String titre, String ville, String url, double prix, int nbrNote, int avgNote, int nbrLit) {
        this.titre = titre;
        this.ville = ville;
        this.url = url;
        this.nbrNote = nbrNote;
        this.prix = prix;
        this.avgNote = avgNote;
        this.nbrLit = nbrLit;
    }


    public int getNbrLit() {
        return nbrLit;
    }

    public void setNbrLit(int nbrLit) {
        this.nbrLit = nbrLit;
    }


    public int getNbrNote() {
        return nbrNote;
    }

    public void setNbrNote(int nbrNote) {
        this.nbrNote = nbrNote;
    }

    public int getAvgNote() {
        return avgNote;
    }

    public void setAvgNote(int avgNote) {
        this.avgNote = avgNote;
    }


    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getVille() {
        return ville;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }


}
