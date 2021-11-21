package com.dwirty.controllers;

import com.dwirty.beans.ImageLogement;
import com.dwirty.beans.Logement;
import com.dwirty.gestion.CompactUser;
import com.dwirty.gestion.GestionDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class ModifieOffre extends HttpServlet {

    GestionDAO gestionDAO;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        if (request.getParameter("btn_modifie") != null) {

            gestionDAO = new GestionDAO();
            List[] offreDetais = gestionDAO.getDetaisOffre(request.getParameter("btn_modifie"));


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

            response.addCookie(new Cookie("offretitre", lgs.getTitre_log_logement()));

            Cookie cookies[] = request.getCookies();

            if (cookies != null) {

                for (Cookie cookie : cookies) {

                    if (cookie.getName().equals("useremail")) {

                        request.setAttribute("useremail", cookie.getValue());

                    }
                }
            }

            RequestDispatcher rd = request.getRequestDispatcher("/modifieoffre.jsp");
            rd.forward(request, response);


        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("btn_save") != null) {

            String offreTitre = request.getParameter("offre_titre");

            String offreVille = request.getParameter("offre_ville");

            int offrePersonne = Integer.parseInt(request.getParameter("offre_personne"));

            int offreChambre = Integer.parseInt(request.getParameter("nbr_chambre_offre"));


            int offreChambreDouble = Integer.parseInt(request.getParameter("nbr_chambre_double"));


            int offreTotalLits = Integer.parseInt(request.getParameter("nbr_lits_total"));


            double offrePrix = Double.parseDouble(request.getParameter("offre_prix"));


            String offreDesc = request.getParameter("offre_desc");

            Logement logement = new Logement();

            logement.setAdress_log_logement(offreVille);
            logement.setTitre_log_logement(offreTitre);

            if (request.getParameter("offre_date_mod") != null) {

                String offreDateMod = request.getParameter("offre_date_mod");

                logement.setDisponibilite_log_logement(offreDateMod);

            }
            if (request.getParameter("disponibilite").equals("active")) {
                logement.setIs_hotel_logement(1);
            } else {
                logement.setIs_hotel_logement(0);
            }

            logement.setPrix_log_logement(offrePrix);
            logement.setPersone_capacite_logement(offrePersonne);
            logement.setDesc_general_logement(offreDesc);
            logement.setNbr_chambre_total(offreChambre);
            logement.setNbr_lit_double(offreChambreDouble);
            logement.setNbr_lit(offreTotalLits);

            gestionDAO = new GestionDAO();

            String titreOffre = new String("");
            Cookie cookies[] = request.getCookies();

            if (cookies != null) {

                for (Cookie cookie : cookies) {

                    if (cookie.getName().equals("offretitre")) {

                        titreOffre = cookie.getValue();

                    }
                }
            }
            gestionDAO.updateOffre(logement, titreOffre);

            request.setAttribute("message", "Les modifications sont enregistrées!");

            Cookie cookiess[] = request.getCookies();

            if (cookiess != null) {

                for (Cookie cookie : cookiess) {

                    if (cookie.getName().equals("useremail")) {

                        request.setAttribute("useremail", cookie.getValue());

                    }
                }
            }

            RequestDispatcher rd = request.getRequestDispatcher("/result.jsp");
            rd.forward(request, response);


        }

    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

