<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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

<script>
var re_id = /^[a-z0-9]+$/;
var re_id = /^[a-z0-9]+$/;
var re_name= /^[가-힣]+$/;
var re_address= /^[가-힣0-9\s]+$/;
var re_reginum = /^[0-9]{10}$/;
var re_managerphone = /^[0-9]{10,11}$/;
var re_manageremail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

var pattern1 = /[0-9]/;
var pattern2 = /[a-zA-Z]/;
var pattern3 = /[~!@\#$%<>^&*]/;
var idFlag=false;
var checkid;

	$(function(){
		
		checkid=document.getElementById("idofCheck").value;
		/* 
		var loginId = ${sessionScope.loginId}
		
		$.ajax({
			url:"searchUpdate",
			data:{enterprise_ID:loginId},
			type:"get",
			success:function(data){
				$(id).val(data.enterprise_ID),
				$(message1).html("ID는 변경 불가합니다."),				
				$(pw).val(data.enterprise_PW),
				$(name).val(data.enterprise_Name),
				$(address).val(data.enterprise_Address),
				$(reginum).val(data.enterprise_RegiNum),
				$(managername).val(data.enterprise_ManagerName),
				$(managerphone).val(data.enterprise_ManagerPhone),
				$(manageremail).val(data.enterprise_ManagerEmail),
				$(etc).val(data.enterprise_ETC),
				$(code).val(data.enterprise_Code)
				
			}
		}); */
		
		if (checkid=="") {
			
			$("#id").on("keyup", function(){
		    	var id = $("#id").val();
				if (id=="") {
					$("#message1").html(" ");
					/* return false; */
				}
				else if (!re_id.test(id)) {
					$("#message1").html("영어와 숫자만 입력가능합니다. 띄어쓰기불가능");
					/* return false; */
				} else {
					$.ajax({
						url:"checkId",
						data:{
							id:id
							},
						type:"get",
						success:function(data){
							if (data=="duplicated") {
								$("#message1").html("중복되는 ID가 있습니다.");
								idFlag=false;
								return idFlag;
							}
							else if(data=="fail"){
								$("#message1").html("ID는 6~14자 내로 가능합니다. 띄어쓰기불가능");
								idFlag=false;
								return idFlag;
							}
							else if(data="success"){
								$("#message1").html("가능한 ID입니다.");
								idFlag=true;
							}
						} 
					});	
				}
			});
		}
		
		$("#pw").on("keyup", function(){
			var pw = $("#pw").val();
		    if (pw=="") {
		    	$("#message2").html(" ");
				/* return false; */
			} else if (!pattern1.test(pw)||!pattern2.test(pw)||!pattern3.test(pw)||pw.length<8||pw.length>20) {
				$("#message2").html("영문+숫자+특수기호 8자리 이상 20자리 이하로 구성하여야 합니다. 띄어쓰기불가능");
				/* return false; */
			}else {
				$("#message2").html(" ");
			}
		});
		
		$("#name").on("keyup",function(){
			var name=$("#name").val();
			if (name=="") {
				$("#message3").html(" ");
				/* return false; */
			}
			else if (!re_name.test(name)) {
				$("#message3").html("한글로 적어주세요. 띄어쓰기불가능");
				/* return false; */
			} else if (name.length>5 || name.length<2) {
				$("#message3").html("2~5자 내로 입력해주세요. 띄어쓰기불가능");
				/* return false; */
			} else{
				$("#message3").html(" ");
			}
		});
		
		$("#address").on("keyup",function(){
			var address=$("#address").val();
			if (address=="") {
				$("#message4").html(" ");
				/* return false; */
			}else if (!re_address.test(address)) {
				$("#message4").html("한글과 숫자로만 적어주세요. 띄어쓰기가능");
				/* return false; */
			}else{
				$("#message4").html(" ");
			}
		});
		
		$("#reginum").on("keyup",function(){
			var reginum=$("#reginum").val();
			
			if (reginum=="") {
				$("#message5").html(" ");
				/* return false; */
			}
			if (!re_reginum.test(reginum)) {
				$("#message5").html("10자리로 된 숫자만 입력해주세요. 띄어쓰기불가능");
				/* return false; */
			}else{
				$("#message5").html(" ");
				/* return false; */
			}
		});
		
		$("#managername").on("keyup",function(){
			var managername=$("#managername").val();
			if (managername=="") {
				$("#message6").html(" ");
				/* return false; */
			}else if (!re_name.test(managername)) {
				$("#message6").html("한글로 적어주세요. 띄어쓰기불가능");
				/* return false; */
			}else if (managername.length>5 || managername.length<2) {
				$("#message6").html("2~5자 내로 입력해주세요. 띄어쓰기불가능");
				/* return false; */
			}else{
				$("#message6").html(" ");
			}
		});
		
		$("#managerphone").on("keyup",function(){
			var managerphone=$("#managerphone").val();
			if (managerphone=="") {
				$("#message7").html(" ");
				/* return false; */
			}else if (!re_managerphone.test(managerphone)) {
				$("#message7").html("10자리 혹은 11자리의 숫자를 입력해주세요. 띄어쓰기불가능")
				/* return false; */
			}else{
				$("#message7").html(" ");
			}
		});
		
		$("#manageremail").on("keyup",function(){
			var manageremail=$("#manageremail").val();
			if (manageremail=="") {
				$("#message8").html(" ");
				/* return false; */
			}else if (!re_manageremail.test(manageremail)) {
				$("#message8").html("mail의 주소를 입력해주세요. 띄어쓰기불가능");
				/* return false; */
			} else{
				$("#message8").html(" ");
			}
		});
	}); 
	
	function checkForm(){
		
		if (checkid=="") {
			
			var id = $("#id").val();
			if (id=="") {
				$("#message1").html(" ");
				return false;
			}
			else if (!re_id.test(id)) {
				$("#message1").html("영어와 숫자만 입력가능합니다. 띄어쓰기불가능");
				return false;
			} else if(!idFlag){
				return false;
			}
		}
		
		var pw = $("#pw").val();
	    if (pw=="") {
	    	$("#message2").html(" ");
			return false;
		} else if (!pattern1.test(pw)||!pattern2.test(pw)||!pattern3.test(pw)||pw.length<8||pw.length>20) {
			$("#message2").html("영문+숫자+특수기호 8자리 이상 20자리 이하로 구성하여야 합니다. 띄어쓰기불가능");
			return false;
		} else if (pw==""){
			$("#message2").html(" ");
			return false;
		}
	    
	    var name=$("#name").val();
		if (name=="") {
			$("#message3").html(" ");
			/* return false; */
		}
		else if (!re_name.test(name)) {
			$("#message3").html("한글로 적어주세요. 띄어쓰기불가능");
			return false;
		} else if (name.length>5 || name.length<2) {
			$("#message3").html("2~5자 내로 입력해주세요. 띄어쓰기불가능");
			return false;
		} else if (name==""){
			$("#message3").html(" ");
			/* return false; */
		}
		
		var address=$("#address").val();
		if (address=="") {
			$("#message4").html(" ");
			/* return false; */
		}else if (!re_address.test(address)) {
			$("#message4").html("한글과 숫자로만 적어주세요. 띄어쓰기가능");
			return false;
		}else if (address==""){
			$("#message4").html(" ");
			/* return false; */
		}
	    
		var reginum=$("#reginum").val();
		if (reginum=="") {
			$("#message5").html(" ");
			/* return false; */
		}else if (!re_reginum.test(reginum)) {
			$("#message5").html("10자리로 된 숫자만 입력해주세요. 띄어쓰기불가능");
			return false;
		}else if (reginum==""){
			$("#message5").html(" ");
			/* return false; */
		}
		
		var managername=$("#managername").val();
		if (managername=="") {
			$("#message6").html(" ");
			/* return false; */
		}else if (!re_name.test(managername)) {
			$("#message6").html("한글로 적어주세요. 띄어쓰기불가능");
			return false;
		}else if (managername.length>5 || managername.length<2) {
			$("#message6").html("2~5자 내로 입력해주세요. 띄어쓰기불가능");
			return false;
		}else if (managername==""){
			$("#message6").html(" ");
			/* return false; */
		}
		
		var managerphone=$("#managerphone").val();
		if (managerphone=="") {
			$("#message7").html(" ");
			/* return false; */
		}else if (!re_managerphone.test(managerphone)) {
			$("#message7").html("10자리 혹은 11자리의 숫자를 입력해주세요. 띄어쓰기불가능")
			return false;
		}else if (managerphone==""){
			$("#message7").html(" ");
			/* return false; */
		}
		
		var manageremail=$("#manageremail").val();
		if (manageremail=="") {
			$("#message8").html(" ");
			/* return false; */
		}else if (!re_manageremail.test(manageremail)) {
			$("#message8").html("mail의 주소를 입력해주세요. 띄어쓰기불가능");
			return false;
		} else if (manageremail==""){
			$("#message8").html(" ");
			/* return false; */
		} 
		
	    
	    return true;
	}
		
		
</script>

<body>

<div class="page_loader"></div>
<input type="hidden" id="idofCheck" value="${enterprise.enterprise_ID}">

<!-- Content area start -->
<div class="content-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <!-- Form content box start -->
                <div class="form-content-box">
                    <!-- details -->
                    <div class="details">
                        <!-- Main title -->
                        <div class="main-title">
                            <h1><span>Signup</span></h1>
                        </div>
                        <!-- Form start-->
                        <c:if test="${sessionScope.enterpriseLoginID==null}">
                        <form action="insertEnterprise" method="post" onsubmit="return checkForm();">
                            <div class="form-group">
	                            <input type="text" name="enterprise_ID" id="id" class="input-text" placeholder="ID"><br>
	                            <b id="message1"></b>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope.enterpriseLoginID!=null}">
						<form action="updateEnterprise" method="post" onsubmit="return checkForm();">
							<input type="hidden" name="enterprise_ID" id="id" class="input-text" value="${Enterprise.enterprise_ID}">
						</c:if>
                            <div class="form-group">
                                <input type="text" name="enterprise_Name" id="name" class="input-text" value="${Enterprise.enterprise_Name}" placeholder="Name"><br>
                                <b id="message3"></b>
                            </div>
                            <div class="form-group">
                                <input type="password" name="enterprise_PW" id="pw" class="input-text" value="${Enterprise.enterprise_PW}" placeholder="Password"><br>
                                <b id="message2"></b>
                            </div>
                           <!--  <div class="form-group">
                                <input type="password" name="confirm_Password" class="input-text" placeholder="Confirm Password"><br>
                                <b id="message4"></b>
                            </div> -->
                            <div class="form-group">
                                <input type="text" name="enterprise_Address" id="address" class="input-text" value="${Enterprise.enterprise_Address}" placeholder="Address"><br>
                                <b id="message4"></b>
                            </div>
                            <div class="form-group">
                                <input type="text" name="enterprise_RegiNum" id="reginum" class="input-text" value="${Enterprise.enterprise_RegiNum}" placeholder="Reginum"><br>
                                <b id="message5"></b>
                            </div>
                            <div class="form-group">
                                <input type="text" name="enterprise_ManagerName" id="managername" class="input-text" value="${Enterprise.enterprise_ManagerName}" placeholder="ManagerName"><br>
                                <b id="message6"></b>
                            </div>
                            <div class="form-group">
                                <input type="text" name="enterprise_ManagerPhone" id="managerphone" class="input-text" value="${Enterprise.enterprise_ManagerPhone}" placeholder="ManagerPhone"><br>
                                <b id="message7"></b>
                            </div>
                            <div class="form-group">
                                <input type="email" name="enterprise_ManagerEmail" id="manageremail" class="input-text" value="${Enterprise.enterprise_ManagerEmail}" placeholder="ManagerEmail"><br>
                                <b id="message8"></b>
                            </div>
                            <div class="form-group2">
                                <input type="radio" name="enterprise_Code" id="code" value="부동산" <c:if test="${Enterprise.enterprise_Code=='부동산'}">checked="checked"</c:if> checked="checked">부동산
                                <input type="radio" name="enterprise_Code" id="code" value="보증업체" <c:if test="${Enterprise.enterprise_Code=='보증업체'}">checked="checked"</c:if>>보증업체
                                <input type="radio" name="enterprise_Code" id="code" value="기타" <c:if test="${Enterprise.enterprise_Code=='기타'}">checked="checked"</c:if>>기타<br>
                                <b id="message9"></b>
                            </div>
                            <div class="form-group">
                                <input type="text" name="enterprise_ETC" id="etc" class="input-text" value="${Enterprise.enterprise_ETC}" placeholder="ETC">
                            </div>
                            <c:if test="${sessionScope.enterpriseLoginID==null}">
                            <div class="form-group">
                                <button type="submit" class="button-md button-theme btn-block">Signup</button>
                            </div>
                            </c:if>
                            <c:if test="${sessionScope.enterpriseLoginID!=null}">
                            <div class="form-group">
                                <button type="submit" class="button-md button-theme btn-block">Modify</button>
                            </div>
                            </c:if>
                        </form>
                        <c:if test="${sessionScope.enterpriseLoginID!=null}">
                        <form action="withdraw">
                            <div class="form-group">
                                <button type="submit" class="button-md button-theme btn-block">Delete</button>
                            </div>
                        </form>
                        </c:if>
                        <!-- Form end-->
                    </div>
                    <!-- Footer -->
                    <div class="footer">
                        <span>
                            I want to <a href="goEnterprisePage">return to login</a>
                        </span>
                    </div>
                </div>
                <!-- Form content box end -->
            </div>
        </div>
    </div>
</div>
<!-- Content area end -->

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