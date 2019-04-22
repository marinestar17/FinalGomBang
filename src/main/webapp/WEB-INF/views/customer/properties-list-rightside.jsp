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
    <!-- <link rel="stylesheet" type="text/css" href="css/ie10-viewport-bug-workaround.css"> -->

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script type="text/javascript" src="js/ie8-responsive-file-warning.js"></script><![endif]-->
    <!-- <script src="resources/user/js/ie-emulation-modes-warning.js"></script> -->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="js/html5shiv.min.js"></script>
    <script type="text/javascript" src="js/respond.min.js"></script>
    <![endif]-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="resources/user/js/geoapi.js"></script>
    <script>
    var Seq ="";
    	$(function(){
    		$(".overlay-link").on("click",showThreeImg);
    		$("#searchButton").on("click",searchItem);
    		/* $( "#geoapi-prefectures" ).addClass( "selectpicker search-fields" ); // css의 시점 문제를 해결
    		$( "#geoapi-cities" ).addClass( "selectpicker search-fields" );  // css의 시점 문제를 해결 */ 
    		var selectedGeoapi_prefectures = $("#selectedGeoapi_prefectures").val();
    		var selectedGeoapi_cities = $("#selectedGeoapi_cities").val();
    		var selectedGeoapi_towns = $("#selectedGeoapi_towns").val();
    		//console.log(selectedGeoapi_towns+"//"+selectedGeoapi_cities);
    		/* setTimeout(function(){ 
    			$("#geoapi-prefectures").val(selectedGeoapi_prefectures); */
    			/* $("#geoapi-cities").val(selectedGeoapi_cities);
    			$("#geoapi_towns").val(selectedGeoapi_towns); */
    			/*  $.getJSON(geoapi_url, { "method": "getCities", "prefecture": selectedGeoapi_prefectures }, setCities);
    			 setTimeout(function(){ 

       			 $("#geoapi-cities").val(selectedGeoapi_cities);
    			},200); 
    		}, 900); */
    		
    		/*  var id = document.getElementsByClassName("imglist");
    		
    		
    		if (id.length > 0) {
    				for(var i=0;i<id.length;i++){
    					var imgcont="";
    					imgcont+='<a href="/GomBang/img/'+id[i].value+'" class="overlay-link"><i class="fa fa-expand"></i></a>';
    					$("#imgGal"+id[i].value).append(imgcont); 
    				}
    		} */
    		var imgArray=[];
    		var counter=0;
    		$( ".imglist" ).each(function( index,item ) {
    			
    			if(jQuery.inArray($(this).attr("data-seq"),imgArray)<0){
    				imgArray[counter++]=$(this).attr("data-seq");
    				var imgcont="";
    				imgcont='<a href="/GomBang/img/'+item.value+'" class="overlay-link"><i class="fa fa-expand"></i></a>';
    				$("#imgGal"+$(this).attr("data-seq")).append(imgcont);
    			}else{
    				var imgcont="";
    				imgcont='<a style="display:none" href="/GomBang/img/'+item.value+'" class="overlay-link"><i class="fa fa-expand"></i></a>';
    				$("#imgGal"+$(this).attr("data-seq")).append(imgcont);
    			}
    			
    			 
    		});
    		
    		
    		
    	});
    	function searchItem(){/* 
    		$("#searchItemForm").submit();
    		 */
    		
    		$.ajax({
    			url:"searchItem2",
    			data:{
    				forSale_Status:$( "#selectOptionStatus option:selected" ).text(),
    				forSale_HouseType:$( "#selectHouseType option:selected" ).text(),
    				geoapi_prefectures:$( "#geoapi-prefectures option:selected" ).text(),
    				geoapi_cities:$( "#geoapi-cities option:selected" ).text(), 
    				geoapi_towns:$( "#geoapi-towns option:selected" ).text(),
    				min_distance:$("input[name=min_distance]").val(),
    				max_distance:$("input[name=max_distance]").val(),
    				max_price:$("input[name=max_price]").val(),
    				min_price:$("input[name=min_price]").val(),
    				forSale_OptionA:$('input[name=forSale_OptionA]:checked').val(),
    				
    				forSale_OptionB:$('input[name=forSale_OptionB]:checked').val(),
    				forSale_OptionC:$('input[name=forSale_OptionC]:checked').val(),
    				forSale_OptionD:$('input[name=forSale_OptionD]:checked').val(),
    				forSale_OptionE:$('input[name=forSale_OptionE]:checked').val(),
    				forSale_OptionF:$('input[name=forSale_OptionF]:checked').val()
    			},
    			type:"get",
    			success:function(jsp){
    				$("#lotInfo").html(jsp);
    			}
    		});
    	}
    	
    	function showThreeImg(){
    		Seq = $(this).attr("data-Seq");
    		$.ajax({
    			url:"detailImg",
    			data:{forSale_Seq:Seq},
    			type:"get",
    			success:function(list){
    				//console.log(list);
    				var content = "";
    				$.each(list,function(index,item){
    					//console.log(item.saveName);
    					content += '<a href="/GomBang/img/'+item.saveName+'" class="hidden"></a>'
    				});
    				//$(".property-magnify-gallery").html("");
    			}
    		});
    	}
    	
    	/* function geoApiChangePrefecture () {
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
			content+='<select style="color: #999;"id="geoapi-cities" name="geoapi_cities" data-live-search="true" data-live-search-placeholder="Search value" >';
			content+='<option style="color: #95c41f;" value="市区町村名を選択してください" >市区町村名を選択してください</option>';
			content+='</select>';
			$( "#geoapi-cities" ).addClass( "selectpicker search-fields" );
			 $("#cities").html(content);
			 for (var index = 0; index < cities.length; index++) {
 		        var option = $(document.createElement('option'));
 		        option.text(cities[index].city);
 		        option.val(cities[index].city);
 		        option.css("color","#95c41f");
 		        $('#geoapi-cities').append(option);
 		    }
 		    $("#geoapi-cities").change(searchAddress);
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
					
					postCodeList+="<option value='町を選択してください。' class='postcode' style='color: #95c41f;'>町を選択してください。</option>";
					$.each(res.data,function(index,item){
						//postCodeList+="<option class='postcode' data-town='"+ item.town+"' data-code='"+item.postcode+"'>"+item.postcode+" "+item.town"</option>";
						if(item.town!=""){
							postCodeList+="<option class='postcode' data-town='"+ item.town+"' data-code='"+item.postcode+"' style='color: #95c41f;'>"+item.town+"</option>";
						}
					})
					//$("#geoapi_towns").change(selectPostCode);
					$("#geoapi_towns").html(postCodeList);
					
				}
			});
		} */
    </script>
    <style>
    #geoapi-prefectures{
    	width:100%;
    	color: #999;
		height:44px;
		border: 1px solid #e0e0e0;
		display:block;
    }
    #geoapi-cities{
		width:100%;
		color: #999;
		height:44px;
		border: 1px solid #e0e0e0;
		display:block;
	}
	#geoapi-towns{
		width:100%;
		height:44px;
		border: 1px solid #e0e0e0;
		color: #999;
		display:block;

	}
    </style>
