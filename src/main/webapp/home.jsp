<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">


    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/site.css">
</head>
<body id="home-page" class="app-page">


<%@include file="WEB-INF/jspf/navigation.jspf" %>
<header class="masthead text-white text-center home-inline-4">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-xl-9 mx-auto">
                <h1>Dwerty Location</h1>
                <p class="hero-description">Trouvez votre prochain logement au Maroc.</p>
            </div>
            <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
                <form method="GET" action="${context}/" aria-label="Rechercher un logement">
                    <div class="form-row">
                        <!--div class="col-12 col-md-9 mb-2 mb-md-0"><input class="form-control form-control-lg" type="text" placeholder="Cherche un offre.."></div-->
                        <div class="col-12 col-md-4 mb-2 mb-md-0"><select class="btn btn-primary btn-block btn-lg home-inline-5"
                                                                          name="search_ville" aria-label="Ville">
                            <option value="Casablanca">Casablanca</option>
                            <option value="Rabat">Rabat</option>
                            <option value="Nador">Nador</option>
                            <option value="Agadir">Agadir</option>
                            <option value="Tanger">Tanger</option>
                        </select>
                        </div>
                        <div class="col-12 col-md-3 mb-2 mb-md-0"><select class="btn btn-primary btn-block btn-lg home-inline-6"
                                                                          name="prix_search" aria-label="Budget par nuit">

                            <option value="200">0 - 200 dh</option>
                            <option value="400">200 - 400 dh</option>
                            <option value="600">400 - 600 dh</option>
                            <option value="601">Plus 600 dh</option>
                        </select>
                        </div>
                        <div class="col-12 col-md-2 mb-2 mb-md-0"><select class="btn btn-primary btn-block btn-lg home-inline-6"
                                                                          name="lit_search" aria-label="Nombre de lits">

                            <option value="1">1 lit</option>
                            <option value="2">2 lit</option>
                            <option value="3">3 lit</option>
                            <option value="4">4 lit</option>
                            <option value="4">Plus 4 lit</option>
                        </select>
                        </div>

                        <div class="col-12 col-md-3">
                            <button class="btn btn-primary btn-block btn-lg home-inline-7" name="search" value="search" type="submit">
                                Chercher
                            </button>
                        </div>


                    </div>
                </form>
            </div>
        </div>
    </div>
</header>

<main class="offers container" aria-label="Offres de logement">
    <h2><c:choose><c:when test="${!empty searchx}">R&#233;sultats de recherche</c:when><c:otherwise>Les logements disponibles</c:otherwise></c:choose></h2>
    <c:if test="${empty logement}">
        <p class="empty-offers">Aucun logement disponible pour le moment.</p>
    </c:if>
    <div class="offers-grid">

<c:forEach items="${logement}" var="offre">


    <form class="composon" action="${context}/DetaisOffre" method="GET">

        <img src=
                 <c:out value="${offre.url}"></c:out> width="337px" height="200px" class="img-1"/>
        <p class="titre" name="offre_name"><c:out value="${offre.titre}"></c:out></p>
        <p class="place-1" name="offre_ville">Ville : <c:out value="${offre.ville}"></c:out></p>
        <p class="prix-1" name="offre_prix">Prix : <c:out
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
        <button class="btn-to-explor" name="btn_detais" type="submit" value="<c:out value='${offre.titre}'/>">Voir l'offre</button>


    </form>


</c:forEach>
    </div>
</main>


<%@include file="WEB-INF/jspf/footer.jspf" %>




</body>
</html>
