<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
    <!-- <script src="js/ie-emulation-modes-warning.js"></script> -->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="js/html5shiv.min.js"></script>
    <script type="text/javascript" src="js/respond.min.js"></script>
    <![endif]-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="resources/user/js/geoapi.js"></script>
	<script type="text/javascript" src="http://geoapi.heartrails.com/api/geoapi.js"></script>
    <script>
    var price = $("#itemPriceBar").val();
	$(function(){
		init();
    	$("#Allpro").on("click",Allpro);
    	$("#Apartmentpro").on("click",Apartmentpro);
    	$("#Mansionpro").on("click",Mansionpro);
    	$("#ShareHousepro").on("click",ShareHousepro)
    	$("#OneRoompro").on("click",OneRoompro);
		$("#searchButton").on("click",searchItem); // 검색 버튼 클릭
		
	});
	
	function searchItem(){
		$("#searchItemForm").submit();
	}
	 function init(){
	    	
	    	$.ajax({
	    		type : 'POST'
	    		, url : "ICList"
	    		//, data : 
	    		, success : function(list) {
	    			output(list);
	    			splitOption(list);
	    		}
	    	});
	    }
	    function Allpro(){
	    	$.ajax({
	    		type : 'POST'
	    		, url : "ICList"
	    		//, data : 
	    		, success : function(list) {
	    			output(list);
	    			splitOption(list);
	    		}
	    	});
	    }
	    function Apartmentpro(){
	    	var type=$(this).attr('value');
	    	$.ajax({
	    		type : 'POST'
	    		, url : "HouseTypeList"
	    		, data : {
	    			forSale_HouseType:type
	    		}
	    		, success : function(list) {
	    			output(list);
	    			splitOption(list);
	    		}
	    	});
	    }
	    function Mansionpro(){
	    	var type=$(this).attr('value');
	    	$.ajax({
	    		type : 'POST'
	    		, url : "HouseTypeList"
	    		, data : {
	    			forSale_HouseType:type
	    		}
	    		, success : function(list) {
	    			output(list);
	    			splitOption(list);
	    		}
	    	});
	    }
	    function ShareHousepro(){
	    	var type=$(this).attr('value');
	    	$.ajax({
	    		type : 'POST'
	    		, url : "HouseTypeList"
	    		, data : {
	    			forSale_HouseType:type
	    		}
	    		, success : function(list) {
	    			output(list);
	    			splitOption(list);
	    		}
	    	});
	    }
	    function OneRoompro(){
	    	var type=$(this).attr('value');
	    	$.ajax({
	    		type : 'POST'
	    		, url : "HouseTypeList"
	    		, data : {
	    			forSale_HouseType:type
	    		}
	    		, success : function(list) {
	    			output(list);
	    			splitOption(list);
	    		}
	    	});
	    }
	    
	    function splitOption(resp){
	    	$.each(resp, function(index,item){
	 		var forSale_Option = $(".forSale_Option"+item.forSale_Seq).val();
	 		var seq=item.forSale_Seq;
	 		var optionSplit = forSale_Option.split(',');
	 		var amenitiesContent = "";
	 		$.each(optionSplit,function(index,item){
	 			if(index<6){
	 				amenitiesContent+="<li>";
	 				amenitiesContent+="<i class='flaticon-square-layouting-with-black-square-in-east-area'></i>";
	 				amenitiesContent+="<span>"+item+"</span>";
	 				amenitiesContent+="</li>";
	 				$(".ul"+seq).html(amenitiesContent);
	 			}
	 		});
	    	});
	    }
	    
	    
	    function output(resp){
	    	var data="";
	    	$.each(resp, function(index,item){
	    	data+="<div class='col-lg-4 col-md-4 col-sm-6 col-xs-12  filtr-item' data-category='1, 2, 3, 4'>"
	    	data+="<div class='property'>"
	    	data+="<div class='property-img'>";
	    	data+="<div class='property-tag button alt featured'>"+item.forSale_HouseType+"</div>";
	        data+="<div class='property-tag button sale'>"+item.forSale_Status+"</div>";
	        data+="<div class='property-price'>"+item.forSale_Rent+"</div>";
	        data+="<img src='/GomBang/img/"+item.saveName+"' alt='fp' class='img-responsive'>";
	        data+="<div class='property-overlay'>";
	        data+="<a href='customerItemDetail?forSale_Seq="+item.forSale_Seq+"' class='overlay-link'>";
	        data+="<i class='fa fa-link'></i>";
	        data+="</a>";
	        data+="</div>";
	        data+="</div>";
	        data+="<div class='property-content'>";
	        data+="<h1 class='title'>";
	        data+="<a href='properties-details.html'>"+item.forSale_Title+"</a>";
	        data+="</h1>";
	        data+="<h3 class='property-address'>";
	        data+="<a href='properties-details.html'>";
	        data+="<i class='fa fa-map-marker'></i>"+item.geoapi_prefectures+""+item.geoapi_cities+""+item.geoapi_towns+""+item.geoapi_remain+"</a>";
	        data+="</h3>";
	        data+="<input type='hidden' value='"+item.forSale_Option+"' class='forSale_Option"+item.forSale_Seq+"'>";
	        data+="<ul class='facilities-list clearfix ul"+item.forSale_Seq+"'>";
	        data+="</ul>";
	        data+="<div class='property-footer'>";
	        data+="<span class='left'>";
	        data+="<a href='#'><i class='fa fa-user'></i>"+item.enterprise_ID+"</a>";
	        data+="</span>";
	        data+="<span class='right'>";
	        data+="<i class='fa fa-calendar'></i>"+item.forSale_Indate+"Days ago";
	        data+="</span>";
	        data+="</div>";
	        data+="</div>";
	        data+="</div>";
	        data+="</div>";
	    	});
	    	  $(".filtr-container").html(data);
	    }
	    
