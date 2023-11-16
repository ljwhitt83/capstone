
<%--
  Created by IntelliJ IDEA.
  User: ljwhi
  Date: 1/24/2021
  Time: 10:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"><meta http-equiv="refresh"  CONTENT="<%= session.getMaxInactiveInterval() %>;
URL='<%= session.getServletContext().getContextPath() %>/login?error=You have been logged out due to inactivity'" />

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="static/assets/vendor/bootstrap/css/bootstrap.min.css">
        <link href="static/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
        <link rel="stylesheet" href="static/assets/libs/css/style.css">
        <link rel="stylesheet" href="static/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
        <title>profile </title>
    </head>

<body>
<!-- ============================================================== -->
<!-- main wrapper -->
<!-- ============================================================== -->
<div class="dashboard-main-wrapper">
    <!-- ============================================================== -->
    <!-- navbar -->
    <!-- ============================================================== -->
    <jsp:include page="components/header.jsp"/>
    <!-- ============================================================== -->
    <!-- end navbar -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- left sidebar -->
    <!-- ============================================================== -->
    <jsp:include page="components/dashboard.jsp"/>
    <!-- ============================================================== -->
    <!-- end left sidebar -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- wrapper  -->
    <!-- ============================================================== -->
    <div class="dashboard-wrapper">
        <div class="influence-profile">
            <div class="container-fluid dashboard-content ">
                <!-- ============================================================== -->
                <!-- pageheader -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="page-header">
                            <h3 class="mb-2"> Profile </h3>
                            <p>
                                ${msg} ${success} <span class="text-danger"> ${error} </span>
                            </p>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page"> Profile </li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end pageheader -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- content -->
                <!-- ============================================================== -->
                <div class="row">
                    <!-- ============================================================== -->
                    <!-- profile -->
                    <!-- ============================================================== -->
                    <div class="col-xl-3 col-lg-3 col-md-5 col-sm-12 col-12">
                        <!-- ============================================================== -->
                        <!-- card profile -->
                        <!-- ============================================================== -->
                        <div class="card">
                            <div class="card-body">
                                <div class="user-avatar text-center d-block">
                                    <a href="#" data-toggle="modal" data-target="#add-images" >
                                        <c:if test="${not empty user_account.image}">
                                            <img src="static/img/users/${user_account.id}/profile/${user_account.image}" class="rounded-circle user-avatar-xxl">
                                        </c:if>
                                        <div><i class="fa fa-upload text-center"></i></div>
                                    </a>
                                </div>
                                <div class="text-center">
                                    <h2 class="font-24 mb-0">${user_account.fname} ${user_account.lname} <span class="text-danger">${denied}</span></h2>
                                </div>
                            </div>
                            <div class="card-body border-top">
                                <h3 class="font-16">Contact Information</h3>
                                <div class="">
                                    <ul class="list-unstyled mb-0">
                                        <li class="mb-2"><i class="far fa-envelope mr-2"></i>${user_account.email}</li>
                                        <li class="mb-0"><i class=" fas fa-phone-square mr-2  text-primary"></i> ${user_account.getAddress().phone}</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- end card profile -->
                        <!-- ============================================================== -->
                    </div>
                    <!-- ============================================================== -->
                    <!-- end profile -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- campaign data -->
                    <!-- ============================================================== -->
                    <div class="col-xl-9 col-lg-9 col-md-7 col-sm-12 col-12">
                        <!-- ============================================================== -->
                        <!-- campaign tab one -->
                        <!-- ============================================================== -->
                        <div class="influence-profile-content pills-regular">
                            <ul class="nav nav-pills mb-3 nav-justified" id="pills-tab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="pills-campaign-tab" data-toggle="pill" href="#pills-campaign" role="tab" aria-controls="pills-campaign" aria-selected="true">Contact</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="pills-cards-tab" data-toggle="pill" href="#pills-cards" role="tab" aria-controls="pills-review" aria-selected="false">Cards</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="pills-product-tab" data-toggle="pill" href="#pills-product" role="tab" aria-controls="pills-msg" aria-selected="false">Listings</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="pills-packages-tab" data-toggle="pill" href="#pills-packages" role="tab" aria-controls="pills-packages" aria-selected="false">Rest Password</a>
                                </li>
                            </ul>
                            <div class="tab-content" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="pills-campaign" role="tabpanel" aria-labelledby="pills-campaign-tab">
                                    <div class="row">
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <div class="section-block">
                                                <h3 class="section-title">Contact Information</h3>
                                            </div>
                                        </div>
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <div class="card">
                                                <form:form action="updatecontact" modelAttribute="address" method="post" >
                                                    <div class="card-body">
                                                        <form:input type="hidden" path="id" value="${user_account.id}"/>
                                                        <form:input type="hidden" path="accounts.id" value="${user_account.id}"/>
                                                        <div class="form-row">
                                                            <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12 mb-2">
                                                                <label for="street">Address</label>
                                                                <form:input class="form-control form-control-lg" path="street" value="" placeholder="Enter Address"/>
                                                                <div class="invalid-feedback">
                                                                    Please provide a valid city.
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12 mb-2">
                                                                <label for="city">City</label>
                                                                <form:input class="form-control form-control-lg" path="city" value="" placeholder="Enter City"/>
                                                                <div class="invalid-feedback">
                                                                    Please provide a valid state.
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12 mb-2">
                                                                <label>State/Province<em class="required">*</em></label>
                                                                <form:select class="form-control form-control-lg" id="region_id" path="state" required="true">
                                                                    <c:choose>
                                                                        <c:when test="${empty user_account.getAddress().state}">
                                                                            <option value="">Select State</option>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <option value="${user_account.getAddress().state}">
                                                                                    ${user_account.getAddress().state}
                                                                            </option>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                    <c:forEach items="${states}" var="state">
                                                                        <option value="${state}">${state.id}</option>
                                                                    </c:forEach>
                                                                </form:select>
                                                            </div>
                                                        </div>

                                                        <div class="form-row">
                                                            <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12 mb-2">
                                                                <label for="zip">ZIP</label>
                                                                <form:input class="form-control form-control-lg" path="zip" value="" placeholder="Enter ZIP"/>
                                                            </div>
                                                            <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12 mb-2">
                                                                <label for="phone">Phone</label>
                                                                <form:input  class="form-control form-control-lg"  path="phone" value="" placeholder="Enter phone" />
                                                            </div>
                                                            <div class="col-xl-2 col-lg-2 col-md-12 col-sm-12 col-12 mb-2">
                                                                <label for="age">Age</label>
                                                                <form:input  class="form-control form-control-lg"  path="age" value="" placeholder="Enter Age" />
                                                            </div>
                                                            <div class="col-xl-2 col-lg-2 col-md-12 col-sm-12 col-12 mb-2">
                                                                <label for="gender">Gender</label>
                                                                <form:select class="form-control form-control-lg" path="gender" required="true">
                                                                    <c:choose>
                                                                        <c:when test="${empty user_account.getAddress().gender}">
                                                                            <option value="">Select</option>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <option value="${user_account.getAddress().gender}">
                                                                                    ${user_account.getAddress().gender}
                                                                            </option>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                    <option value="Male">Male</option>
                                                                    <option value="Female">Female</option>
                                                                </form:select>
                                                            </div>
                                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
                                                                <button class="btn btn-primary btn-sm" type="submit">Save</button>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </form:form>
                                            </div>
                                        </div>

                                    </div>

                                </div>
                                <div class="tab-pane fade" id="pills-packages" role="tabpanel" aria-labelledby="pills-packages-tab">

                                    <div class="row">
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <div class="section-block">
                                                <h2 class="section-title">Reset Password</h2>
                                            </div>
                                        </div>
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <div class="card">
                                                <form:form action="changepassword" modelAttribute="user" method="post" >
                                                    <div class="card-body">
                                                        <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12 mb-2">
                                                            <form:input type="hidden" path="id" value="${user_account.id}" class="form-control"  placeholder="Password"/>
                                                            <label for="password">Old Password <span class="required">*</span></label>
                                                            <form:input type="password" path="password" class="form-control" placeholder="Password"/>
                                                        </div>
                                                        <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12 mb-2">
                                                            <label for="password">Create New Password <span class="required">*</span></label>
                                                            <form:input type="password" path="password2" class="form-control"  placeholder="Create new Password"/>
                                                        </div>
                                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
                                                            <button class="btn btn-primary btn-sm" type="submit">Reset</button>
                                                        </div>
                                                    </div>
                                                </form:form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="pills-cards" role="tabpanel" aria-labelledby="pills-cards-tab">
                                    <div class="card">
                                        <div class="card-header">
                                            <a href="#" data-toggle="modal" data-target="#addnew" class="btn btn-danger btn-sm">Add Card <i class="far fa-credit-card"></i></a>
                                        </div>

                                        <div class="card-body">
                                            <div class="card-body">

                                                <c:if test="${not empty user_account.getPaymentMethod()}">
                                                    <table class="table ">
                                                        <tr class="text-success">
                                                            <th>#</th>
                                                            <th>
                                                                <input id="searchnow" class="form-control form-control-sm col-md-8" type="text" placeholder="Filter Card ">
                                                            </th>
                                                            <th>Expiry</th>
                                                            <th>Type</th>
                                                        </tr>
                                                        <tbody>
                                                        <c:set var="count" value="0"/>
                                                        <c:forEach var="cards" items="${user_account.getPaymentMethod()}">
                                                            <c:set var="count" value="${count+1}"/>
                                                            <tr>
                                                                <td> ${count}.</td>
                                                                <td> ${cards.cardno}</td>
                                                                <td>
                                                                        ${cards.expiry}
                                                                </td>
                                                                <td> ${cards.type}
                                                                    <a href="deletecard?id=${cards.id}" onclick="confirmed(); return false;" class="btn btn-default"> <i class="far fa-trash-alt"></i></a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </c:if>
                                            </div>

                                        </div>

                                    </div>

                                </div>
                                <div class="tab-pane fade" id="pills-product" role="tabpanel" aria-labelledby="pills-product-tab">
                                    <div class="card">
                                        <h5 class="card-header">My Listings [${user_account.getProducts().size()}]
                                            <a  href="#" data-toggle="modal" data-target="#edit"
                                                class="btn btn-danger btn-sm float-right"> <i class="fa fa-plus" aria-hidden="true"></i> Add Product
                                            </a>
                                        </h5>
                                        <div class="card-body">
                                            <div class="col-md-12">
                                                <c:if test="${not empty user_account.getProducts()}">
                                                    <table class="table ">
                                                        <tr class="text-success">
                                                            <th>#</th>
                                                            <th>Product</th>
                                                            <th></th>
                                                            <th>Department</th>
                                                            <th>Action</th>
                                                        </tr>
                                                        <tbody>
                                                        <c:set var="count" value="0"/>
                                                        <c:forEach var="pi" items="${user_account.getProducts()}">
                                                            <c:set var="count" value="${count+1}"/>
                                                            <tr>
                                                                <td> ${count}.</td>
                                                                <td>


                                                                    <div>
                                                                        <a href="productdetails?id=${pi.id}">
                                                                            <img width="80" src="static/img/products/${pi.id}/${pi.img}" alt="" />
                                                                        </a>
                                                                    </div>

                                                                </td>
                                                                <td>
                                                                        ${pi.name} <br> ${pi.color} <br> $<fmt:formatNumber value="${pi.price}" maxFractionDigits="2" minFractionDigits="2"/>
                                                                </td>
                                                                <td>
                                                                        ${pi.type}
                                                                </td>
                                                                <td>
                                                                    <a href="deleteproduct?id=${pi.id}" onclick="confirmed(); return false;" class="btn btn-default"> <i class="far fa-trash-alt"></i></a>

                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </c:if>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- end campaign tab one -->
                        <!-- ============================================================== -->
                    </div>
                    <!-- ============================================================== -->
                    <!-- end campaign data -->
                    <!-- ============================================================== -->
                </div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- end content -->
        <!-- ============================================================== -->


    </div>
    <!-- ============================================================== -->
    <!-- end wrapper -->
    <!-- ============================================================== -->
