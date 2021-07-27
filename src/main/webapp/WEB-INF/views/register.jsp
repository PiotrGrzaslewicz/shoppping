<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>

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

                        <h3 class="font-weight-bold text-gray-500">Rejestracja</h3>
                    </div>

                    <div class="flex-row">
                        <div>

                            <a href="/demo"
                               class="btn btn-warning btn-sm btn-icon-split">
                                                 <span class="icon text-white-50">
                                                    <i class="fas fa-play"></i>
                                                 </span>
                                <span class="text">DEMO</span>
                            </a>

                        </div>
                    </div>


                    <%--                 WRÓĆ do LISTY --%>



                </div>


                <!-- Topbar Navbar -->


            </nav>

            <!-- End of Topbar -->

            <!-- Begin Page Content -->


            <%--            LISTY--%>

            <div class="container-fluid flex-column h-100 align-items-center">



                <div class="row ">

                    <div class="container">

                        <div class="card shadow mb-4 border-left-0 border-bottom-0 border-right-0 border-top-0 bg-gray-700">
                            <!-- Card Header - Accordion -->
                            <a  class="d-block card-header py-3 bg-gray-900 border-bottom-0"
                            >
                                <h6 class="m-0 font-weight-bold text-white">Wprowadź dane nowego użytkownika</h6>
                            </a>
                            <!-- Card Content - Collapse -->
                            <div class="collapse show" id="coll2">
                                <div class="card-body text-gray-100"
                                     style="display: flex; justify-content: space-between; padding-top: 5px; padding-bottom: 5px ">
                                    <div class="">
                                        <form:form modelAttribute="user" class="user" action="/register" method="post">
                                            <div class="form-group row">
                                                <div class="col-sm-6 mb-3 mb-sm-0">
                                                    <form:errors path="name" cssClass="text-sm-center text-danger" />
                                                    <form:input path="name" type="text" class="form-control bg-light border-0 small" id="exampleFirstName" placeholder="Imię" minlength="3" required="true"/>
                                                </div>
                                                <div class="col-sm-6">
                                                    <form:errors path="surname" cssClass="text-sm-center text-danger" />
                                                    <form:input path="surname" type="text" class="form-control bg-light border-0 small" id="exampleLastName" placeholder="Nazwisko" minlength="3" required="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <form:errors path="email" cssClass="text-sm-center text-danger" />
                                                <form:input path="email" type="email" class="form-control bg-light border-0 small" id="exampleInputEmail" placeholder="Email Address"/>
                                            </div>
                                            <p class="text-sm-center text-danger">${msg}</p>
                                            <div class="form-group row">

                                                <div class="col-sm-6 mb-3 mb-sm-0">

                                                    <form:input path="password" type="password" class="form-control bg-light border-0 small" id="exampleInputPassword" placeholder="Hasło"/>
                                                </div>
                                                <div class="col-sm-6">
                                                    <input type="password" class="form-control bg-light border-0 small" id="exampleRepeatPassword" placeholder="Powtórz hasło" name="repassword">
                                                </div>
                                            </div>
                                            <div class="input-group-append">
                                                <button class="btn btn-info" type="submit">
                                                    <i class="fas fa-plus fa-sm"></i> Utwórz profil
                                                </button>
                                            </div>

                                        </form:form>

                                        <div class="text-center ">
                                            <a class="small text-white" href="/login">Masz już konto? Zaloguj się!</a>
                                        </div>
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

<%--add list modal--%>
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


                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="Warzywa"
                               name="categories">
                        <label class="form-check-label" for="inlineCheckbox1">Warzywa</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="Mięso"
                               name="categories">
                        <label class="form-check-label" for="inlineCheckbox2">Mięso</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="Nabiał"
                               name="categories">
                        <label class="form-check-label" for="inlineCheckbox3">Nabiał</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox4" value="Pieczywo"
                               name="categories">
                        <label class="form-check-label" for="inlineCheckbox4">Pieczywo</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox5"
                               value="Konserwy, suche zapasy, napoje" name="categories">
                        <label class="form-check-label" for="inlineCheckbox5">Konserwy, suche zapasy, napoje</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox6" value="AGD"
                               name="categories">
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
