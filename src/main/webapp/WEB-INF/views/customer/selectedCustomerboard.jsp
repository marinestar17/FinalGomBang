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
			<td>ROOM NUMBER : ${customerBoard.customerBoard_Seq}</td>
			<td>TITLE : ${customerBoard.customerBoard_Title}</td>
			<td>HITCOUNT : ${customerBoard.customerBoard_Hitcount}</td>
			<td>
				<c:if test="${sessionScope.customerLoginID==customerBoard.customer_ID}">
					<a href="goRemakecustomer?customerBoard_Seq=${customerBoard.customerBoard_Seq}">MODIFY</a>
				</c:if>
			</td>
		</tr>
		<tr>
			<td>WRITER : ${customerBoard.customer_ID}</td>
			<%-- <td>방 태그 : ${customerBoard.customerBoard_Tag}</td> --%>
			<td>DATE : ${customerBoard.customerBoard_Indate}</td>
		</tr>
		<tr>
			<td>CONTENT : ${customerBoard.customerBoard_Content}</td>
		</tr>
	</table>
</body>
</html>