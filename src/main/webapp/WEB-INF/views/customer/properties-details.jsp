<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <title>The Nest - Real Estate HTML Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">

    <!-- External CSS libraries -->
    <link rel="stylesheet" type="text/css" href="resources/user/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="resources/user/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="resources/user/css/bootstrap-submenu.css">
    <link rel="stylesheet" type="text/css" href="resources/user/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="resources/user/css/leaflet.css" type="text/css">
    <link rel="stylesheet" href="resources/user/css/map.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="resources/user/fonts/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="resources/user/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" type="text/css" href="resources/user/fonts/linearicons/style.css">
    <link rel="stylesheet" type="text/css"  href="resources/user/css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" type="text/css"  href="resources/user/css/dropzone.css">
    <link rel="stylesheet" type="text/css"  href="resources/user/css/magnific-popup.css">

    <!-- Custom stylesheet -->
    <link rel="stylesheet" type="text/css" href="resources/user/css/style.css">
    <link rel="stylesheet" type="text/css" id="style_sheet" href="resources/user/css/skins/default.css">

    <!-- Favicon icon -->
    <link rel="shortcut icon" href="resources/user/img/favicon.ico" type="image/x-icon" >

    <!-- Google fonts -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800%7CPlayfair+Display:400,700%7CRoboto:100,300,400,400i,500,700">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link rel="stylesheet" type="text/css" href="resources/user/css/ie10-viewport-bug-workaround.css">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script type="text/javascript" src="js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="resources/user/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="js/html5shiv.min.js"></script>
    <script type="text/javascript" src="js/respond.min.js"></script>
    <![endif]-->
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/user/js/geoapi.js"></script>
 <script src="./resources/ckeditor/ckeditor.js"></script>
 <script>
 	$(function(){
 		imageInit();
 		splitOption();
 		reservation();
 		bookmarkcheck();
 	});
 	
 	function splitOption(){
 		var forSale_Option = $("#forSale_Option").val();
 		var optionSplit = forSale_Option.split(',');
 		var amenitiesContent = "";
 		var amenitiesContent2 = "";
 		var amenitiesContent3 = "";
 		$.each(optionSplit,function(index,item){
 			if(index<3){
 				amenitiesContent += '<li>';
 	 			amenitiesContent += '<i class="fa fa-check-square"></i>';
 	 			amenitiesContent += item;
 	 			amenitiesContent += '</li>';
 				$("#amenitiesUl1").html(amenitiesContent);
 			}else if (index>=3 && index<=5){
 				amenitiesContent2 += '<li>';
 	 			amenitiesContent2 += '<i class="fa fa-check-square"></i>';
 	 			amenitiesContent2 += item;
 	 			amenitiesContent2 += '</li>';
 				$("#amenitiesUl2").html(amenitiesContent2);
 			}else{
 				amenitiesContent3 += '<li>';
 	 			amenitiesContent3 += '<i class="fa fa-check-square"></i>';
 	 			amenitiesContent3 += item;
 	 			amenitiesContent3 += '</li>';
 				$("#amenitiesUl3").html(amenitiesContent3);
 			}
 		});
 		
 		
 	}
 	
 	function imageInit(){
 		var seq="${detailItem.forSale_Seq}";
 		
 		$.ajax({
 			url:"detailImg",
 			data:{forSale_Seq:seq},
 			type:"get",
 			success:function(res){
 				var imgContent="";
 				var imgContentDiv="";
 				$.each(res,function(index,item){
 					imgContent += '<li data-target="#carousel-custom" data-slide-to="0" class="" >';
 					imgContent += '<img src="/GomBang/img/'+item.saveName+'" alt="Chevrolet Impala" style="width:auto;height:60px;margin-left: auto; margin-right: auto; display: block;">';
 					imgContent += '</li>';
 				})
 				$.each(res,function(index,item){
 					if(index==0){
 						imgContentDiv += '<div class="item active"><img src="/GomBang/img/'+item.saveName+'" class="thumb-preview" alt="Chevrolet Impala" style="width:auto; height:413px;margin-left: auto; margin-right: auto"></div>';
 					}
 					else{
 						imgContentDiv += '<div class="item">';
 	 					imgContentDiv += '<img src="/GomBang/img/'+item.saveName+'" class="thumb-preview" alt="Chevrolet Impala" style="width:auto; height:413px; margin-left: auto; margin-right: auto;">';
 	 					imgContentDiv += '</div>';
 					}
 					
 				})
 				$("#detailImageOl").html(imgContent);
 				$("#detailImageDiv").html(imgContentDiv);
 			}
 			
 			
 		});
 	}
 	
 	function reservation(){
 		$(".reservation").on("click", function(){
 			var table = '';
 			//table += '<form>';
            table +='<div class="row">';
            table +='<div class="col-lg-12">';
            table +='<div class="form-group">';
            table+='<br>';
            table +='<label class="form-label">허위 정보 입력시, 신청이 취소될 수 있습니다.</label><br>';
            table +='<label class="form-label">비자종류</label><br>';
            table +='<input type="text" class="input-text" placeholder="입력" name = "reservation_Visa" id = "reservation_Visa"><br>';
            table +='</div>';
            table +='</div>';
            table +='<div class="col-lg-12">';
            table +='<div class="form-group">';
            table +='<label class="form-label">보증인 여부</label><br>';
            table +='<input type="text" class="input-text" placeholder="예/아니오" name = "reservation_Guarantor" id = "reservation_Guarantor"><br>';
            table +='</div>';
            table +='</div>';
            table +='<div class="col-lg-12">';
            table +='<div class="form-group mb-0">';
            table +='<input type = "hidden" value = "${sessionScope.customer.customer_ID}" id = "customer_ID">';
            table +='<input type = "hidden" value = "${detailItem.enterprise_ID}" id = "enterprise_ID">';
            table +='<input type = "hidden" value = "${detailItem.forSale_Seq}" id = "forSale_Seq">';
            table +='<button class="search-button" id = "reservationButton">에약</button>';
            table +='</div>';
            table +='</div>';
            table +='</div>';
            //table +='</form>';
           	$(".question").html(table);
           	
           	
           	$("#reservationButton").on("click", function(){
           		var visa = $("#reservation_Visa").val();
           		var guarantor = $("#reservation_Guarantor").val();
           		var customer = "${sessionScope.customer.customer_ID}";
           		var enterprise = "${detailItem.enterprise_ID}";
           		var seq = "${detailItem.forSale_Seq}"; 
           		$.ajax({
         			url:"reservationCheck"
         			,data:{customer_ID:customer}
         			,type:"post"
         			,success:function(list){
         				for (var i = 0; i < list.length; i++) {
       						if (list[i].forSale_Seq == seq) {
       							alert("이미 예약중");
       							return;
							}
        				} //for
        				reservationCheck();
         			}//success
         		});//ajax
           	})
 		}) //function
 	}
 	
 	//예약 췌크
 	function reservationCheck(){
 		var visa = $("#reservation_Visa").val();
   		var guarantor = $("#reservation_Guarantor").val();
   		var customer = "${sessionScope.customer.customer_ID}";
   		var enterprise = "${detailItem.enterprise_ID}";
   		var seq = "${detailItem.forSale_Seq}"; 
 		 $.ajax({
    			url:"insertCustomerReservation"
    			,type:"post"
    			,data:{reservation_Visa:visa, reservation_Guarantor:guarantor, customer_ID:customer, enterprise_ID:enterprise, forSale_Seq:seq}
    			,success:function(result){
    				if (result == 1) {
						alert("신청되었습니다.");
						alert("예약 성사시, 각 기업과의 연락은 개인 E-mail 등을 이용해주시기 바랍니다.");
						 $("#reservation_Visa").val("");
						 $("#reservation_Guarantor").val("");
						 location.reload();
					} 
    			}
    			,error : function(){
    				alert("실패!");
    			}
    		});//ajax 
 	}
 	
 	function bookmarkcheck(){
 		$(".bookmark").on("click", function(){
 			var customer = "${sessionScope.customer.customer_ID}";
 	 		var seq = "${detailItem.forSale_Seq}"; 
 	 		$.ajax({
 	 			url:"bookmarkCheck"
 	 			,data:{customer_ID:customer}
 	 			,type:"post"
 	 			,success:function(list){
 	 				for (var i = 0; i < list.length; i++) {
 						if (list[i].forSale_Seq == seq) {
 							alert("이미 추가되어있습니다.");
 							return;
 						}
 					}
 	 				bookmark();
 	 			}
 	 		});
 		})
 	}
 	
 	function bookmark(){
 			var customer = "${sessionScope.customer.customer_ID}";
       		var enterprise = "${detailItem.enterprise_ID}";
       		var seq = "${detailItem.forSale_Seq}"; 
       		$.ajax({
       			url:"customerBookmark"
       			,data:{enterprise_ID:enterprise, customer_ID:customer, forSale_Seq:seq}
       			,type:"post"
       			,success:function(result){
       				if (result == 1) {
						alert("책갈피 등록");
						$(".bookmark").val("책갈피 등록중");
					} else {
						alert("error!");
					}
       			}//success
       		});//ajax
 	}//function
 </script>
