package com.dwirty.controllers;

import com.dwirty.beans.ImageLogement;
import com.dwirty.beans.Logement;
import com.dwirty.beans.Notes;
import com.dwirty.gestion.GestionDAO;
import com.dwirty.gestion.OffrePresentation;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author kh
 */
public class ShowOffres extends HttpServlet {

    GestionDAO gestionDAO;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        gestionDAO = new GestionDAO();
        if ("1".equals(request.getParameter("created"))) {
            request.setAttribute("message", "Votre offre est publiee.");
        } else if ("1".equals(request.getParameter("updated"))) {
            request.setAttribute("message", "Les modifications sont enregistrees.");
        }
        String cin_pro = (String) request.getSession().getAttribute("iduser");
        List[] offre = gestionDAO.getOffrePro((String) cin_pro);

        if (offre.length != 0) {

            ArrayList<Logement> lg = new ArrayList<Logement>();
            ArrayList<ImageLogement> url = new ArrayList<ImageLogement>();
            ArrayList<Notes> notes = new ArrayList<Notes>();

            ArrayList<OffrePresentation> offrePre = new ArrayList<OffrePresentation>();

            for (int i = 0; i < offre[0].size(); i++) {

                lg.add((Logement) offre[0].get(i));
                url.add(OffrePresentation.imageFor(offre[1], lg.get(i)));
                notes.add((Notes) offre[2].get(i));

                OffrePresentation op = new OffrePresentation(lg.get(i).getTitre_log_logement(),
                        lg.get(i).getAdress_log_logement(),
                        url.get(i).getUrl_img_Image(),
                        lg.get(i).getPrix_log_logement(),
                        notes.get(i).getNbrNote(),
                        Math.round(notes.get(i).getNoteEvaluer())
                );
                offrePre.add(op);

            }

            request.setAttribute("logement", offrePre);


        }
        //request.setAttribute("hi",offre[0].size() );

        Cookie cookiess[] = request.getCookies();

        if (cookiess != null) {

            for (Cookie cookie : cookiess) {

                if (cookie.getName().equals("useremail")) {

                    request.setAttribute("useremail", cookie.getValue());

                }
            }
        }

        RequestDispatcher rd = request.getRequestDispatcher("/showoffre.jsp");
        rd.forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

