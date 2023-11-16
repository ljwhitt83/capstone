<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="static/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="static/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="static/assets/libs/css/style.css">
    <link rel="stylesheet" href="static/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <title>Product Detail</title>
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
            <div class="influence-finder">
                <div class="container-fluid dashboard-content">
                    <!-- ============================================================== -->
                    <!-- pageheader -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="page-header">
                                <h3 class="mb-2">${item.type}: Product Detail  </h3>
                                <p class="pageheader-text"></p>                               
                                 
                                <div class="page-breadcrumb">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">${item.name}</li>
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
                         <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <!-- ============================================================== -->
                            <!-- card influencer one -->
                            <!-- ============================================================== -->
                            <div class="card">
                                 <div class="card-body">
                                  
                         	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="row">
                              <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-12">
		                        
		                                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		                                    
                                            
		                                    <div class="carousel-inner">
		                                        
		                                        <c:forEach var="img" items="${item.getIfiles()}">
                                                <div class="carousel-item <c:if test="${item.getIfiles().indexOf(img) eq 0}">active</c:if>">
		                                            <img class="product-img" src="static/img/products/${item.id}/${img.image}" style="width:auto; max-height:400px;">
		                                            <div class="ribbons-text btn btn-default">
		                                            <c:if test="${item.email eq loggedInuser or fn:contains(role, 'ADMIN')}">
							                        <a href="removeimg?id=${item.id}&imgid=${img.id}&img=${img.image}" onclick="confirmed(); return false;" title="Delete">
							                        <i class="fa fa-times text-danger" ></i></a>
													<a href="setimg?id=${item.id}&img=${img.image}" title="Set as main Image"> <i class="btn-xm fa fa-plus text-success"></i></a>
													</c:if>
		                                            </div>
		                                            <div class=""><a href="#" class="product-wishlist-btn btn-light">
		                                            ${item.getIfiles().indexOf(img)+1}/${item.getIfiles().size()}</a></div>
		                                            
		                                        </div>
		                                        </c:forEach>
		                                    </div>
		                                    
		                                    <ol class="carousel-indicators">
                                               <c:forEach var="img" items="${item.getIfiles()}">
                                            
                                                <a href="#" data-target="#carouselExampleIndicators" data-slide-to="${item.getIfiles().indexOf(img)}"
                                                 class="<c:if test="${item.getIfiles().indexOf(img) eq 0}">active</c:if>">
                                                  <img src="static/img/products/${item.id}/${img.image}" style="width:50px; max-height:50px;">
                                                
                                                 </a>
                                                
                                               
                                               </c:forEach> 
                                            </ol>
		                                </div>
		                        </div>
                                
                                <div class="col-xl-8 col-lg-8 col-md-8 col-sm-12 col-12 pl-xl-0 pl-lg-0 pl-md-0 border-left m-b-30">
                                    <div class="product-details">
                                        <div class="border-bottom pb-3 mb-3">
                                            <h4 class="mb-3 text-success">${item.name}</h4>
                                            
                                            <h5 class="mb-0 text-danger"> $<fmt:formatNumber value="${item.price}" 
											       maxFractionDigits="2" minFractionDigits="2"/>
											      
							                </h5>
							                
                                        </div>
                                        <div class="product-colors border-bottom">
                                            <h4>Select Colors</h4>
                                            <input type="radio" class="radio" id="radio-1" name="group" />
                                            <label for="radio-1"></label>
                                            <input type="radio" class="radio" id="radio-2" name="group" />
                                            <label for="radio-2"></label>
                                            <input type="radio" class="radio" id="radio-3" name="group" />
                                            <label for="radio-3"></label>
                                        </div>
                                        
                                        <div class="product-size border-bottom">
                                            <h4>Size</h4>
                                            <div class="btn-group" role="group" aria-label="First group">
                                                <button type="button" class="btn btn-outline-light">SM</button>
                                                <button type="button" class="btn btn-outline-light">L</button>
                                                <button type="button" class="btn btn-outline-light">XL</button>
                                                <button type="button" class="btn btn-outline-light">2XL</button>
                                            </div>
                                            <div class="product-qty">
                                                <h4>Quantity</h4>
                                                <div class="quantity">
                                                    <input type="number" min="1" max="9" step="1" value="1" >
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product-description">
                                            <h4 class="mb-1">Descriptions</h4>
                                            <p>${item.des}</p>
                                            <a href="#" class="btn btn-primary btn-block btn-lg">Add to Cart</a>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                            
	                      
	                    </div>
	                   </div>
                      </div>
                      </div>
                        
                        <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 m-b-10">
                                    <h3> Related Products</h3>
                                </div>
                                <c:forEach var="item" items="${list}">
                                <div class="col-xl-4 col-lg-6 col-md-12 col-sm-12 col-12">
                                    <div class="product-thumbnail">
                                        <div class="product-img-head">
                                            <div class="product-img">
                                                <img src="static/img/products/${item.id}/${item.img}" class="img-fluid" style="width:300px; height:300px;"></div>
                                            <div class="ribbons">New</div>
                                            <div class=""><a href="#" class="product-wishlist-btn"><i class="fas fa-heart"></i></a></div>
                                        </div>
                                        <div class="product-content">
                                            <div class="product-content-head">
                                                <h3 class="product-title">${item.name}</h3>                                                
                                                <div class="product-price">
                                                 $<fmt:formatNumber value="${item.price}" 
											       maxFractionDigits="2" minFractionDigits="2"/>
                                                </div>
                                            </div>
                                            <div class="product-btn">
                                                <a href="productdetails?id=${item.id}" class="btn btn-primary btn-sm">Add to Cart</a>
                                               
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                                </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- footer -->
                    <!-- ============================================================== -->
                    <div class="footer">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                                    Copyright © 2018 Concept. All rights reserved. Dashboard by <a href="https://colorlib.com/wp/">Colorlib</a>.
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                                    <div class="text-md-right footer-links d-none d-sm-block">
                                        <a href="about">About</a>                                       
                                        <a href="contact">Contact Us</a>
                                         <a href="home">Home</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end footer -->
                    <!-- ============================================================== -->
                </div>
                <!-- ============================================================== -->
                <!-- end wrapper  -->
                <!-- ============================================================== -->
            </div>
        <!-- ============================================================== -->
        <!-- end wrapper -->
        <!-- ============================================================== -->
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
        jQuery('<div class="quantity-nav"><div class="quantity-button quantity-up">+</div><div class="quantity-button quantity-down">-</div></div>').insertAfter('.quantity input');
        jQuery('.quantity').each(function() {
            var spinner = jQuery(this),
                input = spinner.find('input[type="number"]'),
                btnUp = spinner.find('.quantity-up'),
                btnDown = spinner.find('.quantity-down'),
                min = input.attr('min'),
                max = input.attr('max');

            btnUp.click(function() {
                var oldValue = parseFloat(input.val());
                if (oldValue >= max) {
                    var newVal = oldValue;
                } else {
                    var newVal = oldValue + 1;
                }
                spinner.find("input").val(newVal);
                spinner.find("input").trigger("change");
            });

            btnDown.click(function() {
                var oldValue = parseFloat(input.val());
                if (oldValue <= min) {
                    var newVal = oldValue;
                } else {
                    var newVal = oldValue - 1;
                }
                spinner.find("input").val(newVal);
                spinner.find("input").trigger("change");
            });

        });
        </script>
    
      <script src="static/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
        <!-- bootstap bundle js -->
        <script src="static/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
        <!-- slimscroll js -->
        <script src="static/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
        <!-- main js -->
        <script src="static/assets/libs/js/main-js.js"></script>
        <script>
        jQuery('<div class="quantity-nav"><div class="quantity-button quantity-up">+</div><div class="quantity-button quantity-down">-</div></div>').insertAfter('.quantity input');
        jQuery('.quantity').each(function() {
            var spinner = jQuery(this),
                input = spinner.find('input[type="number"]'),
                btnUp = spinner.find('.quantity-up'),
                btnDown = spinner.find('.quantity-down'),
                min = input.attr('min'),
                max = input.attr('max');

            btnUp.click(function() {
                var oldValue = parseFloat(input.val());
                if (oldValue >= max) {
                    var newVal = oldValue;
                } else {
                    var newVal = oldValue + 1;
                }
                spinner.find("input").val(newVal);
                spinner.find("input").trigger("change");
            });

            btnDown.click(function() {
                var oldValue = parseFloat(input.val());
                if (oldValue <= min) {
                    var newVal = oldValue;
                } else {
                    var newVal = oldValue - 1;
                }
                spinner.find("input").val(newVal);
                spinner.find("input").trigger("change");
            });

        });
        </script>
   
</body>
 
</html>