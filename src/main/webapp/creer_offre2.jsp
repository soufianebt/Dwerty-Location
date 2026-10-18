<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Creer un offre de location</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/create_offre_style_2.css"/>

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
<body id="creer_offre2-page" class="app-page">


<%@include file="WEB-INF/jspf/navigation.jspf" %>


<form class="form-offre-1" method="POST" action="CreateOffre">
    <label class="ms">Créer une offre</label><br>


    <label class="lbl-chambre" for="room-count">Nombre de chambres</label> <select id="room-count" name="chambre_offre" class="chambre-de-offre">
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
</select>
    <label class="lbl-chambre-double" for="double-rooms">Chambres doubles</label> <select id="double-rooms" name="chambre_double_offre"
                                                                       class="chambre-double-de-offre">
    <option value="0">0</option>
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
</select></br>


    <label class="lbl-lits" for="bed-count">Nombre de lits</label> <select id="bed-count" name="lit_offre" class="lit-de-offre">
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
</select>

    <label class="lbl-prix" for="night-price">Prix par nuit (DH)</label><input id="night-price" type="number" min="1" step="0.01" required class="prix-offre" name="prix_offre"
                                                              placeholder="129.99"/></br>
    <label class="lbl-date" for="available-date">Date de disponibilite</label><input id="available-date" type="date" required name="date_offre"
                                                                                class="date-offre"/></br>

    <label class="lbl-max" for="guest-count">Nombre maximum de personnes</label><input id="guest-count" type="number" min="1" max="100" required class="max-offre" name="max_offre"
                                                                   placeholder="1"/></br>


    <button type="submit" class="submet-2" name="submit_2" value="next2">Continuer</button>


</form>

<c:if test="${!empty message}">

    <p class="message" name="message">

        <c:out value="${message}"/>

    </p>

</c:if>


<%@include file="WEB-INF/jspf/footer.jspf" %>






</body>
</html>