<body>

<div class="page_loader"></div>

<!-- Top header start -->
<header class="top-header hidden-xs" id="top">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                <div class="list-inline">
                    <a href="tel:1-8X0-666-8X88"><i class="fa fa-phone"></i>1-8X0-666-8X88</a>
                    <a href="tel:info@themevessel.com"><i class="fa fa-envelope"></i>info@themevessel.com</a>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                <ul class="top-social-media pull-right">
                    <li>
                        <a href="login.html" class="sign-in"><i class="fa fa-sign-in"></i> Login</a>
                    </li>
                    <li>
                        <a href="signup.html" class="sign-in"><i class="fa fa-user"></i> Register</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>
<!-- Top header end -->

<!-- Main header start -->
<header class="main-header">
    <div class="container">
        <nav class="navbar navbar-default">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#app-navigation" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="goHome" class="logo">
                    <img src="resources/user/img/logos/logo.png" alt="logo">
                </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="navbar-collapse collapse" role="navigation" aria-expanded="true" id="app-navigation">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a tabindex="0" data-toggle="dropdown" data-submenu="" aria-expanded="false">
                            Home<span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="index.html">Home 1</a></li>
                            <li><a href="index-2.html">Home 2</a></li>
                            <li><a href="index-3.html">Home 3</a></li>
                            <li><a href="index-4.html">Home 4</a></li>
                            <li><a href="index-5.html">Home 5</a></li>
                        </ul>
                    </li>
                    <li class="dropdown active">
                        <a tabindex="0" data-toggle="dropdown" data-submenu="" aria-expanded="false">
                            Properties<span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-submenu">
                                <a tabindex="0">List Layout</a>
                                <ul class="dropdown-menu">
                                    <li><a href="properties-list-rightside.html">Right Sidebar</a></li>
                                    <li><a href="properties-list-leftside.html">Left Sidebar</a></li>
                                    <li><a href="properties-list-fullwidth.html">Fullwidth</a></li>
                                </ul>
                            </li>
                            <li class="dropdown-submenu">
                                <a tabindex="0">Grid Layout</a>
                                <ul class="dropdown-menu">
                                    <li><a href="properties-grid-rightside.html">Right Sidebar</a></li>
                                    <li><a href="properties-grid-leftside.html">Left Sidebar</a></li>
                                    <li><a href="properties-grid-fullwidth.html">Fullwidth</a></li>
                                </ul>
                            </li>
                            <li class="dropdown-submenu">
                                <a tabindex="0">Map View</a>
                                <ul class="dropdown-menu">
                                    <li><a href="properties-map-leftside-list.html">Map List 1</a></li>
                                    <li><a href="properties-map-rightside-list.html">Map List 2</a></li>
                                    <li><a href="properties-map-leftside-grid.html">Map Grid 1</a></li>
                                    <li><a href="properties-map-rightside-grid.html">Map Grid 2</a></li>
                                    <li><a href="properties-map-full.html">Map FullWidth</a></li>
                                </ul>
                            </li>
                            <li class="dropdown-submenu">
                                <a tabindex="0">Property Detail</a>
                                <ul class="dropdown-menu">
                                    <li><a href="properties-details.html">Property Detail 1</a></li>
                                    <li><a href="properties-details-2.html">Property Detail 2</a></li>
                                    <li><a href="properties-details-3.html">Property Detail 3</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a tabindex="0" data-toggle="dropdown" data-submenu="" aria-expanded="false">
                            Agents<span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="agent-listing-grid.html">Agent grid</a></li>
                            <li><a href="agent-listing-grid-sidebar.html">Agent Grid sidebarbar</a></li>
                            <li><a href="agent-listing-row.html">Agent list</a></li>
                            <li><a href="agent-listing-row-sidebar.html">Agent List Sidebarbar</a></li>
                            <li><a href="agent-single.html">Agent Detail</a></li>
                        </ul>
                    </li>
                    <li class="dropdown mega-dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            Pages <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu mega-dropdown-menu row">
                            <li class="col-lg-3 col-md-3 col-sm-6">
                                <ul>
                                    <li class="dropdown-header">Pages</li>
                                    <li><a href="about.html">About 1</a></li>
                                    <li><a href="about-2.html">About 2</a></li>
                                    <li><a href="services-1.html">Services 1</a></li>
                                    <li><a href="services-2.html">Services 2</a></li>
                                    <li><a href="pricing-tables.html">Pricing Tables 1</a></li>
                                    <li><a href="pricing-tables-2.html">Pricing Tables 2</a></li>
                                    <li><a href="pricing-tables-3.html">Pricing Tables 3</a></li>
                                </ul>
                            </li>
                            <li class="col-lg-3 col-md-3 col-sm-6">
                                <ul>
                                    <li class="dropdown-header">Pages</li>
                                    <li><a href="faq.html">Faq 1</a></li>
                                    <li><a href="faq-2.html">Faq 2</a></li>
                                    <li><a href="gallery-1.html">Gallery 1</a></li>
                                    <li><a href="gallery-2.html">Gallery 2</a></li>
                                    <li><a href="gallery-3.html">Gallery 3</a></li>
                                    <li><a href="properties-comparison.html">Properties Comparison</a></li>
                                    <li><a href="search-brand.html">Search Brand</a></li>
                                </ul>
                            </li>
                            <li class="col-lg-3 col-md-3 col-sm-6">
                                <ul>
                                    <li class="dropdown-header">Pages</li>
                                    <li><a href="contact.html">Contact 1</a></li>
                                    <li><a href="contact-2.html">Contact 2</a></li>
                                    <li><a href="contact-3.html">Contact 3</a></li>
                                    <li><a href="typography.html">Typography</a></li>
                                    <li><a href="elements.html">Elements</a></li>
                                    <li><a href="icon.html">Icon</a></li>
                                    <li><a href="404.html">Pages 404</a></li>

                                </ul>
                            </li>
                            <li class="col-lg-3 col-md-3 col-sm-6">
                                <ul>
                                    <li class="dropdown-header">Pages</li>
                                    <li><a href="user-profile.html">User profile</a></li>
                                    <li><a href="my-properties.html">My Properties</a></li>
                                    <li><a href="favorited-properties.html">Favorited properties</a></li>
                                    <li><a href="submit-property.html">Submit Property</a></li>
                                    <li><a href="login.html">Login</a></li>
                                    <li><a href="signup.html">Signup</a></li>
                                    <li><a href="forgot-password.html">Forgot Password</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a tabindex="0" data-toggle="dropdown" data-submenu="" aria-expanded="false">
                            Blog<span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-submenu">
                                <a tabindex="0">Classic</a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="blog-classic-sidebar-right.html">Right Sidebar</a></li>
                                    <li><a class="dropdown-item" href="blog-classic-sidebar-left.html">Left Sidebar</a></li>
                                    <li><a class="dropdown-item" href="blog-classic-fullwidth.html">FullWidth</a></li>
                                </ul>
                            </li>
                            <li class="dropdown-submenu">
                                <a tabindex="0">Columns</a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="blog-columns-2col.html">2 Columns</a></li>
                                    <li><a class="dropdown-item" href="blog-columns-3col.html">3 Columns</a></li>
                                </ul>
                            </li>
                            <li class="dropdown-submenu">
                                <a tabindex="0">Blog Details</a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="blog-single-sidebar-right.html">Right Sidebar</a></li>
                                    <li><a class="dropdown-item" href="blog-single-sidebar-left.html">Left Sidebar</a></li>
                                    <li><a class="dropdown-item" href="blog-single-fullwidth.html">Fullwidth</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right rightside-navbar">
                    <li>
                        <a href="submit-property.html" class="button">
                            Submit Property
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</header>
<!-- Main header end -->

