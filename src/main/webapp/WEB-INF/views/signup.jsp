<%--
  Created by IntelliJ IDEA.
  User: ljwhi
  Date: 1/24/2021
  Time: 11:59 AM
  To change this template use File | Settings | File Templates.
--%>
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
<div class="splash-container"><br><br><br>
    <jsp:include page="components/header.jsp"/>
    <div class="card ">
        <div class="card-header text-center"><a href="home"><!-- <img class="logo-img" src="static/assets/images/logo.png" alt="logo"> --></a>
            <span class="splash-description">Register<br>  ${success} <span class="text-danger">${error} ${param.error}</span></span></div>
        <div class="card-body">
            <form:form action="register" modelAttribute="accounts" method="Post">
                <div class="form-group">
                    <form:input path="fname" class="form-control form-control-lg"  type="text" placeholder="First Name" autocomplete="off"/>
                    <form:errors path="fname" class="text-danger"></form:errors>
                </div>
                <div class="form-group">
                    <form:input path="lname" class="form-control form-control-lg"  type="text" placeholder="Last Name" autocomplete="off"/>
                    <form:errors path="lname" class="text-danger"></form:errors>
                </div>
                <div class="form-group">
                    <form:input type="email" path="email" class="form-control form-control-lg"  placeholder="E-mail" autocomplete="off" />
                    <form:errors path="email" class="text-danger"></form:errors>
                </div>
                <div class="form-group input-group" id="custom-search">
                    <form:input  class="form-control form-control-lg pwd" path="password" id="password" type="password" placeholder="Password" autocomplete="off" />
                    <div class="input-group-append">
                        <button class="btn btn-default reveal" type="button"><i class="fas fa-eye"></i></button>
                    </div>
                </div>
                <form:errors path="password" class="text-danger"></form:errors>

                <div class="form-group input-group" id="custom-search">
                    <form:input  class="form-control form-control-lg pwd" path="password2" id="password2" type="password" placeholder="Password" autocomplete="off" />
                    <div class="input-group-append">
                        <button class="btn btn-default reveal" type="button"><i class="fas fa-eye"></i></button>
                    </div>

                </div>
                <form:errors path="password2" class="text-danger"></form:errors>

                <div class="form-group">
                    <label class="custom-control custom-checkbox">
                        <input class="custom-control-input" type="checkbox"><span class="custom-control-label">Remember Me</span>
                    </label>
                </div>
                <button type="submit" class="btn btn-primary btn-lg btn-block">Sign in</button>
            </form:form>
        </div>
        <!-- <div class="card-footer bg-white p-0  ">
            <div class="card-footer-item card-footer-item-bordered">
                <a href="login" class="footer-link">Login</a></div>
             <div class="card-footer-item card-footer-item-bordered">
                <a href="contact" class="footer-link">Contact</a>
            </div>
            <div class="card-footer-item card-footer-item-bordered">
                <a href="home" class="footer-link">Home</a>
            </div>
        </div> -->
    </div>
</div>

<!-- ============================================================== -->
<!-- end login page  -->
<!-- ============================================================== -->
<!-- Optional JavaScript -->
<script src="static/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
<script src="static/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
</body>

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

</html>