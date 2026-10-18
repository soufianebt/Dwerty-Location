<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/site.css">
    <title>JSP SignUp</title>
</head>
<body id="signup-page" class="app-page">
<%@include file="WEB-INF/jspf/navigation.jspf" %>
<main class="auth-content">
    <h1>Creer un compte</h1>
    <c:if test="${not empty message}"><div class="notice" role="alert"><c:out value="${message}"/></div></c:if>
    <form method="post" action="${pageContext.request.contextPath}/LoginServlet">
        <label class="field" for="nom">Nom<input id="nom" name="nom" autocomplete="family-name" maxlength="100" required value="<c:out value='${param.nom}'/>"></label>
        <label class="field" for="prenom">Prenom<input id="prenom" name="prenom" autocomplete="given-name" maxlength="100" required value="<c:out value='${param.prenom}'/>"></label>
        <label class="field" for="telephone">Telephone<input type="tel" id="telephone" name="telephone" autocomplete="tel" maxlength="25" required value="<c:out value='${param.telephone}'/>"></label>
        <label class="field" for="email">Adresse e-mail<input type="email" id="email" name="email" autocomplete="email" maxlength="200" required value="<c:out value='${param.email}'/>"></label>
        <label class="field" for="password">Mot de passe (8 caracteres minimum)<input type="password" id="password" name="password" autocomplete="new-password" minlength="8" maxlength="72" required></label>
        <label class="field" for="validepassword">Confirmer le mot de passe<input type="password" id="validepassword" name="validepassword" autocomplete="new-password" minlength="8" maxlength="72" required></label>
        <fieldset>
            <legend>Votre profil</legend>
            <div class="role-options">
                <label><input type="radio" name="insc_type" value="Benefice" ${param.insc_type != 'Locataire' ? 'checked' : ''} required> Client</label>
                <label><input type="radio" name="insc_type" value="Locataire" ${param.insc_type == 'Locataire' ? 'checked' : ''}> Proprietaire</label>
            </div>
        </fieldset>
        <button type="submit" name="signup" value="1">Creer mon compte</button>
    </form>
    <p class="auth-switch">Deja inscrit ? <a href="${pageContext.request.contextPath}/LoginServlet">Se connecter</a></p>
</main>
<%@include file="WEB-INF/jspf/footer.jspf" %>
</body>
</html>