</script>
    <!-- 주소API CSS -->
    <style>


    	
    
    #geoapi-prefectures{
    	width:100%;
		height:40px;
		border: 0px solid rgba(255, 255, 255, 0.2);
		color: #999;
		padding:4px 0px;
		background-color: rgba(255, 255, 255, 0.2);
		border-radius:3px;
    }
    #geoapi-cities{
		width:100%;
		height:40px;
		border: 0px solid rgba(255, 255, 255, 0.2);
		/* color: #95c41f; */
		color: #999;
		padding:4px 0px;
		background-color: rgba(255, 255, 255, 0.2);
		border-radius:3px;

	}
	#geoapi-towns{
		width:100%;
		height:40px;
		border: 0px solid rgba(255, 255, 255, 0.2);
		color: #999;
		padding:4px 0px;
		background-color: rgba(255, 255, 255, 0.2);
		border-radius:3px;

	}
    </style>
</head>
<body>

<div class="page_loader"></div>
<!-- header 시작ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ -->
<!-- Top header start -->
<header class="top-header hidden-xs" id="top">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                <div class="list-inline">
                    <!-- <a href="tel:1-8X0-666-8X88"><i class="fa fa-phone"></i>1-8X0-666-8X88</a>
                    <a href="tel:info@themevessel.com"><i class="fa fa-envelope"></i>info@themevessel.com</a> -->
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                <ul class="top-social-media pull-right">
                    <c:if test="${sessionScope.customerLoginID==null && sessionScope.enterpriseLoginID==null}">
                    <li>
                        <a href="customerLogingo" class="sign-in"><i class="fa fa-sign-in"></i> Login</a>
                    </li>
                    <li>
                        <a href="customerSignupgo" class="sign-in"><i class="fa fa-user"></i> Register</a>
                    </li>
                    </c:if>
                    <c:if test="${sessionScope.customerLoginID!=null}">
                    <li>
                        <a href="customerLogout" class="sign-in"><i class="fa fa-sign-in"></i> Logout</a>
                    </li>
                    <li>
                        <a href="customerSignupgo" class="sign-in"><i class="fa fa-user"></i>Customer Modify</a>
                    </li>
                    </c:if>
                    <c:if test="${sessionScope.enterpriseLoginID!=null}">
                    <li>
                        <a href="enterpriseLogout" class="sign-in"><i class="fa fa-sign-in"></i> Logout</a>
                    </li>
                    <li>
                        <a href="goUpdate?enterprise_ID=${sessionScope.enterpriseLoginID}" class="sign-in"><i class="fa fa-user">
                        
                        </i> Enterprise Modify
                        </a>
                    </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
</header>
<!-- Top header end -->

