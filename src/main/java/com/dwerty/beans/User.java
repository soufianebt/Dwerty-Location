/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dwerty.beans;

import javax.persistence.*;

/**
 *
 * @author kh
 */

@Entity
@Table(name="Client")

public class User {

    
    
    @Id  
    @Column(name="CIN_client_client")
   
    private String id;
    
    private String nom_client_client,prenom_client_client,email_client_client,password_client_client;
    
    private String tele_client_client;
           
    @Column(nullable=true)
    private Integer valide_email_client;

    
    
    
// Client constructor

   
    
    
    
    public int getValide_email_client() {
        return valide_email_client;
    }

    public void setValide_email_client(int valide_email_client) {
        this.valide_email_client = valide_email_client;
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

    public String getEmail_client_client() {
        return email_client_client;
    }

    public void setEmail_client_client(String email_client_client) {
        this.email_client_client = email_client_client;
    }

    public String getPassword_client_client() {
        return password_client_client;
    }

    public void setPassword_client_client(String password_client_client) {
        this.password_client_client = password_client_client;
    }

    public String getTele_client_client() {
        return tele_client_client;
    }

    public void setTele_client_client(String tele_client_client) {
        this.tele_client_client = tele_client_client;
    }
    
   

   
}
