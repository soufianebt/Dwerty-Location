<%-- 
    Document   : login
    Created on : 06-Jan-2021, 20:21:28
    Author     : HP
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
    String Title = "login";
%>
<jsp:include page="Header.jsp"></jsp:include>
    <body>
        <div class="formlogin">
            
            <form method="POST" action="LoginServlet" >
                <h3 id="h3-seconnecter">Se connecter</h3>
                <input type="text" id="email" name="email" placeholder="Email.."required="required"/><br>
                <input type="password" id="password" name="password" placeholder="Mot de passe.." required="required"/><br>
                <button type="submit" id="btn-connecter" name="login">Connecter</button><br>
                <a id="signup-link" href="signup.jsp">Creer un nouveau compte</a> 
                
                <c:if test ="${ !empty logintest }">
                                    
                       <p id="msg-auth" style="margin-left: 20%;color: orange;"><c:out value="${message}"/></p>
                       
                </c:if>
              
                        
            </form>
        </div>
    <jsp:include page="footer.html"></jsp:include>
    </body>
</html>
