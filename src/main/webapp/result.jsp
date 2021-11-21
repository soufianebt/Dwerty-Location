<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Save</title>

    <link rel="stylesheet" href="style/bootstrap/js/bootstrap.min.js">
    <link rel="stylesheet" href="style/Footer.css">
    <link rel="stylesheet" href="create_offre_result.css"/>


</head>
<body>
<form class="form-offre-1" method="GET" action="CreateOffre">

    <c:choose>
        <c:when test="${!empty message}">
            <p class="message"><c:out value="${message}"></c:out></p>


        </c:when>

        <c:otherwise>
            <p class="message">Les modifications sont enregistrer</p>
        </c:otherwise>

    </c:choose>
    </br> <input class="btn-to-home" name="btn_go_home" type="submit" value="Home"/>


</form>


<script src="/Ressources/js/jquery.min.js"></script>
<script src="style/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