<!-- Sub banner start -->
<div class="sub-banner overview-bgi">
    <div class="overlay">
        <div class="container">
            <div class="breadcrumb-area">
                <h1>Properties Detail</h1>
                <ul class="breadcrumbs">
                    <li><a href="index.html">Home</a></li>
                    <li class="active">Properties Detail</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- Sub Banner end -->

<!-- Properties details page start -->
<div class="content-area  properties-details-page">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                <!-- Header -->
                <div class="heading-properties clearfix sidebar-widget">
                    <div class="pull-left">
                        <h3>${detailItem.forSale_Title }</h3> 
                        <p>
                            <i class="fa fa-map-marker"></i>${detailItem.geoapi_prefectures } ${detailItem.geoapi_cities } ${detailItem.geoapi_towns } ${detailItem.geoapi_remain }
                        </p>
                    </div>
                    <div class="pull-right">
                        <h3><span>${detailItem.forSale_Rent }</span></h3>
                        <h5>
                            Per Manth
                        </h5>
                    </div>
                </div>
                <!-- Properties details section start -->
                <div class="Properties-details-section sidebar-widget">
                    <!-- Properties detail slider start -->
                    <div class="properties-detail-slider simple-slider mb-40">
                        <div id="carousel-custom" class="carousel slide" data-ride="carousel">
                            <div class="carousel-outer">
                                <!-- Wrapper for slides -->
                                <div class="carousel-inner" id="detailImageDiv">
                                    <div class="item">
                                        <img src="http://placehold.it/710x473" class="thumb-preview" alt="Chevrolet Impala">
                                    </div>
                                    <div class="item">
                                        <img src="http://placehold.it/710x473" class="thumb-preview" alt="Chevrolet Impala">
                                    </div>
                                    <div class="item">
                                        <img src="http://placehold.it/710x473" class="thumb-preview" alt="Chevrolet Impala">
                                    </div>
                                    <div class="item">
                                        <img src="http://placehold.it/710x473" class="thumb-preview" alt="Chevrolet Impala">
                                    </div>
                                    <div class="item">
                                        <img src="http://placehold.it/710x473" class="thumb-preview" alt="Chevrolet Impala">
                                    </div>
                                    <div class="item">
                                        <img src="http://placehold.it/710x473" class="thumb-preview" alt="Chevrolet Impala">
                                    </div>
                                    <div class="item">
                                        <img src="http://placehold.it/710x473" class="thumb-preview" alt="Chevrolet Impala">
                                    </div>
                                    <div class="item active">
                                        <img src="http://placehold.it/710x473" class="thumb-preview" alt="Chevrolet Impala">
                                    </div>
                                </div>
                                <!-- Controls -->
                                <a class="left carousel-control" href="#carousel-custom" role="button" data-slide="prev">
                                    <span class="slider-mover-left no-bg t-slider-r pojison" aria-hidden="true">
                                        <i class="fa fa-angle-left"></i>
                                    </span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="right carousel-control" href="#carousel-custom" role="button" data-slide="next">
                                    <span class="slider-mover-right no-bg t-slider-l pojison" aria-hidden="true">
                                        <i class="fa fa-angle-right"></i>
                                    </span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                            <!-- Indicators -->
                            <ol id="detailImageOl" class="carousel-indicators thumbs visible-lg visible-md">
                                <li data-target="#carousel-custom" data-slide-to="0" class=""><img src="http://placehold.it/90x60" alt="Chevrolet Impala"></li>
                                <li data-target="#carousel-custom" data-slide-to="1" class=""><img src="http://placehold.it/90x60" alt="Chevrolet Impala"></li>
                                <li data-target="#carousel-custom" data-slide-to="2" class=""><img src="http://placehold.it/90x60" alt="Chevrolet Impala"></li>
                                <li data-target="#carousel-custom" data-slide-to="3" class=""><img src="http://placehold.it/90x60" alt="Chevrolet Impala"></li>
                                <li data-target="#carousel-custom" data-slide-to="4" class=""><img src="http://placehold.it/90x60" alt="Chevrolet Impala"></li>
                                <li data-target="#carousel-custom" data-slide-to="5" class=""><img src="http://placehold.it/90x60" alt="Chevrolet Impala"></li>
                                <li data-target="#carousel-custom" data-slide-to="6" class=""><img src="http://placehold.it/90x60" alt="Chevrolet Impala"></li>
                                <li data-target="#carousel-custom" data-slide-to="7" class=""><img src="http://placehold.it/90x60" alt="Chevrolet Impala"></li>
                            </ol>
                        </div>
                    </div>
                    <!-- Properties detail slider end -->

                    <!-- Advanced search start -->
                    <div class="advabced-search hidden-lg hidden-md">
                        <div class="main-title-2">
                            <h1><span>Advanced</span> Search</h1>
                        </div>

                        <form method="GET">
                            <div class="form-group">
                                <select class="selectpicker search-fields" name="property-status" data-live-search="true" data-live-search-placeholder="Search value">
                                    <option>Property Status</option>
                                    <option>For Sale</option>
                                    <option>For Rent</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <select class="selectpicker search-fields" name="location" data-live-search="true" data-live-search-placeholder="Search value">
                                    <option>Location</option>
                                    <option>United States</option>
                                    <option>United Kingdom</option>
                                    <option>American Samoa</option>
                                    <option>Belgium</option>
                                    <option>Cameroon</option>
                                    <option>Canada</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <select class="selectpicker search-fields" name="property-types" data-live-search="true" data-live-search-placeholder="Search value" >
                                    <option>Property Types</option>
                                    <option>Residential</option>
                                    <option>Commercial</option>
                                    <option>Land</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <select class="selectpicker search-fields" name="area-from" data-live-search="true" data-live-search-placeholder="Search value" >
                                    <option>Area From</option>
                                    <option>1000</option>
                                    <option>800</option>
                                    <option>600</option>
                                    <option>400</option>
                                    <option>200</option>
                                    <option>100</option>
                                </select>
                            </div>

                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <select class="selectpicker search-fields" name="bedrooms">
                                            <option>Bedrooms</option>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <select class="selectpicker search-fields" name="bathroom">
                                            <option>Bathroom</option>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <select class="selectpicker search-fields" name="balcony">
                                            <option>Balcony</option>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <select class="selectpicker search-fields" data-live-search="true" name="garage">
                                            <option>Garage</option>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="range-slider">
                                <label>Area</label>
                                <div data-min="0" data-max="10000" data-unit="Sq ft" data-min-name="min_area" data-max-name="max_area" class="range-slider-ui ui-slider" aria-disabled="false"></div>
                                <div class="clearfix"></div>
                            </div>

                            <div class="range-slider">
                                <label>Price</label>
                                <div data-min="0" data-max="150000" data-unit="USD" data-min-name="min_price" data-max-name="max_price" class="range-slider-ui ui-slider" aria-disabled="false"></div>
                                <div class="clearfix"></div>
                            </div>

                            <div class="form-group">
                                <button class="search-button">Search</button>
                            </div>
                        </form>
                    </div>
                    <!-- Advanced search end -->

                    <!-- Property description start -->
                    <div class="panel-box properties-panel-box Property-description">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab1default" data-toggle="tab" aria-expanded="true">Description</a></li>
                            <li class=""><a href="#tab4default" data-toggle="tab" aria-expanded="false">Price</a></li>
                            <li class=""><a href="#tab3default" data-toggle="tab" aria-expanded="false">Amenities</a></li>
                            <li class=""><a href="#tab5default" data-toggle="tab" aria-expanded="false">for Subway</a></li>
                            <li class=""><a href="#tab2default" data-toggle="tab" aria-expanded="false">for Subway</a></li>
                        </ul>
                        <div class="panel with-nav-tabs panel-default">
                            <div class="panel-body">
                                <div class="tab-content">
                                    <div class="tab-pane fade active in" id="tab1default">
                                        <div class="main-title-2">
                                            <h1><span>Description</span></h1>
                                        </div>
                                        <div>${detailItem.forSale_ETC}</div>
                                        <input type="hidden" id="forSale_ETC" value='${detailItem.forSale_ETC}'>
                                    </div>
                                    <div class="tab-pane fade features" id="tab2default">
                                        <!-- Properties condition start -->
                                        <div class="properties-condition">
                                            <div class="main-title-2">
                                                <h1><span>Condition</span></h1>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                    <ul class="condition">
                                                        <li>
                                                            <i class="fa fa-check-square"></i>3 Beds
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-check-square"></i>Bathroom
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                    <ul class="condition">
                                                        <li>
                                                            <i class="fa fa-check-square"></i>4800 sq ft
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-check-square"></i>TV
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                    <ul class="condition">
                                                        <li>
                                                            <i class="fa fa-check-square"></i>1 Garage
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-check-square"></i>Balcony
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Properties condition end -->
                                    </div>
                                    <div class="tab-pane fade technical" id="tab3default">
                                        <!-- Properties amenities start -->
                                        <div class="properties-amenities">
                                            <div class="main-title-2">
                                                <h1><span>Amenities</span></h1>
                                                <input type="hidden" value="${detailItem.forSale_Option}" id="forSale_Option">
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                    <ul class="amenities" id="amenitiesUl1">
                                                       <!--  <li>
                                                            <i class="fa fa-check-square"></i>Air conditioning
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-check-square"></i>Balcony
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-check-square"></i>Pool
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-check-square"></i>TV
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-check-square"></i>Gym
                                                        </li> -->
                                                    </ul>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                    <ul class="amenities" id="amenitiesUl2">
                                                       <!--  <li>
                                                            <i class="fa fa-check-square"></i>Wifi
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-check-square"></i>Parking
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-check-square"></i>Double Bed
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-check-square"></i>Iron
                                                        </li> -->
                                                    </ul>
                                                </div>
                                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                    <ul class="amenities" id="amenitiesUl3">
                                                        <!-- <li>
                                                            <i class="fa fa-check-square"></i>Telephone
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-check-square"></i>Jacuzzi
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-check-square"></i>Alarm
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-check-square"></i>Garage
                                                        </li> -->
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Properties amenities end -->
                                    </div>
                                    <div class="tab-pane fade" id="tab4default">
                                        <!-- Floor Plans start -->
                                        <div class="floor-plans">
                                            <div class="main-title-2">
                                                <h1><span>Floor Plans</span></h1>
                                            </div>
                                            <table>
                                                <tbody><tr>
                                                    <td><strong>forSale_Rent</strong></td>
                                                    <td><strong>forSale_Deposit</strong></td>
                                                    <td><strong>forSale_Reward</strong></td>
                                                    <td><strong>forSale_ManageCost</strong></td>
                                                </tr>
                                                <tr>
                                                    <td>${detailItem.forSale_Rent}</td>
                                                    <td>${detailItem.forSale_Deposit}</td>
                                                    <td>${detailItem.forSale_Reward}</td>
                                                    <td>${detailItem.forSale_ManageCost}</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            <img src="http://placehold.it/708x359" alt="floor-plans" class="img-responsive">
                                        </div>
                                        <!-- Floor Plans end -->
                                    </div>
                                    <div class="tab-pane fade" id="tab5default">
                                        <!-- Inside properties start  -->
                                        <div class="inside-properties">
                                            <!-- Main Title 2 -->
                                            <div class="main-title-2">
                                                <h1><span>for Subway</span></h1>
                                            </div>
                                            	<i class="lnr lnr-train"><span id="forSubwayDistance"></span></i>
                                            <div>
                                            </div>
                                            <div id="subwayMap" class="contact-map"></div>
                                            <!-- <iframe src="https://www.youtube.com/embed/5e0LxrLSzok" allowfullscreen=""></iframe> -->
                                        </div>
                                        <!-- Inside properties end -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Property description end -->
                </div>
                <!-- Properties details section end -->

                <!-- Location start -->
                <div class="location sidebar-widget">
                    <div class="map">
                        <!-- Main Title 2 -->
                        <div class="main-title-2">
                            <h1><span>Location</span></h1>
                            <input type="hidden" value="${detailItem.forSale_Lat }" id="forSale_Lat">
                            <input type="hidden" value="${detailItem.forSale_Lng }" id="forSale_Lng">
                        </div>
                        <div id="map" class="contact-map"></div>
                        <div id="storeList"></div>
    <div id="controls">
		<form name="controls">
			<input type="radio" name="searchType" class="searchType" value="cafe" onclick="search()" checked="checked" data-val="카페" />카페
			<br/>
			<input type="radio" name="searchType" class="searchType" value="convenience_store" onclick="search()" data-val="편의점" />편의점
			<br/>
			<input type="radio" name="searchType" class="searchType" value="train_station" onclick="search()" data-val="지하철" />지하철
			<br/>
			<input type="radio" name="searchType" class="searchType" value="bus_station" onclick="search()" data-val="버스정류장" />버스정류장
			<br/>
			<input type="radio" name="searchType" class="searchType" value="convenience_store" onclick="search()" data-val="편의점" />편의점
			<br/>
			<input type="radio" name="searchType" class="searchType" value="supermarket" onclick="search()" data-val="슈퍼마켓" />슈퍼마켓
			</form>
	</div>
	
	
    <div id="right-panel">
      <h2>Results</h2>
      <ul id="places"></ul>
    </div>
                    </div>
                </div>
                <!-- Location end -->

                <!-- Properties details section start -->
                <div class="Properties-details-section sidebar-widget">
                    <!-- Properties comments start -->
                    <div class="properties-comments mb-40">
                        <!-- Comments section start -->
                        <div class="comments-section">
                            <!-- Main Title 2 -->
                            <div class="main-title-2">
                                <h1><span>Comments </span> Section</h1>
                            </div>

                            <ul class="comments">
                                <li>
                                    <div class="comment">
                                        <div class="comment-author">
                                            <a href="#">
                                                <img src="http://placehold.it/60x60" alt="avatar-5">
                                            </a>
                                        </div>
                                        <div class="comment-content">
                                            <div class="comment-meta">
                                                <div class="comment-meta-author">
                                                    Jane Doe
                                                </div>
                                                <div class="comment-meta-reply">
                                                    <a href="#">Reply</a>
                                                </div>
                                                <div class="comment-meta-date">
                                                    <span class="hidden-xs">8:42 PM 3/3/2017</span>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="comment-body">
                                                <div class="comment-rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec luctus tincidunt aliquam. Aliquam gravida massa at sem vulputate interdum et vel eros. Maecenas eros enim, tincidunt vel turpis vel, dapibus tempus nulla. Donec vel nulla dui. Pellentesque sed ante sed ligula hendrerit condimentum. Suspendisse rhoncus fringilla ipsum quis porta.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <ul>
                                        <li>
                                            <div class="comment">
                                                <div class="comment-author">
                                                    <a href="#">
                                                        <img src="http://placehold.it/60x60" alt="avatar-5">
                                                    </a>
                                                </div>

                                                <div class="comment-content">
                                                    <div class="comment-meta">
                                                        <div class="comment-meta-author">
                                                            Jane Doe
                                                        </div>

                                                        <div class="comment-meta-reply">
                                                            <a href="#">Reply</a>
                                                        </div>

                                                        <div class="comment-meta-date">
                                                            <span class="hidden-xs">8:42 PM 3/3/2017</span>
                                                        </div>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                    <div class="comment-body">
                                                        <div class="comment-rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-half-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec luctus tincidunt aliquam. Aliquam gravida massa at sem vulputate interdum et vel eros. Maecenas eros enim, tincidunt vel turpis vel, dapibus tempus nulla. Donec vel nulla dui.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <div class="comment">
                                        <div class="comment-author">
                                            <a href="#">
                                                <img src="http://placehold.it/60x60" alt="avatar-5">
                                            </a>
                                        </div>
                                        <div class="comment-content">
                                            <div class="comment-meta">
                                                <div class="comment-meta-author">
                                                    Jane Doe
                                                </div>
                                                <div class="comment-meta-reply">
                                                    <a href="#">Reply</a>
                                                </div>
                                                <div class="comment-meta-date">
                                                    <span class="hidden-xs">8:42 PM 3/3/2017</span>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="comment-body">
                                                <div class="comment-rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <ul>
                                        <li>
                                            <div class="comment comment-mrg-bdr-nane">
                                                <div class="comment-author">
                                                    <a href="#">
                                                        <img src="http://placehold.it/60x60" alt="avatar-5">
                                                    </a>
                                                </div>

                                                <div class="comment-content">
                                                    <div class="comment-meta">
                                                        <div class="comment-meta-author">
                                                            Jane Doe
                                                        </div>

                                                        <div class="comment-meta-reply">
                                                            <a href="#">Reply</a>
                                                        </div>

                                                        <div class="comment-meta-date">
                                                            <span class="hidden-xs">8:42 PM 3/3/2017</span>
                                                        </div>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                    <div class="comment-body">
                                                        <div class="comment-rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-half-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec luctus tincidunt aliquam. Aliquam gravida massa at sem vulputate interdum et vel eros. Maecenas eros enim, tincidunt vel turpis vel, dapibus tempus nulla. Donec vel nulla dui.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <!-- Comments section end -->
                    </div>
                    <!-- Properties comments end -->

                    <!-- Contact 1 start -->
                    <div class="contact-1">
                        <div class="contact-form">
                            <!-- Main Title 2 -->
                            <div class="main-title-2">
                                <h1><span>Contact</span> with us</h1>
                            </div>
                            <form id="contact_form" action="index.html" method="GET" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group fullname">
                                            <input type="text" name="full-name" class="input-text" placeholder="Full Name">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group enter-email">
                                            <input type="email" name="email" class="input-text"  placeholder="Enter email">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group subject">
                                            <input type="text" name="subject" class="input-text" placeholder="Subject">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group number">
                                            <input type="text" name="phone" class="input-text" placeholder="Phone Number">
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="form-group message">
                                            <textarea class="input-text" name="message" placeholder="Write message"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                        <div class="form-group send-btn mb-0">
                                            <button type="submit" class="button-md button-theme">Send Message</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Contact 1 end -->
                </div>
                <!-- Properties details section end -->
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                <!-- Sidebar start -->
                <div class="sidebar right">
                    <!-- Search contents sidebar start -->
                    <div class="sidebar-widget hidden-xs hidden-sm">
                        <div class="main-title-2">
                            <h1><span>Advanced</span> Search</h1>
                        </div>

                        <form method="GET">
                            <div class="form-group">
                                <select class="selectpicker search-fields" name="property-status" data-live-search="true" data-live-search-placeholder="Search value">
                                    <option>Property Status</option>
                                    <option>For Sale</option>
                                    <option>For Rent</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <select class="selectpicker search-fields" name="location" data-live-search="true" data-live-search-placeholder="Search value">
                                    <option>Location</option>
                                    <option>United States</option>
                                    <option>United Kingdom</option>
                                    <option>American Samoa</option>
                                    <option>Belgium</option>
                                    <option>Cameroon</option>
                                    <option>Canada</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <select class="selectpicker search-fields" name="property-types" data-live-search="true" data-live-search-placeholder="Search value" >
                                    <option>Property Types</option>
                                    <option>Residential</option>
                                    <option>Commercial</option>
                                    <option>Land</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <select class="selectpicker search-fields" name="area-from" data-live-search="true" data-live-search-placeholder="Search value" >
                                    <option>Area From</option>
                                    <option>1000</option>
                                    <option>800</option>
                                    <option>600</option>
                                    <option>400</option>
                                    <option>200</option>
                                    <option>100</option>
                                </select>
                            </div>

                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <select class="selectpicker search-fields" name="bedrooms">
                                            <option>Bedrooms</option>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <select class="selectpicker search-fields" name="bathroom">
                                            <option>Bathroom</option>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <select class="selectpicker search-fields" name="balcony">
                                            <option>Balcony</option>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <select class="selectpicker search-fields" data-live-search="true" name="garage">
                                            <option>Garage</option>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                            <option>4</option>
                                            <option>5</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="range-slider">
                                <label>Area</label>
                                <div data-min="0" data-max="10000" data-unit="Sq ft" data-min-name="min_area" data-max-name="max_area" class="range-slider-ui ui-slider" aria-disabled="false"></div>
                                <div class="clearfix"></div>
                            </div>

                            <div class="range-slider">
                                <label>Price</label>
                                <div data-min="0" data-max="150000" data-unit="USD" data-min-name="min_price" data-max-name="max_price" class="range-slider-ui ui-slider" aria-disabled="false"></div>
                                <div class="clearfix"></div>
                            </div>

                            <div class="form-group mb-0">
                                <button class="search-button">Search</button>
                            </div>
                        </form>
                    </div>
                    <!-- Search contents sidebar end -->

                    <!-- Popular posts start -->
                    <div class="sidebar-widget popular-posts">
                        <div class="main-title-2">
                            <h1><span>Recently</span> Properties</h1>
                        </div>
                        <div class="media">
                            <div class="media-left">
                                <img class="media-object" src="http://placehold.it/90x63" alt="small-properties-1">
                            </div>
                            <div class="media-body">
                                <h3 class="media-heading">
                                    <a href="properties-details.html">Sweet Family Home</a>
                                </h3>
                                <p>February 27, 2018</p>
                                <div class="price">
                                    $734,000
                                </div>
                            </div>
                        </div>
                        <div class="media">
                            <div class="media-left">
                                <img class="media-object" src="http://placehold.it/90x63" alt="small-properties-2">
                            </div>
                            <div class="media-body">
                                <h3 class="media-heading">
                                    <a href="properties-details.html">Modern Family Home</a>
                                </h3>
                                <p>February 27, 2018</p>
                                <div class="price">
                                    $734,000
                                </div>
                            </div>
                        </div>
                        <div class="media">
                            <div class="media-left">
                                <img class="media-object" src="http://placehold.it/90x63" alt="small-properties-3">
                            </div>
                            <div class="media-body">
                                <h3 class="media-heading">
                                    <a href="properties-details.html">Beautiful Single Home</a>
                                </h3>
                                <p>February 27, 2018</p>
                                <div class="price">
                                    $734,000
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Category posts start -->
                    <div class="sidebar-widget category-posts">
                        <div class="main-title-2">
                            <h1><span>Popular</span> Category</h1>
                        </div>
                        <ul class="list-unstyled list-cat">
                            <li><a href="#">Single Family </a> <span>(45)  </span></li>
                            <li><a href="#">Apartment  </a> <span>(21)  </span></li>
                            <li><a href="#">Condo </a> <span>(23)  </span></li>
                            <li><a href="#">Multi Family </a> <span>(19)  </span></li>
                            <li><a href="#">Villa </a> <span>(19)  </span></li>
                            <li><a href="#">Other  </a> <span>(22)  </span></li>
                        </ul>
                    </div>

                    <!-- Social media start -->
                    <!-- <div class="social-media sidebar-widget clearfix">
                        Main Title 2
                        <div class="main-title-2">
                            <h1><span>Social</span> Media</h1>
                        </div>
                        Social list
                        <ul class="social-list">
                            <li><a href="#" class="facebook-bg"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#" class="twitter-bg"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#" class="linkedin-bg"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="#" class="google-bg"><i class="fa fa-google-plus"></i></a></li>
                            <li><a href="#" class="rss-bg"><i class="fa fa-rss"></i></a></li>
                        </ul>
                    </div> -->

                    <!-- Mortgage calculator start -->
                    <div class="sidebar-widget contact-1 mortgage-calculator">
                    <a  class="btn button-sm border-button-theme reservation">예약(상담)신청</a>
                    <a  class="btn button-sm border-button-theme bookmark ">책갈피 담아두기</a>
                   <!--  <div class="main-title-2">  
                            <h1><span>Mortgage</span> Calculator</h1>
                        </div> -->
                        <div class="contact-form question">
                          <!--  <form id="agent_form" action="index.html" method="GET" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label class="form-label">Property Price</label>
                                            <input type="text" class="input-text" placeholder="$87.000">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label class="form-label">Interest Rate (%)</label>
                                            <input type="text" class="input-text" placeholder="10%">
                                        </div>
                                    </div> 
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label class="form-label">Period In Months</label>
                                            <input type="text" class="input-text" placeholder="10 Months">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label class="form-label">Down Payment</label>
                                            <input type="text" class="input-text" placeholder="$36,300">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group mb-0">
                                            <button class="search-button">Search</button>
                                        </div>
                                    </div>
                                </div>
                            </form> -->
                        </div> 
                    </div>
                </div>
                <!-- Sidebar end -->
            </div>
        </div>
    </div>
