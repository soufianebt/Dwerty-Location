<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Creer un offre de location</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/create_offre_style_3.css"/>


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
<body id="creer_offre3-page" class="app-page">

<%@include file="WEB-INF/jspf/navigation.jspf" %>


<form class="form-offre-1" method="POST" action="CreateOffre" enctype="multipart/form-data">

    <label class="ms">Créer une offre</label><br>
    <label class="lbl-add-file">Ajouter 3 images descriptive pour votre offre de </br>logement :</label></br>
    <label class="lbl-add-file1">Image 1</label>
    <input type="file" class="file-1" name="img_offre1" accept="image/jpeg,image/png" aria-label="Photo 1" required/></br>
    <label class="lbl-add-file2">Image 2</label>
    <input type="file" class="file-1" name="img_offre2" accept="image/jpeg,image/png" aria-label="Photo 2" required/></br>
    <label class="lbl-add-file3">Image 3</label>
    <input type="file" class="file-1" name="img_offre3" accept="image/jpeg,image/png" aria-label="Photo 3" required/>
    <button type="submit" class="submet-3" name="submit_3" value="Ajouter">Publier l'offre</button>


</form>


<%@include file="WEB-INF/jspf/footer.jspf" %>







</body>
</html>
