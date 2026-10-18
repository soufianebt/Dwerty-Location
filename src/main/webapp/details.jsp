<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Details</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/details.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/site.css">
</head>
<body id="details-page" class="app-page">

<%@include file="WEB-INF/jspf/navigation.jspf" %>


<main class="detail-content">
<h1><c:out value="${logement.titre_log_logement}"/></h1>
<div class="note">
  <p class="note-num">${note}</p>

  <c:choose>
    <c:when test="${note==0}">
      <img class="etoil" src="img/videstar.png" width=20px height=20px/>
      <img class="etoil" src="img/videstar.png" width=20px height=20px/>
      <img class="etoil" src="img/videstar.png" width=20px height=20px/>
      <img class="etoil" src="img/videstar.png" width=20px height=20px/>
      <img class="etoil" src="img/videstar.png" width=20px height=20px/>
    </c:when>
    <c:when test="${note==1}">
      <img class="etoil" src="img/remluestar.png" width=20px height=20px/>
      <img class="etoil" src="img/videstar.png" width=20px height=20px/>
      <img class="etoil" src="img/videstar.png" width=20px height=20px/>
      <img class="etoil" src="img/videstar.png" width=20px height=20px/>
      <img class="etoil" src="img/videstar.png" width=20px height=20px/>
    </c:when>
    <c:when test="${note==2}">
      <img class="etoil" src="img/remluestar.png" width=20px height=20px/>
      <img class="etoil" src="img/remluestar.png" width=20px height=20px/>
      <img class="etoil" src="img/videstar.png" width=20px height=20px/>
      <img class="etoil" src="img/videstar.png" width=20px height=20px/>
      <img class="etoil" src="img/videstar.png" width=20px height=20px/>
    </c:when>
    <c:when test="${note==3}">
      <img class="etoil" src="img/remluestar.png" width=20px height=20px/>
      <img class="etoil" src="img/remluestar.png" width=20px height=20px/>
      <img class="etoil" src="img/remluestar.png" width=20px height=20px/>
      <img class="etoil" src="img/videstar.png" width=20px height=20px/>
      <img class="etoil" src="img/videstar.png" width=20px height=20px/>
    </c:when>
    <c:when test="${note==4}">
      <img class="etoil" src="img/remluestar.png" width=20px height=20px/>
      <img class="etoil" src="img/remluestar.png" width=20px height=20px/>
      <img class="etoil" src="img/remluestar.png" width=20px height=20px/>
      <img class="etoil" src="img/remluestar.png" width=20px height=20px/>
      <img class="etoil" src="img/videstar.png" width=20px height=20px/>
    </c:when>
    <c:when test="${note==5}">
      <img class="etoil" src="img/remluestar.png" width=20px height=20px/>
      <img class="etoil" src="img/remluestar.png" width=20px height=20px/>
      <img class="etoil" src="img/remluestar.png" width=20px height=20px/>
      <img class="etoil" src="img/remluestar.png" width=20px height=20px/>
      <img class="etoil" src="img/remluestar.png" width=20px height=20px/>
    </c:when>

  </c:choose>
  <p class="note-pers">(${nbrnote})</p>
</div>
<br>
<img class="offre-icone" src="img/espace-reserve.png"/>
<p class="offre-ville"><c:out value="${logement.adress_log_logement}"></c:out></p>


<div class="detail-gallery">

  <c:if test="${!empty imageslogement1}"></c:if>

  <img src="<c:out value="${imageslogement1.url_img_Image}"/>" alt="Vue du logement">


  <img src="<c:out value="${imageslogement2.url_img_Image}"/>" alt="Interieur du logement">


  <img src="<c:out value="${imageslogement3.url_img_Image}"/>" alt="Autre vue du logement">


</div>
<div class="detail-info">
  <section>


    <p class="offre-chambre-double-lit" name="offre_chambre_double_lit"><b><c:out
            value="${logement.nbr_chambre_total} "></c:out> chambre , <c:out
            value="${logement.nbr_lit_double} "></c:out> chambre double , <c:out
            value="${logement.nbr_lit} "></c:out> lits en total</b></p>
    <p class="offre-persone" name="offre_persone"><b>Support jusqu'à <c:out
            value=" ${logement.persone_capacite_logement} "></c:out> personnes </b></p>
    <p class="offre-prix details-inline-4" name="offre_prix"><b>Prix: <c:out
            value=" ${logement.prix_log_logement} "></c:out> dh / Nuit</b></p>
    <c:if test="${logement.is_hotel_logement == 1}">
      <p class="offre-date-disponibilite details-inline-4" name="offre_date_disponibilite"><b>Disponible</b>
      </p>
    </c:if>
    <c:if test="${logement.is_hotel_logement ==0}">
      <p class="offre-date-disponibilite details-inline-5" name="offre_date_disponibilite"><b>Date de
        disponibilité:<c:out value="  ${logement.disponibilite_log_logement}"></c:out></b></p>
    </c:if>
    <p class="offre-description" name="offre_description"><b>Description
        géneral</b><br><c:out value="${logement.desc_general_logement}"/></p>
      </section>
      <aside>
    <img class="img-prop" src="img/profile.png"/>
    <p class="prop-p"><b>Le proprietaire</b></p>
    <p class="offre-propritaire details-inline-6" name="offre_propritaire"><c:out
            value="  ${propritaire.nom_client_client} ${propritaire.prenom_client_client} "></c:out></p>
    <p class="offre-propritaire-tele details-inline-6"><c:out
            value="${propritaire.tele_client_client}"></c:out></p>


  </aside>
</div>

<c:if test="${commentaire!=null}">
<section class="review-section">
  <h2>Avis (<c:out value="${nbrnote}"/>)</h2>

      <c:forEach items="${commentaire}" var="comt">
        <div class="review">
          <p><b><c:out value="${comt.prenom} ${comt.nom}"/></b> <strong><c:out value="${comt.note}"/> / 5</strong></p>
          <p><c:out value="${comt.commentaire}"/></p>
        </div>
      </c:forEach>

      <c:if test="${not empty sessionScope.iduser}">
      <form class="review-form" method="POST" action="${pageContext.request.contextPath}/DetaisOffre">
          <label class="field">Votre note
            <select name="offre_note"><option value="5">5 / 5</option><option value="4">4 / 5</option><option value="3">3 / 5</option><option value="2">2 / 5</option><option value="1">1 / 5</option></select>
          </label>
          <label class="field">Votre commentaire<textarea name="commentaire" maxlength="250" required></textarea></label>
          <button type="submit" name="save_commt" value="${logement.id_log_logement}">Publier mon avis</button>
      </form>
      </c:if>
      <c:if test="${empty sessionScope.iduser}"><p><a href="${pageContext.request.contextPath}/LoginServlet">Connectez-vous pour laisser un avis</a></p></c:if>
    </section>
    </c:if>
</main>





<%@include file="WEB-INF/jspf/footer.jspf" %>
</body>
</html>
