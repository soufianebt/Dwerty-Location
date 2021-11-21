<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Modifer une offre</title>
    <link rel="stylesheet" href="bootstrap.min.css">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">

    <link rel="stylesheet" href="create_offre_style1.css"/>
    <link rel="stylesheet" href="style/bootstrap/js/bootstrap.min.js">
    <link rel="stylesheet" href="style/Footer.css">

    <style>

        .div-details {
            width: 90%;
            height: 600px;

            margin-top: 10px;
            margin-left: 5%;
            border-radius: 20px;
            display: inline-block;
        }

        .img-1 {

            width: 60%;
            height: 450px;
            background-color: #000;
            margin-top: 30px;
            margin-left: 2%;
            border-radius: 20px 0px 0px 20px;
            display: inline-block;

        }

        .img-2 {
            display: inline-block;
            width: 35%;
            height: 223px;
            background-color: #000;
            margin-top: 259.5px;
            margin-left: 0.25%;
            border-radius: 0px 0px 20px 0px;

        }

        .img-3 {
            display: inline-block;
            width: 35%;
            height: 222px;
            background-color: #000;
            margin-bottom: 199px;
            margin-left: -35.36%;
            border-radius: 0px 20px 0px 0px;

        }

        .offre-info {

            display: inline-block;
            width: 86%;
            height: 600px;
            /*margin-bottom: 0%;*/
            /*margin-top: -200px;*/


            border-radius: 20px 20px 20px 20px;
            padding-left: 10px;
            margin-top: -50px;
            margin-left: 6.5%;
            margin-bottom: 30px;
            box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            padding-top: 20px;
            padding-left: 20px;
            padding-right: 20px;


        }

        .offre-titre {

            margin-top: 100px;
            margin-left: 6.5%;
            font-size: 35px;
            display: block;
            height: 70px;
            border-radius: 10px;
            padding-left: 20px;

        }

        .offre-icone {
            display: inline-block;
            margin-top: -10px;
            margin-left: 6.5%;


        }

        .offre-ville {
            display: inline-block;
            font-size: 19px;
            margin-left: 14px;
            margin-top: 10px;
            width: 250px;

        }

        p {
            font-size: 20px;
            text-align: left;
        }

        .propritaire-info {
            display: inline-block;
            width: 32%;
            height: 300px;

            margin-top: -100px;
            margin-bottom: -200px;
            margin-left: 5px;
            border-radius: 0px 20px 20px 0px;
            box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

        .img-prop {
            display: inline-block;
            margin-top: -5px;
        }

        .prop-p {
            display: inline-block;
            margin-left: 15px;
            margin-top: 30px;
        }

        offre-date-disponibilite {
            display: inline-block;
            padding-left: 20px;
            margin-left: 20px;
        }

        .offre-propritaire {
            margin-left: 44px;
            margin-bottom: 2px;
            font-size: 20px;
        }

        .offre-propritaire-tele {
            margin-top: 0px;
            margin-left: 44px;
            font-size: 20px;
        }

        input {
            width: 50px;
            border-radius: 10px;
            height: 30px;
        }

        .offre-prix-mod {
            width: 85px;
        }

        .offre-desc {
            width: 80%;
            height: 90px;

        }

        .btn-to-explor {


            margin-left: 70%;
            margin-top: 60px;
            width: 300px;
            height: 40px;
            border-radius: 40px;
            border: 0px;

        }

        .btn-to-explor:hover {


            background-color: green;
            color: white;
            font-size: 15px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);

        }

        .offre-titre-mod {
            width: 600px;
            height: 60px;

        }

        .offre-date-mod {
            display: inline-block;
            width: 200px;
        }

        .container {
            display: block;
            position: relative;
            padding-left: 35px;
            margin-bottom: 12px;
            cursor: pointer;
            font-size: 22px;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        /* Hide the browser's default radio button */
        .container input {
            position: absolute;
            opacity: 0;
            cursor: pointer;
        }

        /* Create a custom radio button */
        .checkmark {
            position: absolute;
            top: 0;
            left: 0;
            height: 25px;
            width: 25px;
            background-color: #E7EAE7;
            border-radius: 50%;
        }

        /* On mouse-over, add a grey background color */
        .container:hover input ~ .checkmark {
            background-color: #E7EAE7;
        }

        /* When the radio button is checked, add a blue background */
        .container input:checked ~ .checkmark {
            background-color: green;
        }

        /* Create the indicator (the dot/circle - hidden when not checked) */
        .checkmark:after {
            content: "";
            position: absolute;
            display: none;
        }

        /* Show the indicator (dot/circle) when checked */
        .container input:checked ~ .checkmark:after {
            display: block;
        }

        /* Style the indicator (dot/circle) */
        .container .checkmark:after {
            top: 9px;
            left: 9px;
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background: white;
        }
    </style>
</head>
<body>


<nav class="navbar navbar-light navbar-expand bg-light navigation-clean">
    <div class="container"><img src="img/LOGO1.png" width=45px height=45px/><a class="navbar-brand" href="#">Dwerty</a>
        <button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"></button>
        <div class="collapse navbar-collapse" id="navcol-1">
            <a class="navbar-brand" href="http://localhost:8081/DwertyOfficiel/CreateOffre"
               style="margin-left: 10%;font-size: 17px;">Creer un offre</a>
            <a class="navbar-brand" href="http://localhost:8081/DwertyOfficiel/ShowOffres"
               style="margin-left: 3%;font-size: 17px;">Afficher mes offres</a>
            <a class="btn btn-primary ml-auto" role="button" href="http://localhost:8081/DwertyOfficiel/LoginServlet">
                <c:choose>
                    <c:when test="${!empty useremail}">
                        Deconnecter
                    </c:when>
                    <c:otherwise>
                        Se connecter
                    </c:otherwise>
                </c:choose></a>

        </div>
    </div>
</nav>

<form method="post" action="ModifieOffre">
    <textarea class="offre-titre" name="offre_titre"><c:out value="${logement.titre_log_logement}"></c:out></textarea>
    <img class="offre-icone" src="img/espace-reserve.png"/>

    <select name="offre_ville" class="offre-ville">

        <option value=<c:out value="${logement.adress_log_logement}"></c:out>><c:out
                value="${logement.adress_log_logement}"></c:out></option>
        <option value="Rabat-sale">Rabat</option>
        <option value="Layoun">Dakhla</option>

    </select>


    <div class="div-details">

        <c:if test="${!empty imageslogement1}"></c:if>

        <img class="img-1" src="<c:out value="${imageslogement1.url_img_Image}"></c:out>"/>


        <img class="img-2" src="<c:out value="${imageslogement2.url_img_Image}"></c:out>"/>


        <img class="img-3" src="<c:out value="${imageslogement3.url_img_Image}"></c:out>"/>


    </div>

    <div class="offre-info">


        <p class="offre-chambre-double-lit" name="offre_chambre_double_lit"><b><input type="number"
                                                                                      name="nbr_chambre_offre" value=
                <c:out value="${logement.nbr_chambre_total} "></c:out>/> chambre , <input type="number"
                                                                                          name="nbr_chambre_double"
                                                                                          value=
                <c:out value="${logement.nbr_lit_double} "></c:out>/>
            chambre double , <input type="number" name="nbr_lits_total" value=<c:out
                    value="${logement.nbr_lit} "></c:out>/> lits en total</b></p>
        <p class="offre-persone" name="offre_persone"><b>Support jusqu'à <input type="number" name="offre_personne"
                                                                                value=<c:out
                value=" ${logement.persone_capacite_logement} "></c:out>/> personnes </b></p>
        <p class="offre-prix" name="offre_prix" style="color:green"><b>Prix: <input class="offre-prix-mod"
                                                                                    name="offre_prix" type="number"
                                                                                    value=<c:out
                value=" ${logement.prix_log_logement} "></c:out>/> dh / Nuit</b></p>
        <c:if test="${logement.is_hotel_logement == 0}">
            <p><b class="disponibilite" style="color: #000">Disponibilite de l'offre</b></p>

            <p class="offre-date-disponibilite" name="offre_date_disponibilite" style="color:red;"><b>Sera disponible le
                :<c:out value="  ${logement.disponibilite_log_logement}"></c:out></b> <b
                    style="color: orange;margin-left: 10px;">changer la date :</b> <input type="date"
                                                                                          name="offre_date_mod"
                                                                                          class="offre-date-mod"
                                                                                          style="margin-left: 10px;"/>
            </p>

            <label class="container">Activé
                <input name="disponibilite" type="radio" value="active">
                <span class="checkmark"></span>
            </label>
            <label class="container">Desactivé
                <input name="disponibilite" type="radio" checked="checked" value="desactive">
                <span class="checkmark"></span>
            </label>

        </c:if>
        <c:if test="${logement.is_hotel_logement == 1}">


            <label class="container">Activé
                <input name="disponibilite" type="radio" checked="checked" value="active">
                <span class="checkmark"></span>
            </label>
            <label class="container">Desactivé
                <input name="disponibilite" type="radio" value="desactive">
                <span class="checkmark"></span>
            </label>

            <br>
            (Si vous avez desactive votre offre s'il vous plais entrer la date ou le logement sera disponible )<input type="date" name="offre_date_mod" class="offre-date-mod" style="margin-left: 10px;"/>


        </c:if>

        <p class="offre-description" name="offre_description"><b>Description géneral</b><br><textarea name="offre_desc"
                                                                                                      class="offre-desc">${logement.desc_general_logement}</textarea>
        </p>

        <Button class="btn-to-explor" name="btn_save" type="submit">Enregistrer les modifications</button>


    </div>


</form>


<footer class="black-footer" style="background-color: #1b262c;margin-top: 300px">
    <div class="image-ff"><img src="img/LOGO1.png" width=139px height=139px/></div>
    <div class="container footer-container" style="margin-top: -140px;margin-left: 200px">
        <div class="col row">
            <ul class="col-sm items-col">
                <li>Avis de nous clients</li>
                <li>trouver une location</li>
                <li>devener un Hote</li>
            </ul>
            <ul class="items-col col-sm">
                <li>Sitemap</li>
                <li>Gestiondes cookies</li>
            </ul>
        </div>
    </div>
    <p>©2020 Dwerty Location<br><br></p>
</footer>

<script src="/Ressources/js/jquery.min.js"></script>
<script src="style/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.3/js/bootstrap.bundle.min.js"></script>
<script src="script.min.js"></script>

</body>
</html>
