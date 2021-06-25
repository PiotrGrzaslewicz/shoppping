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
                        <a href="#" data-toggle="modal" data-target="#editListNameModal">
                            <i class="far fa-edit"></i></a>


                        <h3 class="font-weight-bold text-gray-500">${list.name}</h3>
                    </div>


                    <%--                ROZPOCZNIJ ZAKUPY --%>

                    <div class="mb-8">
                        <div>
                            <a href="/shop/main" class="btn btn-success btn-icon-split">
                    <span class="icon text-white-50">
                      <i class="fas fa-play"></i>
                    </span>
                                <span class="text">Rozpocznij zakupy</span>
                            </a>
                        </div>
                    </div>

<%--                    NOWA LISTA --%>

                    <div class="mb-8">
                        <div>
                            <a href="#" class="btn btn-info btn-icon-split" data-toggle="modal"
                               data-target="#addListModal">
                    <span class="icon text-white-50">
                      <i class="fas fa-plus"></i>
                    </span>
                                <span class="text">Nowa lista</span>
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
                <c:if test="${!nameCheck}"><p class="text-sm-center text-danger">Taka kategegoria już istnieje</p>

                </c:if>
                <p class="text-sm-center text-danger">${msg}</p>

                <%--               KATEGORIA w opcji TWORZENIE LISTY        --%>
                <c:forEach var="category" items="${data}">
                    <div class="row ">
                        <div class="container">
                            <div class="card shadow mb-4 border-left-0 border-bottom-0 border-right-0 border-top-0 bg-gray-700">
                                <!-- Card Header - Accordion -->
                                <a href="#a${category.key.id}"
                                   class="d-block card-header py-3 bg-gray-900 border-bottom-0"
                                   data-toggle="collapse" role="button" aria-expanded="true"
                                   aria-controls="collapseCardExample">
                                    <h6 class="m-0 font-weight-bold text-white">${category.key.name}</h6>
                                </a>
                                <!-- Card Content - Collapse -->
                                <div class="collapse show" id="a${category.key.id}">
                                        <%--                                     formularz dodawania produktu --%>


                                    <div class="card-body text-gray-100" style="padding-top: 5px; padding-bottom: 5px">
                                        <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
                                              action="/list/addproduct" method="post">
                                            <div class="input-group">
                                                <input type="text" class="form-control bg-light border-0 small"
                                                       placeholder="Dodaj produkt..." name="name" minlength="2" required="true">
                                                <input type="hidden" name="categoryId" value="${category.key.id}">
                                                <input type="hidden" name="listId" value="${list.id}">
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                <div class="input-group-append">
                                                    <button class="btn btn-info" type="submit">
                                                        <i class="fas fa-plus-circle fa-sm"></i> Dodaj
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>

                                    <hr style="padding: 0px; margin: 0px">

                                        <%--                                   produkt --%>
                                    <c:forEach var="product" items="${category.value}" varStatus="status">

                                        <div class="card-body text-gray-100 "
                                             style="display: flex; justify-content: space-between; padding-top: 5px; padding-bottom: 5px">
                                            <div>${product.name}</div>
                                            <div>
                                                <a href="/list/removeproduct/${product.id}"
                                                   class="btn btn-danger btn-circle btn-sm">
                                                    <i class="fas fa-trash"></i>
                                                </a>
                                            </div>
                                        </div>

                                        ${not status.last ? '<hr style="padding: 0px; margin: 0px">' : ''}

                                    </c:forEach>

                                    <div class="d-block card-footer py-3 bg-gray-900 border-bottom-0 border-top-0"
                                         data-toggle="collapse" role="button" aria-expanded="true"
                                         aria-controls="collapseCardExample">

                                        <a href="/list/removecategory/${category.key.id}/${list.id}"
                                           class="btn btn-danger btn-sm btn-icon-split">
                    <span class="icon text-white-50">
                      <i class="fas fa-trash"></i>
                    </span>
                                            <span class="text">Usuń kategorię</span>
                                        </a>

                                    </div>


                                </div>


                            </div>

                        </div>

                    </div>
                </c:forEach>

                <%--                    tworzenie kategorii--%>

                <div class="row ">
                    <div class="container">
                        <div class="card shadow mb-4 border-left-0 border-bottom-0 border-right-0 border-top-0 bg-gray-700">
                            <!-- Card Header - Accordion -->
                            <div class="d-block card-header py-3 bg-gray-900 border-bottom-0">
                                <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
                                      action="/list/addcategory" method="post">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                               placeholder="Dodaj nową kategorię..." name="name" minlength="3" required="true">
                                        <input type="hidden" name="listId" value="${list.id}">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <div class="input-group-append">
                                            <button class="btn btn-info" type="submit" id="addCategory">
                                                <i class="fas fa-plus-circle fa-sm"></i> Dodaj
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>


                </div>


                <%--                        USUNIĘTE  --%>


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


<div class="modal fade" id="editListNameModal" tabindex="-1" role="dialog" aria-labelledby="editListNameLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content bg-gray-200">
            <div class="modal-header">
                <h5 class="modal-title" id="editListNameLabel">Zmień nazwę</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
                      action="/list/changename" method="post">
                    <div class="input-group">
                        <input type="text" class="form-control bg-light border-0 small"
                               value="${list.name}" name="name" required="true" minlength="3">
                        <input type="hidden" name="listId" value="${list.id}">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <div class="input-group-append">
                            <button class="btn btn-info" type="submit">
                                <i class="far fa-edit fa-sm"></i> Zmień
                            </button>
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="addListModal" tabindex="-1" role="dialog" aria-labelledby="addListLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content bg-gray-200">
            <div class="modal-header">
                <h5 class="modal-title" id="addListLabel">Utwórz nową listę</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
                      action="/list/add" method="post">

                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="Warzywa" name="categories">
                        <label class="form-check-label" for="inlineCheckbox1">Warzywa</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="Mięso" name="categories">
                        <label class="form-check-label" for="inlineCheckbox2">Mięso</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="Nabiał" name="categories">
                        <label class="form-check-label" for="inlineCheckbox3">Nabiał</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox4" value="Pieczywo" name="categories">
                        <label class="form-check-label" for="inlineCheckbox4">Pieczywo</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox5" value="Konserwy, suche zapasy, napoje" name="categories">
                        <label class="form-check-label" for="inlineCheckbox5">Konserwy, suche zapasy, napoje</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox6" value="AGD" name="categories">
                        <label class="form-check-label" for="inlineCheckbox6">AGD</label>
                    </div>


                    <div class="input-group">


                        <input type="text" class="form-control bg-light border-0 small"
                               placeholder="Podaj nazwę..." name="name" minlength="3" required="true">

                        <div class="input-group-append">
                            <button class="btn btn-info" type="submit">
                                <i class="fas fa-plus fa-sm"></i> Utwórz
                            </button>
                        </div>
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
