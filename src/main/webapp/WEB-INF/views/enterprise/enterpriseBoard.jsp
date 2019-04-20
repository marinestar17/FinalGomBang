<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style >
	table{
		width: 60%;
		text-align:center;
	}
</style>
<script>
	$(function(){
		init();
		
		$("#button").on("click", function(){
			$("#goInsertEnterpriseBoard").submit();
		})
	})
	
	function init(){
		$.ajax({
			url:"enterpriseBoardList"
			,type:"get"
			,data:{}
			,success:function(ebList){
				output(ebList);
			}
		}) //ajax
	}
	
	function output(ebList){
		var table = '<table id = "listTable">';
		table+= '<hr>';
		table+= '<tr><th>글번호</th><th>태그</th><th>글제목</th><th>글쓴이</th><th>조회수</th><th>등록일자</th></tr>';
		$.each(ebList, function(index,item){
			table+= '<tr><td>' + item.enterpriseBoard_Seq + '</td>';
			table+= '<td>' +item.enterpriseBoard_Tag + '</td>';
			table+= '<td><a href="enterpriseBoardDetail?enterpriseBoard_Seq='+item.enterpriseBoard_Seq+'" class="detail">' +item.enterpriseBoard_Title+ '</a></td>';
			table+= '<td>' +item.enterprise_ID + '</td>';
			table+= '<td>' +item.enterpriseBoard_HitCount + '</td>';
			table+= '<td>'+ item.enterpriseBoard_Indate+ '</td></tr>';
		}) //each		
		table+= '</table><hr>';
		table+='<select id="searchSelectBoard" name="searchSelect">';
		table+='<option>전체</option>'; 
		table+='<option value="enterpriseBoard_Tag" >태그로 검색</option>';
		table+='<option value="enterprise_ID">작성자로 검색</option>';
		table+='<option value="enterpriseBoard_Title">제목으로 검색</option>';
		table+='</select>&nbsp;&nbsp;';
		table+='<input type = text name = "search" id = "searchBoard" placeholder="검색할 값을 입력하세요" >';
		table+= '<input type = button id="searchButton" value = "확인">';
		$("#top").html(table);
		$("#searchButton").on("click", function(){
			var search = $("#searchBoard").val();
			var searchSelect = $("#searchSelectBoard").val();
			
		})
	}
</script>
<body>
	<div id = "top"></div>
	
	<form action="goInsertEnterpriseBoard" method = "get" id = "goInsertEnterpriseBoard">
		<input type = "button" value = "글쓰기" id = "button">
	</form>
</body>
</html>