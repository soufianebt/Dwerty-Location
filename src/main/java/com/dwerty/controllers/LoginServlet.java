/*
 * This Servlet class for cotrole the Login & registre operation
 */
package com.dwerty.controllers;

import com.dwerty.beans.User;
import com.dwerty.beans.UserSession;
import com.dwerty.gestion.GestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(value = "/LoginServlet")
public class LoginServlet extends HttpServlet {

    private GestionDAO gestionDAO;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // DoGet methode
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
            int result = this.gestionDAO.testSessionUser(usersession);

            if (result == 0) {

                request.setAttribute("logintest", "field");

                request.setAttribute("message", "Email ou mot de passe est incorrect !");

            } else {

                request.setAttribute("logintest", "succes");

                request.setAttribute("message", "les informations sont correcte!");

            }

            RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
            rd.forward(request, response);

        } else if (request.getParameter("signup") != null) {

            /*
        *
        * Enregistrer un nouvel utilisateur
             */
            User user = new User();

            user.setNom_client_client(request.getParameter("nom"));

            user.setPrenom_client_client(request.getParameter("prenom"));

            user.setEmail_client_client(request.getParameter("email"));

            user.setTele_client_client(request.getParameter("telephone"));

            user.setPassword_client_client(request.getParameter("password"));

            user.setId(user.getNom_client_client().substring(1, 3)
                    + user.getTele_client_client().substring(3, 5)
                    + new Random().nextInt(999999));

            if( request.getParameter("insc_type").equals("Locataire")){
            
                    user.setValide_email_client(0);
            }else{
            
                   user.setValide_email_client(1);
            }
            

            this.gestionDAO = new GestionDAO();
            
            this.gestionDAO.addUser(user);
            
            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);

        }

    }

    public void destroy(){}
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
