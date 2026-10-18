<%--
    Document   : login
    Created on : 06-Jan-2021, 20:21:28
    Author     : HP
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Login</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/site.css">
</head>
<body id="login-page" class="app-page">
<%@include file="WEB-INF/jspf/navigation.jspf" %>
<main class="auth-content">
  <h1>Se connecter</h1>
  <c:if test="${not empty message}">
    <div class="notice ${success ? 'notice-success' : ''}" role="status"><c:out value="${message}"/></div>
  </c:if>
  <form method="post" action="${pageContext.request.contextPath}/LoginServlet">
    <label class="field" for="email">Adresse e-mail
      <input type="email" id="email" name="email" autocomplete="username" required value="<c:out value='${param.email}'/>">
    </label>
    <label class="field" for="password">Mot de passe
      <input type="password" id="password" name="password" autocomplete="current-password" required>
    </label>
    <button type="submit" name="login" value="1">Se connecter</button>
  </form>
  <p class="auth-switch">Pas encore de compte ? <a href="${pageContext.request.contextPath}/signup.jsp">Creer un compte</a></p>
</main>
<%@include file="WEB-INF/jspf/footer.jspf" %>
</body>
</html>
