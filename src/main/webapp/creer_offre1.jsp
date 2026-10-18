<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Creer un offre de location</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/create_offre_style1.css"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/site.css">
</head>
<body id="creer_offre1-page" class="app-page">

<%@include file="WEB-INF/jspf/navigation.jspf" %>


<form class="form-offre-1" method="POST" action="CreateOffre">
    <label class="ms">Créer une offre</label><br>
    <label for="offer-title">Titre de l'offre</label>
    <input id="offer-title" type="text" class="titre-de-offre" name="titre_offre" placeholder="Titre de l'offre" maxlength="150" required value="<c:out value='${titre}'/>">
    </br>


    <select name="province_offre" class="province-de-offre" aria-label="Region">

        <option value="Casablanca-Settat">Casablanca-Settat</option>
        <option value="Oriental">Oriental</option>
        <option value=" Rabat-Salé-Kénitra">Rabat-Salé-Kénitra</option>

    </select>

    <select name="ville_offre" class="ville-de-offre" aria-label="Ville">

        <option value="Casablanca">Casablanca</option>
        <option value="Rabat">Rabat</option>
        <option value="Nador">Nador</option>
        <option value="Tanger">Tanger</option>
        <option value="Agadir">Agadir</option>
        <option value="Marrakech">Marrakech</option>
        <option value="Skhirate-Témara">Skhirate-Témara</option>


    </select></br>

    <label for="offer-description">Description</label>
    <textarea id="offer-description" name="description_offre" class="description-de-offre" placeholder="Description" maxlength="250" required><c:if
            test="${!empty description}"><c:out value="${description}"/></c:if></textarea>

    <button type="submit" class="submet-1" name="submit_1" value="next1">Continuer</button>


    <c:if test="${!empty message}">

        <p class="message" name="message">

            <c:out value="${message}"/>

        </p>

    </c:if>


</form>


<%@include file="WEB-INF/jspf/footer.jspf" %>








</body>
</html>
