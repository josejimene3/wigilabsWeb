<%-- 
    Document   : index
    Created on : 29/12/2021, 10:09:55 AM
    Author     : Desarrollo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <jsp:include page="head.jsp"></jsp:include>
    <body>
    <jsp:include page="header.jsp"></jsp:include>
        <main>
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <h2>Sistema de calificación de películas y series</h2>
                    </div>
                </div>
                <form method="POST" action="login" class="col-12">
                    <div class="card">
                        <div class="card-header text-center">
                            Iniciar Sesión
                        </div>
                        <div class="card-body">
                            <div class="form-group ${error != null ? 'has-error' : ''}">
                                <input name="username" type="text" class="form-control" placeholder="Username" autofocus="true"/>
                            </div>
                            <div class="form-group ${error != null ? 'has-error' : ''}">
                                <input name="password" type="password" class="form-control" placeholder="Password"/>
                            </div>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </div>                            
                        <div class="card-footer text-muted">
                            <button class="btn btn-primary btn-block" type="submit">Ingresar</button>
                        </div>
                    </div>
                </form>
                <c:choose>
                    <c:when test="${param.error}">
                        <div class="alert alert-danger" role="alert">
                            Usuario y/o contraseña incorrectos
                        </div>
                    </c:when>
                </c:choose>
            </div>
        </main>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
