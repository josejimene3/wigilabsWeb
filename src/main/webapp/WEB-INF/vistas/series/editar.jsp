<%-- 
    Document   : editar
    Created on : 30/12/2021, 04:26:49 PM
    Author     : Desarrollo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="/WEB-INF/head.jsp"></jsp:include>
        <body>
        <jsp:include page="/WEB-INF/header.jsp"></jsp:include>
            <main class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="text-center">${titulo}</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 col-md-10">
                    <form:form action="nuevo" method="put" modelAttribute="serie">
                        <div class="card">
                            <div class="card-header text-center">
                                Datos serie
                            </div>
                            <div class="card-body">
                                <form:input class="form-control form-control-sm" path="id" type="hidden"/>
                                <div class="col-sm-12 row">
                                    <label>Nombre:</label>
                                    <div class="input-group has-validation">
                                        <form:input class="form-control form-control-sm" path="nombre" type="text"/>
                                        <form:errors path="nombre"/>
                                    </div>
                                </div>
                                <div class="col-sm-12 row">
                                    <label>Género:</label>
                                    <div class="input-group has-validation">
                                        <form:input class="form-control form-control-sm" path="genero" type="text"/>
                                        <form:errors path="genero"/>
                                    </div>
                                </div>
                                <div class="col-sm-12 row">
                                    <label>Calificación:</label>
                                    <div class="input-group has-validation">
                                        <form:input class="form-control form-control-sm" path="calificacion" type="number"/>
                                        <form:errors path="calificacion"/>
                                    </div>
                                </div>
                            </div>                            
                            <div class="card-footer text-muted">
                                <button class="btn btn-primary btn-sm" type="submit">
                                    <i class="bi bi-send-fill"></i> Guardar
                                </button>
                                <a class="btn btn-success btn-sm" href="<c:url value="/series"/>">
                                    <i class="bi bi-table"></i> Ver todas
                                </a>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </main>                
        <jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
    </body>
</html>
