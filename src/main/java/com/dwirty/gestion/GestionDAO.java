package com.dwirty.gestion;

import com.dwirty.beans.*;
import com.dwirty.crud.DAO;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class GestionDAO implements DAO {


    /**
     * Ajouter un utilisateur a la base de donnee
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
    public List testSessionUser(UserSession usersession) {


        List results = null;


        Session session = HibernateUtil.getSessionFactory().openSession();

        String qr = " FROM User"
                + " where email_client_client = :email and password_client_client = :password";


        Query query = session.createQuery(qr);

        query.setParameter("email", usersession.getEmail());

        query.setParameter("password", usersession.getPassword());

        results = query.list();

        if (!results.isEmpty()) {

            return results;
        }

        return results;


    }

    /*
        Gestion des offres
    */

    @Override
    public int addLogement(Logement logement) {

        int res = 0;

        Session session = HibernateUtil.getSessionFactory().openSession();

        Transaction transaction = session.beginTransaction();


        res = (int) session.save(logement);

        transaction.commit();

        session.close();


        return res;

    }

    @Override
    public int[] addChambre(ArrayList<Chambre> chambre, int logement) {


        int res[] = new int[chambre.size()];

        int i = 0;
        while (i < chambre.size()) {

            Session session = HibernateUtil.getSessionFactory().openSession();

            Transaction transaction = session.beginTransaction();

            res[i] = (int) session.save(chambre.get(i));

            transaction.commit();

            session.close();

            // ** New code


            i++;
        }

        // ** New code
      /*  i = 0;
        while( i < chambre.size() ){

            Session session = HibernateUtil.getSessionFactory().openSession();

            Transaction transaction = session.beginTransaction();

            Compose lcc = new Compose(logement, res[i]);

            res[i] = (int) session.save(lcc);

            transaction.commit();

            session.close();





            i++;
        }*/


        return res;

    }

    @Override
    public int addCompose(int logid, int[] chambre) {

        int i = 0;
        int res = 0;

        while (i < chambre.length) {

            Compose compose = new Compose(logid, chambre[i]);
            Session session = HibernateUtil.getSessionFactory().openSession();

            Transaction transaction = session.beginTransaction();

            session.save(compose);

            transaction.commit();


            session.close();
            i++;
        }


        return 0;

    }

    @Override
    public int addImage(ImageLogement[] imagelogement) {
        int res = 0;

        for (int i = 0; i < imagelogement.length; i++) {

            Session session = HibernateUtil.getSessionFactory().openSession();

            Transaction transaction = session.beginTransaction();

            session.save(imagelogement[i]);

            transaction.commit();


            session.close();

        }

        return res;
    }

    @Override
    public void addProprietaire(Proprietaire proprietaire) {

        Session session = HibernateUtil.getSessionFactory().openSession();

        Transaction transaction = session.beginTransaction();

        session.save(proprietaire);

        transaction.commit();


        session.close();

    }

    @Override
    public List[] getOffre() {

        List[] offres = new List[3];
        List notes = new ArrayList<Notes>();

        Session session = HibernateUtil.getSessionFactory().openSession();

        String qr = "FROM Logement";

        String qr2 = "FROM ImageLogement";


        Query query = session.createQuery(qr);

        Query query2 = session.createQuery(qr2);


        List results = query.list();
        List results2 = query2.list();

        offres[0] = results;
        offres[1] = results2;
        Notes note = null;
        for (int i = 0; i < offres[0].size(); i++) {

            String qr3 = "select count(id_evaluer),avg(etoiles_evaluer) from Evaluer where id_log_logement =:idlog";
            Query qrexe = session.createQuery(qr3);
            qrexe.setParameter("idlog", ((Logement) offres[0].get(i)).getId_log_logement());
            List reslt = qrexe.list();
            Object[] evaluer = (Object[]) reslt.get(0);

            if (evaluer[1] == null) {
                float vl = 0.0f;
                note = new Notes(vl, (int) ((long) evaluer[0]));
            } else {

                note = new Notes((float) ((double) evaluer[1]), (int) ((long) evaluer[0]));
            }

            notes.add(note);


        }
        offres[2] = notes;

        return offres;


    }

    @Override
    public List[] getDetaisOffre(String titreOffre) {

        List res[] = new List[3];
        List logement, propritaire;
        List images;
        Iterator itir;

        Session session = HibernateUtil.getSessionFactory().openSession();

        String qr1 = "FROM Logement where titre_log_logement =:titre";
        String qr2 = "select u.id,u.nom_client_client,u.prenom_client_client,u.tele_client_client FROM User as u,Logement as l where l.titre_log_logement =:titre and u.id = l.CIN_prop_proprietaire";
        String qr3 = "FROM ImageLogement where id_log_logement =:idlogement";
        Query query1 = session.createQuery(qr1);
        Query query2 = session.createQuery(qr2);
        Query query3 = session.createQuery(qr3);

        query1.setParameter("titre", titreOffre);
        query2.setParameter("titre", titreOffre);

        logement = query1.list();
        propritaire = query2.list();


        query3.setParameter("idlogement", (int) ((Logement) logement.get(0)).getId_log_logement());
        images = query3.list();

        res[0] = logement;
        res[1] = propritaire;
        res[2] = images;


        return res;
    }

    @Override
    public List[] getOffrePro(String cin_pro) {

        List[] offres = new List[3];
        List notes = new ArrayList<Notes>();

        Session session = HibernateUtil.getSessionFactory().openSession();

        String qr = "FROM Logement where CIN_prop_proprietaire =:cin_pro";

        String qr2 = "FROM ImageLogement where id_log_logement=:id_log";


        Query query = session.createQuery(qr);

        query.setParameter("cin_pro", cin_pro);

        List results = query.list();
        List results2 = new ArrayList<ImageLogement>();


        for (int i = 0; i < results.size(); i++) {

            Query query2 = session.createQuery(qr2);

            query2.setParameter("id_log", (int) ((Logement) results.get(i)).getId_log_logement());


            results2.add((ImageLogement) query2.list().get(0));
            results2.add((ImageLogement) query2.list().get(1));
            results2.add((ImageLogement) query2.list().get(2));


        }

        Notes note = null;
        for (int i = 0; i < results.size(); i++) {

            String qr3 = "select count(id_evaluer),avg(etoiles_evaluer) from Evaluer where id_log_logement =:idlog";
            Query qrexe = session.createQuery(qr3);
            qrexe.setParameter("idlog", ((Logement) results.get(i)).getId_log_logement());
            List reslt = qrexe.list();
            Object[] evaluer = (Object[]) reslt.get(0);

            if (evaluer[1] == null) {
                float vl = 0.0f;
                note = new Notes(vl, (int) ((long) evaluer[0]));
            } else {

                note = new Notes((float) ((double) evaluer[1]), (int) ((long) evaluer[0]));
            }

            notes.add(note);


        }


        offres[2] = notes;
        offres[0] = results;
        offres[1] = results2;

        return offres;
    }

    @Override
    public int updateOffre(Logement logement, String titreoffre) {

        int res = 0;
        Session session = HibernateUtil.getSessionFactory().openSession();
        String qr = "FROM Logement where titre_log_logement=:titre";
        Query query = session.createQuery(qr);
        query.setParameter("titre", titreoffre);
        List resLog = query.list();

        Logement newLogement = (Logement) session.load(Logement.class, ((Logement) resLog.get(0)).getId_log_logement());

        newLogement.setAdress_log_logement(logement.getAdress_log_logement());

        newLogement.setTitre_log_logement(logement.getTitre_log_logement());

        newLogement.setPrix_log_logement(logement.getPrix_log_logement());

        if (logement.getDisponibilite_log_logement() != null) {
            newLogement.setDisponibilite_log_logement(logement.getDisponibilite_log_logement());
        }
        newLogement.setIs_hotel_logement(logement.getIs_hotel_logement());
        newLogement.setNbr_lit_double(logement.getNbr_lit_double());

        newLogement.setDesc_general_logement(logement.getDesc_general_logement());

        newLogement.setPersone_capacite_logement(logement.getPersone_capacite_logement());

        newLogement.setNbr_chambre_total(logement.getNbr_chambre_total());

        newLogement.setNbr_lit(logement.getNbr_lit());

        Transaction transaction = session.beginTransaction();
        session.update(newLogement);
        transaction.commit();
        session.close();

        return res;

    }

    @Override
    public List[] getOffreSearch(String ville, double maxprix, double minprix, int nbrlit) {

        List[] offres = new List[3];
        List notes = new ArrayList<Notes>();
        Session session = HibernateUtil.getSessionFactory().openSession();

        String qr = "FROM Logement where (adress_log_logement=:ville and prix_log_logement<=:maxprix) and (prix_log_logement>:minprix and nbr_lit=:nbrlit)";
        if (maxprix > 600) {
            qr = "FROM Logement where (adress_log_logement=:ville and prix_log_logement>:maxprix) and (prix_log_logement>:minprix and nbr_lit=:nbrlit)";
        }


        String qr2 = "FROM ImageLogement where id_log_logement=:idlogm";


        Query query = session.createQuery(qr);


        query.setParameter("ville", ville);
        query.setParameter("maxprix", maxprix);
        query.setParameter("minprix", minprix);
        query.setParameter("nbrlit", nbrlit);


        List results = query.list();

        List results2 = new ArrayList<ImageLogement>();


        for (int i = 0; i < results.size(); i++) {
            Query query2 = session.createQuery(qr2);
            query2.setParameter("idlogm", (int) ((Logement) results.get(i)).getId_log_logement());

            results2.add((ImageLogement) query2.list().get(0));
            results2.add((ImageLogement) query2.list().get(1));
            results2.add((ImageLogement) query2.list().get(2));

        }


        Notes note = null;
        for (int i = 0; i < results.size(); i++) {

            String qr3 = "select count(id_evaluer),avg(etoiles_evaluer) from Evaluer where id_log_logement =:idlog";
            Query qrexe = session.createQuery(qr3);
            qrexe.setParameter("idlog", ((Logement) results.get(i)).getId_log_logement());
            List reslt = qrexe.list();
            Object[] evaluer = (Object[]) reslt.get(0);

            if (evaluer[1] == null) {
                float vl = 0.0f;
                note = new Notes(vl, (int) ((long) evaluer[0]));
            } else {

                note = new Notes((float) ((double) evaluer[1]), (int) ((long) evaluer[0]));
            }

            notes.add(note);


        }


        offres[0] = results;
        offres[1] = results2;
        offres[2] = notes;

        return offres;

    }

    // msg de client vers le propritaire


    @Override
    public int saveCommentaire(Evaluer ev) {
        int res = 0;

        Session session = HibernateUtil.getSessionFactory().openSession();

        Transaction transaction = session.beginTransaction();

        session.save(ev);

        transaction.commit();

        res = 1;


        session.close();


        return res;


    }

    @Override
    public int getEvaluation() {

        int res = 0;

        String qr = "FROM evaluer";


        return res;
    }

    @Override
    public List[] getNotesOffre(String titre) {
        List<Notes> results = new ArrayList<Notes>();
        List[] noteCommts = new List[2];
        Session session = HibernateUtil.getSessionFactory().openSession();
        String qr1 = "select count(id_evaluer),avg(etoiles_evaluer) from Evaluer where id_log_logement=:idlog";
        String qr2 = "FROM Logement where titre_log_logement=:titre";
        String qr3 = "select e.commentaire_evaluer,e.etoiles_evaluer,c.nom_client_client,c.prenom_client_client from Evaluer as e, User as c where id_log_logement =:idlog and e.CIN_client_client=c.id";

        Query query1 = session.createQuery(qr1);
        Query query2 = session.createQuery(qr2);

        query2.setParameter("titre", titre);

        List list2 = query2.list();

        query1.setParameter("idlog", ((Logement) list2.get(0)).getId_log_logement());

        List list1 = query1.list();

        Object[] evaluer = (Object[]) list1.get(0);

        Notes note;

        if (evaluer[1] == null) {
            float vl = 0.0f;
            note = new Notes(vl, (int) ((long) evaluer[0]));
        } else {

            note = new Notes((float) ((double) evaluer[1]), (int) ((long) evaluer[0]));
        }


        Query query3 = session.createQuery(qr3);
        query3.setParameter("idlog", ((Logement) list2.get(0)).getId_log_logement());
        List commtes = query3.list();
        results.add(note);
        noteCommts[0] = results;
        noteCommts[1] = commtes;

        return noteCommts;
    }

    @Override
    public String[] getUser(String cin) {
        String data[] = new String[2];
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query qr = session.createQuery("select nom_client_client,prenom_client_client from User where id=:cin");
        qr.setParameter("cin", cin);
        data[0] = (String) ((Object[]) qr.list().get(0))[0];
        data[1] = (String) ((Object[]) qr.list().get(0))[1];

        return data;
    }


}