<!-- Main header start (소비자)-->
<c:if test="${sessionScope.enterpriseLoginID==null}">
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
                <a href="goHome">
                    <img src="/GomBang/img/gombangLogo.png" style="margin-right:50px;padding:19px 0;">
                </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="navbar-collapse collapse" role="navigation" aria-expanded="true" id="app-navigation">
                <ul class="nav navbar-nav">
                    <li class="dropdown active">
                        <a tabindex="0" data-toggle="dropdown" data-submenu="" aria-expanded="false">
                            Home<span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="goHome">Home</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a tabindex="0" data-toggle="dropdown" data-submenu="" aria-expanded="false">
                           	 Map<span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="goFullMap">Map FullWidth</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a tabindex="0" data-toggle="dropdown" data-submenu="" aria-expanded="false">
                            	Search<span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="searchItem3">Advanced Search</a></li>
                        </ul>
                    </li>
                    
                    <li class="dropdown">
                        <a tabindex="0" data-toggle="dropdown" data-submenu="" aria-expanded="false">
                            Q&A<span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="goCustomerboard">Q&A Board</a></li>
                        </ul>
                    </li>
                    <c:if test="${sessionScope.customer.customer_ID!=null}">
                    <li class="dropdown">
                        <a tabindex="0" data-toggle="dropdown" data-submenu="" aria-expanded="false">
                            Information<span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="enterpriseListCheck">Enterprise List </a></li>
                        </ul> 
                    </li>
                    
                     <li class="dropdown">
                        <a tabindex="0" data-toggle="dropdown" data-submenu="" aria-expanded="false">
                            User<span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="customerMyProfile?customer_ID=${sessionScope.customer.customer_ID }">User profile</a></li>
                        </ul>
                    </li>
                    </c:if>
                </ul>
                <ul class="nav navbar-nav navbar-right rightside-navbar">
                    <li>
                        <!-- <a href="submitProperty" class="button"> 
                            Submit Property
                        </a> -->
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</header>
</c:if>
<!-- Main header end (소비자)-->

