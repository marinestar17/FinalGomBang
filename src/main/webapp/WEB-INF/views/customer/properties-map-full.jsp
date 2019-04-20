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
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<body>

<div class="page_loader"></div>

<!-- Top header start -->
<header class="top-header hidden-xs" id="top">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                <div class="list-inline">
                    <a href="tel:1-8X0-666-8X88"><i class="fa fa-phone"></i>1-8X0-666-8X88</a>
                    <a href="tel:info@themevessel.com"><i class="fa fa-envelope"></i>info@themevessel.com</a>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                <ul class="top-social-media pull-right">
                   <c:if test="${sessionScope.enterpriseLoginID==null}">
                    <li>
                        <a href="customerLogingo" class="sign-in"><i class="fa fa-sign-in"></i> Login</a>
                    </li>
                    <li>
                        <a href="customerSignupgo" class="sign-in"><i class="fa fa-user"></i> Register</a>
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
                <a href="index.html" class="logo">
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

<!-- Map content start-->
<div class="map-content content-area container-fluid">
    <div class="col-lg-12">
        <div class="row">
            <!-- <div id="map"></div> -->
            <input id="pac-input" class="controls" type="text" placeholder="Search Box" style="width:400px;">
            <div id="map"></div>
        </div>
    </div>
</div>
<!-- Map content end -->
<script>
	$(function(){
	
      });
      function initAutocomplete() {
    	  // 마크찍기
    	  $.ajax({
		  		url:"searchAllItem",
		  		type:"get",
		  		success:function(list){
		  			console.log(list);
		  			$.each(list,function(index,item){
		  				console.log(item.forSale_Seq);
		  				var contentString =
		  			        "<div class='map-properties'>" +
		  			        "<div class='map-img'>" +
		  			        "<img src='/GomBang/img/" + item.forSale_ETC + "'/>" +
		  			        "</div>" +
		  			        "<div class='map-content'>" +
		  			        "<h4><a href='properties-details.html'>" + item.forSale_Title + "</a></h4>" +
		  			        "<p class='address'> <i class='fa fa-map-marker'></i>" + item.geoapi_prefectures + " " + item.geoapi_cities + " " + item.geoapi_towns + " " + item.geoapi_remain +"</p>" +
		  			        "<h5 class='address'><i class='fa fa-money'></i> " + item.forSale_Rent + "円</h5>" +
		  			        "<div class='map-properties-btns'><a href='customerItemDetail?forSale_Seq=" + item.forSale_Seq+"' class='button-sm button-theme'>Details</a></div>" +
		  			        "</div>";
		  				var myLatLng = {lat: item.forSale_Lat, lng: item.forSale_Lng};
		  				var marker = new google.maps.Marker({
		  		            position: myLatLng,
		  		            map: map,
		  		            title: 'Hello World!'
		  		          });
		  				attachMessage(marker,contentString);
		  			});
		  		}
	 	 }); 
    	  // 맵 켜졌을때 시작지점
    	  var map = new google.maps.Map(document.getElementById('map'), {
        	center: {lat: 35.698390, lng: 139.773072},
          zoom: 16,
          mapTypeId: 'roadmap'
        });
        
    	
    	function attachMessage(marker, contentString){
    		 var infowindow = new google.maps.InfoWindow({
    	          content: contentString
    	        });
    		 marker.addListener('click', function() {
    	          infowindow.open(marker.get('map'), marker);
    	        });
    	}

        // Create the search box and link it to the UI element.
        var input = document.getElementById('pac-input');
        var searchBox = new google.maps.places.SearchBox(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

        // Bias the SearchBox results towards current map's viewport.
        map.addListener('bounds_changed', function() {
          searchBox.setBounds(map.getBounds());
        });

        var markers = [];
        // Listen for the event fired when the user selects a prediction and retrieve
        // more details for that place.
        searchBox.addListener('places_changed', function() {
          var places = searchBox.getPlaces();

          if (places.length == 0) {
            return;
          }

          // Clear out the old markers.
          markers.forEach(function(marker) {
            marker.setMap(null);
          });
          markers = [];

          // For each place, get the icon, name and location.
          var bounds = new google.maps.LatLngBounds();
          places.forEach(function(place) {
            if (!place.geometry) {
              console.log("Returned place contains no geometry");
              return;
            }
            var icon = {
              url: place.icon,
              size: new google.maps.Size(71, 71),
              origin: new google.maps.Point(0, 0),
              anchor: new google.maps.Point(17, 34),
              scaledSize: new google.maps.Size(25, 25)
            };

            // Create a marker for each place.
            markers.push(new google.maps.Marker({
              map: map,
              icon: icon,
              title: place.name,
              position: place.geometry.location
            }));
            console.log(place);
            console.log(place.geometry.viewport);
            if (place.geometry.viewport) {
              // Only geocodes have viewport.
              bounds.union(place.geometry.viewport);
            } else {
              bounds.extend(place.geometry.location);
            }
          });
          map.fitBounds(bounds);
          
        });
      }

    </script>
    
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD16Rw_1wxr6ylwIbpNOeW76O89uhaIaz4&libraries=places&callback=initAutocomplete&libraries=places&language=ja&region=J"
         async defer></script>
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
<!-- <script src="resources/user/js/maps.js"></script> -->
<script src="resources/user/js/app.js"></script>

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="resources/user/js/ie10-viewport-bug-workaround.js"></script>
<!-- Custom javascript -->
<script src="resources/user/js/ie10-viewport-bug-workaround.js"></script>

</body>
</html>



