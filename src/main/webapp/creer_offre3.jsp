<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Creer un offre de location</title>
    <link rel="stylesheet" href="create_offre_style_3.css"/>

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


<form class="form-offre-1" method="POST" action="CreateOffre" enctype="multipart/form-data">

    <label class="ms">Créer une offre</label><br>
    <label class="lbl-add-file">Ajouter 3 images descriptive pour votre offre de </br>logement :</label></br>
    <label class="lbl-add-file1">Image 1</label>
    <input type="file" class="file-1" name="img_offre1"/></br>
    <label class="lbl-add-file2">Image 2</label>
    <input type="file" class="file-1" name="img_offre2"/></br>
    <label class="lbl-add-file3">Image 3</label>
    <input type="file" class="file-1" name="img_offre3"/>
    <button type="submit" class="submet-3" name="submit_3" value="Ajouter">Ajouter</button>


</form>


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
