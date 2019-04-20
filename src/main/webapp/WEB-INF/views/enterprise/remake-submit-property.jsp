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
   <!--  <script src="resources/user/js/ie-emulation-modes-warning.js"></script> -->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="js/html5shiv.min.js"></script>
    <script type="text/javascript" src="js/respond.min.js"></script>
    <![endif]-->
    
    <style>
    #geoapi-prefectures{
    	width:100%;
		height:44px;
		border: 1px solid #e0e0e0;
    }
    #geoapi-cities{
		width:100%;
		height:44px;
		border: 1px solid #e0e0e0;
	}
    </style>
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/user/js/geoapi.js"></script>
 <script src="./resources/ckeditor/ckeditor.js"></script>

<script>
	
	/* function geoApiChangePrefecture () {
		
		var content="";
		content+='<label>City</label>';
		content+='<select  id="geoapi-cities" name="geoapi-cities" data-live-search="true" data-live-search-placeholder="Search value">';
		content+='<option value="市区町村名を選択してください">市区町村名を選択してください</option>';
		content+='</select>';
		
		$("#cities").html(content);
		geoapi_prefecture_selected = $("#geoapi-prefectures option:selected");
	    geoApiInitializeCities();
	    geoApiInitializeTowns();
	    if (geoapi_prefecture_selected.val() == '市区町村名を選択してください') {
	      return;
	    }
	    $.getJSON(geoapi_url, { "method": "getCities", "prefecture": geoapi_prefecture_selected.text() }, setCities);
	    $("#geoapi-cities").css("display","block");
	    $("#geoapi-cities").css("display","initial");
	    $( "#geoapi-cities" ).addClass( "selectpicker search-fields" );
	}  */
	function geoApiChangePrefecture () {
		geoapi_prefecture_selected = $("#geoapi-prefectures option:selected");
	    geoApiInitializeCities();
	    geoApiInitializeTowns();
	    if (geoapi_prefecture_selected.val() == '都道府県を選択してください') {
	      return;
	    }
	    $.getJSON(geoapi_url, { "method": "getCities", "prefecture": geoapi_prefecture_selected.text() }, setCities);
	}
	
	
	function setCities (json) {
	    var cities = json.response['location'];
	    $("#cities").empty();
	    var content="";
		content+='<label>City</label>';
		content+='<select style="color: #999;"id="geoapi-cities" name="geoapi-cities" data-live-search="true" data-live-search-placeholder="Search value">';
		content+='<option value="市区町村名を選択してください">市区町村名を選択してください</option>';
		content+='</select>';
		$( "#geoapi-cities" ).addClass( "selectpicker search-fields" );
		$("#cities").html(content);
	    for (var index = 0; index < cities.length; index++) {
	        var option = $(document.createElement('option'));
	        option.text(cities[index].city);
	        option.val(cities[index].city);
	        $('#geoapi-cities').append(option);
	    }
	    $("#geoapi-cities").change(searchAddress);
	} 

	var myLatLng = {lat: 0, lng: 0};
	
	$(function(){
		var geoapi_prefectures = "";
		var geoapi_cities = "";
		var geoapi_towns = "";
		var geoapi_remain = "";
		var geoapi_postCode = "";
		var forSale_Subway = "";
		$("#updateItem").on("click",updateItem);		
		$("#searchAddress").on("click",searchAddress);
		$("#checkMap").on("click",codeAddress);
		ck = CKEDITOR.replace("editor", editorConfig);
		
		//$( "#geoapi-prefectures" ).addClass( "selectpicker search-fields" ); // css의 시점 문제를 해결
		$( "#geoapi-cities" ).addClass( "selectpicker search-fields" );  // css의 시점 문제를 해결 */
		//$("#geoapi-cities").css("display","block");
		/* $( "#geoapi-prefectures" ).change(function() {
			$( "#geoapi-cities" ).removeClass( "selectpicker search-fields" );
			
			setTimeout(function(){
				$( "#geoapi-cities" ).addClass( "selectpicker search-fields" );
				/* $( "#geoapi-cities" ).addClass( "selectpicker search-fields" ); */
				//style="display:block;"
				//$("#geoapi-cities").css("display","block");
			//}, 100);
			
			
			
			//}); 

		  var strMemo ="${enterItem.forSale_Option}";  //checkbox값 주려고
		    var arrMemo = strMemo.split(",");  
		   alert(arrMemo[1]);
		   for (var i = 0; i < arrMemo.length; i++) {
			   
			   if(arrMemo[i]=='에어컨'){
					 $('input:checkbox[id="checkbox1"]').attr("checked", true);
					
				}
				 if(arrMemo[i]=='엘리베이터'){
					 $('input:checkbox[id="checkbox4"]').attr("checked", true);
					 //continue;
				}
				if(arrMemo[i]=='세탁기'){
					 $('input:checkbox[id="checkbox2"]').attr("checked", true);
					// continue;
				}
				 if(arrMemo[i]=='흡연장'){
					 $('input:checkbox[id="checkbox5"]').attr("checked", true);
					 //continue;
				}
				 if(arrMemo[i]=='베란다'){
					 $('input:checkbox[id="checkbox3"]').attr("checked", true);
					// continue;
				}
				 if(arrMemo[i]=='주차장'){
					 $('input:checkbox[id="checkbox6"]').attr("checked", true);
					 //continue;
				} 
			   }
		  
	});
	
	// 매물 수정
	function updateItem(){
		geocoder = new google.maps.Geocoder();
	    //In this case it gets the address from an element on the page, but obviously you  could just pass it to the method instead
	   	geoapi_towns = $("#geoapi_towns").val();
	    geoapi_remain = $("#geoapi_remain").val();
	    // 표시되는 주소
	    var address =geoapi_prefectures + geoapi_cities + geoapi_towns + geoapi_remain;
	    geocoder.geocode( { 'address' : address }, function( results, status ) {
	        if( status == google.maps.GeocoderStatus.OK ) {
			//results[0].geometry.location.lat(), results[0].geometry.location.lng()
	            //In this case it creates a marker, but you can get the lat and lng from the location.LatLng
	           // 주소의 위도 경도 가져오기 
	          
	        myLatLng = {lat: results[0].geometry.location.lat(), lng: results[0].geometry.location.lng()};
			
			
			
			geoapi_prefectures = $("#geoapi-prefectures option:selected").val();
			$("#geoapi_prefectures").val(geoapi_prefectures);
			geoapi_cities = $("#geoapi-cities option:selected").val();
			$("#geoapi_cities").val(geoapi_cities);
			geoapi_towns = $("#geoapi_towns").val();
			geoapi_remain = $("#geoapi_remain").val();
			/* var forSale_Address = geoapi_prefectures + " " + geoapi_cities + " " + geoapi_towns + " " + geoapi_remain; */
			geoapi_postCode = $("#geoapi_postCode").val();
			var forSale_Rent = $("#forSale_Rent").val();
			var forSale_Deposit = $("#forSale_Deposit").val();
			var forSale_Reward = $("#forSale_Reward").val();
			var forSale_Option = "";
			$("input[name=forSale_Option]:checked").each(function() {
				forSale_Option += $(this).val()+" "; 
			});
			var forSale_Subway = $("#forSale_Subway").val();
			var forSale_ETC = CKEDITOR.instances.editor.getData();
			var forSale_HouseType = $("#forSale_HouseType").val();
			var forSale_Status = $("#forSale_Status option:selected").val();
			var forSale_Title = $("#forSale_Title").val();
			var forSale_ManageCost = $("#forSale_ManageCost").val();
			var forSale_Seq=$("#forSale_Seq").val();
			/* $("#forSale_Address").val(forSale_Address); */
			$("#forSale_PostCode").val(geoapi_postCode);
			$("#forSale_ETC").val(forSale_ETC);
			$("#forSale_Lat").val(myLatLng.lat);
			$("#forSale_Lng").val(myLatLng.lng);
			
			$("#updateItemForm").submit();
			
			
			
	        } else {
	            alert( 'Geocode was not successful for the following reason: ' + status );
	        }
	        
	    } );
		
	}
	
	// 주소로 우편번호 리스트 출력
	function searchAddress(){
		geoapi_prefectures = $("#geoapi-prefectures option:selected").val();
		geoapi_cities = $("#geoapi-cities option:selected").val();
		geoapi_towns = $("#geoapi_towns option:selected").val();
		var postCodeList = "";
		$.ajax({
			url:"https://apis.postcode-jp.com/api/v2/search?apiKey=ISdegT3BVbqK3v41cl1yinQOc0LfWelSsdNBPWr&q="+geoapi_prefectures+" "+geoapi_cities,
			type:"get",
			success:function(res){
				
				/* $.each(res.data,function(index,item){
					postCodeList+="<tr><td class='postcode' data-town='"+ item.town+"' data-code='"+item.postcode+"'>"+item.postcode+"<td><td>"+item.town+"</td></tr>";
				}) */
				$.each(res.data,function(index,item){
					//postCodeList+="<option class='postcode' data-town='"+ item.town+"' data-code='"+item.postcode+"'>"+item.postcode+" "+item.town"</option>";
					if(item.town!=""){
						postCodeList+="<option class='postcode' data-town='"+ item.town+"' data-code='"+item.postcode+"'>"+item.town+"</option>";
					}
				})
				
				$("#geoapi_towns").change(selectPostCode);
				$("#geoapi_towns").html(postCodeList);
				
			}
		});
	}
	// 우편번호 선택
	function selectPostCode(){
		geoapi_towns = $("#geoapi_towns option:selected").val();
		var town = $("#geoapi_towns option:selected").attr('data-town');
		var postCode = $("#geoapi_towns option:selected").attr('data-code');
		
		$("#geoapi_towns").val(town);
		$("#geoapi_postCode").val(postCode);
	}
	
	
	// 지도에 표시
	function codeAddress() {
		geocoder = new google.maps.Geocoder();
	    //In this case it gets the address from an element on the page, but obviously you  could just pass it to the method instead
	   	geoapi_towns = $("#geoapi_towns").val();
	    geoapi_remain = $("#geoapi_remain").val();
	    // 표시되는 주소
	    var address =geoapi_prefectures + geoapi_cities + geoapi_towns + geoapi_remain;
	    console.log(address);
	    geocoder.geocode( { 'address' : address }, function( results, status ) {
	        if( status == google.maps.GeocoderStatus.OK ) {
			//results[0].geometry.location.lat(), results[0].geometry.location.lng()
	            //In this case it creates a marker, but you can get the lat and lng from the location.LatLng
	           // 주소의 위도 경도 가져오기 
	          
	        myLatLng = {lat: results[0].geometry.location.lat(), lng: results[0].geometry.location.lng()};
			console.log(myLatLng);
	        // 맵에 찍기  
			var map = new google.maps.Map(document.getElementById('map'), {
	          center: myLatLng,
	          zoom: 18,
	          mapTypeId: 'roadmap'
	        });
			// 마크찍기
	          var marker = new google.maps.Marker({
		            position: myLatLng,
		            map: map,
		            title: 'Hello World!'
		          });
	        
	        } else {
	            alert( 'Geocode was not successful for the following reason: ' + status );
	        }
	        
	        var infowindow = new google.maps.InfoWindow();
	        var service = new google.maps.places.PlacesService(map);
	    } );
	}
		
	
	// ckeditor Config
	var editorConfig = {
	        filebrowserUploadUrl : "requestupload", //이미지 업로드
	    };

	    CKEDITOR.on('dialogDefinition', function( ev ){
	        var dialogName = ev.data.name;
	        var dialogDefinition = ev.data.definition;

	        switch (dialogName) {
	            case 'image': //Image Properties dialog
	            //dialogDefinition.removeContents('info');
	            dialogDefinition.removeContents('Link');
	            dialogDefinition.removeContents('advanced');
	            break;
	        }
	    });
	
	  
	    // 구글 지도
	    function initAutocomplete() {
	        var map = new google.maps.Map(document.getElementById('map'), {
	          center: {lat: 35.698390, lng: 139.773072},
	          zoom: 12,
	          mapTypeId: 'roadmap'
	        });
	      }
	    
	
	  

	   for (var i = 0; i < arrMemo.length; i++) {
		
		   if(arrMemo[i]=="에어컨"){
			   $('input:checkbox[id="checkbox1"]').attr("checked", true);
			   alert(arrMemo[i]);

		   }
	}
	   
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD16Rw_1wxr6ylwIbpNOeW76O89uhaIaz4&libraries=places&callback=initAutocomplete&libraries=places&language=ja&region=J"
         async defer></script>
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
                <a href="goHome" class="logo"> <!-- 홈페이지로 이동 -->
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
                    <li class="dropdown">
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
                    <li class="dropdown active mega-dropdown">
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
                <h1>Submit Property</h1>
                <ul class="breadcrumbs">
                    <li><a href="index.html">Home</a></li>
                    <li class="active">Submit Property</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- Sub Banner end -->

