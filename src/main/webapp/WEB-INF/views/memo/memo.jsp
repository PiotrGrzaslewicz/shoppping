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
    <link href="<c:url value="/static/sb/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value="/static/sb/css/sb-admin-2.min.css"/>" rel="stylesheet">

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
                        <h3 class="font-weight-bold text-gray-500">Zapisane notatki</h3>
                    </div>


                    <%--                 DODAJ KATEGORIĘ --%>
                    <div class=" mb-8">
                        <div>
                            <a href="#" class="btn btn-info  btn-icon-split" data-toggle="modal"
                               data-target="#categoryModal">
                            <span class="icon text-white-50">
                            <i class="fas fa-undo"></i>
                            </span>
                                <span class="text">Wróć do listy zakupów</span>
                            </a>
                        </div>
                    </div>

                    <%--                ROZPOCZNIJ ZAKUPY --%>

                    <%--                    <div class="mb-8">--%>
                    <%--                        <div>--%>
                    <%--                            <a href="#" class="btn btn-success btn-icon-split">--%>
                    <%--                    <span class="icon text-white-50">--%>
                    <%--                      <i class="fas fa-play"></i>--%>
                    <%--                    </span>--%>
                    <%--                                <span class="text">Rozpocznij zakupy</span>--%>
                    <%--                            </a>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>

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
                            <a class="dropdown-item" href="/user/edit">
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


                <%--               KATEGORIA w opcji TWORZENIE LISTY        --%>




                <%--              KATEGORIA  w opcji zakupy wszystko do kupienia      --%>

                <div class="row">

                    <div class="container">

                        <div class="card shadow mb-4 border-left-0 border-bottom-0 border-right-0 border-top-0 bg-gray-700">
                            <!-- Card Header - Accordion -->
                            <div  class="d-block card-header py-3 bg-gray-900 border-bottom-0">
                                <h6 class="m-0 font-weight-bold text-white">Notatka 1</h6>
                            </div>
                            <!-- Card Content - Collapse -->



                            <hr style="padding: 0px; margin: 0px">


                            <div class="card-body text-gray-100"
                                 style="display: flex; justify-content: space-between; padding-top: 5px; padding-bottom: 5px ">
                                <div>

                                        Boczek

                                </div>


                            </div>

                            <div class="card-body text-gray-100"
                                 style="display: flex; justify-content: space-between; padding-top: 5px; padding-bottom: 5px ">
                                <div>

                                        Cukierki

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




<!-- Bootstrap core JavaScript-->
<script src="<c:url value="/static/sb/vendor/jquery/jquery.min.js"/>"></script>
<script src="<c:url value="/static/sb/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

<!-- Core plugin JavaScript-->
<script src="<c:url value="/static/sb/vendor/jquery-easing/jquery.easing.min.js"/>"></script>

<!-- Custom scripts for all pages-->
<script src="<c:url value="/static/sb/js/sb-admin-2.min.js"/>"></script>

</body>

</html>
