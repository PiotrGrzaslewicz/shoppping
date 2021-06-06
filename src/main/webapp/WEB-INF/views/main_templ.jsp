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
                        <i class="far fa-edit"></i>
                        <h3 class="font-weight-bold text-gray-500">Lista 1</h3>
                    </div>




                    <%--                ROZPOCZNIJ ZAKUPY --%>

                    <div class="mb-8">
                        <div>
                            <a href="#" class="btn btn-success btn-icon-split">
                    <span class="icon text-white-50">
                      <i class="fas fa-play"></i>
                    </span>
                                <span class="text">Rozpocznij zakupy</span>
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
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">Użytkownik</span>
                            <i class="fas fa-user"></i>
                        </a>


                        <!-- Dropdown - User Information -->

                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                Twój profil
                            </a>
                            <%--                            <a class="dropdown-item" href="#">--%>
                            <%--                                <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>--%>
                            <%--                                Ustawienia profilu--%>
                            <%--                            </a>--%>
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                Zapisane listy
                            </a>
                            <a class="dropdown-item" href="#">
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


                <%--               KATEGORIA w opcji TWORZENIE LISTY        --%>

                <div class="row ">

                    <div class="container">

                        <div class="card shadow mb-4 border-left-0 border-bottom-0 border-right-0 border-top-0 bg-gray-700">
                            <!-- Card Header - Accordion -->
                            <a href="#coll1" class="d-block card-header py-3 bg-gray-900 border-bottom-0"
                               data-toggle="collapse" role="button" aria-expanded="true"
                               aria-controls="collapseCardExample">

                                <h6 class="m-0 font-weight-bold text-white">Mięso</h6>

                            </a>
                            <!-- Card Content - Collapse -->
                            <div class="collapse show" id="coll1">

                                <%--                                     formularz dodawania produktu --%>

                                <div class="card-body text-gray-100" style="padding-top: 5px; padding-bottom: 5px">
                                    <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-light border-0 small"
                                                   placeholder="Dodaj produkt...">
                                            <div class="input-group-append">
                                                <button class="btn btn-info" type="button">
                                                    <i class="fas fa-plus-circle fa-sm"></i> Dodaj
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <hr style="padding: 0px; margin: 0px">

                                <%--                                   produkt --%>

                                <div class="card-body text-gray-100 "
                                     style="display: flex; justify-content: space-between; padding-top: 5px; padding-bottom: 5px">
                                    <div>Szynka</div>
                                    <div>
                                        <a href="#" class="btn btn-danger btn-circle btn-sm">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                    </div>
                                </div>

                                <hr style="padding: 0px; margin: 0px">

                                <div class="card-body text-gray-100"
                                     style="display: flex; justify-content: space-between; padding-top: 5px; padding-bottom: 5px ">
                                    <div>Kabanosy</div>
                                    <div>
                                        <a href="#" class="btn btn-danger btn-circle btn-sm">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                    </div>
                                </div>

                                <div class="d-block card-footer py-3 bg-gray-900 border-bottom-0 border-top-0"
                                     data-toggle="collapse" role="button" aria-expanded="true"
                                     aria-controls="collapseCardExample">

                                    <a href="#" class="btn btn-danger btn-sm btn-icon-split">
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

                <%--                    tworzenie kategorii--%>

                <div class="row ">

                    <div class="container">

                        <div class="card shadow mb-4 border-left-0 border-bottom-0 border-right-0 border-top-0 bg-gray-700">
                            <!-- Card Header - Accordion -->
                            <div class="d-block card-header py-3 bg-gray-900 border-bottom-0">


                            <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                                <div class="input-group">
                                    <input type="text" class="form-control bg-light border-0 small"
                                           placeholder="Dodaj nową kategorię...">
                                    <div class="input-group-append">
                                        <button class="btn btn-info" type="button">
                                            <i class="fas fa-plus-circle fa-sm"></i> Dodaj
                                        </button>
                                    </div>
                                </div>
                            </form>

                        </div>


                    </div>


                </div>

            </div>


            <%--              KATEGORIA  w opcji zakupy wszystko do kupienia      --%>

            <div class="row ">

                <div class="container">

                    <div class="card shadow mb-4 border-left-0 border-bottom-0 border-right-0 border-top-0 bg-gray-700">
                        <!-- Card Header - Accordion -->
                        <a href="#coll2" class="d-block card-header py-3 bg-gray-900 border-bottom-0"
                           data-toggle="collapse" role="button" aria-expanded="true"
                           aria-controls="collapseCardExample">
                            <h6 class="m-0 font-weight-bold text-white">Agd</h6>
                        </a>
                        <!-- Card Content - Collapse -->
                        <div class="collapse show" id="coll2">
                            <div class="card-body text-gray-100"
                                 style="display: flex; justify-content: space-between; padding-top: 5px; padding-bottom: 5px ">
                                <div>
                                    <a href="#" class="btn btn-success btn-circle btn-sm">
                                        <i class="fas fa-check"></i>
                                    </a> Gąbki
                                </div>
                                <div>
                                    <a href="#" class="btn btn-warning btn-circle btn-sm">
                                        <i class="fas fa-exclamation-triangle"></i>
                                    </a>
                                    <a href="#" class="btn btn-danger btn-circle btn-sm">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </div>

                            </div>

                            <hr style="padding: 0px; margin: 0px">


                            <div class="card-body text-gray-100"
                                 style="display: flex; justify-content: space-between; padding-top: 5px; padding-bottom: 5px ">
                                <div>
                                    <a href="#" class="btn btn-success btn-circle btn-sm">
                                        <i class="fas fa-check"></i>
                                    </a> Papier toaletowy
                                </div>
                                <div>
                                    <a href="#" class="btn btn-warning btn-circle btn-sm">
                                        <i class="fas fa-exclamation-triangle"></i>
                                    </a>
                                    <a href="#" class="btn btn-danger btn-circle btn-sm">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </div>

                            </div>


                        </div>

                    </div>

                </div>
            </div>

            <%--                                   KATEGORIA z RÓŻNYMI WARIANTAMI    --%>

            <div class="row ">

                <div class="container">

                    <div class="card shadow mb-4 border-left-0 border-bottom-0 border-right-0 border-top-0 bg-gray-700">
                        <!-- Card Header - Accordion -->
                        <a href="#coll3" class="d-block card-header py-3 bg-gray-900 border-bottom-0"
                           data-toggle="collapse" role="button" aria-expanded="true"
                           aria-controls="collapseCardExample">
                            <h6 class="m-0 font-weight-bold text-white">Nabiał</h6>
                        </a>
                        <!-- Card Content - Collapse -->
                        <div class="collapse show" id="coll3">

                            <%--                                    produkt           --%>

                            <div class="card-body text-gray-100 bg-gradient-success"
                                 style="display: flex; justify-content: space-between; padding-top: 5px; padding-bottom: 5px ">
                                <div>
                                    Ser
                                </div>
                                <div>
                                    <a href="#" class="btn btn-success btn-circle btn-sm">
                                        <i class="fas fa-undo"></i>
                                    </a>

                                </div>

                            </div>

                            <hr style="padding: 0px; margin: 0px">


                            <div class="card-body text-gray-100"
                                 style="display: flex; justify-content: space-between; padding-top: 5px; padding-bottom: 5px ">
                                <div>
                                    <a href="#" class="btn btn-success btn-circle btn-sm">
                                        <i class="fas fa-check"></i>
                                    </a> Mleko
                                </div>
                                <div>
                                    <a href="#" class="btn btn-warning btn-circle btn-sm">
                                        <i class="fas fa-exclamation-triangle"></i>
                                    </a>
                                    <a href="#" class="btn btn-danger btn-circle btn-sm">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </div>

                            </div>

                            <hr style="padding: 0px; margin: 0px">


                            <div class="card-body text-gray-100"
                                 style="display: flex; justify-content: space-between; padding-top: 5px; padding-bottom: 5px ">
                                <div>
                                    <a href="#" class="btn btn-success btn-circle btn-sm">
                                        <i class="fas fa-check"></i>
                                    </a> Śmietana
                                </div>
                                <div>
                                    <a href="#" class="btn btn-warning btn-circle btn-sm">
                                        <i class="fas fa-exclamation-triangle"></i>
                                    </a>
                                    <a href="#" class="btn btn-danger btn-circle btn-sm">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </div>

                            </div>

                            <hr style="padding: 0px; margin: 0px">


                            <div class="card-body text-gray-100"
                                 style="display: flex; justify-content: space-between; padding-top: 5px; padding-bottom: 5px ">
                                <div>
                                    <a href="#" class="btn btn-success btn-circle btn-sm">
                                        <i class="fas fa-check"></i>
                                    </a> Jogurt
                                </div>
                                <div>
                                    <a href="#" class="btn btn-warning btn-circle btn-sm">
                                        <i class="fas fa-exclamation-triangle"></i>
                                    </a>
                                    <a href="#" class="btn btn-danger btn-circle btn-sm">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </div>

                            </div>

                        </div>

                    </div>

                </div>
            </div>


            <%--                    MEMO --%>

            <div class="row ">

                <div class="container">

                    <div class="card shadow mb-4 border-left-0 border-bottom-0 border-right-0 border-top-0 bg-gray-700">
                        <!-- Card Header - Accordion -->
                        <a href="#coll4" class="d-block card-header py-3 bg-gradient-warning border-bottom-0"
                           data-toggle="collapse" role="button" aria-expanded="true"
                           aria-controls="collapseCardExample">
                            <h6 class="m-0 font-weight-bold text-white">MEMO</h6>
                        </a>
                        <!-- Card Content - Collapse -->
                        <div class="collapse " id="coll4">

                            <%--                                    produkt           --%>

                            <div class="card-body text-gray-100 bg-gradient-warning"
                                 style="display: flex; justify-content: space-between; padding-top: 5px; padding-bottom: 5px ">
                                <div>
                                    Kocia karma
                                </div>
                                <div>
                                    <a href="#" class="btn btn-warning btn-circle btn-sm">
                                        <i class="fas fa-undo"></i>
                                    </a>

                                </div>

                            </div>


                            <div class="card-body text-gray-100 bg-gradient-warning"
                                 style="display: flex; justify-content: space-between; padding-top: 5px; padding-bottom: 5px ">
                                <div>
                                    Pieprz
                                </div>
                                <div>
                                    <a href="#" class="btn btn-warning btn-circle btn-sm">
                                        <i class="fas fa-undo"></i>
                                    </a>

                                </div>

                            </div>

                            <div class="card-body text-gray-100 bg-gradient-warning"
                                 style="display: flex; justify-content: space-between; padding-top: 5px; padding-bottom: 5px ">

                                <div class="card-body text-gray-100 bg-gradient-warning"
                                     style="padding-top: 5px; padding-bottom: 5px">
                                    <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-light border-0 small"
                                                   placeholder="Zapisz notatkę...">
                                            <div class="input-group-append">
                                                <button class="btn btn-warning" type="button">
                                                    <i class="fas fa-save fa-sm"></i> Zapisz
                                                </button>
                                            </div>
                                        </div>
                                    </form>

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
                        <a href="#coll5" class="d-block card-header py-3 bg-gradient-danger border-bottom-0"
                           data-toggle="collapse" role="button" aria-expanded="true"
                           aria-controls="collapseCardExample">
                            <h6 class="m-0 font-weight-bold text-white">USUNIĘTE</h6>
                        </a>
                        <!-- Card Content - Collapse -->
                        <div class="collapse " id="coll5">

                            <%--                                    produkt           --%>

                            <div class="card-body text-gray-100 bg-gradient-danger"
                                 style="display: flex; justify-content: space-between; padding-top: 5px; padding-bottom: 5px ">
                                <div>
                                    Kocia karma
                                </div>
                                <div>
                                    <a href="#" class="btn btn-danger btn-circle btn-sm">
                                        <i class="fas fa-undo"></i>
                                    </a>

                                </div>

                            </div>


                            <div class="card-body text-gray-100 bg-gradient-danger"
                                 style="display: flex; justify-content: space-between; padding-top: 5px; padding-bottom: 5px ">
                                <div>
                                    Pieprz
                                </div>
                                <div>
                                    <a href="#" class="btn btn-danger btn-circle btn-sm">
                                        <i class="fas fa-undo"></i>
                                    </a>

                                </div>

                            </div>

                            <div class="card-body text-gray-100 bg-gradient-danger"
                                 style="display: flex; justify-content: space-between; padding-top: 5px; padding-bottom: 5px ">

                                <div class="card-body text-gray-100 bg-gradient-danger"
                                     style="padding-top: 5px; padding-bottom: 5px">
                                    <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-light border-0 small"
                                                   placeholder="Zapisz notatkę...">
                                            <div class="input-group-append">
                                                <button class="btn btn-danger" type="button">
                                                    <i class="fas fa-save fa-sm"></i> Zapisz
                                                </button>
                                            </div>
                                        </div>
                                    </form>

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

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content bg-gray-200">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Potwierdź wylogowanie</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Wybierz "Wyloguj" aby zakończyć sesję i opuścić stronę.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Anuluj</button>
                <a class="btn btn-primary" href="login.html">Wyloguj</a>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="categoryModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content bg-gray-200">
            <div class="modal-header">
                <h5 class="modal-title" id="1exampleModalLabel">Dodawanie kategorii</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                    <div class="input-group">
                        <input type="text" class="form-control bg-light border-0 small"
                               placeholder="Dodaj kategorię...">
                        <div class="input-group-append">
                            <button class="btn btn-info" type="button">
                                <i class="fas fa-plus-circle fa-sm"></i> Dodaj
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