</div>

<div class="modal fade show" id="add-images" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add Profile Image</h5>
                <a href="#" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </a>
            </div>
            <form method="POST" action="addimages" enctype="multipart/form-data"  >

                <div class="modal-body">
                    <img id="output_image" class="col-md-10 rounded-circle"/>

                    <div class="custom-file mb-3">
                        <input type="file" name="file" class="custom-file-input" id="customFile" onchange="preview_image(event)">
                        <label class="custom-file-label" for="customFile">File Input</label>
                    </div>
                    <input name="id" type="hidden" value="${user_account.id}" >
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Save</button>
                    <a href="#" class="btn btn-secondary" data-dismiss="modal">Close</a>

                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade show" id="addnew" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <!-- Modal body -->
            <div class="modal-body">
                <h4>Add <i class="far fa-credit-card"></i></h4>
                <form:form action="addcard" modelAttribute="card" method="post" role="form"  >
                    <div class="form-group">
                        <label for="cardno">Card Number<em class="required">*</em></label>
                        <form:input type="text" class="form-control" path="cardno" placeholder="Card Number" minlenth="9" />
                    </div>
                    <div class="form-group">
                        <label for="expiry">Expiry Date<em class="required">*</em></label>
                        <form:input type="month" class="form-control"  path="expiry" placeholder="Expiry Date"/>
                    </div>
                    <div class="form-group">
                        <label for="secode">Card Security<em class="required">*</em></label>
                        <form:input type="number" class="form-control" path="secode" placeholder="Card Security" min="3" />
                    </div>
                    <form:input type="hidden" path="id" value="${user_account.id}"/>
                    <form:input type="hidden" path="accounts.id" value="${user_account.id}"/>
                    <button type="submit" title="Save" class="btn btn-success"><span>Save</span></button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </form:form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="edit">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-">
                    Add New product
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
                </h5>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <form:form action="saveproduct" modelAttribute="product" method="post" role="form" enctype="multipart/form-data" >
                    <form:input type="hidden" path="id"/>
                    <form:input type="hidden" path="users_id" value="${user_account.id}"/>
                    <form:input type="hidden" path="img" />
                    <form:input type="hidden" path="email" value="${user_account.email}" />
                    <div class="form-row">
                        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 mb-2">
                            <label for="name">Product Name</label>
                            <form:input path="name" placeholder="Product Name" class="form-control" />
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 mb-2">
                            <label for="price">Price</label>
                            <form:input path="price" placeholder="Price" class="form-control" />
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 mb-2">
                            <label for="size"> Size <span class="required">*</span></label>
                            <select name="size" class="form-control" >
                                <option value="" >Select</option>
                                <c:forEach items="${sizes}" var="item">
                                    <option value="${item}" > ${item}</option>
                                </c:forEach>
                            </select>

                        </div>

                        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 mb-2">
                            <label for="type"> Department <span class="required">*</span></label>
                            <select name="type" class="form-control" >
                                <option value="" >Select</option>
                                <option value="Electronics" >Electronics</option>
                                <option value="Clothing" >Clothing</option>
                                <option value="Shoe" >Shoe</option>

                            </select>

                        </div>

                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb-2">
                            <label for="name"> Color<span class="required">*</span> </label>
                            <form:select path="color" id="color" multiple="true" class="form-control"  required="required" >
                                <option value="" >Select</option>
                                <c:forEach items="${cols}" var="item">
                                    <option value="${item}" > ${item}</option>
                                </c:forEach>
                            </form:select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb-2">
                            <div class="form-group">
                                <label for="des">Description<em class="required">*</em></label>
                                <form:textarea path="des"  placeholder="Description" class="form-control" cols="5" rows="4"  required="required"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">

                        <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12 mb-2">
                            <form:input path="file" type="file" name="file" class="custom-file-input" required="required"/>
                            <label class="custom-file-label" for="customFile">File 1st</label>
                        </div>

                        <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12 mb-2">
                            <form:input path="file" type="file" name="file" class="custom-file-input"/>
                            <label class="custom-file-label" for="customFile">File 2nd</label>
                        </div>

                        <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12 mb-2">
                            <form:input path="file" type="file" name="file" class="custom-file-input"/>
                            <label class="custom-file-label" for="customFile">File 3rd</label>
                        </div>

                        <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12 mb-2">
                            <form:input path="file" type="file" name="file" class="custom-file-input"/>
                            <label class="custom-file-label" for="customFile">File 4th</label>
                        </div>



                    </div>
                    <hr>

                    <button class="btn btn-primary" type="submit">Submit</button>
                    <button type="button" data-dismiss="modal" aria-label="Close" class="btn btn-danger"><span aria-hidden="true">Close</span></button>

                </form:form>

            </div>
        </div>
    </div>
</div>




<!-- ============================================================== -->
<!-- end main wrapper -->
<!-- ============================================================== -->
<!-- Optional JavaScript -->
<!-- jquery 3.3.1  -->
<script src="static/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
<!-- bootstap bundle js -->
<script src="static/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<!-- slimscroll js -->
<script src="static/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
<!-- main js -->
<script src="static/assets/libs/js/main-js.js"></script>

<script>
    function confirmed(){
        if (confirm('You are about to delete, Do you want to proceed?')) {
            document.getElementById("del").submit();
            return true;
        } else {
            return false;
        }
    }

    $("#searchnow").keyup(function () {
        var value = this.value.toLowerCase().trim();

        $("table tr").each(function (index) {
            if (!index) return;
            $(this).find("td").each(function () {
                var id = $(this).text().toLowerCase().trim();
                var not_found = (id.indexOf(value) == -1);
                $(this).closest('tr').toggle(!not_found);
                return not_found;
            });
        });
    });

    function preview_image(event)
    {
        var reader = new FileReader();
        reader.onload = function()
        {
            var output = document.getElementById('output_image');
            output.classList.add("preview");
            output.src = reader.result;
        }
        reader.readAsDataURL(event.target.files[0]);
    }

</script>
</body>

</html>