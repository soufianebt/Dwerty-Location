<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Votre offres</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Footer.css">


    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/showoffre.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/site.css">
</head>


<body id="showoffre-page" class="app-page">


<%@include file="WEB-INF/jspf/navigation.jspf" %>


<main class="page-content">
    <h1>Mes offres</h1>
    <c:if test="${not empty message}"><p class="notice" role="status"><c:out value="${message}"/></p></c:if>
    <c:if test="${empty logement}">
        <div class="empty-state"><p>Vous n'avez pas encore publie d'offre.</p>
            <c:if test="${sessionScope.owner}"><a class="button" href="${pageContext.request.contextPath}/CreateOffre">Creer une offre</a></c:if>
            <a href="${pageContext.request.contextPath}/">Parcourir les logements</a>
        </div>
    </c:if>
    <div class="offer-list">
<c:forEach items="${logement}" var="offre">


    <form class="composon" action="${pageContext.request.contextPath}/ModifieOffre" method="GET">

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
        <div class="offer-actions">
            <button name="btn_detais" type="submit" formaction="${pageContext.request.contextPath}/DetaisOffre" value="<c:out value='${offre.titre}'/>">Voir l'offre</button>
            <button name="btn_modifie" type="submit" value="<c:out value='${offre.titre}'/>">Modifier</button>
        </div>


    </form>


</c:forEach>
    </div>
</main>


<%@include file="WEB-INF/jspf/footer.jspf" %>








</body>
</html>

