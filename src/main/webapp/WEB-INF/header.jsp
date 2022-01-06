<%-- 
    Document   : header
    Created on : 29/12/2021, 11:28:21 AM
    Author     : Desarrollo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Wigilabs</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <sec:authorize access="isAuthenticated()">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="<c:url value="/peliculas"/>">Peliculas</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Series
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li>
                                <a class="dropdown-item" href="<c:url value="/series"/>">Serie</a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li>
                                <a class="dropdown-item" href="<c:url value="/temporadas"/>">Temporada
                                </a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li>
                                <a class="dropdown-item" href="<c:url value="/episodios"/>">Episodio</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                            
                <form:form action="logout" method="post" class="d-flex">
                    <button class="btn btn-primary" type="submit">Cerrar sesión</button>
                </form:form>
            </div>
            </sec:authorize>
        </div>
    </nav>
    <div class="container">
        <div class="row">
            <div class="col-sm-8">
                <c:choose>
                    <c:when test="${success != null}">
                        <div class="alert alert-success alert-dismissible" role="alert">
                            <strong>¡Éxito!</strong><p>${success}</p>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:when>
                    <c:when test="${info != null}">
                        <div class="alert alert-info alert-dismissible" role="alert">
                            <strong>¡Información!</strong><p>${info}</p>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:when>
                    <c:when test="${warning != null}">
                        <div class="alert alert-warning alert-dismissible" role="alert">
                            <strong>¡Atención!</strong><p>${warning}</p>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:when>
                    <c:when test="${error != null}">
                        <div class="alert alert-danger alert-dismissible" role="alert">
                            <strong>¡Error!</strong><p>${error}</p>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </div>
</header>