</head>
<body>
<c:forEach items="${threeImgList}" var="imgs">
	<c:forEach items="${imgs}" var="img">
       <input type="hidden" class="imglist" value="${img.saveName}" data-seq="${img.forSale_Seq}">
	</c:forEach>
</c:forEach>

<div class="page_loader"></div>

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
                    <li class="dropdown">
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
                    <li class="dropdown active">
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
                    
                    <li class="dropdown">
                        <a tabindex="0" data-toggle="dropdown" data-submenu="" aria-expanded="false">
                            User<span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="customerMyProfile?customer_ID=${sessionScope.customer.customer_ID }">User profile</a></li>
                        </ul>
                    </li>
                    
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

<!-- Sub banner start -->
<div class="sub-banner overview-bgi">
    <div class="overlay">
        <div class="container">
            <div class="breadcrumb-area">
                <h1>Advanced Search</h1>
                <ul class="breadcrumbs">
                    <li><a href="goHome"></a></li>
                    <li class="active">Advanced Search</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- Sub Banner end -->

<!-- Properties section body start -->
<div class="properties-section-body content-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-8 col-xs-12">
                <!-- Option bar start -->
                <div class="option-bar">
                    <div class="row">
                        <div class="col-lg-6 col-md-5 col-sm-5 col-xs-2">
                            <h4>
                                <span class="heading-icon">
                                    <i class="fa fa-th-list"></i>
                                </span>
                                <span class="hidden-xs">Properties List</span>
                            </h4>
                        </div>
                        <div class="col-lg-6 col-md-7 col-sm-7 col-xs-10 cod-pad">
                            <!-- <div class="sorting-options">
                                <select class="sorting">
                                    <option>New To Old</option>
                                    <option>Old To New</option>
                                    <option>Properties (High To Low)</option>
                                    <option>Properties (Low To High)</option>
                                </select>
                                <a href="properties-list-rightside.html" class="change-view-btn active-view-btn"><i class="fa fa-th-list"></i></a>
                                <a href="properties-grid-rightside.html" class="change-view-btn"><i class="fa fa-th-large"></i></a>
                            </div> -->
                        </div>
                    </div>
                </div>
                <!-- Option bar end -->

                <div class="clearfix"></div>
                <!-- 이전 검색 조건을 가져오기 위한 히든값들 -->
                <input type="hidden" id="selectedStatus" value="${PreviousSearchItem.forSale_Status }">
                <input type="hidden" id="selectedHouseType" value="${PreviousSearchItem.forSale_HouseType }">
                <input type="hidden" id="selectedGeoapi_prefectures" value="${PreviousSearchItem.geoapi_prefectures }">
                <input type="hidden" id="selectedGeoapi_towns" value="${PreviousSearchItem.geoapi_towns }">
                <input type="hidden" id="selectedGeoapi_cities" value="${PreviousSearchItem.geoapi_cities }">
                <input type="hidden" id="selectedMin_distance" value="${PreviousSearchItem.min_distance }">
                <input type="hidden" id="selectedMax_distance" value="${PreviousSearchItem.max_distance }">
                <input type="hidden" id="selectedMin_price" value="${PreviousSearchItem.min_price }">
                <input type="hidden" id="selectedMax_price" value="${PreviousSearchItem.max_price }">
                <!-- 시작 -->
                <!-- Property start -->
                <div id="lotInfo">
                <c:forEach var="searchItemList" items="${searchItemList }" varStatus="status">
                
                <div class="property clearfix wow fadeInUp delay-03s">
                    <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 col-pad">
                        <!-- Property img -->
                        <div class="property-img">
                            <div class="property-tag button alt featured">${searchItemList.forSale_HouseType }</div>
                            <c:if test="${searchItemList.forSale_Status=='For Sale' }">
                            <div class="property-tag button sale">For Sale</div>
                            </c:if>
                            <c:if test="${searchItemList.forSale_Status=='For Rent' }">
                            <div class="property-tag button sale">For Rent</div>
                            </c:if>
                            <div class="property-price">${searchItemList.forSale_Rent }</div>
                            <img src="/GomBang/img/${searchImgList[status.count-1].saveName }" alt="fp-list" class="img-responsive hp-1">
                            <div class="property-overlay">
                                <a href="customerItemDetail?forSale_Seq=${searchItemList.forSale_Seq }" class="overlay-link">
                                    <i class="fa fa-link"></i>
                                </a>
                                <a class="overlay-link property-video" title="Lexus GS F">
                                    <i class="fa fa-video-camera"></i>
                                </a>
                                <div class="property-magnify-gallery" id="imgGal${searchItemList.forSale_Seq}">
                                	<!-- 이미지 파일 없을시 오류나는거 해결해야 한다. -->
                                    <%-- <a href="/GomBang/img/${searchImgList[status.count-1].saveName }" class="overlay-link" data-seq="${searchItemList.forSale_Seq }">
                                        <i class="fa fa-expand"></i>
                                    </a> --%>
                                    <%-- <a href="/GomBang/img/${searchImgList[1].saveName }" class="hidden"></a>
                                    <a href="/GomBang/img/${searchImgList[2].saveName }" class="hidden"></a> --%>
                                    <input type="hidden" id="test22" value="${threeImgList}">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12 property-content ">
                        <!-- title -->
                        <h1 class="title">
                            <a href="customerItemDetail?forSale_Seq=${searchItemList.forSale_Seq }">${searchItemList.forSale_Title}</a>
                        </h1>
                        <!-- Property address -->
                        <h3 class="property-address">
                            <a href="customerItemDetail?forSale_Seq=${searchItemList.forSale_Seq }">
                                <i class="fa fa-map-marker"></i>${searchItemList.geoapi_prefectures} ${searchItemList.geoapi_cities} ${searchItemList.geoapi_towns} ${searchItemList.geoapi_remain}
                            	<br>
                            	<i class="fa fa-train"></i>${searchItemList.forSale_SubwayDistance2 }
                            </a>
                        </h3>
                        
                        <!-- Facilities List -->
                        <ul class="facilities-list clearfix">
                            <c:forEach var="optionList" items="${optionList[status.count-1]}" varStatus="num">
                            
                            <li>
                                <i class="fa fa-check-square"></i>
                                <span>${optionList }</span>
                            </li>
                            </c:forEach>
                            <!-- <li>
                                <i class="flaticon-bed"></i>
                                <span>3 Beds</span>
                            </li>
                            <li>
                                <i class="flaticon-monitor"></i>
                                <span>TV </span>
                            </li>
                            <li>
                                <i class="flaticon-holidays"></i>
                                <span> 2 Baths</span>
                            </li>
                            <li>
                                <i class="flaticon-vehicle"></i>
                                <span>1 Garage</span>
                            </li>
                            <li>
                                <i class="flaticon-building"></i>
                                <span> 3 Balcony</span>
                            </li> -->
                        </ul>
                        <!-- Property footer -->
                        <div class="property-footer">
                            <span class="left">
                                <a href="#"><i class="fa fa-user"></i>${searchItemList.enterprise_ID}</a>
                            </span>
                            <span class="right">
                                <i class="fa fa-calendar"></i>${searchItemList.forSale_Indate } Days ago
                            </span>
                        </div>
                    </div>
                </div>
                </c:forEach>
                <!-- Property end -->
			</div>
                <!-- Page navigation start -->
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li>
                            <a href="properties-list-leftside.html" aria-label="Previous">
                                <span aria-hidden="true">«</span>
                            </a>
                        </li>
                        <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                        <li><a href="properties-list-leftside.html">2</a></li>
                        <li><a href="properties-list-fullwidth.html">3</a></li>
                        <li>
                            <a href="properties-list-fullwidth.html" aria-label="Next">
                                <span aria-hidden="true">»</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                <!-- Page navigation end-->
            </div>

            <div class="col-lg-4 col-md-4 col-xs-12">
                <!-- Search contents sidebar start -->
                <div class="sidebar-widget">
                    <div class="main-title-2">
                        <h1><span>Advanced</span> Search</h1>
                    </div>

                    <form method="GET" id="searchItemForm" action="searchItem" >
                        <div class="form-group">
                            <select id="selectOptionStatus" class="selectpicker search-fields" name="forSale_Status" data-live-search="true" data-live-search-placeholder="Search value">
                                <option>Property Status</option>
                                <option>For Sale</option>
                                <option>For Rent</option>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <select id="selectHouseType" class="selectpicker search-fields" name="forSale_HouseType" data-live-search="true" data-live-search-placeholder="Search value" >
                                <option>Property Types</option>
                                <option>Apartment</option>
                                <option>Mansion</option>
                                <option>Share House</option>
                                <option>One Room</option>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <select id="geoapi-prefectures" name="geoapi_prefectures" class="test1">
  								<option value="都道府県を選択してください">都道府県を選択してください</option>
							</select>
                        </div>

                        <div class="form-group" id="cities">
                            <select id="geoapi-cities" name="geoapi_cities" >
  								<option value="市区町村名を選択してください">市区町村名を選択してください</option>
							</select>
                        </div>
                        
                        <div class="form-group">
                            <select id="geoapi-towns" class="input-text" name="geoapi_towns">
                            	<option value="市町を選択してください">町を選択してください</option>
                            </select>
                        </div>


                        <div class="range-slider">
                            <label>For Train</label>
                            <div data-min="0" data-max="2000" data-unit="M" data-min-name="min_distance" data-max-name="max_distance" class="range-slider-ui ui-slider" aria-disabled="false"></div>
                            <div class="clearfix"></div>
                        </div>

                        <div class="range-slider">
                            <label>Price</label>
                            <div data-min="0" data-max="300000" data-unit="엔화" data-min-name="min_price" data-max-name="max_price" class="range-slider-ui ui-slider" aria-disabled="false"></div>
                            <div class="clearfix"></div>
                        </div>

                        <a class="show-more-options" data-toggle="collapse" data-target="#options-content">
                            <i class="fa fa-plus-circle"></i> Show More Options
                        </a>
                        <div id="options-content" class="collapse">
                            <label class="margin-t-10">Features</label>
                            <div class="checkbox checkbox-theme checkbox-circle">
                                <input id="checkbox1" class="forSale_Option" type="checkbox" name="forSale_OptionA" value="에어컨">
                                <label for="checkbox1">
                                    	에어컨
                                </label>
                            </div>
                            <div class="checkbox checkbox-theme checkbox-circle">
                                <input id="checkbox2" class="forSale_Option" type="checkbox" name="forSale_OptionB" value="세탁기">
                                <label for="checkbox2">
                                    	세탁기
                                </label>
                            </div>
                            <div class="checkbox checkbox-theme checkbox-circle">
                                <input id="checkbox3" class="forSale_Option" type="checkbox" name="forSale_OptionC" value="베란다">
                                <label for="checkbox3">
                                    	베란다
                                </label>
                            </div>
                            <div class="checkbox checkbox-theme checkbox-circle">
                                <input id="checkbox4" class="forSale_Option" type="checkbox" name="forSale_OptionD" value="엘리베이터">
                                <label for="checkbox4">
                                    	엘리베이터
                                </label>
                            </div>
                            <div class="checkbox checkbox-theme checkbox-circle">
                                <input id="checkbox5" class="forSale_Option" type="checkbox" name="forSale_OptionE" value="흡연장">
                                <label for="checkbox5">
                                    	흡연장
                                </label>
                            </div>
                            <div class="checkbox checkbox-theme checkbox-circle">
                                <input id="checkbox6" class="forSale_Option" type="checkbox" name="forSale_OptionF" value="주차장">
                                <label for="checkbox6">
                                   	 주차장
                                </label>
                            </div>
                        </div>

                        <div class="form-group mb-0">
                            <button type="button" class="search-button" id="searchButton">Search</button>
                        </div>
                    </form>
                </div>

                <!-- Category posts start -->
                <!-- <div class="sidebar-widget category-posts">
                    <div class="main-title-2">
                        <h1><span>popular</span> Category</h1>
                    </div>
                    <ul class="list-unstyled list-cat">
                        <li><a href="#">Single Family </a> <span>(45)  </span></li>
                        <li><a href="#">Apartment  </a> <span>(21)  </span></li>
                        <li><a href="#">Condo </a> <span>(23)  </span></li>
                        <li><a href="#">Multi Family </a> <span>(19)  </span></li>
                        <li><a href="#">Villa </a> <span>(19)  </span></li>
                        <li><a href="#">Other  </a> <span>(22)  </span></li>
                    </ul>
                </div> -->

                <!-- Popular posts start -->
                <!-- <div class="sidebar-widget popular-posts">
                    <div class="main-title-2">
                        <h1><span>Recent</span> Properties</h1>
                    </div>
                    <div class="media">
                        <div class="media-left">
                            <img class="media-object" src="http://placehold.it/90x63" alt="small-properties-1">
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
                </div> -->

                <!-- Helping box Start -->
                <!-- <div class="sidebar-widget helping-box clearfix">
                    <div class="main-title-2">
                        <h1><span>Helping</span> Center</h1>
                    </div>
                    <div class="helping-center">
                        <div class="icon"><i class="fa fa-map-marker"></i></div>
                        <h4>Address</h4>
                        <p>123 Kathal St. Tampa City,</p>
                    </div>
                    <div class="helping-center">
                        <div class="icon"><i class="fa fa-phone"></i></div>
                        <h4>Phone</h4>
                        <p><a href="tel:+55-417-634-7071">+55 417 634 7071</a> </p>
                    </div>
                </div> -->

                <!-- Latest reviews start -->
                <!-- <div class="sidebar-widget latest-reviews mb-0">
                    <div class="main-title-2">
                        <h1><span>Latest</span> Reviews</h1>
                    </div>
                    <div class="media">
                        <div class="media-left">
                            <a href="#">
                                <img class="media-object" src="http://placehold.it/50x50" alt="avatar-1">
                            </a>
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading"><a href="#">John Antony</a></h3>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <p>Lorem ipsum dolor sit amet,
                                consectetur adipiscing elit.
                                Etiamrisus tortor, accumsan at nisi et,
                            </p>
                        </div>
                    </div>
                    <div class="media mb-0">
                        <div class="media-left">
                            <a href="#">
                                <img class="media-object" src="http://placehold.it/50x50" alt="avatar-2">
                            </a>
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading"><a href="#">Karen Paran</a></h3>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <p>Lorem ipsum dolor sit amet,
                                consectetur adipiscing elit.
                                Etiamrisus tortor, accumsan at nisi et,
                            </p>
                        </div>
                    </div>
                </div> -->
            </div>
        </div>
    </div>
</div>
<!-- Properties section body end -->

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
                                Address: 코엑스 4층 SCIT 교육센터
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
                                            <!-- <iframe class="modalIframe" src="https://www.youtube.com/embed/5e0LxrLSzok" allowfullscreen></iframe> -->
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
<script type="text/javascript">
var selectedStatus = $("#selectedStatus").val();
//$("#selectOptionStatus").val(selectedStatus);
$("#selectOptionStatus").val(selectedStatus).prop("selected", true);
var selectedHouseType = $("#selectedHouseType").val();
$("#selectHouseType").val(selectedHouseType);
/* var selectedGeoapi_prefectures = $("#selectedGeoapi_prefectures").val(); */
var selectMin_price = $("#selectedMin_price").val();
//console.log(selectMin_price);
$(".current-min").val(selectMin_price);
//console.log($("#test22").val());

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