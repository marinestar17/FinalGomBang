<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>The Nest - Real Estate HTML Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function(){
		
	$("#customer_id").on("keyup",customerIDcheck);//아이디 중복체크 및 글자 길이
	$("#customer_pw").on("keyup",length);//비밀번호 길이
	$("#customer_name").on("keyup",hangl);//한글 유효성검사
	$("#signup").on("click",btn);//회원가입버튼시 유효성검사
	$("#modify").on("click",btn);
	});
		
    function customerIDcheck(){//아이디 유효성검사
	var id = $("#customer_id").val();
		$.ajax({
		  url:"customerIDcheck",
		  type:"get",
		  data:{customer_id:id},
		  success:function(data1){
			  if(id.length<=10 && id.length>=3){
				  
				if(data1=="duplicated"){
					$("#duplicatemessage").html("ID중복");
				}else{
					$("#duplicatemessage").html("등록가능");
				}					
			  }else{
				  
				  $("#duplicatemessage").html("3이상10이하를 적어주세요");
			  }
			  
			  
		   }
			  
	    });
		
     }
    
    
    
    function length(){//pw의 길이 유효성검사
    	var pw=$("#customer_pw").val();
        if(pw.length>10 || pw.length<3){
        	$("#li").html("3이상10이하를 적어주세요");
        }
        else{
        	$("#li").html("");
        }
    }
    
    function hangl(){//한글 유효성검사
    	var name=$("#customer_name").val();
    	var han=/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
    	if(han.test(name)==false){
    		$("#lu").html("한글을 적어주세요");
    		return false;
    	}else{
    		$("#lu").html("");
    	}
    }
 
    function btn(){    //회원가입 버튼을 누를시 널값 이메일형식 전화번호 형식의 유효성을 보여준다. 
    	
    	var checkid= '${sessionScope.customerLoginID}';
    	
    	var id = $("#customer_id").val();
    	var pw = $("#customer_pw").val();
    	var name = $("#customer_name").val();
    	var address = $("#customer_address").val();
    	var birthdate= $("#customer_birthdate").val();
    	var nickname = $("#customer_nickname").val();
    	var phone = $("#customer_phone").val();
    	var gender =$('input[name="customer_gender"]:checked').val();

    	var email = $("#customer_email").val();
        var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;//정규식이메일 
        var regPhone = /^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/;//정규식 비밀번호

    	if(checkid==""){
    		
    	if(id==""){
    		alert("아이디를 입력하세요");
    		
    	}else if(pw==""){
    		alert("비밀번호를 입력하세요");
    		
    	}else if(name==""){
    		alert("이름을 입력하세요");
    		
    	}else if(address==""){
    		alert("주소를 입력하세요");
    		
    	}else if(birthdate==""){
    		alert("생일을 입력하세요");
    		
    	}else if(nickname==""){
    		alert("닉네임을 입력하세요");
    		
    	}else if(phone==""){
    		alert("핸드폰을 입력하세요");
    	
    	}else if(regPhone.test(phone)==false){
    		alert("잘못된 핸드폰 양식입니다");
    		return false;
    			
    	}else if(gender==""){
    		alert("성별을 입력하세요");
    		
    	}else if(email==""){
    		alert("이메일을 입력하세요");
    		
    	}else if(regEmail.test(email)==false){
    		alert("잘못된 이메일 형식입니다");
    		return false;
    		
    	}else{
    		$("#signupForm").submit();
    		alert("회원가입이 완료 되었습니다");
    		
    	}  
    		
    }else{
		if(pw==""){
    		alert("비밀번호를 입력하세요");
    		
    	}else if(name==""){
    		alert("이름을 입력하세요");
    		
    	}else if(address==""){
    		alert("주소를 입력하세요");
    		
    	}else if(birthdate==""){
    		alert("생일을 입력하세요");
    		
    	}else if(nickname==""){
    		alert("닉네임을 입력하세요");
    		
    	}else if(phone==""){
    		alert("핸드폰을 입력하세요");
    	
    	}else if(regPhone.test(phone)==false){
    		alert("잘못된 핸드폰 양식입니다");
    		return false;
    			
    	}else if(email==""){
    		alert("이메일을 입력하세요");
    		
    	}else if(regEmail.test(email)==false){
    		alert("잘못된 이메일 형식입니다");
    		return false;
    		
    	}else{
    		$("#modifyForm").submit();
    		alert("회원정보가 수정되었습니다");
    		
    	} 
    }
    }
    </script>
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
    <script type="text/javascript" src="resources/user/js/html5shiv.min.js"></script>
    <script type="text/javascript" src="resources/user/js/respond.min.js"></script>
    <![endif]-->
    <style>
    	#customer_birthdate{
    		    width: 100%;
    padding: 10px 15px;
    font-size: 13px;
    height: 44px;
    border: 1px solid #e8e7e7;
    outline: none;
    color: #717171;
    border-radius: 3px;
    	
    	}
    
    </style>
