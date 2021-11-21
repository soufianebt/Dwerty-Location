package com.dwirty.controllers;

import com.dwirty.beans.*;
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
import java.util.Random;

@WebServlet(name = "LoginServlet", urlPatterns = "/LoginServlet" )
public class LoginServlet extends HttpServlet {

    private GestionDAO gestionDAO;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // DoGet methode
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //if(request.getAttribute("btn-connect"))
        RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
        rd.forward(request, response);

    }

    // DoPost methode
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        /*
         *
         * Test les informations de connexion de l'utilisateur
         */
        if (request.getParameter("login") != null) {

            UserSession usersession = new UserSession(request.getParameter("email"),
                    request.getParameter("password"),
                    new Random().nextInt(99999)
            );

            this.gestionDAO = new GestionDAO();
            List result = this.gestionDAO.testSessionUser(usersession);

            if (result.isEmpty()) {

                request.setAttribute("logintest", "field");

                request.setAttribute("message", "Email ou mot de passe est incorrect !");

            } else {

                request.setAttribute("logintest", "succes");

                request.setAttribute("message", "les informations sont correcte!");

                response.addCookie(new Cookie("useremail", request.getParameter("email")));
                response.addCookie(new Cookie("iduser", ((User) result.get(0)).getId()));

                request.setAttribute("useremail", request.getParameter("email"));





                /*
                Extract les offres deja existent sur la base de donnees
                 */
                gestionDAO = new GestionDAO();

                List[] offre = gestionDAO.getOffre();

                request.setAttribute("logement", this.traitOffre(offre));

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/home.jsp");

                requestDispatcher.forward(request, response);

            }




            /*
             *  Enregistrer la session de l'utilisateur avec la technique des coockies
             */
        } else if (request.getParameter("signup") != null) {

            /*
             * Enregistrer un nouvel utilisateur
             */
            User user = new User();

            Proprietaire proprietaire = new Proprietaire();

            user.setNom_client_client(request.getParameter("nom"));

            user.setPrenom_client_client(request.getParameter("prenom"));

            user.setEmail_client_client(request.getParameter("email"));

            user.setTele_client_client(request.getParameter("telephone"));

            user.setPassword_client_client(request.getParameter("password"));

            user.setId(user.getNom_client_client().substring(1, 3)
                    + user.getTele_client_client().substring(3, 5)
                    + new Random().nextInt(999999));

            if (request.getParameter("insc_type").equals("Locataire")) {

                user.setValide_email_client(1);

                /**
                 * Le new user is a proprietaire
                 */
                proprietaire.setCIN_prop_proprietaire(user.getId());
                proprietaire.setNom_prop_proprietaire(user.getNom_client_client());
                proprietaire.setPrenom_prop_proprietaire(user.getPrenom_client_client());

            } else {

                user.setValide_email_client(0);

            }

            this.gestionDAO = new GestionDAO();

            this.gestionDAO.addUser(user);

            /*
             * Dans le cas ou le client es coche la case du locataire donc on va enregistrer
             * le client comme etons un client proprietaire plus que un client normal
             */
            if (user.getId().equals(proprietaire.getCIN_prop_proprietaire())) {

                this.gestionDAO.addProprietaire(proprietaire);
            }

            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);

        }

    }

    /*
     * Cette fonction pour traite les offres returner depuis la connection ou base de donne
     *
     */
    private ArrayList<OffrePresentation> traitOffre(List[] offre) {

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

        return offrePre;

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
