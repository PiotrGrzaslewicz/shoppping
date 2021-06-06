<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Shopping</title>

    <!-- Custom fonts for this template-->
    <link href="<c:url value="/sb/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value="/sb/css/sb-admin-2.min.css"/>" rel="stylesheet">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">


    <!-- Content Wrapper -->
    <div id="content-wrapper">

        <!-- Main Content -->
        <div id="content" class="bg-gray-800">

            <!-- PASEK U GÓRY topbar -->
            <nav class="navbar navbar-expand navbar-light bg-gray-900 topbar mb-4 static-top shadow">

                <div class="container-fluid justify-content-between">

                    <div class="flex-row">
                        <%--                        <a href="#" data-toggle="modal" data-target="#editListNameModal">--%>
                        <%--                            <i class="far fa-edit"></i></a>--%>


                        <h3 class="font-weight-bold text-gray-500">${list.name}</h3>
                    </div>

                    <%--                        edycja listy--%>
                    <div class="mb-8">
                        <div>
                            <a href="/list/main" class="btn btn-info btn-icon-split">
                                        <span class="icon text-white-50">
                                          <i class="far fa-edit"></i>
                                        </span>
                                <span class="text">Edycja listy</span>
                            </a>
                        </div>
                    </div>

                    <%--                    zresetuj listę--%>
                    <div class="mb-8">
                        <div>
                            <a href="#" class="btn btn-info btn-icon-split" data-toggle="modal"
                               data-target="#resetModal">
                    <span class="icon text-white-50">
                      <i class="fas fa-undo"></i>
                    </span>
                                <span class="text">Zresetuj</span>
                            </a>
                        </div>
                    </div>


                </div>


                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <%--                   UŻYTKOWNIK --%>

                    <li class="nav-item dropdown ">
                        <a class="nav-link dropdown-toggle text-gray-500" href="#" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">${user.name}</span>
                            <i class="fas fa-user"></i>
                        </a>


                        <!-- Dropdown - User Information -->

                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="/user/edit">
                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                Twój profil
                            </a>
                            <%--                            <a class="dropdown-item" href="#">--%>
                            <%--                                <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>--%>
                            <%--                                Ustawienia profilu--%>
                            <%--                            </a>--%>
                            <a class="dropdown-item" href="/list/saved">
                                <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                Zapisane listy
                            </a>
                            <a class="dropdown-item" href="/memo/saved">
                                <i class="fas fa-sticky-note fa-sm fa-fw mr-2 text-gray-400"></i>
                                Zapisane notatki
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Wyloguj
                            </a>
                        </div>
                    </li>

                </ul>

            </nav>

            <!-- End of Topbar -->

            <!-- Begin Page Content -->

            <%--            kategorie:  --%>


            <div class="container-fluid flex-column h-100 align-items-center">

<%--            SUKCES--%>



                <c:if test="${success==true}">
                <div class="row ">

                    <div class="container">

                        <div class="card shadow mb-4 border-left-0 border-bottom-0 border-right-0 border-top-0 bg-gray-700">
                            <!-- Card Header - Accordion -->
                            <a href="#success" class="d-block card-header py-3 bg-gradient-success border-bottom-0"
                               data-toggle="collapse" role="button" aria-expanded="true"
                               aria-controls="collapseCardExample">
                                <h6 class="m-0 font-weight-bold text-white">Zakupy skończone!!!</h6>
                            </a>
                            <!-- Card Content - Collapse -->
                            <div class="collapse show" id="success">

                                <%--                                    produkt           --%>


                                    <div class="card-body text-gray-100 bg-gradient-success"
                                         style="display: flex; justify-content: space-between; padding-top: 5px; padding-bottom: 5px ">
                                        <div>
                                                Wszystkie produkty zostały umieszczone w koszyku lub przeniesione do memo/usuniętych.<br>
                                            Możesz zapisać notatki i zresetować listę aby rozpocząć zakupy od nowa lub zmodyfikować listę.

                                        </div>

                                    </div>