</div>
<!-- Properties details page end -->

<!-- Partners block start -->
<div class="partners-block">
    <div class="container">
        <h3>Brands & Partners</h3>
        <div class="row">
            <div class="col-md-12">
                <div class="carousel our-partners slide" id="ourPartners">
                    <div class="carousel-inner">
                        <div class="item active">
                            <div class="col-xs-12 col-sm-6 col-md-3 partner-box">
                                <a href="#">
                                    <img src="http://placehold.it/135x50" alt="partner">
                                </a>
                            </div>
                        </div>
                        <div class="item">
                            <div class="col-xs-12 col-sm-6 col-md-3 partner-box">
                                <a href="#">
                                    <img src="http://placehold.it/135x50" alt="partner-2">
                                </a>
                            </div>
                        </div>
                        <div class="item">
                            <div class="col-xs-12 col-sm-6 col-md-3 partner-box">
                                <a href="#">
                                    <img src="http://placehold.it/135x50" alt="partner-3">
                                </a>
                            </div>
                        </div>
                        <div class="item">
                            <div class="col-xs-12 col-sm-6 col-md-3 partner-box">
                                <a href="#">
                                    <img src="http://placehold.it/135x50" alt="partner-4">
                                </a>
                            </div>
                        </div>
                        <div class="item">
                            <div class="col-xs-12 col-sm-6 col-md-3 partner-box">
                                <a href="#">
                                    <img src="http://placehold.it/135x50" alt="partner-5">
                                </a>
                            </div>
                        </div>
                    </div>
                    <a class="left carousel-control" href="#ourPartners" data-slide="prev"><i class="fa fa-chevron-left icon-prev"></i></a>
                    <a class="right carousel-control" href="#ourPartners" data-slide="next"><i class="fa fa-chevron-right icon-next"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Partners block end -->

