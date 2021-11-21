package com.dwirty.beans;


public class UserSession {

    private int Id;
    private String email;
    private String password;


    public UserSession(String email, String password, int id) {
        this.email = email;
        this.password = password;
        this.Id = id;
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

    public void setId(int id) {
        this.Id = id;
    }


}
