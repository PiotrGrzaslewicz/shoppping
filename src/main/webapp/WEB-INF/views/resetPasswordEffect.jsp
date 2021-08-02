<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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

                        <a href="/login"
                           class="btn btn-info btn-sm btn-icon-split">
                                                 <span class="icon text-white-50">
                                                    <i class="fas fa-play"></i>
                                                 </span>
                            <span class="text">LOGOWANIE</span>
                        </a>

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
                            <a  class="d-block card-header py-3 bg-gray-900 border-bottom-0">
                                <h6 class="m-0 font-weight-bold text-white">Resetowanie hasła</h6>
                            </a>
                            <!-- Card Content - Collapse -->
                            <div class="collapse show" id="coll2">
                                <div class="card-body text-gray-100"
                                     style="display: flex; justify-content: space-between; padding-top: 5px; padding-bottom: 5px ">
                                    <div class="">

                                        ${msg}

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




<!-- Bootstrap core JavaScript-->
<script src="<c:url value="/sb/vendor/jquery/jquery.min.js"/>"></script>
<script src="<c:url value="/sb/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

<!-- Core plugin JavaScript-->
<script src="<c:url value="/sb/vendor/jquery-easing/jquery.easing.min.js"/>"></script>

<!-- Custom scripts for all pages-->
<script src="<c:url value="/sb/js/sb-admin-2.min.js"/>"></script>

</body>

</html>