<%--                                <div class="card-body text-gray-100 bg-gradient-success"--%>
<%--                                     style="display: flex; justify-content: space-between; padding-top: 5px; padding-bottom: 5px ">--%>

<%--                                    <div class="card-body text-gray-100 bg-gradient-success"--%>
<%--                                         style="padding-top: 5px; padding-bottom: 5px">--%>
<%--                                        <div class="mb-8">--%>
<%--                                            <div>--%>
<%--                                                <a href="#" class="btn btn-dark btn-icon-split" data-toggle="modal"--%>
<%--                                                   data-target="#addMemoMemo">--%>
<%--                                        <span class="icon text-white-50">--%>
<%--                                          <i class="far fa-edit"></i>--%>
<%--                                        </span>--%>
<%--                                                    <span class="text">Zapisz notatkę</span>--%>
<%--                                                </a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>

<%--                                    </div>--%>

<%--                                </div>--%>


                            </div>

                        </div>

                    </div>
                </div>
                </c:if>

                <%--               Kategorie--%>

                <c:forEach var="category" items="${data}">

                    <c:if test="${category.value.size()>0}">

                    <div class="row ">
                        <div class="container">
                            <div class="card shadow mb-4 border-left-0 border-bottom-0 border-right-0 border-top-0 bg-gray-700">
                                <!-- Card Header - Accordion -->
                                <a href="#a${category.key.id}"
                                   class="d-block card-header py-3
                                   <c:if test="${category.key.status==1}">bg-gradient-success</c:if>
                                   <c:if test="${category.key.status==0}">bg-gray-900 </c:if>
                                   border-bottom-0"
                                   data-toggle="collapse" role="button" aria-expanded="true"
                                   aria-controls="collapseCardExample">
                                    <h6 class="m-0 font-weight-bold text-white">${category.key.name}</h6>
                                </a>
                                <!-- Card Content - Collapse -->
                                <div class="collapse <c:if test="${category.key.status==0}">show</c:if>" id="a${category.key.id}">


                                        <%--                                   produkt --%>
                                        <%--                                        produkt status 0 or 1 --%>
                                    <c:forEach var="product" items="${category.value}" varStatus="status">

                                        <%--                                    produkt status 1 zielony--%>
                                        <c:if test="${product.status==1}">
                                            <div class="card-body text-gray-100 bg-gradient-success"
                                                 style="display: flex; justify-content: space-between; padding-top: 5px; padding-bottom: 5px ">
                                                <div>
                                                        ${product.name}
                                                </div>
                                                <div>
                                                    <a href="/shop/reset/product/${product.id}/${list.id}"
                                                       class="btn btn-success btn-circle btn-sm">
                                                        <i class="fas fa-undo"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </c:if>

                                        <%--                                        produkt status 0 szary --%>
                                        <c:if test="${product.status==0}">
                                            <div class="card-body text-gray-100"
                                                 style="display: flex; justify-content: space-between; padding-top: 5px; padding-bottom: 5px ">
                                                <div>
                                                    <a href="/shop/success/product/${product.id}/${list.id}"
                                                       class="btn btn-success btn-circle btn-sm">
                                                        <i class="fas fa-check"></i>
                                                    </a> ${product.name}
                                                </div>
                                                <div>
                                                    <a href="/shop/memo/product/${product.id}/${list.id}"
                                                       class="btn btn-warning btn-circle btn-sm">
                                                        <i class="fas fa-exclamation-triangle"></i>
                                                    </a>
                                                    <a href="/shop/cancel/product/${product.id}/${list.id}"
                                                       class="btn btn-danger btn-circle btn-sm">
                                                        <i class="fas fa-trash"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </c:if>

                                        <c:if test="${product.status==0}">
                                            ${not status.last ? '<hr style="padding: 0px; margin: 0px">' : ''}
                                        </c:if>
                                    </c:forEach>


                                </div>


                            </div>

                        </div>

                    </div>

                    </c:if>
                </c:forEach>

                <%--                    MEMO --%>

                <div class="row ">

                    <div class="container">

                        <div class="card shadow mb-4 border-left-0 border-bottom-0 border-right-0 border-top-0 bg-gray-700">
                            <!-- Card Header - Accordion -->
                            <a href="#memo" class="d-block card-header py-3 bg-gradient-warning border-bottom-0"
                               data-toggle="collapse" role="button" aria-expanded="true"
                               aria-controls="collapseCardExample">
                                <h6 class="m-0 font-weight-bold text-white">MEMO- ${memo.size()}</h6>
                            </a>
                            <!-- Card Content - Collapse -->
                            <div class="collapse " id="memo">

                                <%--                                    produkt           --%>

                                <c:forEach var="product" items="${memo}">
                                    <div class="card-body text-gray-100 bg-gradient-warning"
                                         style="display: flex; justify-content: space-between; padding-top: 5px; padding-bottom: 5px ">
                                        <div>
                                                ${product.name}
                                        </div>
                                        <div>
                                            <a href="/shop/reset/product/${product.id}/${list.id}"
                                               class="btn btn-warning btn-circle btn-sm">
                                                <i class="fas fa-undo"></i>
                                            </a>

                                        </div>
                                    </div>
                                </c:forEach>


                                <div class="card-body text-gray-100 bg-gradient-warning"
                                     style="display: flex; justify-content: space-between; padding-top: 5px; padding-bottom: 5px ">

                                    <div class="card-body text-gray-100 bg-gradient-warning"
                                         style="padding-top: 5px; padding-bottom: 5px">
                                        <div class="mb-8">
                                            <div>
                                                <a href="#" class="btn btn-info btn-icon-split" data-toggle="modal"
                                                   data-target="#addMemoMemo">
                                        <span class="icon text-white-50">
                                          <i class="far fa-edit"></i>
                                        </span>
                                                    <span class="text">Zapisz notatkę</span>
                                                </a>
                                            </div>
                                        </div>

                                    </div>

                                </div>


                            </div>

                        </div>

                    </div>
                </div>

                <%--                        USUNIĘTE  --%>

                <div class="row ">

                    <div class="container">

                        <div class="card shadow mb-4 border-left-0 border-bottom-0 border-right-0 border-top-0 bg-gray-700">
                            <!-- Card Header - Accordion -->
                            <a href="#cancelled" class="d-block card-header py-3 bg-gradient-danger border-bottom-0"
                               data-toggle="collapse" role="button" aria-expanded="true"
                               aria-controls="collapseCardExample">
                                <h6 class="m-0 font-weight-bold text-white">USUNIĘTE - ${cancelled.size()}</h6>
                            </a>
                            <!-- Card Content - Collapse -->
                            <div class="collapse " id="cancelled">

                                <%--                                    produkt           --%>
                                <c:forEach items="${cancelled}" var="product">
                                    <div class="card-body text-gray-100 bg-gradient-danger"
                                         style="display: flex; justify-content: space-between; padding-top: 5px; padding-bottom: 5px ">
                                        <div>
                                                ${product.name}
                                        </div>
                                        <div>
                                            <a href="/shop/reset/product/${product.id}/${list.id}"
                                               class="btn btn-danger btn-circle btn-sm">
                                                <i class="fas fa-undo"></i>
                                            </a>

                                        </div>

                                    </div>
                                </c:forEach>


                                <div class="card-body text-gray-100 bg-gradient-danger"
                                     style="display: flex; justify-content: space-between; padding-top: 5px; padding-bottom: 5px ">

                                    <div class="card-body text-gray-100 bg-gradient-danger"
                                         style="padding-top: 5px; padding-bottom: 5px">
                                        <div class="mb-8">
                                            <div>
                                                <a href="#" class="btn btn-info btn-icon-split" data-toggle="modal"
                                                   data-target="#addMemoCancelled">
                                        <span class="icon text-white-50">
                                          <i class="far fa-edit"></i>
                                        </span>
                                                    <span class="text">Zapisz notatkę</span>
                                                </a>
                                            </div>
                                        </div>

                                    </div>

                                </div>


                            </div>

                        </div>

                    </div>
                </div>


            </div>

        </div>


        <%--                    koniec kategorii --%>

        <%--        end of content wrapper--%>
    </div>
