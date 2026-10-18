package com.dwirty.controllers;

import com.dwirty.beans.*;
import com.dwirty.gestion.GestionDAO;
import com.dwirty.gestion.OffrePresentation;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CreateOffre", urlPatterns = {"/CreateOffre"})
@MultipartConfig
public class CreateOffre extends HttpServlet {

    /*
     * Ces deux attributs seulement pour triter les fichiers uployed
     */
    public static final int TAILLE_TAMPON = 10240;
    public static final String CHEMIN_FICHIERS = System.getenv().getOrDefault("UPLOAD_DIR", "C:\\Users");
    private GestionDAO gestionDAO;

    private static String getNomFichier(Part part) throws IOException {
        if (part == null || part.getSize() == 0) {
            return null;
        }
        String type = part.getContentType();
        String extension = "image/jpeg".equals(type) ? ".jpg" : "image/png".equals(type) ? ".png" : null;
        if (extension == null) {
            return null;
        }
        try (InputStream input = part.getInputStream()) {
            if (javax.imageio.ImageIO.read(input) == null) {
                return null;
            }
        }
        return java.util.UUID.randomUUID().toString() + extension;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("btn_go_home") != null) {

            /*
             * Botton go home de dernier fenettre dans les fenettre de creation de l'offre
             */
            gestionDAO = new GestionDAO();

            List[] offre = gestionDAO.getOffre();

            request.setAttribute("logement", this.traitOffre(offre));

            Cookie cookies[] = request.getCookies();

            if (cookies != null) {

                for (Cookie cookie : cookies) {

                    if (cookie.getName().equals("useremail")) {

                        request.setAttribute("useremail", cookie.getValue());

                    }
                }
            }

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/home.jsp");

            requestDispatcher.forward(request, response);

        } else {

            Cookie cookies[] = request.getCookies();

            if (cookies != null) {

                for (Cookie cookie : cookies) {

                    if (cookie.getName().equals("useremail")) {

                        request.setAttribute("useremail", cookie.getValue());

                    }
                }
            }

            RequestDispatcher rd = request.getRequestDispatcher("/creer_offre1.jsp");
            rd.forward(request, response);

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        /*
         * Pour le premier forme de creation de l'offre
         */
        Cookie cookiess[] = request.getCookies();

        if (cookiess != null) {

            for (Cookie cookie : cookiess) {

                if (cookie.getName().equals("useremail")) {

                    request.setAttribute("useremail", cookie.getValue());

                }
            }
        }

        if ((request.getParameter("submit_1") != null && request.getParameter("submit_2") == null) && request.getParameter("submit_3") == null) {

            String titre = request.getParameter("titre_offre");

            String description = request.getParameter("description_offre");

            String province = request.getParameter("province_offre");

            String ville = request.getParameter("ville_offre");


            if ((titre == null || description == null) || (titre.equals("") || description.equals(""))) {

                request.setAttribute("titre", titre);

                request.setAttribute("description", description);

                request.setAttribute("message", "Les informations sont incomplete!");

                RequestDispatcher rd = request.getRequestDispatcher("/creer_offre1.jsp");

                rd.forward(request, response);

            } else {

                request.setAttribute("titre", titre);

                request.setAttribute("description", description);

                request.setAttribute("province", province);

                request.setAttribute("ville", ville);

                /*
                    Ajouter des sessions
                */
                HttpSession session = request.getSession();

                session.setAttribute("titre", titre);

                session.setAttribute("description", description);

                session.setAttribute("province", province);

                session.setAttribute("ville", ville);


                RequestDispatcher rd = request.getRequestDispatcher("/creer_offre2.jsp");

                rd.forward(request, response);
            }

            /*
             * Pour la deusieme forme de creation de l'offre
             */

        } else if (request.getParameter("submit_2") != null && request.getParameter("img_offre1") == null) {


            int chambre_total, chambre_double, lit_total, max_persone;
            double prix_offre;
            try {
                chambre_total = Integer.parseInt(request.getParameter("chambre_offre"));
                chambre_double = Integer.parseInt(request.getParameter("chambre_double_offre"));
                lit_total = Integer.parseInt(request.getParameter("lit_offre"));
                max_persone = Integer.parseInt(request.getParameter("max_offre"));
                prix_offre = Double.parseDouble(request.getParameter("prix_offre"));
            } catch (NumberFormatException exception) {
                request.setAttribute("message", "Completez les informations numeriques du logement.");
                request.getRequestDispatcher("/creer_offre2.jsp").forward(request, response);
                return;
            }
            String date_offre = request.getParameter("date_offre");
            if (!Double.isFinite(prix_offre) || prix_offre <= 0 || chambre_total < 1 || chambre_double < 0
                    || chambre_double > chambre_total || lit_total < 1 || max_persone < 1
                    || date_offre == null || date_offre.isEmpty()) {

                request.setAttribute("message", "Les informations sont incorrect!");

                RequestDispatcher rd = request.getRequestDispatcher("/creer_offre2.jsp");

                rd.forward(request, response);

            } else {

                HttpSession session = request.getSession();

                session.setAttribute("chambre_total", chambre_total);
                session.setAttribute("chambre_double", chambre_double);
                session.setAttribute("lit_total", lit_total);
                session.setAttribute("prix_offre", prix_offre);
                session.setAttribute("date_offre", date_offre);
                session.setAttribute("max_persone", max_persone);

                RequestDispatcher rd = request.getRequestDispatcher("/creer_offre3.jsp");

                rd.forward(request, response);

            }

            /*
             * Pour la troisieme forme de creation de l'offre
             */

        } else if (request.getContentType() != null && request.getContentType().startsWith("multipart/form-data")) {



            /*
             *  Traitement le fichier
             */
            Part part1 = request.getPart("img_offre1");

            Part part2 = request.getPart("img_offre2");

            Part part3 = request.getPart("img_offre3");

            // On vérifie qu'on a bien reçu un fichier

            String nomFichier1 = getNomFichier(part1);

            String nomFichier2 = getNomFichier(part2);

            String nomFichier3 = getNomFichier(part3);
            if (nomFichier1 == null || nomFichier2 == null || nomFichier3 == null
                    || request.getSession().getAttribute("titre") == null || request.getSession().getAttribute("prix_offre") == null) {
                request.setAttribute("message", "Ajoutez trois images JPEG ou PNG valides et completez les etapes precedentes.");
                request.getRequestDispatcher("/creer_offre3.jsp").forward(request, response);
                return;
            }

            /*
             * Premier Image
             */

            if (nomFichier1 != null && !nomFichier1.isEmpty()) {

                String nomChamp = part1.getName();

                // Corrige un bug du fonctionnement d'Internet Explorer

                nomFichier1 = nomFichier1.substring(nomFichier1.lastIndexOf('/') + 1)

                        .substring(nomFichier1.lastIndexOf('\\') + 1);

                // On écrit définitivement le fichier sur le disque

                ecrireFichier(part1, nomFichier1, CHEMIN_FICHIERS);

                //request.setAttribute("message", nomFichier1);


                /*
                 * Deuxieme Image
                 */

            }
            if (nomFichier2 != null && !nomFichier2.isEmpty()) {

                String nomChamp = part2.getName();


                nomFichier2 = nomFichier2.substring(nomFichier2.lastIndexOf('/') + 1)

                        .substring(nomFichier2.lastIndexOf('\\') + 1);


                ecrireFichier(part2, nomFichier2, CHEMIN_FICHIERS);


                //request.setAttribute("message", nomFichier2);


                /*
                 * Troisieme Image
                 */

            }
            if (nomFichier3 != null && !nomFichier3.isEmpty()) {

                String nomChamp = part3.getName();


                nomFichier3 = nomFichier3.substring(nomFichier3.lastIndexOf('/') + 1)

                        .substring(nomFichier3.lastIndexOf('\\') + 1);


                ecrireFichier(part3, nomFichier3, CHEMIN_FICHIERS);

                //request.setAttribute("message", nomFichier3);


            }


            HttpSession session = request.getSession();



            /*
             *
             *  Construction la class Logement
             */

            Logement logement = new Logement();
            ArrayList<Chambre> chambreListe = new ArrayList<Chambre>();
            Lit lit = new Lit();
            ImageLogement[] imageLogement = new ImageLogement[3];


            logement.setIs_hotel_logement(1);
            logement.setPrix_log_logement((double) session.getAttribute("prix_offre"));
            logement.setPersone_capacite_logement((int) session.getAttribute("max_persone"));
            logement.setTitre_log_logement((String) session.getAttribute("titre"));
            logement.setDesc_general_logement((String) session.getAttribute("description"));
            logement.setDisponibilite_log_logement((String) session.getAttribute("date_offre"));
            logement.setNbr_lit((int) session.getAttribute("lit_total"));
            logement.setNbr_chambre_total((int) session.getAttribute("chambre_total"));
            logement.setNbr_lit_double((int) session.getAttribute("chambre_double"));

            logement.setCIN_prop_proprietaire((String) session.getAttribute("iduser"));


            logement.setAdress_log_logement((String) session.getAttribute("ville"));

            for (int i = 0; i < (int) session.getAttribute("chambre_total"); i++) {

                if (i < (int) session.getAttribute("chambre_double")) {

                    Chambre chambre = new Chambre();
                    chambre.setType_chambre_chambre("double");
                    chambreListe.add(chambre);

                } else {

                    Chambre chambre = new Chambre();
                    chambre.setType_chambre_chambre("simple");
                    chambreListe.add(chambre);

                }
            }


            gestionDAO = new GestionDAO();

            int res = gestionDAO.addLogement(logement);

            int reschambre[] = gestionDAO.addChambre(chambreListe, res);

            int rescompose = gestionDAO.addCompose(res, reschambre);

            imageLogement[0] = new ImageLogement();
            imageLogement[0].setId_log_logement(res);
            imageLogement[0].setUrl_img_Image("img/" + nomFichier1);

            imageLogement[1] = new ImageLogement();
            imageLogement[1].setId_log_logement(res);
            imageLogement[1].setUrl_img_Image("img/" + nomFichier2);

            imageLogement[2] = new ImageLogement();
            imageLogement[2].setId_log_logement(res);
            imageLogement[2].setUrl_img_Image("img/" + nomFichier3);

            gestionDAO.addImage(imageLogement);

            session.removeAttribute("titre");
            session.removeAttribute("prix_offre");
            response.sendRedirect(request.getContextPath() + "/ShowOffres?created=1");


            /*
             *  Page d'erreur dans le cas ou quelque problem apparait
             */

        } else {

            request.setAttribute("message", "Les informations sont incomplete!");

            RequestDispatcher rd = request.getRequestDispatcher("/result.jsp");

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

        return offrePre;

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    /*
     *  Ces deux methodes seulement pour treter les fichiers
     */
    private void ecrireFichier(Part part, String nomFichier, String chemin) throws IOException {
        java.nio.file.Files.createDirectories(java.nio.file.Paths.get(chemin));
        try (BufferedInputStream entree = new BufferedInputStream(part.getInputStream(), TAILLE_TAMPON);
             BufferedOutputStream sortie = new BufferedOutputStream(new FileOutputStream(new File(chemin, nomFichier)), TAILLE_TAMPON)) {
            byte[] tampon = new byte[TAILLE_TAMPON];
            int longueur;
            while ((longueur = entree.read(tampon)) > 0) {
                sortie.write(tampon, 0, longueur);
            }
        }
    }

}
