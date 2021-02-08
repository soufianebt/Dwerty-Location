/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dwerty.gestion;

import com.dwerty.beans.User;
import com.dwerty.beans.UserSession;
import com.dwerty.crud.*;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * This class for implements the methods of DAO interface
 */
public class GestionDAO implements DAO {
    

    
    /**
     * 
     *  Ajouter un utilisateur a la base de donnee
     */
    
    @Override
    public void addUser(User user) {
        
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        Transaction transaction = session.beginTransaction();
        
        session.save(user);
        
        transaction.commit();
        
        session.close();
        
        
    }

    @Override
    public void deleteUser(User user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void updateUser() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    // Methode for test user connexion test
    
    @Override
    public int testSessionUser(UserSession usersession) {
        
      
        List results = null;
        
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        String qr = " FROM User"
                + " where email_client_client = :email and password_client_client = :password";
        
       
        
        Query query = session.createQuery(qr);
        
        query.setParameter("email",usersession.getEmail());
        
        query.setParameter("password", usersession.getPassword());
        
        results = query.list();
        
        if( !results.isEmpty() ){
        
            return 1;
        }
        
        return 0;
        
        
    }
    
}
