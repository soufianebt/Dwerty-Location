<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Details</title>

  <link rel="stylesheet" href="bootstrap.min.css">
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.4.1/css/simple-line-icons.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
  <style>

    .div-details {
      width: 90%;
      height: 600px;

      margin-top: 10px;
      margin-left: 5%;
      border-radius: 20px;
      display: inline-block;
    }

    .img-1 {

      width: 60%;
      height: 450px;
      background-color: #000;
      margin-top: 30px;
      margin-left: 2%;
      border-radius: 20px 0px 0px 20px;
      display: inline-block;

    }

    .img-2 {
      display: inline-block;
      width: 35%;
      height: 223px;
      background-color: #000;
      margin-top: 259.5px;
      margin-left: 0.25%;
      border-radius: 0px 0px 20px 0px;

    }

    .img-3 {
      display: inline-block;
      width: 35%;
      height: 222px;
      background-color: #000;
      margin-bottom: 199px;
      margin-left: -35.36%;
      border-radius: 0px 20px 0px 0px;

    }

    .offre-info {

      display: inline-block;
      width: 86%;
      height: 500px;
      /*margin-bottom: 0%;*/
      /*margin-top: -200px;*/


      border-radius: 20px 20px 20px 20px;
      padding-left: 10px;
      margin-top: -50px;
      margin-left: 6.5%;
      margin-bottom: 30px;
      box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
      padding-top: 20px;
      padding-left: 20px;
      padding-right: 20px;


    }

    .offre-titre {

      margin-top: 100px;
      margin-left: 0%;
      font-size: 35px;
      display: inline-block;

    }

    .offre-icone {
      display: inline-block;
      margin-top: -10px;
      margin-left: 6.5%;


    }

    .offre-ville {
      display: inline-block;
      font-size: 19px;
      margin-left: 14px;
      margin-top: 10px;
    }

    p {
      font-size: 20px;
    }

    .propritaire-info {
      display: inline-block;
      width: 32%;
      height: 300px;

      margin-top: -100px;
      margin-bottom: -200px;
      margin-left: 5px;
      border-radius: 0px 20px 20px 0px;
      box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    }

    .img-prop {
      display: inline-block;
      margin-top: -5px;
    }

    .prop-p {
      display: inline-block;
      margin-left: 15px;
      margin-top: 30px;
    }

    .offre-propritaire {
      margin-left: 44px;
      margin-bottom: 2px;
      font-size: 20px;
    }

    .offre-propritaire-tele {
      margin-top: 0px;
      margin-left: 44px;
      font-size: 20px;
    }

    .note {
      margin-top: -20px;
      margin-left: 3%;
      display: inline-block;


    }

    .etoil {
      margin-top: -10px;
      margin-left: 2px;
      display: inline-block;
    }

    .note-num {
      font-size: 22px;
      margin-left: 0px;
      margin-top: 0px;
      color: #F49F00;
      font-weight: bold;
      display: inline-block;
    }

    .note-pers {
      margin-bottom: -40px;
      font-size: 21px;
      margin-left: 0px;
      color: #000000;

      display: inline-block;
    }

    .offre-titre-div {
      display: inline-block;
      margin-left: 6.5%;

    }

    .offre-commentaires {

      display: inline-block;
      width: 86%;

      /*margin-bottom: 0%;*/
      /*margin-top: -200px;*/


      border-radius: 20px 20px 20px 20px;
      padding-left: 10px;
      margin-top: 50px;
      margin-left: 6.5%;
      margin-bottom: 30px;
      box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
      padding-top: 20px;
      padding-left: 20px;
      padding-right: 20px;
    }

    .save-commt:hover {


      background-color: green;
      color: white;
      font-size: 15px;
      box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);

    }
  </style>
</head>
<body>

<nav class="navbar navbar-light navbar-expand bg-light navigation-clean">
  <div class="container"><img src="img/LOGO1.png" width=45px height=45px/><a class="navbar-brand" href="#"
                                                                             style="color:#007bff"><b>Dwerty</b></a>
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


<div class="offre-titre-div"><p class="offre-titre" name="offre_ville"><c:out
        value="${logement.titre_log_logement}"></c:out></p></div>
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
      <img class="etoil" src="iimg/videstar.png" width=20px height=20px/>
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


<div class="div-details">

  <c:if test="${!empty imageslogement1}"></c:if>

  <img class="img-1" src="<c:out value="${imageslogement1.url_img_Image}"></c:out>"/>


  <img class="img-2" src="<c:out value="${imageslogement2.url_img_Image}"></c:out>"/>


  <img class="img-3" src="<c:out value="${imageslogement3.url_img_Image}"></c:out>"/>