</div>

<!-- End of Main Content -->


</div>


<!-- End of Content Wrapper -->

<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<%--MODALE --%>
<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="logoutModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content bg-gray-200">
            <div class="modal-header">
                <h5 class="modal-title" id="logoutModalLabel">Potwierdź wylogowanie</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Wybierz "Wyloguj" aby zakończyć sesję i opuścić stronę.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Anuluj</button>
<%--                <a class="btn btn-primary" href="login.html">Wyloguj</a>--%>
                <form action="<c:url value="/logout"/>" method="post">
                    <input class="btn btn-primary" type="submit" value="Wyloguj">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="resetModal" tabindex="-1" role="dialog" aria-labelledby="resetModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content bg-gray-200">
            <div class="modal-header">
                <h5 class="modal-title" id="resetModalLabel">Potwierdź resetowanie</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Wszystkie przedmioty powrócą do stanu wyjściowego - "do kupienia"</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Anuluj</button>
                <a class="btn btn-info" href="/shop/reset/${list.id}">Zresetuj</a>
            </div>
        </div>
    </div>
</div>



<div class="modal fade" id="addMemoMemo" tabindex="-1" role="dialog" aria-labelledby="addMemoMemoLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content bg-gray-200">
            <div class="modal-header">
                <h5 class="modal-title" id="addMemoMemoLabel">Utwórz nową notatkę (produkty niedostępne)</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
                      action="/memo/add" method="post">



                    <div class="form-group">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                        <input type="text" class="form-control bg-light border-0 small"
                               placeholder="Podaj nazwę..." name="name" minlength="3" required="true">
                        <input type="hidden"  name="type" value="2">
                        <input type="hidden" name="listId" value=${list.id}>
                        <div class="input-group-append">
                            <button class="btn btn-info" type="submit">
                                <i class="fas fa-plus fa-sm"></i> Utwórz
                            </button>

                        </div>

                    </div>

                    <div class="form-text">
                        <textarea name="description" minlength="3"
                                  class="form-control bg-light border-0 small" placeholder="Podaj opis...(opcjonalne)"></textarea>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="addMemoCancelled" tabindex="-1" role="dialog" aria-labelledby="addMemoCancelledLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content bg-gray-200">
            <div class="modal-header">
                <h5 class="modal-title" id="addMemoCancelledLabel">Utwórz nową notatkę (produkty usunięte)</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
                      action="/memo/add" method="post">



                    <div class="form-group">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                        <input type="text" class="form-control bg-light border-0 small"
                               placeholder="Podaj nazwę..." name="name" minlength="3" required="true">
                        <input type="hidden"  name="type" value="3">
                        <input type="hidden" name="listId" value=${list.id}>
                        <div class="input-group-append">
                            <button class="btn btn-info" type="submit">
                                <i class="fas fa-plus fa-sm"></i> Utwórz
                            </button>

                        </div>

                    </div>

                    <div class="form-text">
                        <textarea name="description" minlength="3"
                                  class="form-control bg-light border-0 small" placeholder="Podaj opis...(opcjonalne)"></textarea>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>



<!-- Bootstrap core JavaScript-->
<script src="<c:url value="/sb/vendor/jquery/jquery.min.js"/>"></script>
<script src="<c:url value="/sb/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

<!-- Core plugin JavaScript-->
<script src="<c:url value="/sb/vendor/jquery-easing/jquery.easing.min.js"/>"></script>

<!-- Custom scripts for all pages-->
<script src="<c:url value="/sb/js/sb-admin-2.min.js"/>"></script>

</body>

</html>
