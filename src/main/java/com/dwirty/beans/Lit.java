package com.dwirty.beans;

import javax.persistence.*;

@Entity
@Table(name = "lit")
public class Lit {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    int id_lit_lit;
    int double_lit_lit;
    int id_chambre_chambre;


    public int getId_lit_lit() {
        return id_lit_lit;
    }

    public void setId_lit_lit(int id_lit_lit) {
        this.id_lit_lit = id_lit_lit;
    }

    public int getDouble_lit_lit() {
        return double_lit_lit;
    }

    public void setDouble_lit_lit(int double_lit_lit) {
        this.double_lit_lit = double_lit_lit;
    }

    public int getId_chambre_chambre() {
        return id_chambre_chambre;
    }

    public void setId_chambre_chambre(int id_chambre_chambre) {
        this.id_chambre_chambre = id_chambre_chambre;
    }


}