</div>
<form method="GET" action="DetaisOffre">
  <div class="offre-info">


    <p class="offre-chambre-double-lit" name="offre_chambre_double_lit"><b><c:out
            value="${logement.nbr_chambre_total} "></c:out> chambre , <c:out
            value="${logement.nbr_lit_double} "></c:out> chambre double , <c:out
            value="${logement.nbr_lit} "></c:out> lits en total</b></p>
    <p class="offre-persone" name="offre_persone"><b>Support jusqu'à <c:out
            value=" ${logement.persone_capacite_logement} "></c:out> personnes </b></p>
    <p class="offre-prix" name="offre_prix" style="color:green"><b>Prix: <c:out
            value=" ${logement.prix_log_logement} "></c:out> dh / Nuit</b></p>
    <c:if test="${logement.is_hotel_logement == 1}">
      <p class="offre-date-disponibilite" name="offre_date_disponibilite" style="color:green"><b>Disponible</b>
      </p>
    </c:if>
    <c:if test="${logement.is_hotel_logement ==0}">
      <p class="offre-date-disponibilite" name="offre_date_disponibilite" style="color:red;"><b>Date de
        disponibilité:<c:out value="  ${logement.disponibilite_log_logement}"></c:out></b></p>
    </c:if>
    <p class="offre-description" name="offre_description"><b>Description
      géneral</b><br> ${logement.desc_general_logement}</p>
    <img class="img-prop" src="img/profile.png"/>
    <p class="prop-p"><b>Le proprietaire</b></p>
    <p class="offre-propritaire" style="color: blue" name="offre_propritaire"><c:out
            value="  ${propritaire.nom_client_client} ${propritaire.prenom_client_client} "></c:out></p>
    <p class="offre-propritaire-tele" style="color: blue"><c:out
            value="${propritaire.tele_client_client}"></c:out></p>


  </div>
</form>

<c:if test="${commentaire!=null}">
<c:if test="${commentaire.size()>1}">
<div class="offre-commentaires" style="height: ${commentaire.size()*360}px;">
  </c:if>
  <c:if test="${commentaire.size()==0}">
  <div class="offre-commentaires" style="height: 300px;">
    </c:if>
    <c:if test="${commentaire.size()==1}">
    <div class="offre-commentaires" style="height: 600px;">
      </c:if>

      <c:forEach items="${commentaire}" var="comt">
        <div style="width: 90%;height: 200px;background-color: #FFFFFF;margin-left: 20px;">
          <img src="img/user.png" width=50px height=50px
               style="border-radius: 25px; display: inline-block;margin-top: 20px;"/>
          <p class="client-name"
             style="font-weight: bold;display: inline-block;font-size: 18px;margin-left: 15px;margin-top:0px;">${comt.prenom} ${comt.nom}</p>
          <p class="client-name"
             style="font-weight: bold;display: inline-block;font-size: 18px;margin-left: 15px;margin-top:0px;color: #F49F00">${comt.note}<img
                  class="etoil" src="img/remluestar.png" width=15px height=15px style="display:
                                                                                                                                                                       inline-block;margin-left: 10px;margin-top: -5px;"/>
          </p>
          <p style="margin-left: 6.5%;">${comt.commentaire}</p>
        </div>
        <hr>
      </c:forEach>

      <form method="POST" action="DetaisOffre">
        <div style="width: 90%;height: 200px;background-color: #FFFFFF;margin-left: 20px;">
          <img src="img/user.png" width=50px height=50px
               style="border-radius: 25px; display: inline-block;margin-top: 20px;"/>
          <p class="client-name"
             style="font-weight: bold;display: inline-block;font-size: 18px;margin-left: 15px;margin-top:0px;">${nom} ${prenom}</p>
          <p style="color: #F49F00;font-weight: bold;display: inline-block; margin-left: 20px;font-size: 18px;">
            Evaluer l'offre :</p>

          <select name="offre_note" style="margin-left: 10px; color: #F49F00;">
            <option value="1">1&#x2605;<img class="etoil" src="img/remluestar.png" width=15px height=15px/>
            </option>
            <option value="2">2&#x2605;</option>
            <option value="3">3&#x2605;</option>
            <option value="4">4&#x2605;</option>
            <option value="5">5&#x2605;</option>
          </select><br>
          <textarea name="commentaire"
                    style="margin-top: 20px;margin-left:6.5%;width: 95%;height: 70px; padding-left: 3px;"
                    placeholder="Ajouter un commentaire.."></textarea>
          <button name="save_commt" class="save-commt"
                  style="margin-left: 90%;margin-top: 20px;height: 30px;width: 120px;border-radius: 30px;border:0px;"
                  value="${logement.id_log_logement}">Enregistrer
          </button>

        </div>
      </form>
    </div>
    </c:if>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.3/js/bootstrap.bundle.min.js"></script>
    <script src="script.min.js"></script>
</body>
</html>
