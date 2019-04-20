<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://geoapi.heartrails.com/api/geoapi.js"></script>
 <script src="./resources/ckeditor/ckeditor.js"></script>
 
 <script>
	$(function(){
		var customerBoard_Title = "";
		$("#insertItem").on("click",insertItem);		
		ck = CKEDITOR.replace("editor", editorConfig);
	});
	
	// 매물 등록
	function insertItem(){
		
		var customerBoard_Title = $("#customerBoard_Title").val();
		var customerBoard_Content = CKEDITOR.instances.editor.getData();
		var customerBoard_Tag = $("#customerBoard_Tag").val();
		var customerBoard_Seq = $("#customerBoard_Seq").val();
		var customerBoard = {
				"customerBoard_Title":customerBoard_Title,
				"customerBoard_Content":customerBoard_Content,
				"customerBoard_Tag":customerBoard_Tag,
				"customerBoard_Seq":customerBoard_Seq
				}
		console.log(customerBoard);
		$.ajax({
				url:"remakeCustomeritem",
				type:"POST",
				data:customerBoard,
				success:function(data){
					console.log("성공");
					if (data=="success") {
					location.href="customerBoardlist";
						
					}
				}
		});
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
	    
</script>
</head>
<body>
<h1>Q/A수정페이지</h1>
<h1>${sessionScope.customerLoginID}</h1>
	<form id="insertItemForm" method="post">
	<table>
		<tr>
		
			<th>말머리태그</th>
			<td>
				<select id="customerBoard_Tag" name="customerBoard_Tag">
					<option value="주택" <c:if test="${customerBoard.customerBoard_Tag=='주택'}">selected</c:if> >주택</option>
					<option value="맨션" <c:if test="${customerBoard.customerBoard_Tag=='맨션'}">selected</c:if> >맨션</option>
					<option value="아파트" <c:if test="${customerBoard.customerBoard_Tag=='아파트'}">selected</c:if> >아파트</option>
					<option value="공단주택" <c:if test="${customerBoard.customerBoard_Tag=='공단주택'}">selected</c:if> >공단주택</option>
					<option value="원룸" <c:if test="${customerBoard.customerBoard_Tag=='원룸'}">selected</c:if> >원룸</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>TITLE</th>
			<td><input type="text" id="customerBoard_Title" name="customerBoard_Title" value="${customerBoard.customerBoard_Title}"></td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td>
			<textarea name="editor" id="editor" rows="10" cols="80">
				${customerBoard.customerBoard_Content}
       		 </textarea>
			</td>
		</tr>
		<tr>
			<td><input type="hidden" id="customerBoard_Seq" name="customerBoard_Seq" value="${customerBoard.customerBoard_Seq}"></td>
			<td><input type="button" id="insertItem" value="수정"></td>
		</tr>
	</table>
	</form>
</body>
</html>