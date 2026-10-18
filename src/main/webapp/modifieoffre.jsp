<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Modifer une offre</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/create_offre_style1.css"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Footer.css">


    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/modifieoffre.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/site.css">
</head>
<body id="modifieoffre-page" class="app-page">


<%@include file="WEB-INF/jspf/navigation.jspf" %>

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
        <p class="offre-prix modifieoffre-inline-3" name="offre_prix"><b>Prix: <input class="offre-prix-mod"
                                                                                    name="offre_prix" type="number"
                                                                                    value=<c:out
                value=" ${logement.prix_log_logement} "></c:out>/> dh / Nuit</b></p>
        <c:if test="${logement.is_hotel_logement == 0}">
            <p><b class="disponibilite modifieoffre-inline-4">Disponibilite de l'offre</b></p>

            <p class="offre-date-disponibilite modifieoffre-inline-5" name="offre_date_disponibilite"><b>Sera disponible le
                :<c:out value="  ${logement.disponibilite_log_logement}"></c:out></b> <b class="modifieoffre-inline-6">changer la date :</b> <input type="date"
                                                                                          name="offre_date_mod"
                                                                                          class="offre-date-mod modifieoffre-inline-7"/>
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
            (Si vous avez desactive votre offre s'il vous plais entrer la date ou le logement sera disponible )<input type="date" name="offre_date_mod" class="offre-date-mod modifieoffre-inline-7"/>


        </c:if>

        <p class="offre-description" name="offre_description"><b>Description géneral</b><br><textarea name="offre_desc"
                                                                                                      class="offre-desc">${logement.desc_general_logement}</textarea>
        </p>

        <Button class="btn-to-explor" name="btn_save" type="submit">Enregistrer les modifications</button>


    </div>


</form>


<%@include file="WEB-INF/jspf/footer.jspf" %>







</body>
</html>
