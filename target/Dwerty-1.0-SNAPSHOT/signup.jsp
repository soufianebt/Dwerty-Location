<%-- 
    Document   : jspsignup
    Created on : 30-Dec-2020, 12:57:49
    Author     : HP
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="signupcss.css">
        <title>JSP SignUp</title>
    </head>
    <body>
       <div class="formlogin">
            
            <form method="POST" action="LoginServlet" >
                <h3 id="h3-seconnecter">Inscrivez-Vous</h3>
                <input type="text" id="nom" name="nom" placeholder="Nom.."required="required"/><br>
                <input type="text" id="prenom" name="prenom" placeholder="Prenom.." required="required"/><br>
                <input type="number" id="telephone" name="telephone" placeholder="Telephone.."required="required"/><br><!-- comment -->
                <input type="email" id="email" name="email" placeholder="Email.."required="required"/><br><!-- comment -->
                <input type="password" id="password" name="password" placeholder="Mot de pass.."required="required"/><br><!-- comment -->
                <input type="password" id="validepassword" name="validepassword" placeholder="Valide mot de pass.."required="required"/><br><!-- comment -->
                <div class="inscri-type">
                Inscrire comme :    <input type="radio" id="locataire" name="insc_type" value="Locataire">
                                    <label for="locataire">Locataire</label>
                                    <input type="radio" id="benefice" name="insc_type" value="Benefice">
                                    <label for="benefice">Bénéficiaire</label>
                </div>
                <button type="submit" id="btn-connecter" name="signup">Inscrire</button>
                
                <c:if test ="${!empty adduser}">
                                    
                       <p id="msg-auth" style="margin-left: 20%;color: orange;"><c:out value="${adduser}"/></p>
                       
                </c:if>
                        
            </form>
        </div>


    </body>
</html>
