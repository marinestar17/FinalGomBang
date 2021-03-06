<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<style>
	table{
		width:80%;
		border:1px solid black;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	 $(function(){
		 $("#customerDelete").on("click",customerDelete)//회원버튼삭제
	 })
	  

	function customerDelete(){
		var result = confirm('削除しますか?');
		
		if (!result) {
			return false;
		} else {
			$.ajax({
				url:"customerDelete"
				,type:"get"
				,data:{}
				,success:function(){
					alert("削除しました.");
					location.href="/GomBang";
				}
			})
		}
	}
</script>
<body>
<c:if test="${sessionScope.customerLoginID==null}">
<a href="customerSignupgo">고객 회원가입</a><br><br>
<a href="customerLogingo">고객 로그인</a>
</c:if>

<c:if test="${sessionScope.customerLoginID!=null}">
<h1>${sessionScope.customerLoginID}</h1>
<a href="customerSignupgo">CUSTOMER MODIFY</a><br><br>
<a href="customerLogout">LOGOUT</a><br><br>
<a href="#" id = "customerDelete">WITHDRAW</a>

<form action="goCustomerboard">
	<input type="submit" value="게시판이동">
</form>
	<table>
		<tr>
			<td>NUMBER</td>
			<td>TITLE</td>
			<td>WRITER</td>
			<td>TIME</td>
			<td>HITCOUNT</td>
		</tr>
<c:forEach var="cbList" items="${cbList}">
		<tr>
			<td>${cbList.customerBoard_Seq}</td>
			<td><a href="enterCustomerboard?customerBoard_Seq=${cbList.customerBoard_Seq}">${cbList.customerBoard_Title}</a></td>
			<td>${cbList.customer_ID}</td>
			<td>${cbList.customerBoard_Indate}</td>
			<td>${cbList.customerBoard_Hitcount}</td>
		</tr>
</c:forEach>
	</table>
</c:if>

</body>
</html>