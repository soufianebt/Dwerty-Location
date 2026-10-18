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
import java.util.Locale;
import java.util.UUID;
import java.nio.charset.StandardCharsets;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

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

        if ("1".equals(request.getParameter("registered"))) {
            request.setAttribute("message", "Votre compte est cree. Vous pouvez vous connecter.");
            request.setAttribute("success", true);
        }
        RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
        rd.forward(request, response);

    }

    // DoPost methode
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        if (request.getParameter("logout") != null) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        GestionDAO gestionDAO = new GestionDAO();
        String email = value(request, "email").toLowerCase(Locale.ROOT);
        String password = request.getParameter("password");
        if (request.getParameter("signup") != null) {
            String nom = value(request, "nom");
            String prenom = value(request, "prenom");
            String telephone = value(request, "telephone");
            if (nom.isEmpty() || prenom.isEmpty() || !email.matches("[^\\s@]+@[^\\s@]+\\.[^\\s@]+")
                    || !telephone.matches("[+0-9 ()-]{6,25}") || password == null || password.length() < 8
                    || password.getBytes(StandardCharsets.UTF_8).length > 72) {
                showError(request, response, "/signup.jsp", "Verifiez les champs. Le mot de passe doit contenir au moins 8 caracteres (72 octets maximum).");
                return;
            }
            if (!password.equals(request.getParameter("validepassword"))) {
                showError(request, response, "/signup.jsp", "Les mots de passe ne correspondent pas.");
                return;
            }
            String role = value(request, "insc_type");
            if (!"Locataire".equals(role) && !"Benefice".equals(role)) {
                showError(request, response, "/signup.jsp", "Choisissez un profil.");
                return;
            }
            if (gestionDAO.findUserByEmail(email) != null) {
                showError(request, response, "/signup.jsp", "Un compte utilise deja cette adresse e-mail.");
                return;
            }
            User user = new User();
            user.setId(UUID.randomUUID().toString());
            user.setNom_client_client(nom);
            user.setPrenom_client_client(prenom);
            user.setTele_client_client(telephone);
            user.setEmail_client_client(email);
            user.setPassword_client_client(BCrypt.hashpw(password, BCrypt.gensalt(12)));
            user.setValide_email_client("Locataire".equals(role) ? 1 : 0);
            gestionDAO.registerUser(user);
            response.sendRedirect(request.getContextPath() + "/LoginServlet?registered=1");
            return;
        }
        if (password == null || email.isEmpty() || password.getBytes(StandardCharsets.UTF_8).length > 72) {
            showError(request, response, "/login.jsp", "Saisissez votre e-mail et votre mot de passe.");
            return;
        }
        List results = gestionDAO.testSessionUser(new UserSession(email, password, 0));
        if (results.isEmpty()) {
            showError(request, response, "/login.jsp", "E-mail ou mot de passe incorrect.");
            return;
        }
        User user = (User) results.get(0);
        HttpSession session = request.getSession();
        request.changeSessionId();
        session.setAttribute("useremail", user.getEmail_client_client());
        session.setAttribute("iduser", user.getId());
        session.setAttribute("owner", user.getValide_email_client() == 1);
        session.setAttribute("displayName", user.getPrenom_client_client());
        response.sendRedirect(request.getContextPath() + "/");
    }

    private String value(HttpServletRequest request, String name) {
        String value = request.getParameter(name);
        return value == null ? "" : value.trim();
    }

    private void showError(HttpServletRequest request, HttpServletResponse response, String view, String message)
            throws ServletException, IOException {
        request.setAttribute("message", message);
        request.getRequestDispatcher(view).forward(request, response);
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
