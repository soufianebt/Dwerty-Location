/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dwerty.gestion;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;



public class HibernateUtil {
    
    
     private static SessionFactory sessionFactory;


// Create a sessionFactory
     
    public  static SessionFactory getSessionFactory() {

        try {
            
            sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();

        } catch (Throwable ex) {

            System.err.println(" Initial SessionFactory creation failed" + ex);

            throw new ExceptionInInitializerError(ex);
        }

        return sessionFactory;
    }
    
}
