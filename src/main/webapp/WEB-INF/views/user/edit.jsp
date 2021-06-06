<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
                        <i class="far fa-sticky-note"></i>
                        <h3 class="font-weight-bold text-gray-500">Twój profil</h3>
                    </div>


                    <%--                 WRÓĆ do LISTY --%>
                    <div class=" mb-8">
                        <div>
                            <a href="/shop/main/${list.id}" class="btn btn-info  btn-icon-split">
                            <span class="icon text-white-50">
                            <i class="fas fa-undo"></i>
                            </span>
                                <span class="text">Wróć do zakupów</span>
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


            <%--            LISTY--%>

            <div class="container-fluid flex-column h-100 align-items-center">


                <div class="row ">

                    <div class="container">

                        <div class="card shadow mb-4 border-left-0 border-bottom-0 border-right-0 border-top-0 bg-gray-700">
                            <!-- Card Header - Accordion -->
                            <a class="d-block card-header py-3 bg-gray-900 border-bottom-0"
                            >
                                <h6 class="m-0 font-weight-bold text-white">Edycja danych</h6>
                            </a>
                            <!-- Card Content - Collapse -->
                            <div class="collapse show" id="coll2">
                                <div class="card-body text-gray-100"
                                     style="display: flex; justify-content: space-between; padding-top: 5px; padding-bottom: 5px ">
                                    <div class="">
                                        <p class="text-sm-center text-danger">${msg}</p>
                                        <form:form class="user" action="/user/edit" method="post" modelAttribute="user">
                                            <div class="form-group row">
                                                <div class="col-sm-6 mb-3 mb-sm-0">
                                                    <form:errors path="name" cssClass="text-sm-center text-danger"/>

                                                    <form:input path="name" type="text"
                                                                class="form-control bg-light border-0 small"
                                                                placeholder="${user.name}"/>
                                                </div>
                                                <div class="col-sm-6">
                                                    <form:errors path="surname" cssClass="text-sm-center text-danger"/>

                                                    <form:input path="surname" type="text"
                                                                class="form-control bg-light border-0 small"
                                                                placeholder="${user.surname}" required="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group">

                                                <input type="email" class="form-control bg-light border-0 small"
                                                       value="${user.email}" name="email" required="true"/>
                                            </div>

                                            <div class="d-block">

                                                <div class="col-sm-6" style="padding: 5px">
                                                    <button class="btn btn-info" type="submit">
                                                        <i class="far fa-edit fa-sm"></i> Zmień dane
                                                    </button>
                                                </div>

                                                <form:input type="hidden" path="id" value="${user.id}"/>

                                                <input type="hidden" name="${_csrf.parameterName}"
                                                       value="${_csrf.token}"/>

                                                <div class="col-sm-6" style="padding: 5px">
                                                <a href="/user/changepassword" class="btn btn-warning ">
                                                    <span class="icon text-white-50">
                                                     <i class="fas fa-edit"></i>
                                                        </span>
                                                    <span class="text">Zmień hasło</span>
                                                </a>
                                                </div>

                                            </div>
                                        </form:form>
                                    </div>


                                </div>

                                <hr style="padding: 0px; margin: 0px">


                            </div>

                        </div>

                    </div>
                </div>


            </div>

        </div>


        <%--                    koniec kategorii --%>

        <%--        end of content wrapper--%>

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




<!-- Bootstrap core JavaScript-->
<script src="<c:url value="/sb/vendor/jquery/jquery.min.js"/>"></script>
<script src="<c:url value="/sb/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

<!-- Core plugin JavaScript-->
<script src="<c:url value="/sb/vendor/jquery-easing/jquery.easing.min.js"/>"></script>

<!-- Custom scripts for all pages-->
<script src="<c:url value="/sb/js/sb-admin-2.min.js"/>"></script>

</body>

</html>
