package com.dwirty.beans;

import com.dwirty.gestion.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class Main {
    public static void main(String[] args) {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();

        UserSession userSession = new UserSession("soufianeBOUTHIri@mail.com", "123456");
        session.save(userSession);
    }
}
