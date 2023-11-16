<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 
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
    <title>Members</title>
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
        <!-- =================================`============================= -->
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
                                <h3 class="mb-2">Members </h3>
                                <p class="pageheader-text">${success}</p>                               
                                 
                                <div class="page-breadcrumb">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Our club Members</li>
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
                        <div class="col-xl-9 col-lg-8 col-md-8 col-sm-12 col-12">
                        
                            <!-- ============================================================== -->
                            <!-- card influencer one -->
                            <!-- ============================================================== -->
                            <c:set var="k" value="0"/>
							  <c:forEach var="item" items="${list.content}">
								<c:set var="k" value="${k+1}"/>
								<div class="card">
                                 <div class="card-body">                                   
                                    <div class="row align-items-center">
                                    
                                        <c:if test="${not empty item.image}">
	                                    <div class="col-xl-2 col-lg-4 col-md-4 col-sm-4 col-12">
	                                        <div class="user-avatar float-xl-left pr-4 float-none">
                                                <img src="static/img/users/${item.id}/profile/${item.image}" class="rounded-circle user-avatar-xl">
                                             </div>
	                                        </div>
	                                      </c:if>  
	                                      
	                                       <div class="col-xl-10 col-lg-8 col-md-8 col-sm-8 col-12">
	                                            <div class="user-avatar-info">
	                                                <div class="m-b-20">
	                                                    <div class="user-avatar-name">
	                                                        <h2 class="mb-1">
	                                                        ${item.fname} ${item.lname}<a href="#" data-toggle="modal" data-target="#e-mail${item.id}" class="badge badge-default mr-1">
                                                    		<i class="far fa-comment-alt mr-1"></i></a></h2>
	                                                    </div>
	                                                </div>
	                                                 <div class="user-avatar-address">
	                                                    <p class="border-bottom pb-3">
	                                                        <span class="d-xl-inline-block d-block mb-2"><i class="fa fa-map-marker-alt mr-2 text-primary "></i>
	                                                        ${item.getAddress().street} ${item.getAddress().city} ${item.getAddress().state}
	                                                        </span>
	                                                        <span class="mb-2 ml-xl-4 d-xl-inline-block d-block">
	                                                        Joined: <i class="far fa-calendar mr-2 text-primary"></i> 
                                                            <fmt:formatDate type = "date" value = "${item.getAddress().createdon}" />  </span>
	                                                        <span class=" mb-2 d-xl-inline-block d-block ml-xl-4">${item.getAddress().gender} 
	                                                                </span>
	                                                        <span class=" mb-2 d-xl-inline-block d-block ml-xl-4">${item.getAddress().age} Year Old </span>
	                                                    </p>
	                                                    <div class="mt-3">
	                                                        <a href="#" data-toggle="modal" data-target="#e-mail${item.id}" class="badge badge-light mr-1">
                                                    		<i class="fa fa-envelope mr-1 mr-1"></i>${item.email}</a>
	                                                        <a href="tel:+${item.getAddress().phone}" class="badge badge-light mr-1"><i class="fas fa-mobile-alt mr-1"></i>${item.getAddress().phone}</a> 	                                                       
	                                                    	 <a href="#" class="badge badge-light mr-1"><i class="fas fa-th-list"></i> Listings ${item.getProducts().size()}</a> 	                                                       
	                                                    
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </div>
                                            
                                                <div class="modal fade show" id="e-mail${item.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                                                    <div class="modal-dialog modal-md" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">Send Messages</h5>
                                                                <a href="#" class="close" data-dismiss="modal" aria-label="Close">
                                                                   <span aria-hidden="true">×</span>
                                                                </a>
                                                            </div>
                                                           <div class="card-body">
												                 <form action="emailme" method="post">
												                    <div class="form-group">
			                                                                <label for="name">Your Name</label>
			                                                                <input type="text" class="form-control" name="name" id="name" placeholder="Full Name" required>
			                                                            </div>
			                                                            <input type="hidden" value="${item.email}" class="form-control" name="email" id="email" required>
			                                                            <div class="form-group">
			                                                                <label for="subject">Subject</label>
			                                                                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" required>
			                                                            </div>
			                                                            <div class="form-group">
			                                                                <label for="messages">Message</label>
			                                                                <textarea class="form-control" name="message" id="messages" rows="3" required></textarea>
			                                                            </div>
			                                                            <button type="submit" class="btn btn-primary">
																			<i class="fa fa-envelope"></i> Send
																		</button>
																		<button type="button" data-dismiss="modal" aria-label="Close"
																			class="btn btn-dark btn-sm">Close</button>
												                </form>
												            </div>
												            
                                                        </div>
                                                    </div>
                                                  </div>
                                            
                                        </div>
                                        
                                   </div>                                   
                                </div>
                                </c:forEach>
                                
                                <c:if test="${list.hasContent()}">
					                 <div class="pages">
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
					                                <a class="page-link" href="?page=${list.totalPages-1}&size=${list.getSize()}">
					                                <i class="fa fa-angle-double-right margin-5px-left xs-display-none "></i></a>
					                            </li>
					                        </c:if>
					                     </ul>
					                </div>
					            </c:if>
					            
                            </div>
                            <!-- ============================================================== -->
                            <!-- influencer sidebar  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-3 col-lg-4 col-md-4 col-sm-12 col-12">
                                <div class="card">
                                    <div class="card-body border-top">
                                        <h3 class="font-16"> Sorting By Category </h3>
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="customCheck15">
                                            <label class="custom-control-label" for="customCheck15">Business</label>
                                        </div>
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="customCheck16">
                                            <label class="custom-control-label" for="customCheck16">Lifestyle</label>
                                        </div>
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="customCheck17">
                                            <label class="custom-control-label" for="customCheck17">Fitness</label>
                                        </div>
                                    </div>
                                    <div class="card-body border-top">
                                        <h3 class="font-16">Age Demographics</h3>
                                        <select class="form-control">
                                            <option selected>Select the Age</option>
                                            <option value="20-30">20-30</option>
                                            <option value="30-40">30-40</option>
                                            <option value="40-50">40-50</option>
                                        </select>
                                    </div>
                                    <div class="card-body border-top">
                                        <a href="#" class="btn btn-secondary btn-lg btn-block">Submit</a>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end influencer sidebar  -->
                            <!-- ============================================================== -->
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
    </script>
   
   <c:forEach var="item" items="${list.content}">
       <div class="modal fade" id="edits${item.id}">
		 <div class="modal-dialog modal-sm">
			 <div class="modal-content">	
				<div class="modal-header">
			        <h5 class="modal-">Edit User</h5>
			         <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
			         </div>      
						<!-- Modal body -->
						<div class="modal-body">			    		
			    		  
			    		  <form:form action="updateUsers" modelAttribute="user" method="post">
								<div class="form-group">
									<label for="fn">Name</label>
									<form:input path="fname" value="${item.fname}"
										class="form-control" placeholder="First Name" />
									<form:input type="hidden" path="id" value="${item.id}"/>
									
								</div>
								<div class="form-group">
									<label for="lname">Last Name</label>
									<form:input path="lname" value="${item.lname}"
										class="form-control" placeholder="Last Name" />
								</div>
								
								<div>
									<button type="submit" class="btn btn-primary">
										<i class="fa fa-user"></i> Save
									</button>
									<button type="button" data-dismiss="modal" aria-label="Close"
										class="btn btn-danger">Close</button>
								</div>
							</form:form>
			    		  
			    		</div>
			       </div>
			</div>
		 </div>
	</c:forEach>    
</body>
 
</html>