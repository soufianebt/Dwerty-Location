package com.dwirty.beans;

import javax.persistence.*;


@Entity
@Table(name = "UserSession")
public class UserSession {
    @Id
    @Column(name = "UserSessionId")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int Id;
    private String email;
    private String password;



    public UserSession(String email, String password) {
        this.email = email;
        this.password = password;

    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getId() {
        return Id;
    }



}
