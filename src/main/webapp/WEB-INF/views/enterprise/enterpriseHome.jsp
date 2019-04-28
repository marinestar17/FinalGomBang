<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	
	$("#deletebtn").on("click", function(){
			
			/* Ext.Msg.confirm(
					'확인',
					'정말로 삭제하시겠습니까?(yes/no)',
					function(button){
						if (button=='yes') {
							alert("삭제되었습니다.");
						} else {
							return false;
						}
			}); */

		var result = confirm('削除しますか?');
		
		if (!result) {
			return false;
		} else {
			alert("削除しました.")
		}
	});
	
});
</script>
<body>
<h1>홈</h1>


<c:if test="${sessionScope.loginId==null}">

<form action="enterpriseLogin" method = "post">
	ID : <input type="text" name="enterprise_ID" id="id"><font color="red">${warning}</font><br>
	PW : <input type="password" name="enterprise_PW" id="pw"><br>
	<input type="submit" value="LOGIN"><br>
	<font color="red">${wait}</font>
	<font color="red">${deny}</font>
</form>
<form action="goSignup">
	<input type="submit" value="회원가입창으로 이동">
</form>
</c:if>

<c:if test="${sessionScope.loginId!=null}">
<form action="enterpriseLogout">
	<input type="submit" value="로그아웃">
</form>
<form action="goUpdate">
	<input type="hidden" name="ID" value="${ID}">
	<input type="hidden" name="PW" value="${PW}">
	<input type="hidden" name="Name" value="${Name}">
	<input type="hidden" name="Address" value="${Address}">
	<input type="hidden" name="RegiNum" value="${RegiNum}">
	<input type="hidden" name="ManagerName" value="${ManagerName}">
	<input type="hidden" name="ManagerPhone" value="${ManagerPhone}">
	<input type="hidden" name="ManagerEmail" value="${ManagerEmail}">
	<input type="hidden" name="ETC" value="${ETC}">
	<input type="hidden" name="Code" value="${Code}">
	<input type="submit" value="회원정보수정">
</form>
<form action="withdraw" method="post">
	<input type="submit" id="deletebtn" value="회원탈퇴">
</form>
<form action="goEnterpriseBoard" method = "get">
	<input type = "submit" value = "기업용게시판">
</form>
</c:if>

<form>
	<a href="goInsertItem">매물등록</a>
</form>
</body>
</html>
