package com.dwirty.controllers;

import com.dwirty.beans.*;
import com.dwirty.gestion.CompactUser;
import com.dwirty.gestion.GestionDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


public class DetaisOffre extends HttpServlet {

    private GestionDAO gestionDAO;
    private String titre;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("btn_detais") != null) {

            // cette cookie seulemet pour refrecher la page jsp apres save de commentaire
            response.addCookie(new Cookie("titrelogemp", request.getParameter("btn_detais")));
            //
            gestionDAO = new GestionDAO();
            List[] offreDetais = gestionDAO.getDetaisOffre(request.getParameter("btn_detais"));
            List[] note = gestionDAO.getNotesOffre(request.getParameter("btn_detais"));
            List<NotesComts> notescomts = new ArrayList<NotesComts>();

            Object v[] = (Object[]) offreDetais[1].get(0);

            CompactUser compactuser = new CompactUser((String) v[0], (String) v[1], (String) v[2], (String) v[3]);

            Logement lgs = (Logement) offreDetais[0].get(0);

            ImageLogement imageslg1 = (ImageLogement) offreDetais[2].get(0);
            ImageLogement imageslg2 = (ImageLogement) offreDetais[2].get(1);
            ImageLogement imageslg3 = (ImageLogement) offreDetais[2].get(2);


            request.setAttribute("propritaire", compactuser);
            request.setAttribute("logement", lgs);
            request.setAttribute("imageslogement1", imageslg1);
            request.setAttribute("imageslogement2", imageslg2);
            request.setAttribute("imageslogement3", imageslg3);
            request.setAttribute("nbrnote", ((Notes) note[0].get(0)).getNbrNote());
            request.setAttribute("note", Math.round(((Notes) note[0].get(0)).getNoteEvaluer()));
            for (int i = 0; i < note[1].size(); i++) {
                Object n[] = (Object[]) note[1].get(i);
                NotesComts nm = new NotesComts((int) n[1], (String) n[0], (String) n[2], (String) n[3]);
                notescomts.add(nm);

            }
            request.setAttribute("commentaire", notescomts);

            Cookie cookies[] = request.getCookies();

            if (cookies != null) {

                for (Cookie cookie : cookies) {

                    if (cookie.getName().equals("useremail")) {

                        request.setAttribute("useremail", cookie.getValue());

                    }
                }
            }

            Cookie cookiess[] = request.getCookies();
            String user = null;

            if (cookiess != null) {

                for (Cookie cookie : cookiess) {

                    if (cookie.getName().equals("iduser")) {

                        user = cookie.getValue();

                    }
                }
            }

            String[] userdata = new String[2];
            userdata = new GestionDAO().getUser(user);

            request.setAttribute("nom", userdata[0]);
            request.setAttribute("prenom", userdata[1]);

            RequestDispatcher rd = request.getRequestDispatcher("/details.jsp");
            rd.forward(request, response);


        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        if (request.getParameter("save_commt") != null) {

            Evaluer ev = new Evaluer();
            ev.setCommentaire_evaluer((String) request.getParameter("commentaire"));
            ev.setEtoiles_evaluer(Integer.parseInt(request.getParameter("offre_note")));
            ev.setId_log_logement(Integer.parseInt(request.getParameter("save_commt")));

            String cin_client = new String();

            Cookie cookies[] = request.getCookies();

            if (cookies != null) {

                for (Cookie cookie : cookies) {

                    if (cookie.getName().equals("iduser")) {

                        cin_client = cookie.getValue();

                    }
                }
            }

            ev.setCIN_client_client(cin_client);
            gestionDAO = new GestionDAO();
            int res = gestionDAO.saveCommentaire(ev);
            if (res == 1) {

                Cookie cookiees[] = request.getCookies();

                if (cookiees != null) {

                    for (Cookie cookie : cookiees) {

                        if (cookie.getName().equals("useremail")) {

                            request.setAttribute("useremail", cookie.getValue());

                        }
                        if (cookie.getName().equals("titrelogemp")) {

                            this.titre = new String(cookie.getValue());

                        }

                    }
                }


                gestionDAO = new GestionDAO();
                List[] offreDetais = gestionDAO.getDetaisOffre(this.titre);
                List[] note = gestionDAO.getNotesOffre(this.titre);
                List<NotesComts> notescomts = new ArrayList<NotesComts>();

                Object v[] = (Object[]) offreDetais[1].get(0);

                CompactUser compactuser = new CompactUser((String) v[0], (String) v[1], (String) v[2], (String) v[3]);

                Logement lgs = (Logement) offreDetais[0].get(0);

                ImageLogement imageslg1 = (ImageLogement) offreDetais[2].get(0);
                ImageLogement imageslg2 = (ImageLogement) offreDetais[2].get(1);
                ImageLogement imageslg3 = (ImageLogement) offreDetais[2].get(2);


                request.setAttribute("propritaire", compactuser);
                request.setAttribute("logement", lgs);
                request.setAttribute("imageslogement1", imageslg1);
                request.setAttribute("imageslogement2", imageslg2);
                request.setAttribute("imageslogement3", imageslg3);
                request.setAttribute("nbrnote", ((Notes) note[0].get(0)).getNbrNote());
                request.setAttribute("note", Math.round(((Notes) note[0].get(0)).getNoteEvaluer()));
                for (int i = 0; i < note[1].size(); i++) {
                    Object n[] = (Object[]) note[1].get(i);
                    NotesComts nm = new NotesComts((int) n[1], (String) n[0], (String) n[2], (String) n[3]);
                    notescomts.add(nm);

                }
                request.setAttribute("commentaire", notescomts);


                Cookie cookiess[] = request.getCookies();
                String user = null;

                if (cookiess != null) {

                    for (Cookie cookie : cookiess) {

                        if (cookie.getName().equals("iduser")) {

                            user = cookie.getValue();

                        }
                    }
                }

                String[] userdata = new String[2];
                userdata = new GestionDAO().getUser(user);

                request.setAttribute("nom", userdata[0]);
                request.setAttribute("prenom", userdata[1]);


                RequestDispatcher rd = request.getRequestDispatcher("/details.jsp");
                rd.forward(request, response);
            } else {
            }

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
