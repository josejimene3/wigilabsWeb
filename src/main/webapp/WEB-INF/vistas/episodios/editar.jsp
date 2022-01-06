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
                    <form:form action="nuevo" method="put" modelAttribute="episodio">
                        <div class="card">
                            <div class="card-header text-center">
                                Datos episodio
                            </div>
                            <div class="card-body">
                                <form:input path="id" type="hidden"/>
                                <div class="col-sm-12 row">
                                    <label>Nombre:</label>
                                    <div class="input-group has-validation">
                                        <form:input class="form-control form-control-sm" path="nombre" type="text"/>
                                        <form:errors path="nombre"/>
                                    </div>
                                </div>
                                <div class="col-sm-12 row">
                                    <label>Duración:</label>
                                    <div class="input-group has-validation">
                                        <form:input class="form-control form-control-sm" path="duracion" type="text"/>
                                        <form:errors path="duracion"/>
                                    </div>
                                </div>
                                <div class="ol-sm-12 row">
                                    <label>Temporada</label>
                                    <div class="input-group has-validation">
                                        <form:select class="form-select form-select-sm" path="temporada.id">
                                            <form:option value="">SELECCIONE UNA OPCIÓN</form:option>                                            
                                            <c:forEach items="${temporadas}" var="temporada">
                                                <c:choose>
                                                    <c:when test="${temporada.serie.id == episodio.temporada.serie.id}">
                                                        <form:option value="${temporada.id}">${temporada.nombre} - ${temporada.serie.nombre}</form:option>
                                                    </c:when>
                                                </c:choose>
                                            </c:forEach>
                                        </form:select>
                                        <form:errors path="temporada"/>
                                    </div>
                                </div>
                            </div>                            
                            <div class="card-footer text-muted">
                                <button class="btn btn-primary btn-sm" type="submit">
                                    <i class="bi bi-send-fill"></i> Guardar
                                </button>
                                <a class="btn btn-success btn-sm" href="<c:url value="/episodios"/>">
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
