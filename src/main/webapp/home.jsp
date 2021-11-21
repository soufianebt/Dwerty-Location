<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Home</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

    <style>
        <%@include file="css/create_offre_style1.css" %>
        <%@include file="css/Footer.css"%>
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
            text-align: left;
            margin-top: -12px;
            margin-left: 3%;
            color: #005cbf;

        }

        .prix-1 {
            text-align: left;
            margin-top: -12px;
            margin-left: 3%;
            color: green;


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


    </style>

</head>
<body>


<nav class="navbar navbar-light navbar-expand bg-light navigation-clean">
    <div class="container"><img src="./img/LOGO1.png" width=45px height=45px/><a class="navbar-brand" href="#"
                                                                               style="color:#007bff"><b>Dwerty</b></a>
        <button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"></button>
        <div class="collapse navbar-collapse" id="navcol-1">
            <a class="navbar-brand" href="${context}/CreateOffre"
               style="margin-left: 10%;font-size: 17px;">Créer une offre</a>
            <a class="navbar-brand" href="${context}/ShowOffres"
               style="margin-left: 3%;font-size: 17px;">Afficher mes offres</a>


            <a class="btn btn-primary ml-auto" role="button" href="${context}/LoginServlet">
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
<header class="masthead text-white text-center"
        style="background:url('./img/agadir.jpg')no-repeat center center;background-size:cover;">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-xl-9 mx-auto">
                <h1 class="mb-5">Chercher votre logement entre plus de 10000 offres possible</h1>
            </div>
            <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
                <form method="GET" action="HomeServlet">
                    <div class="form-row">
                        <!--div class="col-12 col-md-9 mb-2 mb-md-0"><input class="form-control form-control-lg" type="text" placeholder="Cherche un offre.."></div-->
                        <div class="col-12 col-md-4 mb-2 mb-md-0"><select class="btn btn-primary btn-block btn-lg"
                                                                          name="search_ville"
                                                                          style="background-color: white;color:blue; border-radius: 20px 0px 0px 20px;">
                            <option value="Casablanca">Casablanca</option>
                            <option value="Rabat">Rabat</option>
                            <option value="Nador">Nador</option>
                            <option value="Agadir">Agadir</option>
                            <option value="Tanger">Tanger</option>
                        </select>
                        </div>
                        <div class="col-12 col-md-3 mb-2 mb-md-0"><select class="btn btn-primary btn-block btn-lg"
                                                                          name="prix_search"
                                                                          style="background-color: white;color:blue;border-radius: 0px; ">

                            <option value="200">0 - 200 dh</option>
                            <option value="400">200 - 400 dh</option>
                            <option value="600">400 - 600 dh</option>
                            <option value="601">Plus 600 dh</option>
                        </select>
                        </div>
                        <div class="col-12 col-md-2 mb-2 mb-md-0"><select class="btn btn-primary btn-block btn-lg"
                                                                          name="lit_search"
                                                                          style="background-color: white;color:blue;border-radius: 0px; ">

                            <option value="1">1 lit</option>
                            <option value="2">2 lit</option>
                            <option value="3">3 lit</option>
                            <option value="4">4 lit</option>
                            <option value="4">Plus 4 lit</option>
                        </select>
                        </div>

                        <div class="col-12 col-md-3">
                            <button class="btn btn-primary btn-block btn-lg" name="search" value="search" type="submit"
                                    style="background-color: white;color: blue; border-radius: 0px 20px 20px 0px;height: 45px;">
                                Chercher
                            </button>
                        </div>


                    </div>
                </form>
            </div>
        </div>
    </div>
</header>


<c:forEach items="${logement}" var="offre">


    <form class="composon" action="DetaisOffre" type="GET">

        <img src=
                 <c:out value="${offre.url}"></c:out> width="337px" height="200px" class="img-1"/>
        <p class="titre" name="offre_name"><c:out value="${offre.titre}"></c:out></p>
        <p class="place-1" name="offre_ville">Ville : <c:out value="${offre.ville}"></c:out></p>
        <p class="prix-1" name="offre_prix"><c:if test="${!empty searchx}">${offre.nbrLit}</c:if> Lits | Prix : <c:out
                value="${offre.prix}"></c:out>dh /nuit</p>
        <div class="note">
            <p class="note-num">${offre.avgNote}</p>
            <c:choose>
                <c:when test="${offre.avgNote==0}">
                    <img class="etoil" src="./img/videstar.png" width=15px height=15px/>

                    <img class="etoil" src="./img/videstar.png" width=15px height=15px/>
                    <img class="etoil" src="./img/videstar.png" width=15px height=15px/>
                    <img class="etoil" src="./img/videstar.png" width=15px height=15px/>
                    <img class="etoil" src="./img/videstar.png" width=15px height=15px/>
                </c:when>
                <c:when test="${offre.avgNote==1}">
                    <img class="etoil" src="./img/remluestar.png" width=15px height=15px/>
                    <img class="etoil" src="./img/videstar.png" width=15px height=15px/>
                    <img class="etoil" src="./img/videstar.png" width=15px height=15px/>
                    <img class="etoil" src="./img/videstar.png" width=15px height=15px/>
                    <img class="etoil" src="./img/videstar.png" width=15px height=15px/>
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
        <Button class="btn-to-explor" name="btn_detais" type="submit" value="${offre.titre}">Plus..</button>


    </form>


</c:forEach>


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


<!--footer class="footer bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 my-auto h-100 text-center text-lg-left">
                <ul class="list-inline mb-2">
                    <li class="list-inline-item"><a href="#">About</a></li>
                    <li class="list-inline-item"><span>⋅</span></li>
                    <li class="list-inline-item"><a href="#">Contact</a></li>
                    <li class="list-inline-item"><span>⋅</span></li>
                    <li class="list-inline-item"><a href="#">Terms of &nbsp;Use</a></li>
                    <li class="list-inline-item"><span>⋅</span></li>
                    <li class="list-inline-item"><a href="#">Privacy Policy</a></li>
                </ul>
                <p class="text-muted small mb-4 mb-lg-0">© Dwerty 2021.</p>
            </div>
            <div class="col-lg-6 my-auto h-100 text-center text-lg-right">
                <ul class="list-inline mb-0">
                    <li class="list-inline-item"><a href="#"><i class="fa fa-facebook fa-2x fa-fw"></i></a></li>
                    <li class="list-inline-item"><a href="#"><i class="fa fa-twitter fa-2x fa-fw"></i></a></li>
                    <li class="list-inline-item"><a href="#"><i class="fa fa-instagram fa-2x fa-fw"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
</footer-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.3/js/bootstrap.bundle.min.js"></script>
<script src="script.min.js"></script>
</body>
</html>
