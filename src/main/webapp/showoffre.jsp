<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Votre offres</title>

    <link rel="stylesheet" href="bootstrap.min.css">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="style/bootstrap/js/bootstrap.min.js">
    <link rel="stylesheet" href="style/Footer.css">

    <style>
        .composon {

            width: 337px;
            height: 370px;
            margin-left: 4%;
            margin-top: 30px;
            margin-bottom: 100px;
            background-color: #FFFFFF;
            display: inline-block;
            border-radius: 10px;
            box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2), 0 2px 20px 0 rgba(0, 0, 0, 0.19);
        }

        .img-1 {
            border-radius: 10px 10px 0px 0px;

        }

        .titre {

            font-size: 20px;
            margin-left: 3%;
            color: black;
            display: inline-block;

        }

        .icon-1 {
            margin-left: 2%;


        }

        .place-1 {
            margin-top: -12px;
            margin-left: 3%;
            color: #005cbf;

            text-align: left;

        }

        .prix-1 {

            margin-top: -12px;
            margin-left: 3%;
            color: green;
            text-align: left;


        }

        .btn-to-explor {


            margin-left: 70%;
            margin-top: -5px;
            width: 80px;
            height: 30px;
            border-radius: 40px;
            border: 0px;

        }

        .btn-to-explor:hover {


            background-color: green;
            color: white;
            font-size: 15px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);

        }

        .note {
            margin-top: -12px;
            margin-left: 3%;


        }

        .etoil {
            margin-top: -4px;
            margin-left: 2px;
            display: inline-block;
        }

        .note-num {
            font-size: 17px;
            margin-left: 0px;
            color: #F49F00;
            font-weight: bold;
            display: inline-block;
        }

        .note-pers {
            font-size: 15px;
            margin-left: 0px;
            color: #000000;

            display: inline-block;
        }


    </style>
</head>


<body>


<nav class="navbar navbar-light navbar-expand bg-light navigation-clean">
    <div class="container"><img src="img/LOGO1.png" width=45px height=45px/><a class="navbar-brand" href="#"
                                                                               style="color:#3963FF;"><b>Dwerty</b></a>
        <button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"></button>
        <div class="collapse navbar-collapse" id="navcol-1">
            <a class="navbar-brand" href="http://localhost:8081/DwertyOfficiel/CreateOffre"
               style="margin-left: 10%;font-size: 17px;">Creer un offre</a>
            <a class="navbar-brand" href="http://localhost:8081/DwertyOfficiel/ShowOffre"
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


<c:forEach items="${logement}" var="offre">


    <form class="composon" action="ModifieOffre" type="GET">

        <img src=
                 <c:out value="${offre.url}"></c:out> width="337px" height="200px" class="img-1"/>
        <p class="titre" name="offre_name"><c:out value="${offre.titre}"></c:out></p>
        <p class="place-1" name="offre_ville">Ville : <c:out value="${offre.ville}"></c:out></p>
        <p class="prix-1" name="offre_prix">Prix : <c:out value="${offre.prix}"></c:out>dh</p>

        <div class="note">
            <p class="note-num">${offre.avgNote}</p>
            <c:choose>
                <c:when test="${offre.avgNote==0}">
                    <img class="etoil" src="img/videstar.png" width=15px height=15px/>

                    <img class="etoil" src="img/videstar.png" width=15px height=15px/>
                    <img class="etoil" src="img/videstar.png" width=15px height=15px/>
                    <img class="etoil" src="img/videstar.png" width=15px height=15px/>
                    <img class="etoil" src="img/videstar.png" width=15px height=15px/>
                </c:when>
                <c:when test="${offre.avgNote==1}">
                    <img class="etoil" src="img/remluestar.png" width=15px height=15px/>
                    <img class="etoil" src="img/videstar.png" width=15px height=15px/>
                    <img class="etoil" src="img/videstar.png" width=15px height=15px/>
                    <img class="etoil" src="img/videstar.png" width=15px height=15px/>
                    <img class="etoil" src="img/videstar.png" width=15px height=15px/>
                </c:when>
                <c:when test="${offre.avgNote==2}">
                    <img class="etoil" src="img/remluestar.png" width=15px height=15px/>
                    <img class="etoil" src="img/remluestar.png" width=15px height=15px/>
                    <img class="etoil" src="img/videstar.png" width=15px height=15px/>
                    <img class="etoil" src="img/videstar.png" width=15px height=15px/>
                    <img class="etoil" src="img/videstar.png" width=15px height=15px/>
                </c:when>
                <c:when test="${offre.avgNote==3}">
                    <img class="etoil" src="img/remluestar.png" width=15px height=15px/>
                    <img class="etoil" src="img/remluestar.png" width=15px height=15px/>
                    <img class="etoil" src="img/remluestar.png" width=15px height=15px/>
                    <img class="etoil" src="img/videstar.png" width=15px height=15px/>
                    <img class="etoil" src="img/videstar.png" width=15px height=15px/>
                </c:when>
                <c:when test="${offre.avgNote==4}">
                    <img class="etoil" src="img/remluestar.png" width=15px height=15px/>
                    <img class="etoil" src="img/remluestar.png" width=15px height=15px/>
                    <img class="etoil" src="img/remluestar.png" width=15px height=15px/>
                    <img class="etoil" src="img/remluestar.png" width=15px height=15px/>
                    <img class="etoil" src="img/videstar.png" width=15px height=15px/>
                </c:when>
                <c:when test="${offre.avgNote==5}">
                    <img class="etoil" src="img/remluestar.png" width=15px height=15px/>
                    <img class="etoil" src="img/remluestar.png" width=15px height=15px/>
                    <img class="etoil" src="img/remluestar.png" width=15px height=15px/>
                    <img class="etoil" src="img/remluestar.png" width=15px height=15px/>
                    <img class="etoil" src="img/remluestar.png" width=15px height=15px/>
                </c:when>


            </c:choose>
            <p class="note-pers">(${offre.nbrNote})</p>
        </div>
        <Button class="btn-to-explor" name="btn_modifie" type="submit" value="${offre.titre}">Modifie..</button>


    </form>


</c:forEach>


<footer class="black-footer" style="background-color: #1b262c;margin-top: 100px">
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