<!-- Submit Property start -->
<div class="content-area-7 submit-property">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="notification-box">
                    <h3>Don't Have an Account?</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ac tortor at tellus feugiat congue quis ut nunc. Semper ac dolor vitae accumsan.</p>
                </div>
            </div>
            <div class="col-md-12">
                <div class="submit-address">
                    <form method="GET" action="updateItem" id="updateItemForm">
                        <div class="main-title-2">
                            <h1><span>Basic</span> Information</h1>
                        </div>
                        <div class="search-contents-sidebar mb-30">
                            <div class="form-group">
                                <label>제목</label>
                                <input type="text" id="forSale_Title" class="input-text" name="forSale_Title" placeholder="Property Title" value="${enterItem.forSale_Title}">
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>Status</label>
                                        <select id="forSale_Status" class="selectpicker search-fields" name="forSale_Status">
                                            <option <c:if test="${enterItem.forSale_Status=='For Sale'}">selected</c:if>>For Sale</option>
                                            <option <c:if test="${enterItem.forSale_Status=='For Rent'}">selected</c:if>>For Rent</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>Type</label>
                                        <select id="forSale_HouseType" class="selectpicker search-fields" name="forSale_HouseType" >
                                            <option <c:if test="${enterItem.forSale_HouseType=='Apartment'}">selected</c:if>>Apartment</option>
                                            <option <c:if test="${enterItem.forSale_HouseType=='House'}">selected</c:if>>House</option>
                                            <option <c:if test="${enterItem.forSale_HouseType=='Commercial'}">selected</c:if>>Commercial</option>
                                            <option <c:if test="${enterItem.forSale_HouseType=='Garage'}">selected</c:if>>Garage</option>
                                            <option <c:if test="${enterItem.forSale_HouseType=='Lot'}">selected</c:if>>Lot</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3 col-sm-6">
                                    <div class="form-group">
                                        <label>야칭</label>
                                        <input type="text" id="forSale_Rent" class="input-text" name="forSale_Rent" placeholder="家賃" value="${enterItem.forSale_Rent}">
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-6">
                                    <div class="form-group">
                                        <label>시키킹</label>
                                        <input type="text" id="forSale_Deposit" class="input-text" name="forSale_Deposit" placeholder="敷金" value="${enterItem.forSale_Deposit}">
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-6">
                                    <div class="form-group">
                                        <label>레이킹</label>
                                        <input type="text" id="forSale_Reward" class="input-text" name="forSale_Reward" placeholder="礼金" value="${enterItem.forSale_Reward}">
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-6">
                                    <div class="form-group">
                                        <label>관리비</label>
                                        <input type="text" id="forSale_ManageCost" class="input-text" name="forSale_ManageCost" placeholder="管理費" value="${enterItem.forSale_ManageCost}">
                                    </div>
                                </div>
                            </div>
                            
                        </div>

                        <div class="main-title-2">
                            <h1><span>Property</span> Gallery</h1>
                        </div>
                        <div id="myDropZone" class="dropzone dropzone-design mb-50">
                            <div class="dz-default dz-message"><span>Drop files here to upload</span></div>
                        </div>

                        <div class="main-title-2">
                            <h1><span>Location</span></h1>
                        </div>
                        <div class="row mb-30 ">
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label>현</label>
                                     <!-- class="selectpicker search-fields"  -->
                                    <select id="geoapi-prefectures" name="geoapi_prefectures" >
  										<option value="${enterItem.geoapi_prefectures}"></option>
									</select>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group" id="cities">
                                    <label>City</label>
                                    <select id="geoapi-cities" name="geoapi_cities"  data-live-search="true" data-live-search-placeholder="Search value">
  										<option value="${enterItem.geoapi_cities}"></option>
									</select>
                                </div>
                            </div>
                            <div >
                                <div >
                                    <div id="postCodeTd"></div>
                                </div>
                            </div>
                            <!-- <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label>Postal Code</label>
                                    <input type="text" class="input-text" name="zip"  placeholder="Postal Code">
                                </div>
                            </div> -->
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label>마을</label>
                                    <select type="text" id="geoapi_towns" class="input-text" name="geoapi_towns"  placeholder="마을">
                                    	<option>선택</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label>Postal Code</label>
                                    <input type="text" id="geoapi_postCode" class="input-text" name="zip"  placeholder="우편번호">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label>나머지 주소</label>
                                    <input type="text" id="geoapi_remain" class="input-text" name="geoapi_remain"  placeholder="나머지 주소">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <!-- <input type="hidden" id="forSale_Address" name="forSale_Address" class="input-text"> -->
                                    <!-- <input type="hidden" id="geoapi_prefectures" name="geoapi_prefectures" class="input-text"> -->
                                    <input type="hidden" id="geoapi_cities" name="geoapi_cities" class="input-text">
                                    <input type="hidden" id="forSale_PostCode" name="forSale_PostCode" class="input-text">
                                    <input type="hidden" id="forSale_ETC" name="forSale_ETC" class="input-text">
                                    <input type="hidden" id="forSale_Lat" name="forSale_Lat" class="input-text" >
                                    <input type="hidden" id="forSale_Lng" name="forSale_Lng" class="input-text">
                                </div>
                            </div>
                        </div>
                        
                        <div class="row mb-30">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Check Map</label>
                                    <input type="button" id="checkMap" value="지도에서확인" >
                                   <div id="map"></div>
                                </div>
                            </div>
                        </div>

                        <div class="main-title-2">
                            <h1><span>Detailed</span> Information</h1>
                        </div>
						
                        <div class="row mb-30">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Detailed Information</label>
                                    <!-- <textarea class="input-text" name="message" placeholder="Detailed Information"></textarea> -->
                                    <textarea name="editor" id="editor" rows="10" cols="80">
                                    ${enterItem.forSale_ETC}
                                    </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-30">
                            <div class="col-lg-12">
                                <label class="margin-t-10">Features (optional)</label>
                                <div class="row">
                                    <div class="col-lg-4 col-sm-4 col-xs-12">
                                        <div class="checkbox checkbox-theme checkbox-circle">
                                         
                                            <input id="checkbox1" class="forSale_Option" type="checkbox" value="에어컨" name="forSale_Option">
                                            <label for="checkbox1">
                                                	에어컨	
                                            </label>
                                        </div>
                                        <div class="checkbox checkbox-theme checkbox-circle">
                                       
                                            <input id="checkbox2" class="forSale_Option" type="checkbox" value="세탁기" name="forSale_Option">
                                            <label for="checkbox2">
                                                	세탁기
                                            </label>
                                        </div>
                                        <div class="checkbox checkbox-theme checkbox-circle">
                                            <input id="checkbox3" class="forSale_Option" type="checkbox" value="베란다" name="forSale_Option">
                                            <label for="checkbox3">
                                                	베란다
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-sm-4 col-xs-12">
                                        <div class="checkbox checkbox-theme checkbox-circle">
                                            <input id="checkbox4" class="forSale_Option" type="checkbox" value="엘리베이터" name="forSale_Option">
                                            <label for="checkbox4">
                                                	엘리베이터
                                            </label>
                                        </div>
                                        <div class="checkbox checkbox-theme checkbox-circle">
                                            <input id="checkbox5" class="forSale_Option" type="checkbox" value="흡연장" name="forSale_Option">
                                            <label for="checkbox5">
                                                	흡연장
                                            </label>
                                        </div>
                                        <div class="checkbox checkbox-theme checkbox-circle">
                                            <input id="checkbox6" class="forSale_Option" type="checkbox" value="주차장"  name="forSale_Option">
                                            <label for="checkbox6">
                                                	주차장
                                            </label>
                                        </div>
                                        <input type="hidden" value="${enterItem.forSale_Seq}" id="forSale_Seq" name="forSale_Seq">
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="main-title-2">
                            <!-- <h1><span>Contact</span> Details</h1> -->
                        </div>
                        <div class="row">
                            <!-- <div class="col-md-4 col-sm-4">
                                <div class="form-group">
                                    <label>Name</label>
                                    <input type="text" class="input-text" name="name" placeholder="Name">
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-4">
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="email" class="input-text" name="email" placeholder="Email">
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-4">
                                <div class="form-group">
                                    <label>Phone (optional)</label>
                                    <input type="text" class="input-text" name="phone"  placeholder="Phone">
                                </div>
                            </div> -->
                            <div class="col-md-4 col-sm-4">
                                <a href="#" class="btn button-md button-theme" id="updateItem">수정</a>
                                <!-- <a href="#" class="btn button-md button-theme">Preview</a> -->
                            </div>
                            
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Submit Property end -->

<!-- Partners block start -->
<!-- <div class="partners-block">
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
</div> -->
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
<script>

</script>
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