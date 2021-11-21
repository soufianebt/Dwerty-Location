package com.dwirty.beans;

import javax.persistence.*;

@Entity
@Table(name = "chambre")
public class Chambre {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id_chambre_chambre;

    String type_chambre_chambre;

    public int getId_chambre_chambre() {
        return id_chambre_chambre;
    }

    public void setId_chambre_chambre(int id_chambre_chambre) {
        this.id_chambre_chambre = id_chambre_chambre;
    }

    public String getType_chambre_chambre() {
        return type_chambre_chambre;
    }

    public void setType_chambre_chambre(String type_chambre_chambre) {
        this.type_chambre_chambre = type_chambre_chambre;
    }


}
