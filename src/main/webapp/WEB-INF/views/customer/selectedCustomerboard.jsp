<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://geoapi.heartrails.com/api/geoapi.js"></script>
 <script src="./resources/ckeditor/ckeditor.js"></script>
<style>
	table{
		width:80%;
		border:1px solid black;
	}
</style>
<body>
	<table>
		<tr>
			<td>방 번호 : ${customerBoard.customerBoard_Seq}</td>
			<td>방 제목 : ${customerBoard.customerBoard_Title}</td>
			<td>조회수 : ${customerBoard.customerBoard_Hitcount}</td>
			<td>
				<c:if test="${sessionScope.customerLoginID==customerBoard.customer_ID}">
					<a href="goRemakecustomer?customerBoard_Seq=${customerBoard.customerBoard_Seq}">수정하기</a>
				</c:if>
			</td>
		</tr>
		<tr>
			<td>작성자 : ${customerBoard.customer_ID}</td>
			<td>방 태그 : ${customerBoard.customerBoard_Tag}</td>
			<td>작성 날짜 : ${customerBoard.customerBoard_Indate}</td>
		</tr>
		<tr>
			<td>내용 : ${customerBoard.customerBoard_Content}</td>
		</tr>
	</table>
</body>
</html>