</head>
<body>
<div class="page_loader"></div>

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
                         <c:if test="${sessionScope.customerLoginID==null}">
                            <h1><span>Customer Signup</span></h1>
                         </c:if>
                          <c:if test="${sessionScope.customerLoginID!=null}">
                            <h1><span>Customer Modify</span></h1>
                         </c:if>
                        </div>
                        <!-- Form start-->
                        <!--회원가입-->
                        <c:if test="${sessionScope.customerLoginID==null}">
                        <form id="signupForm" action="customerSignup" method="post">
                            <div class="form-group">
                                <input type="text" id="customer_id" name="customer_ID" class="input-text" placeholder="Full ID"><b id="duplicatemessage"></b>
                            </div>
                            <div class="form-group">
                                <input  type="password" id="customer_pw" name="customer_PW" class="input-text" placeholder="Password"><b id="li"></b>
                            </div>
                             <div class="form-group">
                                <input type="text" id="customer_name" name="customer_Name"  class="input-text" placeholder="Name"><b id="lu"></b>
                            </div>
                             <div class="form-group">
                                <input type="date" id="customer_birthdate" name="customer_Birthdate" class="input-text">
                            </div>
                             <div class="form-group">
                                <input type="text" id="customer_phone" name="customer_Phone" class="input-text" placeholder="Phone">
                            </div>
                             <div class="form-group">
                                <input type="radio" id="customer_gender" name="customer_Gender" value="남" checked/>Man
		                        <input style="margin-left: 30px;" type="radio" id="customer_gender" name="customer_Gender" value="여" />Woman
                            </div>
                            <div class="form-group">
                                <input  type="text" id="customer_email" name="customer_Email" class="input-text" placeholder="Email Address">
                            </div>
                          
                            
                            <div class="form-group">
                                <input id="signup" type="button" value="Singup" class="button-md button-theme btn-block">
                            </div>
                        </form>
                        </c:if>
                        <!-- 수정 -->
                          <c:if test="${sessionScope.customerLoginID!=null}">
                       <form id="modifyForm" action="customerModify" method="post"> 
                            <div class="form-group">
                               ${sessionScope.customer.customer_ID}<input type="hidden" id="customer_id" name="customer_ID" class="input-text" value="${sessionScope.customer.customer_ID}" /><b id="duplicatemessage"></b>
                            </div>
                            <div class="form-group">
                               <input type="password" id="customer_pw" name="customer_PW" placeholder="Password"  class="input-text" value="${sessionScope.customer.customer_PW}" /><b id="li"></b>
                            </div>
                             <div class="form-group">
                                <input type="text" id="customer_name" name="customer_Name"   placeholder="Name" class="input-text" value="${sessionScope.customer.customer_Name}" /><b id="lu"></b>
                            </div>
                             <div class="form-group">
                                <input type="date" id="customer_birthdate" name="customer_Birthdate" value="${sessionScope.customer.customer_Birthdate}"/>
                            </div>
                             <div class="form-group">
                                <input type="text" id="customer_phone" name="customer_Phone" class="input-text" placeholder="Phone" value="${sessionScope.customer.customer_Phone}" >
                            </div>
                            <div class="form-group">
                            <input type="text" id="customer_email" name="customer_Email" class="input-text" placeholder="Email Address"  value="${sessionScope.customer.customer_Email}" >
                            
                            </div>
                      
                            <div class="form-group">
                                <input id="modify" type="button" value="Modify"  class="button-md button-theme btn-block" >
                            </div>
                        </form>
                        </c:if>
                        <!-- Form end-->
                    </div>
                    <!-- Footer -->
                    <div class="footer">
                        <span>
                            I want to <a href="customerLogingo">return to login</a>
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