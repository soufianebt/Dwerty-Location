<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Creer un offre de location</title>
    <link rel="stylesheet" href="create_offre_style_2.css"/>
    <link rel="stylesheet" href="style/bootstrap/js/bootstrap.min.js">
    <link rel="stylesheet" href="style/Footer.css">
    <link rel="stylesheet" href="bootstrap.min.css">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
</head>
<body>


<nav class="navbar navbar-light navbar-expand bg-light navigation-clean">
    <div class="container"><img src="img/LOGO1.png" width=45px height=45px/><a class="navbar-brand" href="#">Dwerty</a>
        <button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"></button>
        <div class="collapse navbar-collapse" id="navcol-1">
            <a class="navbar-brand" href="http://localhost:8081/DwertyOfficiel/CreateOffre"
               style="margin-left: 10%;font-size: 17px;">Créer une offre</a>
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


<form class="form-offre-1" method="POST" action="CreateOffre">
    <label class="ms">Créer une offre</label><br>


    <label class="lbl-chambre">Totale de chambres </label> <select name="chambre_offre" class="chambre-de-offre">
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
</select>
    <label class="lbl-chambre-double">Chambres doubles</label> <select name="chambre_double_offre"
                                                                       class="chambre-double-de-offre">
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
</select></br>


    <label class="lbl-lits">Totale de lits </label> <select name="lit_offre" class="lit-de-offre">
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
</select>

    <label class="lbl-prix">Prix / Nuit ( DH ) </label><input type="number" class="prix-offre" name="prix_offre"
                                                              placeholder="129.99"/></br>
    <label class="lbl-date">La date de disponibilité du logement </label><input type="date" name="date_offre"
                                                                                class="date-offre"/></br>

    <label class="lbl-max">Nombre max des personnes </label><input type="number" class="max-offre" name="max_offre"
                                                                   placeholder="1"/></br>


    <button type="submit" class="submet-2" name="submit_2" value="next2">Next ></button>


</form>

<c:if test="${!empty message}">

    <p class="message" name="message">

        <c:out value="${message}"/>

    </p>

</c:if>


<footer class="black-footer" style="background-color: #1b262c;margin-top: 150px">
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
