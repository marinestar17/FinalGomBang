<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
		checkid = document.getElementById("idofCheck").value;
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
<input type="hidden" id="idofCheck" value="${enterprise.enterprise_ID}">
<c:if test="${sessionScope.enterpriseLoginID==null }">
<h1>회원가입</h1>
<form action="insertEnterprise" method="post" onsubmit="return checkForm();">
	ID : <input type="text" name="enterprise_ID" id="id" value="${enterprise.enterprise_ID}"><b id="message1"></b><br>
</c:if>
<c:if test="${sessionScope.enterpriseLoginID!=null}">
<h1>회원정보수정</h1>
<form action="updateEnterprise" method="post" onsubmit="return checkForm();">
	<input type="hidden" name="enterprise_ID" id="id" value="${enterprise.enterprise_ID}">
</c:if>
	PW : <input type="password" name="enterprise_PW" id="pw" value="${enterprise.enterprise_PW}"><b id="message2"></b><br>
	NAME : <input type="text" name="enterprise_Name" id="name" value="${enterprise.enterprise_Name}"><b id="message3"></b><br>
	ADDRESS : <input type="text" name="enterprise_Address" id="address" value="${enterprise.enterprise_Address}"><b id="message4"></b><br>
	REGINUM : <input type="text" name="enterprise_RegiNum" id="reginum" value="${enterprise.enterprise_RegiNum}"><b id="message5"></b><br>
	MANAGERNAME : <input type="text" name="enterprise_ManagerName" id="managername" value="${enterprise.enterprise_ManagerName}"><b id="message6"></b><br>
	MANAGERPHONE : <input type="text" name="enterprise_ManagerPhone" id="managerphone" value="${enterprise.enterprise_ManagerPhone}"><b id="message7"></b><br>
	MANAGEREMAIL : <input type="email" name="enterprise_ManagerEmail" id="manageremail" value="${enterprise.enterprise_ManagerEmail}"><b id="message8"></b><br>
	ETC : <input type="text" name="enterprise_ETC" id="etc" value="${enterprise.enterprise_ETC}"><b id="message9"></b><br>
	CODE : <input type="radio" name="enterprise_Code" id="code" value="부동산" checked="checked">부동산
			<input type="radio" name="enterprise_Code" id="code" value="보증업체" checked="checked">보증업체
			<input type="radio" name="enterprise_Code" id="code" value="기타" checked="checked">기타<b id="message9"></b><br>
	<input type="submit" id="signupbtn" value="입력">
	
</form>
</body>
</html>