<!-- Main header start (기업>-->
<c:if test="${sessionScope.enterpriseLoginID!=null}">
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
                <a href="goHome">
                    <img src="/GomBang/img/gombangLogo.png" style="margin-right:50px;padding:19px 0;">
                </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="navbar-collapse collapse" role="navigation" aria-expanded="true" id="app-navigation">
                <ul class="nav navbar-nav">
                    <li class="dropdown active">
                        <a tabindex="0" data-toggle="dropdown" data-submenu="" aria-expanded="false">
                            Profile<span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                              <li><a href="enterpriseMyProfile">User profile</a></li>
                              <li><a href="myproperties">My Properties</a></li>
                              <li><a href="submitProperty">Submit New Property</a></li>
                              <li><a href="goprofilepassword">Forgot Password</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a tabindex="0" data-toggle="dropdown" data-submenu="" aria-expanded="false">
                            Reservation<span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="reservationwait">Reservation Wait</a></li> 
                            <li><a href="reservationcomplete">Reservation Complete</a></li>
                            <li><a href="tradeCompleteList?enterprise_ID=${sessionScope.enterpriseLoginID}">Trade complete</a></li>     
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a tabindex="0" data-toggle="dropdown" data-submenu="" aria-expanded="false">
                            Board<span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="goEnterpriseboard">EnterpriseBoard</a></li> 
                        </ul>
                    </li>
                     <li class="dropdown">
                        <a tabindex="0" data-toggle="dropdown" data-submenu="" aria-expanded="false">
                            Map<span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="goFullMap">Map</a></li> 
                        </ul>
                    </li>
                    
                </ul>
                <ul class="nav navbar-nav navbar-right rightside-navbar">
                    <li>
                        <a href="submitProperty" class="button"> 
                            Submit Property
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</header>
</c:if>
<!-- Main header end (기업)-->
<!-- header 시작ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ -->
<!-- Banner start -->
<div class="banner">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item item-100vh active">
                <img src="http:/GomBang/img/mainImage.jpg" alt="banner-slider-1" class="img-responsive">
                <div class="carousel-caption banner-slider-inner banner-tb text-left">
                    <div class="banner-content banner-content-left">
                        <div class="text-center hidden-md hidden-lg">
                            <h1 data-animation="animated fadeInDown delay-05s"><span>Find your </span> Dream House</h1>
                            <p data-animation="animated fadeInUp delay-1s">Lorem ipsum dolor sit amet, conconsectetuer adipiscing elit Lorem ipsum dolor sit amet, conconsectetuer</p>
                            <a href="#" class="btn button-md button-theme" data-animation="animated fadeInUp delay-15s">Get Started Now</a>
                            <a href="#" class="btn button-md border-button-theme" data-animation="animated fadeInUp delay-15s">Learn More</a>
                        </div>
                        
						
                        
                        <div class="banner-search-box hidden-xs hidden-sm">
                            <!-- Search area start -->
                            <div class="search-area animated fadeInDown delay-1s">
                                <div class="search-area-inner">
                                    <div class="search-contents ">
                                        <form method="GET" id="searchItemForm" action="searchItem">
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                <div class="form-group">
                                                    <select id="forSale_Status" class="selectpicker search-fields" name="forSale_Status" data-live-search="true" data-live-search-placeholder="Search value">
                                                        <option>Property Status</option>
                                                        <option>For Sale</option>
                                                        <option>For Rent</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <input type="hidden" id="selectedMin_distance" name="min_distance" value=-1>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                <div class="form-group">
                                                    <select id="forSale_HouseType" class="selectpicker search-fields" name="forSale_HouseType" data-live-search="true" data-live-search-placeholder="Search value">
                                                        <option>Property Types</option>
                                                        <option>Apartment</option>
                                                        <option>Mansion</option>
                                                        <option>Share House</option>
                                                        <option>One Room</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                <div class="form-group">
                                                    <select  id="geoapi-prefectures" name="geoapi_prefectures" >
 														<option value="都道府県を選択してください">都道府県を選択してください</option>
													</select>
                                                </div>
                                            </div>
                                            <div>
                                            
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                <div class="form-group" id="cities">
                                                    <select id="geoapi-cities" name="geoapi_cities" >
  														<option value="市区町村名を選択してください">市区町村名を選択してください</option>
													</select>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                <div class="form-group">
                                                    <select id="geoapi-towns" name="geoapi_towns" style="color:#999;">
  														<option value="町域を選択してください">町域を選択してください</option>
													</select>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                <!-- <div class="form-group" style="display:none">
                                                    <select class="selectpicker search-fields" name="bathrooms" data-live-search="true" data-live-search-placeholder="Search value" >
                                                        <option>임시</option>
                                                        <option>1</option>
                                                        <option>2</option>
                                                        <option>3</option>
                                                        <option>4</option>
                                                        <option>5</option>
                                                        <option>6</option>
                                                        <option>7</option>
                                                    </select>
                                                </div> -->
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                <div class="form-group mb-0">
                                                    <div class="range-slider">
                                                        <div id="itemPriceBar" data-min="0" data-max="300000" data-unit="円" data-min-name="min_price" data-max-name="max_price" class="range-slider-ui ui-slider" aria-disabled="false"></div>
                                                        <input type="hidden" id="itemPrice" name="forSale_Rent">
                                                        <div class="clearfix"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                <div class="form-group mb-0">
                                                    <button class="search-button" id="searchButton">Search</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- Search area start -->
                        </div>
                    </div>
                </div>
            </div>
    </div>
</div>
<!-- Banner end -->

<!-- Search area start -->
<div class="search-area hidden-lg hidden-md">
    <div class="container">
        <div class="search-area-inner">
            <div class="search-contents ">
                <form method="GET">
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
                            <div class="form-group">
                                <select class="selectpicker search-fields" name="area-from" data-live-search="true" data-live-search-placeholder="Search value">
                                    <option>Area From</option>
                                    <option>1000</option>
                                    <option>800</option>
                                    <option>600</option>
                                    <option>400</option>
                                    <option>200</option>
                                    <option>100</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
                            <div class="form-group">
                                <select class="selectpicker search-fields" name="property-status" data-live-search="true" data-live-search-placeholder="Search value">
                                    <option>Property Status</option>
                                    <option>For Sale</option>
                                    <option>For Rent</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
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
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
                            <div class="form-group">
                                <select class="selectpicker search-fields" name="property-types" data-live-search="true" data-live-search-placeholder="Search value">
                                    <option>Property Types</option>
                                    <option>Residential</option>
                                    <option>Commercial</option>
                                    <option>Land</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
                            <div class="form-group">
                                <select class="selectpicker search-fields" name="bedrooms" data-live-search="true" data-live-search-placeholder="Search value" >
                                    <option>Bedrooms</option>
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                    <option>6</option>
                                    <option>7</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
                            <div class="form-group">
                                <select class="selectpicker search-fields" name="bathrooms" data-live-search="true" data-live-search-placeholder="Search value" >
                                    <option>Bathrooms</option>
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                    <option>6</option>
                                    <option>7</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
                            <div class="form-group">
                                <div class="range-slider">
                                    <div data-min="0" data-max="150000" data-unit="USD" data-min-name="min_price" data-max-name="max_price" class="range-slider-ui ui-slider" aria-disabled="false"></div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 ">
                            <div class="form-group">
                                <button class="search-button">Search</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Search area start -->

<!-- Featured properties start -->
<div class="content-area featured-properties">
    <div class="container">
        <!-- Main title -->
        <div class="main-title">
            <h1>Featured Properties</h1>
        </div>
         <ul class="list-inline-listing filters filters-listing-navigation">
            <li class="active btn filtr-button filtr" data-filter="all"    id="Allpro">All</li>
            <li data-filter="1" class="btn btn-inline filtr-button filtr"  id="Apartmentpro" value="Apartment">Apartment</li>
            <li data-filter="2" class="btn btn-inline filtr-button filtr"  id="Mansionpro" value="Mansion">Mansion</li>
            <li data-filter="3" class="btn btn-inline filtr-button filtr"  id="ShareHousepro" value="Share House">Share House</li>
            <li data-filter="4" class="btn btn-inline filtr-button filtr"  id="OneRoompro" value="One Room">One Room</li>
        </ul>
        
        <div class="row">
            <div class="filtr-container">
                
                       
                </div>
            </div>
        </div>
    </div>
<!-- Featured properties end -->

<!-- Services start -->
<div class="services mb-100 clearfix">
    <div class="container">
        <!-- Main title -->
        <div class="main-title">
            <h1>What Are you Looking For?</h1>
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-6 wow fadeInLeft delay-04s">
                <div class="services-info">
                    <i class="flaticon-internet"></i>
                    <h5>Apartment</h5>
                    <p>韓国のアパートと違います。<br>
                    	アパート。
                    </p>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 wow fadeInLeft delay-04s">
                <div class="services-info">
                	<i class="flaticon-apartment"></i>
                    <h5>Mansion</h5>
                    <p>韓国のアパートの意味です。<br>
                    	マンション。
                    </p>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 wow fadeInRight delay-04s">
                <div class="services-info">
                    <i class="flaticon-social"></i>
                    <h5>Share House</h5>
                    <p>
                    	他の人と一緒に生活します。<br>
                    	シェアハウス。
                    </p>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 wow fadeInRight delay-04s">
                <div class="services-info">
                    <i class="flaticon-symbol"></i>
                    <h5>One Room</h5>
                    <p>
                    	一人暮らしに最適です。<br>
                    	ワンルーム。
                    </p>
                </div>
            </div>
            <div class="col-lg-12 text-center mt-20">
                <!-- <a href="#" class="btn button-md button-theme text-center">Read More</a> -->
            </div>
        </div>
    </div>
</div>
<!-- Services end -->

<!-- Recently properties start -->
<!-- <div class="mb-70 recently-properties">
    <div class="container">
        Main title
        <div class="main-title">
            <h1>Featured Properties</h1>
        </div>
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6 wow fadeInLeft delay-04s">
                <div class="property">
                    <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 col-pad">
                        Property img
                        <div class="property-img">
                            <div class="property-tag button alt featured">Featured</div>
                            <div class="property-price">$150,000</div>
                            <img src="http://placehold.it/231x220" alt="fp-list" class="img-responsive hp-2">
                            <div class="property-overlay">
                                <a href="properties-details.html" class="overlay-link">
                                    <i class="fa fa-link"></i>
                                </a>
                                <a class="overlay-link property-video" title="Lexus GS F">
                                    <i class="fa fa-video-camera"></i>
                                </a>
                                <div class="property-magnify-gallery">
                                    <a href="http://placehold.it/750x540" class="overlay-link">
                                        <i class="fa fa-expand"></i>
                                    </a>
                                    <a href="http://placehold.it/750x540" class="hidden"></a>
                                    <a href="http://placehold.it/750x540" class="hidden"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 property-content ">
                        title
                        <h1 class="title">
                            <a href="properties-details.html">Beautiful Single Home</a>
                        </h1>
                        Property address
                        <h3 class="property-address">
                            <a href="properties-details.html">
                                <i class="fa fa-map-marker"></i>123 Kathal St. Tampa City,
                            </a>
                        </h3>
                        Facilities List
                        <ul class="facilities-list fl-2 clearfix">
                            <li>
                                <i class="flaticon-square-layouting-with-black-square-in-east-area"></i>
                                <span>4800 sq ft</span>
                            </li>
                            <li>
                                <i class="flaticon-bed"></i>
                                <span>3 Bedrooms</span>
                            </li>
                            <li>
                                <i class="flaticon-holidays"></i>
                                <span>2 Bathrooms</span>
                            </li>
                            <li>
                                <i class="flaticon-vehicle"></i>
                                <span>1 Garage </span>
                            </li>
                        </ul>
                        Property footer
                        <div class="property-footer">
                            <span class="left">
                                <a href="#"><i class="fa fa-user"></i>Jhon Doe</a>
                            </span>
                            <span class="right">
                                    <i class="fa fa-calendar"></i>5 Days ago
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6 wow fadeInRight delay-04s">
                <div class="property">
                    <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 col-pad">
                        Property img
                        <div class="property-img">
                            <div class="property-tag button alt featured">Featured</div>
                            <div class="property-price">$150,000</div>
                            <img src="http://placehold.it/231x220" alt="fp-list" class="img-responsive hp-2">
                            <div class="property-overlay">
                                <a href="properties-details.html" class="overlay-link">
                                    <i class="fa fa-link"></i>
                                </a>
                                <a class="overlay-link property-video" title="Lexus GS F">
                                    <i class="fa fa-video-camera"></i>
                                </a>
                                <div class="property-magnify-gallery">
                                    <a href="http://placehold.it/750x540" class="overlay-link">
                                        <i class="fa fa-expand"></i>
                                    </a>
                                    <a href="http://placehold.it/750x540" class="hidden"></a>
                                    <a href="http://placehold.it/750x540" class="hidden"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 property-content ">
                        title
                        <h1 class="title">
                            <a href="properties-details.html">Beautiful Single Home</a>
                        </h1>
                        Property address
                        <h3 class="property-address">
                            <a href="properties-details.html">
                                <i class="fa fa-map-marker"></i>123 Kathal St. Tampa City,
                            </a>
                        </h3>
                        Facilities List
                        <ul class="facilities-list fl-2 clearfix">
                            <li>
                                <i class="flaticon-square-layouting-with-black-square-in-east-area"></i>
                                <span>4800 sq ft</span>
                            </li>
                            <li>
                                <i class="flaticon-bed"></i>
                                <span>3 Bedrooms</span>
                            </li>
                            <li>
                                <i class="flaticon-holidays"></i>
                                <span>2 Bathrooms</span>
                            </li>
                            <li>
                                <i class="flaticon-vehicle"></i>
                                <span>1 Garage </span>
                            </li>
                        </ul>
                        Property footer
                        <div class="property-footer">
                            <span class="left">
                                <a href="#"><i class="fa fa-user"></i>Jhon Doe</a>
                            </span>
                            <span class="right">
                                    <i class="fa fa-calendar"></i>5 Days ago
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> -->
<!-- Partners block end -->

<div class="clearfix"></div>
<!-- Categories strat -->
<div class="categories">
    <div class="container">
        <!-- Main title -->
        <div class="main-title">
              <h1>Popular Places</h1>
        </div>
        <div class="clearfix"></div>
        <div class="row wow">
            <div class="col-lg-5 col-md-5 col-sm-12 col-pad wow fadeInRight delay-04s">
                <div class="category">
                    <div class="category_bg_box category_long_bg cat-4-bg" style="background-image: url(http:/GomBang/img/${popularlista.saveName})">
                    <%--   <img src="/GomBang/img/${popularlist.saveName}"class="category-img" alt="..."> --%>
                        <div class="category-overlay" >
                            <div class="category-content" >
                                <div class="category-subtitle">${popularlista.forSale_Status}</div>
                                <h3 class="category-title"><a href="customerItemDetail?forSale_Seq=${popularlista.forSale_Seq}">${popularlista.forSale_Title}</a></h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-7 col-md-7 col-sm-12">
                <div class="row">
                    <div class="col-sm-6 col-pad wow fadeInLeft delay-04s">
                        <div class="category">
                            <div class="category_bg_box cat-1-bg"  style="background-image: url(http:/GomBang/img/${popularlistb.saveName})">
                                <div class="category-overlay">
                                    <div class="category-content">
                                        <div class="category-subtitle">${popularlistb.forSale_Status}</div>
                                        <h3 class="category-title">
                                            <a href="customerItemDetail?forSale_Seq=${popularlistb.forSale_Seq}">${popularlistb.forSale_Title}</a>
                                        </h3>
                                    </div><!-- /.category-content -->
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-pad wow fadeInLeft delay-04s">
                        <div class="category">
                            <div class="category_bg_box cat-2-bg"  style="background-image: url(http:/GomBang/img/${popularlistc.saveName})">
                                <div class="category-overlay">
                                    <div class="category-content">
                                        <div class="category-subtitle">${popularlistc.forSale_Status}</div>
                                        <h3 class="category-title">
                                            <a href="customerItemDetail?forSale_Seq=${popularlistc.forSale_Seq}">${popularlistc.forSale_Title}</a>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-12 col-pad wow fadeInUp delay-04s">
                        <div class="category">
                            <div class="category_bg_box cat-3-bg"  style="background-image: url(http:/GomBang/img/${popularlistd.saveName})">
                                <div class="category-overlay">
                                    <div class="category-content">
                                        <div class="category-subtitle">${popularlistd.forSale_Status}</div>
                                        <h3 class="category-title"><a href="customerItemDetail?forSale_Seq=${popularlistd.forSale_Seq}">${popularlistd.forSale_Title}</a></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Categories end-->

<!-- Pricing tables 2 start -->
<!-- <div class="pricing-tables-2 mb-70">
    <div class="container">
        <div class="main-title">
            <h1>Pricing Tables</h1>
        </div>
        <div class="row wow fadeInUp delay-04s">
            <div class="col-lg-4 col-md-4">
                <div class="pricing-2">
                    <div class="title">Basic Plan</div>
                    <div class="price-for-user">
                        <div class="price"><sup>$</sup><span class="dolar">54</span><small class="month">per month</small></div>
                    </div>
                    <div class="content">
                        <ul>
                            <li>20 Projects</li>
                            <li>32GB Storage</li>
                            <li>50 Email Accounts</li>
                            <li>12GB Bandwidth</li>
                            <li>32GB Storage</li>
                        </ul>
                    </div>
                    <div class="button"><a href="#" class="btn btn-outline pricing-btn">Get started</a></div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4">
                <div class="pricing-2">
                    <div class="title">Professional</div>
                    <div class="price-for-user">
                        <div class="price"><sup>$</sup><span class="dolar">35</span><small class="month">per month</small></div>
                    </div>
                    <div class="content">
                        <ul>
                            <li>20 Projects</li>
                            <li>32GB Storage</li>
                            <li>50 Email Accounts</li>
                            <li>12GB Bandwidth</li>
                            <li>32GB Storage</li>
                        </ul>
                    </div>
                    <div class="button"><a href="#" class="btn button-theme pricing-btn">Get started</a></div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4">
                <div class="pricing-2">
                    <div class="title">Exclusive</div>
                    <div class="price-for-user">
                        <div class="price"><sup>$</sup><span class="dolar">38</span><small class="month">per month</small></div>
                    </div>
                    <div class="content">
                        <ul>
                            <li>20 Projects</li>
                            <li>32GB Storage</li>
                            <li>50 Email Accounts</li>
                            <li>12GB Bandwidth</li>
                            <li>32GB Storage</li>
                        </ul>
                    </div>
                    <div class="button"><a href="#" class="btn btn-outline pricing-btn">Get started</a></div>
                </div>
            </div>
        </div>
    </div>
</div> -->
<!-- Pricing tables 2 end -->

<!-- Testimonials 2 -->
<div class="testimonials-2">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <div class="sec-title-three">
                        <h4>Happy Programmer</h4>
                        <h2>GomBang Project</h2>
                        <div class="text">
                        	4人1チームでつくりだした、<br>
                        	日本へ行く韓国人向けの不動産サイト！
                        </div>
                    </div>
                </div>
            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                <div id="carouse3-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item content clearfix">
                            <div class="col-lg-4 col-md-5 col-sm-5 col-xs-12">
                                <div class="avatar">
                                    <img src="/GomBang/img/심진용.jpg" alt="avatar-1" class="img-responsive">
                                </div>
                            </div>
                            <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
                                <div class="text">
                                		SCITMASTER36期 シム　ジンヨン<br>
                                    	チームリーダー。<br>
                                </div>
                                <div class="author-name">
                                    JINYONG SIM
                                </div>
                                <ul class="rating">
                                    <li>
                                        <i class="fa fa-star"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star"></i>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="item content active clearfix">
                            <div class="col-lg-4 col-md-5 col-sm-5 col-xs-12">
                                <div class="avatar">
                                    <img src="/GomBang/img/KakaoTalk_20190420_200626848.jpg" alt="avatar-2" class="img-responsive">
                                </div>
                            </div>
                            <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
                                <div class="text">
                                	SCITMASTER36期 キム　ギョンホ<br>
                                	チームメンバー。<br>
                                </div>
                                <div class="author-name">
                                     KYEONGHO KIM
                                </div>
                                <ul class="rating">
                                    <li>
                                        <i class="fa fa-star"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star"></i>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="item content clearfix">
                            <div class="col-lg-4 col-md-5 col-sm-5 col-xs-12">
                                <div class="avatar">
                                    <img src="/GomBang/img/KakaoTalk_20190420_200635259.jpg" alt="avatar-3" class="img-responsive">
                                </div>
                            </div>
                            <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
                                <div class="text">
                                	SCITMASTER36期 キム　ムンスン<br>
                                	チームメンバー。<br>
                                </div>
                                <div class="author-name">
                                    MUNSEUNG KIM
                                </div>
                                <ul class="rating">
                                    <li>
                                        <i class="fa fa-star"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star-half-full"></i>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="item content clearfix">
                            <div class="col-lg-4 col-md-5 col-sm-5 col-xs-12">
                                <div class="avatar">
                                    <img src="/GomBang/img/KakaoTalk_20190421_001308220.jpg" alt="avatar-4" class="img-responsive">
                                </div>
                            </div>
                            <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12 ">
                                 <div class="text">
                                	SCITMASTER36期 ジョンヨンジュンン<br>
                                	チームメンバー。<br>
                                </div>
                                <div class="author-name">
                                    YOUNJUN JUNG
                                </div>
                                <ul class="rating">
                                    <li>
                                        <i class="fa fa-star"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star"></i>
                                    </li>
                                    <li>
                                        <i class="fa fa-star-half-full"></i>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- Controls -->
                    <a class="left carousel-control" href="#carouse3-example-generic" role="button" data-slide="prev">
                        <span class="slider-mover-left t-slider-l" aria-hidden="true">
                            <i class="fa fa-angle-left"></i>
                        </span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carouse3-example-generic" role="button" data-slide="next">
                        <span class="slider-mover-right t-slider-r" aria-hidden="true">
                            <i class="fa fa-angle-right"></i>
                        </span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Testimonial 2 end -->
<div class="clearfix"></div>

<!-- Intro section strat -->
<div class="intro-section">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-3 col-xs-12">
                <!-- <img src="resources/user/img/logos/logo-2.png" alt="logo-2"> -->
            </div>
            <div class="col-md-7 col-sm-6 col-xs-12">
                <h3>Looking To Sell Or Rent Your Property?</h3>
            </div>
            <div class="col-md-2 col-sm-3 col-xs-12">
                <a href="submitProperty" class="btn button-md button-theme">Submit Now</a>
            </div>
        </div>
    </div>
</div>
<!-- Intro section end -->

<!-- Footer 시작 ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ-->

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
                            SCITMASTERS, 36rd C class Group no.3,
                        </p>
                        <ul class="personal-info">
                            <li>
                                <i class="fa fa-map-marker"></i>
                                Address: コエックス四階 SCIT教育センター
                            </li>
                            <li>
                                <i class="fa fa-envelope"></i>
                                Email:<a href="sjydiablo@naver.com">sjydiablo@naver.com</a>
                            </li>
                            <li>
                                <i class="fa fa-phone"></i>
                                Phone: <a href="tel:+82-00-0000-0000">+82-00-0000-0000</a>
                            </li>
                            <li>
                                <!-- <i class="fa fa-fax"></i>
                                Fax: +55 4XX-634-7071 -->
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- <!-- Links -->
                <div class="col-lg-2 col-md-2 col-sm-6 col-xs-12">
                    <div class="footer-item">
                        <div class="main-title-2">
                            <h1>Links</h1>
                        </div>
                        <ul class="links">
                            <li>
                                <a href="goHome">Home</a>
                            </li>
                            <li>
                                <a href="goFullMap">Property-list-fullmap</a>
                            </li>
                            <li>
                                <a href="searchItem3">Advanced Search</a>
                            </li>
                            <li>
                                 <a href="goCustomerboard">Q&A</a>
                            </li>
                            <li>
                            	<a href="customerMyProfile?customer_ID=${sessionScope.customer.customer_ID }">User profile</a>
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
                         <c:forEach var="popularlist" items="${popularlist}" varStatus="status">
                        <div class="media">
                            <div class="media-left">
                                <img class="media-object" src="/GomBang/img/${popularlist.saveName}" alt="small-properties-1" class="img-responsive hidden-xs" style="width: 90px; height: 63px;">
                            </div>
                            <div class="media-body">
                                <h3 class="media-heading">
                                    <a href="customerItemDetail?forSale_Seq=${popularlist.forSale_Seq}">${popularlist.forSale_Title}</a>
                                </h3>
                                <p>${popularlist.forSale_Indate}</p>
                                <div class="price">
                                   ${popularlist.forSale_Rent}
                                </div>
                            </div>
                        </div>
                       <!--  <div class="media">
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
                        </div> -->
                        </c:forEach>
                    </div>
                </div>
                <!-- Subscribe -->
                <!-- <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
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
                </div> -->
            </div>
        </div>
    </div>
</footer>
<!-- Footer end -->

<!-- Footer 끝 ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ-->

<!-- Copy right start -->
<div class="copy-right">
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-8 col-sm-12">
                &copy;  2019 <a href="http://themevessel.com/" target="_blank"></a>.  SCITMASTERS, 36rd C class Group no.3,
            </div>
            <div class="col-md-4 col-sm-12">
                <ul class="social-list clearfix">
                    <!-- <li>
                        <a href="https://www.facebook.com/profile.php?id=100008832071756" class="facebook">
                            <i class="fa fa-facebook"></i>
                        </a>
                    </li>
                    <li>
                        <a href="https://twitter.com/SimJinyong?lang=ko" class="twitter">
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
                    </li> -->
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
                                        <iframe class="modalIframe" src="https://www.youtube.com/embed/5e0LxrLSzok" allowfullscreen></iframe><!-- 유튜브 -->
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

</body>
</html>