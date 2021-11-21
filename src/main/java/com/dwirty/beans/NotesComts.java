package com.dwirty.beans;

public class NotesComts {
    private int note;
    private String commentaire, nom, prenom;

    public NotesComts(int note, String commentaire, String nom, String prenom) {
        this.note = note;
        this.commentaire = commentaire;
        this.nom = nom;
        this.prenom = prenom;
    }

    public int getNote() {
        return note;
    }

    public void setNote(int note) {
        this.note = note;
    }

    public String getCommentaire() {
        return commentaire;
    }

    public void setCommentaire(String commentaire) {
        this.commentaire = commentaire;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }


}