<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

 
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
    <title>Shop</title>
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
                                <h3 class="mb-2">Shop ${msg}</h3>
                                <p class="pageheader-text"></p>                               
                                 
                                <div class="page-breadcrumb">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Shop</li>
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
                           			<div class="row">
									<div class="col-xl-9 col-lg-9 col-md-9 col-sm-12 col-12">
					                <c:if test="${list.hasContent()}">	
					                 <nav aria-label="Page navigation example">
                  						<ul class="pagination">
							                        <c:set var="prev" value="0"/>
							                        <c:if test="${list.hasContent()}">
							                            <c:set var="prev" value="${list.getNumber()-1}"/>
							                        </c:if>
							                        <c:if test="${list.hasPrevious()}">
							                             <li class='page-item'>
							                                <a class="page-link" href="?page=0&size=${list.getSize()}">
							                                <i class="fa fa-angle-double-left margin-5px-left xs-display-none "></i></a>
							                            </li>
							                            <li class='page-item'>							                                
							                                <a class="page-link"href="?page=${prev}&size=${list.getSize()}">
							                                <i class="fa fa-long-arrow-alt-left margin-5px-right xs-display-none"></i> Prev</a>
							                            </li>
							                        </c:if>
							                        
							                        <c:forEach var="i" begin="0" end="${list.totalPages -1}">
							                            <li class='page-item <c:if test="${list.getNumber() eq i || (empty list.getNumber() && i eq 0)}">active</c:if>'>
							                                <a class="page-link" href="?page=${i}&size=${list.getSize()}">${i+1} </a>
							                            </li>
							                     
							                        </c:forEach>
							                        <c:if test="${list.hasNext()}">
							                            <li class='page-item'>
							                                <a class="page-link" href="?page=${list.getNumber() + 1}&size=${list.getSize()}">Next
							                                <i class="fa fa-long-arrow-alt-right margin-5px-left xs-display-none "></i></a>
							                            </li>
							                            <li class='page-item'>
							                                <a class="page-link" href="?page=${list.totalPages -1}&size=${list.getSize()}">
							                                <i class="fa fa-angle-double-right margin-5px-left xs-display-none "></i></a>
							                            </li>
							                        </c:if>
							                     </ul>
               								 </nav>
							            </c:if>	
							            </div>
							            
							            <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12 float-right">
							            <form action="filter" method="post">
							            <select class="form-control" name="section" id="input-select" onchange="this.form.submit()">
                                            <option value="">Sort By</option>
                                            <option value="Electronics">Electronics</option>
                                            <option value="Shoe">Shoe</option>
                                            <option value="Clothing">Clothing</option>
                                        </select>
                                        </form>
							            </div>
							           </div> 
                             
					
					<div class="row">
				          <c:forEach var="item" items="${list.content}">
				            <div class="col-xl-4 col-lg-6 col-md-12 col-sm-12 col-12">
                                    <div class="product-thumbnail">
                                       <c:if test="${not empty item.img}">
                                        <div class="product-img-head">
                                            <div class="product-img">
                                               <a href="productdetails?id=${item.id}"> 
            									 <img src="static/img/products/${item.id}/${item.img}" class="img-fluid" style="height:250px">
            							     </a>
            							     </div>                                            
                                            <!-- <div class="ribbons"></div> -->
                                            <!-- <div class="ribbons-text">New</div> -->
                                            <div class=""><a href="#" class="product-wishlist-btn"><i class="fas fa-heart"></i></a></div>
                                        </div>
                                        </c:if>
                                        
                                        <div class="product-content">
                                            <div class="product-content-head">
                                                <h3 class="product-title">${item.name}</h3>                                                
                                                <div class="product-price">
                                                 $<fmt:formatNumber value="${item.price}" 
											       maxFractionDigits="2" minFractionDigits="2"/>
                                                </div>
                                            </div>
                                            <div class="product-btn">
                                                <a href="#" class="btn btn-primary btn-sm">Add to Cart</a>
                                                <a class="btn btn-dark btn-sm" href="#" data-toggle="modal" data-target="#product-modal${item.id}"><span class="fa fa-eye"> view</span></a> 
              
                                            </div>
                                        </div>
                                    </div>
                                </div>
                             </c:forEach>
                                
                                
                   	 </div>                                 
                                 </div>                                 
                            </div>
                           </div>
                            
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
    
    
			              
    <c:forEach var="item" items="${list.content}">
  				   <div class="modal fade" id="product-modal${item.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
					    <div class="modal-dialog modal-lg">
						<div class="modal-content">	
						<div class="modal-header">
  				   
			                <h5 class="modal-title" id="exampleModalLabel">${item.name}
			                </h5>
                               <a href="#" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                             </a>
			              </div>      
						<!-- Modal body -->
						<div class="modal-body">			    		
			    		 
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="row">
                              <div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 col-12">
		                        
		                                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		                                    <ol class="carousel-indicators">
                                               <c:forEach var="img" items="${item.getIfiles()}">
                                                <li data-target="#carouselExampleIndicators" data-slide-to="${item.getIfiles().indexOf(img)}" class="<c:if test="${item.getIfiles().indexOf(img) eq 0}">active</c:if>"></li>
                                               </c:forEach> 
                                            </ol>
                                            
		                                    <div class="carousel-inner">
		                                        
		                                        <c:forEach var="img" items="${item.getIfiles()}">
                                                <div class="carousel-item <c:if test="${item.getIfiles().indexOf(img) eq 0}">active</c:if>">
		                                            <img src="static/img/products/${item.id}/${img.image}" style="width:350px; max-height:500px;">
		                                        </div>
		                                        </c:forEach>
		                                    </div>
		                                    <a class="carousel-control-prev text-danger" href="#carouselExampleIndicators" role="button" data-slide="prev">
		                                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		                                       <span class="sr-only">Previous</span>  </a>
		                                    <a class="carousel-control-next text-danger" href="#carouselExampleIndicators" role="button" data-slide="next">
		                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
		                                            <span class="sr-only">Next</span>  </a>
		                                </div>
		                        </div>
                                
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 pl-xl-0 pl-lg-0 pl-md-0 border-left m-b-30">
                                    <div class="product-details">
                                        <div class="border-bottom pb-3 mb-3">
                                            <h3 class="mb-3 text-success">${item.name}</h3>
                                            
                                            <h4 class="mb-0 text-danger"> $<fmt:formatNumber value="${item.price}" 
											       maxFractionDigits="2" minFractionDigits="2"/>
											      
							                </h4>
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
                                                    <input type="number" min="1" max="9" step="1" value="1">
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
					  </div>			
                     </c:forEach>
                     
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
    
      
   
</body>
 
</html>