<!-- Footer start -->
<footer class="main-footer clearfix">
    <div class="container">
        <!-- Footer info-->
        <div class="footer-info">
            <div class="row">
                <!-- About us -->
                <div class="col-lg-4 col-md-3 col-sm-6 col-xs-12">
                    <div class="footer-item">
                        <div class="main-title-2">
                            <h1>Contact Us</h1>
                        </div>
                        <p>
                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's printing and
                        </p>
                        <ul class="personal-info">
                            <li>
                                <i class="fa fa-map-marker"></i>
                                Address: 20/F Green Road, Dhanmondi, Dhaka
                            </li>
                            <li>
                                <i class="fa fa-envelope"></i>
                                Email:<a href="mailto:sales@hotelempire.com">info@themevessel.com</a>
                            </li>
                            <li>
                                <i class="fa fa-phone"></i>
                                Phone: <a href="tel:+55-417-634-7071">+55 4XX-634-7071</a>
                            </li>
                            <li>
                                <i class="fa fa-fax"></i>
                                Fax: +55 4XX-634-7071
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- Links -->
                <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
                    <div class="footer-item">
                        <div class="main-title-2">
                            <h1>Links</h1>
                        </div>
                        <ul class="links">
                            <li>
                                <a href="index.html">Home</a>
                            </li>
                            <li>
                                <a href="about.html">About Us</a>
                            </li>
                            <li>
                                <a href="contact.html">Contact Us</a>
                            </li>
                            <li>
                                <a href="blog-single-sidebar-right.html">Blog</a>
                            </li>
                            <li>
                                <a href="blog-single-sidebar-right.html">Services</a>
                            </li>
                            <li>
                                <a href="properties-list-rightside.html">properties Listing</a>
                            </li>
                            <li>
                                <a href="properties-grid-rightside.html">properties Grid</a>
                            </li>
                            <li>
                                <a href="properties-details.html">properties Details</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- Recent cars -->
                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                    <div class="footer-item popular-posts">
                        <div class="main-title-2">
                            <h1>Popular Posts</h1>
                        </div>
                        <div class="media">
                            <div class="media-left">
                                <img class="media-object" src="http://placehold.it/90x63" alt="small-properties-1">
                            </div>
                            <div class="media-body">
                                <h3 class="media-heading">
                                    <a href="properties-details.html">Sweet Family Home</a>
                                </h3>
                                <p>February 27, 2018</p>
                                <div class="price">
                                    $734,000
                                </div>
                            </div>
                        </div>
                        <div class="media">
                            <div class="media-left">
                                <img class="media-object" src="http://placehold.it/90x63" alt="small-properties-2">
                            </div>
                            <div class="media-body">
                                <h3 class="media-heading">
                                    <a href="properties-details.html">Modern Family Home</a>
                                </h3>
                                <p>February 27, 2018</p>
                                <div class="price">
                                    $734,000
                                </div>
                            </div>
                        </div>
                        <div class="media">
                            <div class="media-left">
                                <img class="media-object" src="http://placehold.it/90x63" alt="small-properties-3">
                            </div>
                            <div class="media-body">
                                <h3 class="media-heading">
                                    <a href="properties-details.html">Beautiful Single Home</a>
                                </h3>
                                <p>February 27, 2018</p>
                                <div class="price">
                                    $734,000
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Subscribe -->
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="footer-item">
                        <div class="main-title-2">
                            <h1>Subscribe</h1>
                        </div>
                        <div class="newsletter clearfix">
                            <p>
                                Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id
                            </p>

                            <form action="#" method="post">
                                <div class="form-group">
                                    <input class="nsu-field btn-block" id="nsu-email-0" type="text" name="email" placeholder="Enter your Email Address" required="">
                                </div>
                                <div class="form-group mb-0">
                                    <button type="submit" class="button-sm button-theme btn-block">
                                        Subscribe
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Footer end -->

