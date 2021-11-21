package com.dwirty.controllers;

import com.dwirty.beans.ImageLogement;
import com.dwirty.beans.Logement;
import com.dwirty.beans.Notes;
import com.dwirty.gestion.GestionDAO;
import com.dwirty.gestion.OffrePresentation;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "HomeServlet", urlPatterns = {"/"})
public class HomeServlet extends HttpServlet {

    private GestionDAO gestionDAO;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("search") == null) {
            gestionDAO = new GestionDAO();

            List[] offre = gestionDAO.getOffre();
            ArrayList<Logement> lg = new ArrayList<Logement>();
            ArrayList<ImageLogement> url = new ArrayList<ImageLogement>();
            ArrayList<Notes> notes = new ArrayList<Notes>();

            ArrayList<OffrePresentation> offrePre = new ArrayList<OffrePresentation>();

            for (int i = 0; i < offre[0].size(); i++) {

                lg.add((Logement) offre[0].get(i));
                url.add((ImageLogement) offre[1].get(i * 3));
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

            /*
             *   si le client deja connecter donc entrer directement
             */
            Cookie cookies[] = request.getCookies();

            if (cookies != null) {

                for (Cookie cookie : cookies) {

                    if (cookie.getName().equals("useremail")) {

                        request.setAttribute("useremail", cookie.getValue());

                    }
                }
            }

            request.setAttribute("logement", offrePre);

            //request.setAttribute("image",url );
            RequestDispatcher rd = request.getRequestDispatcher("/home.jsp");
            rd.forward(request, response);

        } else {

            // Recherche
            String ville = request.getParameter("search_ville");
            double prixmax = Double.parseDouble(request.getParameter("prix_search"));
            double prixmin = (double) (prixmax - Double.parseDouble("200"));
            int nbrlit = Integer.parseInt(request.getParameter("lit_search"));
            gestionDAO = new GestionDAO();

            List[] offre = gestionDAO.getOffreSearch(ville, prixmax, prixmin, nbrlit);

            ArrayList<Logement> lg = new ArrayList<Logement>();
            ArrayList<ImageLogement> url = new ArrayList<ImageLogement>();
            ArrayList<Notes> notes = new ArrayList<Notes>();

            ArrayList<OffrePresentation> offreSear = new ArrayList<OffrePresentation>();

            for (int i = 0; i < offre[0].size(); i++) {

                lg.add((Logement) offre[0].get(i));
                url.add((ImageLogement) offre[1].get(i * 3));
                notes.add((Notes) offre[2].get(i));

                OffrePresentation op = new OffrePresentation(lg.get(i).getTitre_log_logement(),
                        lg.get(i).getAdress_log_logement(),
                        url.get(i).getUrl_img_Image(),
                        lg.get(i).getPrix_log_logement(),
                        notes.get(i).getNbrNote(),
                        Math.round(notes.get(i).getNoteEvaluer()),
                        lg.get(i).getNbr_lit()
                );
                offreSear.add(op);

            }

            request.setAttribute("logement", offreSear);
            request.setAttribute("searchx", "yes");
            Cookie cookies[] = request.getCookies();

            if (cookies != null) {

                for (Cookie cookie : cookies) {

                    if (cookie.getName().equals("useremail")) {

                        request.setAttribute("useremail", cookie.getValue());

                    }
                }
            }

            //request.setAttribute("image",url );
            RequestDispatcher rd = request.getRequestDispatcher("/home.jsp");
            rd.forward(request, response);


        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
