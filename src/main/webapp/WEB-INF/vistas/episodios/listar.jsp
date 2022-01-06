<%-- 
    Document   : listar
    Created on : 30/12/2021, 12:45:47 PM
    Author     : Desarrollo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
                <div class="col-md-12">
                    <a class="btn btn-success btn-sm" href="<c:url value="/episodios/nuevo"/>">
                        <i class="bi bi-plus-circle-fill"></i> Nuevo
                    </a>
                </div>
                <div class="col-md-12">
                    <div class="table-responsive">
                        <table class="table table-striped table-sm text-center">
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Duracion</th>
                                    <th>Temporada</th>
                                    <th>Serie</th>
                                    <th>Opciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${episodios}" var="episodio">
                                    <tr>
                                        <td>${episodio.nombre}</td>
                                        <td>${episodio.duracion} Min.</td>
                                        <td>${episodio.temporada.nombre}
                                        <td>${episodio.temporada.serie.nombre}
                                        </td>
                                        <td>
                                            <a class="btn btn-primary btn-sm" href="<c:url value="/episodios/${episodio.id}"/>">
                                                <i class="bi bi-pencil-fill"></i> Editar
                                            </a>
                                            <button class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#eliminar${episodio.id}">
                                                <i class="bi bi-trash-fill"></i> Eliminar
                                            </button>
                                        </td>
                                    </tr>
                                <div class="modal fade" id="eliminar${episodio.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Eliminar episodio</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <p>¿Desea eliminar el episodio "${episodio.nombre}" de la temporada "${episodio.temporada.nombre} - ${episodio.temporada.serie.nombre}"?</p>
                                            </div>
                                            <div class="modal-footer">
                                                <a class="btn btn-success btn-sm" href="<c:url value="/episodios/eliminar/${episodio.id}"/>">
                                                    <i class="bi bi-check-circle-fill"></i> Sí
                                                </a>
                                                <button type="button" class="btn btn-danger btn-sm" data-bs-dismiss="modal">
                                                    <i class="bi bi-x-circle-fill"></i> No
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>                
                <c:if test="${totalItems > 0 }">
                    <div class="panel-footer">
                        Mostrar 
                        <c:choose>
                            <c:when test="${currentPage <= 0}">${currentPage+1}</c:when>
                            <c:otherwise>${(size*currentPage)+1}</c:otherwise>
                        </c:choose> a 
                        <c:choose>
                            <c:when test="${(currentPage+1) == totalPages}">${totalItems}</c:when>
                            <c:otherwise>${size*(currentPage+1)}</c:otherwise>
                        </c:choose>
                        de ${totalItems}
                        <nav aria-label="Page navigation example">
                            <ul class="pagination pagination-sm">
                                <c:choose>
                                    <c:when test="${currentPage > 0}">
                                        <li class="page-item">
                                            <a class="page-link" href="<c:url value="/episodios?page=0&size=${size}"/>">
                                                <i class="bi bi-chevron-double-left"></i>
                                            </a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item disabled">
                                            <a class="page-link">
                                                <i class="bi bi-chevron-double-left"></i>
                                            </a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${currentPage > 0}">
                                        <li class="page-item">
                                            <a class="page-link" href="<c:url value="/episodios?page=${currentPage - 1}&size=${size}"/>">                                                
                                                <i class="bi bi-chevron-left"></i>
                                            </a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item disabled">
                                            <a class="page-link">                                                
                                                <i class="bi bi-chevron-left"></i>
                                            </a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                                <c:forEach begin="0" end="${totalPages-1}" var="page">
                                    <c:choose>
                                        <c:when test="${page != currentPage}"> 
                                            <li class="page-item">
                                                <a href="<c:url value="/episodios?page=${page}&size=${size}"/>" class="page-link">${page+1}</a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item active">
                                                <a class="page-link">${page+1}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:choose>
                                    <c:when test="${(currentPage+1) < totalPages}">
                                        <li class="page-item">
                                            <a class="page-link" href="<c:url value="/episodios?page=${currentPage + 1}&size=${size}"/>">
                                                <i class="bi bi-chevron-right"></i>
                                            </a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item disabled">
                                            <a class="page-link">
                                                <i class="bi bi-chevron-right"></i>
                                            </a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${(currentPage + 1) < totalPages}">
                                        <li class="page-item">
                                            <a class="page-link" href="<c:url value="/episodios?page=${totalPages-1}&size=${size}"/>">
                                                <i class="bi bi-chevron-double-right"></i>
                                            </a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item disabled">
                                            <a class="page-link">
                                                <i class="bi bi-chevron-double-right"></i>
                                            </a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </nav>
                    </div>
                </c:if>
            </div>
        </main>
        <jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
    </body>
</html>