<!-- Copy right start -->
<div class="copy-right">
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-8 col-sm-12">
                &copy;  2017 <a href="http://themevessel.com/" target="_blank">Theme Vessel</a>. Trademarks and brands are the property of their respective owners.
            </div>
            <div class="col-md-4 col-sm-12">
                <ul class="social-list clearfix">
                    <li>
                        <a href="#" class="facebook">
                            <i class="fa fa-facebook"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="twitter">
                            <i class="fa fa-twitter"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="linkedin">
                            <i class="fa fa-linkedin"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="google">
                            <i class="fa fa-google-plus"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="rss">
                            <i class="fa fa-rss"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- Copy end right-->

<!-- Car Video Modal -->
<div class="modal property-modal fade" id="propertyModal" tabindex="-1" role="dialog" aria-labelledby="carModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="carModalLabel">
                    Find Your Dream House
                </h5>
                <p>
                    123 Kathal St. Tampa City,
                </p>
                <span class="ratings">
                    <i class="fa fa-star s1 active" data-score="1"></i>
                    <i class="fa fa-star s2 active" data-score="2"></i>
                    <i class="fa fa-star s3 active" data-score="3"></i>
                    <i class="fa fa-star s4 active" data-score="4"></i>
                    <i class="fa fa-star s5 active" data-score="5"></i>
                </span>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row modal-raw">
                    <div class="col-lg-5 modal-left">
                        <div class="modal-left-content">
                            <div class="bs-example" data-example-id="carousel-with-captions">
                                <div class="carousel slide" id="properties-carousel" data-ride="carousel">
                                    <div class="carousel-inner" role="listbox">
                                        <div class="item">
                                            <img src="http://placehold.it/450x300 " alt="best-properties">
                                        </div>
                                        <div class="item">
                                            <img src="http://placehold.it/450x300 " alt="best-properties">
                                        </div>
                                        <div class="item active">
                                            <!-- <iframe class="modalIframe" src="https://www.youtube.com/embed/5e0LxrLSzok" allowfullscreen></iframe> --><!-- 유튜브 -->
                                        </div>
                                    </div>

                                    <a class="control control-prev" href="#properties-carousel" role="button" data-slide="prev">
                                        <i class="fa fa-angle-left"></i>
                                    </a>
                                    <a class="control control-next" href="#properties-carousel" role="button" data-slide="next">
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="description">
                                <h3>Description</h3>
                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.But also the leap into electronic typesetting, remaining,</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7 modal-right">
                        <div class="modal-right-content bg-white">
                            <strong class="price">
                                $178,000
                            </strong>
                            <section>
                                <h3>Features</h3>
                                <div class="features">
                                    <ul class="bullets">
                                        <li><i class="flaticon-air-conditioner"></i>Air conditioning</li>
                                        <li><i class="flaticon-wifi"></i>Wifi</li>
                                        <li><i class="flaticon-transport"></i>Parking</li>
                                        <li><i class="flaticon-people-2"></i>Pool</li>
                                        <li><i class="flaticon-weightlifting"></i>Gym</li>
                                        <li><i class="flaticon-building"></i>Alarm</li>
                                        <li><i class="flaticon-old-telephone-ringing"></i>Balcony</li>
                                        <li><i class="flaticon-monitor"></i>TV</li>
                                    </ul>
                                </div>
                            </section>
                            <section>
                                <h3>Overview</h3>
                                <dl>
                                    <dt>Model</dt>
                                    <dd>Maxima</dd>
                                    <dt>Condition</dt>
                                    <dd>Brand New</dd>
                                    <dt>Year</dt>
                                    <dd>2018</dd>
                                    <dt>Price</dt>
                                    <dd>$178,000</dd>
                                </dl>
                            </section>
                            <section>
                                <h3>Last Review</h3>
                                <div class="ratings" data-rating="5">
                                    <span>
                                        <i class="fa fa-star s1 active" data-score="1"></i>
                                        <i class="fa fa-star s2 active" data-score="2"></i>
                                        <i class="fa fa-star s3 active" data-score="3"></i>
                                        <i class="fa fa-star s4 active" data-score="4"></i>
                                        <i class="fa fa-star s5 active" data-score="5"></i>
                                    </span>
                                </div>
                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's </p>
                            </section>
                            <a href="properties-details.html" class="btn button-sm button-theme">Show Detail</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="resources/user/js/jquery-2.2.0.min.js"></script>
