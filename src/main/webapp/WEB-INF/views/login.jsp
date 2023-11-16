<%--
  Created by IntelliJ IDEA.
  User: ljwhi
  Date: 1/24/2021
  Time: 11:59 AM
  To change this template use File | Settings | File Templates.
--%>

<!doctype html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:if test="${not empty role}">
    <c:redirect url="/profile"/>
</c:if>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="static/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="static/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="static/assets/libs/css/style.css">
    <link rel="stylesheet" href="static/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <style>
        html,
        body {
            height: 100%;
        }

        body {
            display: -ms-flexbox;
            display: flex;
            -ms-flex-align: center;
            align-items: center;
            padding-top: 40px;
            padding-bottom: 40px;
        }
    </style>
</head>

<body>
<!-- ============================================================== -->
<!-- login page  -->
<!-- ============================================================== -->
<div class="splash-container">
    <jsp:include page="components/header.jsp"/>

    <div class="card ">
        <div class="card-header text-center"><a href="home"><!-- <img class="logo-img" src="static/assets/images/logo.png" alt="logo"> --></a>
            <h3 class="splash-description">${msg}<br>  ${success} </h3></div>
        <div class="card-body">
            <h3 class="text-danger text-center"> ${param.error} ${error}</h3>
            <form action="login" method="Post" autocomplete="off">
                <div class="form-group">
                    <input class="form-control form-control-lg" name="email" id="username" type="text" placeholder="Username" >
                </div>

                <div class="input-group" id="custom-search">
                    <input  class="form-control form-control-lg pwd" name="password" id="password" type="password" placeholder="Password">
                    <div class="input-group-append">
                        <button class="btn btn-default reveal" type="button"><i class="fas fa-eye"></i></button>
                    </div>
                </div>

                <div class="form-group">
                    <label class="custom-control custom-checkbox">
                        <input class="custom-control-input" type="checkbox"><span class="custom-control-label">Remember Me</span>
                    </label>
                </div>
                <button type="submit" class="btn btn-primary btn-lg btn-block">Sign in</button>
            </form>
        </div>
        <div class="card-footer bg-white p-0  ">
            <div class="card-footer-item card-footer-item-bordered">
                <a href="register" class="footer-link">Create An Account</a></div>
            <div class="card-footer-item card-footer-item-bordered">
                <a href="#" data-toggle="modal" data-target="#paswd" class="footer-link">Forgot Password</a>
            </div>
        </div>
    </div>
</div>

<div class="modal fade show" id="paswd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Password Help</h5>
                <a href="#" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </a>
            </div>
            <div class="card-body">
                <form action="#" method="post">
                    <div class="form-group">
                        <label for="name">We will send password reset instructions to your e-mail</label>
                        <input type="email" class="form-control form-control-lg" name="name" id="name" placeholder="E-Mail" required>
                    </div>

                    <button type="submit" class="btn btn-primary float-left">Send Message</button>
                </form>
            </div>

        </div>
    </div>
</div>

<!-- ============================================================== -->
<!-- end login page  -->
<!-- ============================================================== -->
<!-- Optional JavaScript -->
<script src="static/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
<script src="static/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>

<script type="text/javascript">
    $(".reveal").on('click',function() {
        var $pwd = $(".pwd");
        if ($pwd.attr('type') === 'password') {
            $pwd.attr('type', 'text');
        } else {
            $pwd.attr('type', 'password');
        }
    });

</script>
</body>

</html>
