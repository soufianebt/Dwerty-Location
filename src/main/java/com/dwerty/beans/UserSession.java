/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dwerty.beans;

/**
 *
 * @author kh
 */
public class UserSession {
    
    private String email;
    private String password;
    private int Id;
    

    public UserSession(String email, String password, int Id) {
        this.email = email;
        this.password = password;
        this.Id = Id;
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

    public void setId(int Id) {
        this.Id = Id;
    }
    
    
}