<script src="resources/user/js/bootstrap.min.js"></script>
<script src="resources/user/js/bootstrap-submenu.js"></script>
<script src="resources/user/js/rangeslider.js"></script>
<script src="resources/user/js/jquery.mb.YTPlayer.js"></script>
<script src="resources/user/js/wow.min.js"></script>
<script src="resources/user/js/bootstrap-select.min.js"></script>
<script src="resources/user/js/jquery.easing.1.3.js"></script>
<script src="resources/user/js/jquery.scrollUp.js"></script>
<script src="resources/user/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="resources/user/js/leaflet.js"></script>
<script src="resources/user/js/leaflet-providers.js"></script>
<script src="resources/user/js/leaflet.markercluster.js"></script>
<script src="resources/user/js/dropzone.js"></script>
<script src="resources/user/js/jquery.filterizr.js"></script>
<script src="resources/user/js/jquery.magnific-popup.min.js"></script>
<script src="resources/user/js/maps.js"></script>
<script src="resources/user/js/app.js"></script>

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="resources/user/js/ie10-viewport-bug-workaround.js"></script>
<!-- Custom javascript -->
<script src="resources/user/js/ie10-viewport-bug-workaround.js"></script>




<script>
      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

      var map;
      var subwayMap;
	  var forSale_Lat = parseFloat($("#forSale_Lat").val());
	  var forSale_Lng = parseFloat($("#forSale_Lng").val());
      function initMap() {
        // Create the map.
        var pyrmont = {lat:forSale_Lat, lng:forSale_Lng};
        map = new google.maps.Map(document.getElementById('map'), {
          center: pyrmont,
          zoom: 17
        });
        
        subwayMap = new google.maps.Map(document.getElementById('subwayMap'), {
            center: pyrmont,
            zoom: 17
          });

        // Create the places service.
        
		
        search(pyrmont);
        searchSubway(pyrmont);
      }
      
      
      function search(pyrmont){
    	  var pyrmont = {lat:forSale_Lat, lng:forSale_Lng};
          map = new google.maps.Map(document.getElementById('map'), {
            center: pyrmont,
            zoom: 15
          });
    	  var service = new google.maps.places.PlacesService(map);
          var getNextPage = null;
    	  var searchType;
          for(var i = 0; i < document.controls.searchType.length; i++){
          	if(document.controls.searchType[i].checked){
          		searchType = document.controls.searchType[i].value;
          	}
          }
          
          document.getElementById("places").innerHTML="";
          
          // Perform a nearby search.
          service.nearbySearch(
              {location: pyrmont, radius: 500, type: [searchType]},
              function(results, status, pagination) {
                if (status !== 'OK'){
                	storeCount(null);
                	return;
                }
  			  	
                createMarkers(results);
                storeCount(results);
                
                getNextPage = pagination.hasNextPage && function() {
                  pagination.nextPage();
                };
              });
      }
      // 주변 시설물 개수 출력
      function storeCount(places){
    	  var searchPlace = $('input[name="searchType"]:checked').attr('data-val');
    	  /* alert(searchPlace);
    	  var storeCnt = $('input[name="searchType"]:checked').val(); */
          var storeCnt = 0;
          
          if(places!=null){
        	  for(var i = 0, place; place = places[i]; i++){
         		 storeCnt++;
         	  }
          }
    	  
    	  var storeList = '<table>';
    	  	storeList += '<tr id=>';
        	storeList += '<td><h3>'+searchPlace+storeCnt+'개<h3></td>';
        	storeList += '</tr>';
          	storeList += '</table>';
          
          $("#storeList").html(storeList);
      }
      
      // 마크 찍기
      function createMarkers(places) { 
    	var pyrmont = {lat:forSale_Lat, lng:forSale_Lng};
        var bounds = new google.maps.LatLngBounds();
        map = new google.maps.Map(document.getElementById('map'), {
          center: pyrmont,
          zoom: 15
        });
        
        var placesList = document.getElementById('places');
        for (var i = 0, place; place = places[i]; i++) {
        	image = {
        			url : place.icon,
    	            size: new google.maps.Size(71, 71),
    	            origin: new google.maps.Point(0, 0),
    	            anchor: new google.maps.Point(17, 34),
    	            scaledSize: new google.maps.Size(25, 25)
    	          };

    	          var centerMarker = new google.maps.Marker({
    	            map: map,
    	            title: place.name,
    	            position: pyrmont
    	          });
    	          
    	          var marker = new google.maps.Marker({
    	            map: map,
    	            icon: image,
    	            title: place.name,
    	            position: place.geometry.location
    	          });
				
    	          var li = document.createElement('li');
    	          li.textContent = place.name;
    	          placesList.appendChild(li);
    	          
    	          
        }
        var infowindow = new google.maps.InfoWindow();
        var service = new google.maps.places.PlacesService(map);
      }
      
      var subRadius=1000;
      // 가장 가까운 지하철 찾기
      function searchSubway(pyrmont){
    	  subRadius=100;
    	  subCallBack();
      }
      var subwayLat;
      var subwayLng;
      var subwayArr = new Array();
      var subwayDistanceArr = new Array();
       function subCallBack(){
    	  subRadius=subRadius+100;
    	  pyrmont = {lat:forSale_Lat, lng:forSale_Lng};
    	  subwayMap = new google.maps.Map(document.getElementById('subwayMap'), {
            center: pyrmont,
            zoom: 15
          });
    	  var service = new google.maps.places.PlacesService(subwayMap);
    	  
    	  service.nearbySearch(
                  {location: pyrmont, radius: subRadius, type: ['subway_station']},
                  function(results, status, pagination) {
                    if (status !== 'OK'){
                    	subCallBack();
                    }else{
                    	console.log(results);
                    	for(var i=0; i<=results.length-1; i++){
                    		//subwayArr.push(results[i].geometry.location);
                    		subwayArr.push(results[i]);
                    	}
                    	/* for(var var i=0; i<=results.length-1; i++){
                    		console.log(subwayArr[i]);
                    	} */
                    	console.log(subwayArr);
                    	
                    	subwayLat = results[results.length-1].geometry.location.lat();
                    	subwayLng = results[results.length-1].geometry.location.lng();
                    	/* console.log(subwayLat); // 지하철 위도 경도를 구했다.
                    	console.log(subwayLng); */
                    	//createSubwayMarkers(results);
                    	routeMap();
                         getNextPage = pagination.hasNextPage && function() {
                           pagination.nextPage();
                         };
                    }
                  });
    	  
      } 
      
      // 마크 찍기
      function createSubwayMarkers(places) {
    	var pyrmont = {lat:forSale_Lat, lng:forSale_Lng};
        var bounds = new google.maps.LatLngBounds();
        subwayMap = new google.maps.Map(document.getElementById('subwayMap'), {
          center: pyrmont,
          zoom: 15
        });
        
        var placesList = document.getElementById('places');
        for (var i = 0, place; place = places[i]; i++) {
        	image = {
        			url : place.icon,
    	            size: new google.maps.Size(71, 71),
    	            origin: new google.maps.Point(0, 0),
    	            anchor: new google.maps.Point(17, 34),
    	            scaledSize: new google.maps.Size(25, 25)
    	          };

    	          var centerMarker = new google.maps.Marker({
    	            map: subwayMap,
    	            title: place.name,
    	            position: pyrmont
    	          });
    	          
    	          var marker = new google.maps.Marker({
    	            map: subwayMap,
    	            title: place.name,
    	            position: place.geometry.location
    	          });
				
    	          var li = document.createElement('li');
    	          li.textContent = place.name;
    	          placesList.appendChild(li);
    	          
    	          
        }
        var infowindow = new google.maps.InfoWindow();
        var service = new google.maps.places.PlacesService(subwayMap);
      }
      
      
      
      function routeMap() {
    	  var origin= {lat:forSale_Lat, lng:forSale_Lng};  // 매물주소의 위도경도
          var directionsDisplay = new google.maps.DirectionsRenderer;
          var directionsService = new google.maps.DirectionsService;
          var subwayMap = new google.maps.Map(document.getElementById('subwayMap'), {
            center: origin,
            zoom: 17
          });
          directionsDisplay.setMap(subwayMap);

          calculateAndDisplayRoute(directionsService, directionsDisplay);
        }
      
      
		
        function calculateAndDisplayRoute(directionsService, directionsDisplay) {
        	test(subwayArr,directionsService, directionsDisplay);
        }
        
        var cnt=0;
        var subwayMin = 99999;
		var subwayDestination = {lat: 0, lng: 0};
		
        function test(subwayArr,directionsService, directionsDisplay){
        		
        	  var origin= {lat:forSale_Lat, lng:forSale_Lng};  // 매물주소의 위도경도
              var destination= {lat: 0, lng: 0};  // 가까운 지하철 위도경도
              var i=cnt;
             console.log(subwayArr[i]);
        	 directionsService.route({
                 origin: {lat:forSale_Lat, lng:forSale_Lng},  // 매물주소의 위도경도
                 destination: {lat: subwayArr[i].geometry.location.lat(), lng: subwayArr[i].geometry.location.lng()},  // 가까운 지하철 위도경도
                 // Note that Javascript allows us to access the constant
                 // using square brackets and a string value as its
                 // "property."
                 travelMode: google.maps.TravelMode['WALKING']
               }, function(response, status) {
                 if (status == 'OK') {
               		//directionsDisplay.setDirections(response);
                         subwayDistanceArr.push(response.routes[0].legs[0].distance.text);
                         subwayDistanceArr.push(response.routes[0].legs[0].distance.value);
                         if(response.routes[0].legs[0].distance.value <= subwayMin){
                         	subwayMin = response.routes[0].legs[0].distance.value;
                         	console.log(subwayArr[i].geometry.location.lat() + "리스폰"+i);
                         	console.log(response.routes[0].legs[0].distance.value+ "리스폰"+i);
                	  		console.log(response.routes[0].legs[0].distance.text+ "리스폰"+i);
                         	subwayDestination = {lat: subwayArr[i].geometry.location.lat(), lng: subwayArr[i].geometry.location.lng()};
                         	console.log("i = " + i);
                         	console.log("aaa" + subwayMin);
                         	console.log("subwayDestination" + JSON.stringify(subwayDestination));
                         	cnt++;
                         	
                         	if(cnt == subwayArr.length){
                         		routeMap2();
                         	}
                         	else if(cnt!=subwayArr.length+1){
                         		test(subwayArr,directionsService, directionsDisplay);
                         	}
                         	
                         	
                         }
               	  
                 } else {
                   window.alert('Directions request failed due to ' + status);
                 }
               });
        	 
        	return;
        }
        
        function routeMap2() {
      	  var origin= {lat:forSale_Lat, lng:forSale_Lng};  // 매물주소의 위도경도
            var directionsDisplay = new google.maps.DirectionsRenderer;
            var directionsService = new google.maps.DirectionsService;
            var subwayMap = new google.maps.Map(document.getElementById('subwayMap'), {
              center: origin,
              zoom: 17
            });
            
            directionsDisplay.setMap(subwayMap);

            calculateAndDisplayRoute2(directionsService, directionsDisplay);
          }
        
        function calculateAndDisplayRoute2(directionsService, directionsDisplay) {
            //var selectedMode = document.getElementById('mode').value;
            console.log("2번쨰");
            console.log(subwayDestination);
            var origin= {lat:forSale_Lat, lng:forSale_Lng};  // 매물주소의 위도경도
            var destination= {lat: subwayDestination.lat, lng: subwayDestination.lng};  // 가까운 지하철 위도경도
            console.log("확인용");
            console.log(destination);
            directionsService.route({
              origin: {lat:forSale_Lat, lng:forSale_Lng},  // 매물주소의 위도경도
              destination: {lat: subwayDestination.lat, lng: subwayDestination.lng},  // 가까운 지하철 위도경도
              // Note that Javascript allows us to access the constant
              // using square brackets and a string value as its
              // "property."
              travelMode: google.maps.TravelMode['WALKING']
            }, function(response, status) {
              if (status == 'OK') {
                directionsDisplay.setDirections(response);
                console.log(response.routes[0].legs[0].distance.text);
                $("#forSubwayDistance").html(response.routes[0].legs[0].distance.text);
              } else {
                window.alert('Directions request failed due to ' + status);
              }
            });
          }
        
    </script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD16Rw_1wxr6ylwIbpNOeW76O89uhaIaz4&libraries=places&callback=initMap&sensor=false"></script>
</body>
</html>