<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="./resources/ckeditor/ckeditor.js"></script>

<script>
	/* var geoapi_prefectures = "";
	var geoapi_cities = "";
	var geoapi_towns = ""; */
	
	$(function(){
		ck = CKEDITOR.replace("editor", editorConfig);
		
		$("#insertButton").on("click", function(){
			check();
			insertEnterpriseBoard();
		})
	});
	
	
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
	
	function check(){
		var tag = $("#enterpriseBoard_Tag").val();
		var pw = $("#enterpriseBoard_PW").val();
		var title = $("#enterpriseBoard_Title").val();
		if (pw.length == 0) {
			alert("パスワード入力。");
			return;
		}		
		if(title.length==0){
			alert("タイトル入力。");
			return;
		}
		if(pw.length==0){
			alert("パスワード入力。");
			return;
		}
	}
	
	function insertEnterpriseBoard(){
		var tag = $("#enterpriseBoard_Tag").val();
		var pw = $("#enterpriseBoard_PW").val();
		var title = $("#enterpriseBoard_Title").val();
		var content = CKEDITOR.instances.editor.getData();
		var id = $("#enterprise_ID").val();
		var enterpriseBoard = {
			enterprise_ID : id
			,enterpriseBoard_Title : title
			,enterpriseBoard_Content : content
			,enterpriseBoard_Tag : tag
			,enterpriseBoard_PW : pw
		}
		
		 $.ajax({
			url:"insertEnterpriseBoard"
			,data: enterpriseBoard
			,type: "post"
			,success: function(){
				alert("등록됨");
				location.href = "/GomBang/goEnterpriseBoard";
			}
		}) 
	}
</script>
</head>
<body>
<h1>게시판 ㅎㅇ</h1>
<form action="insertEnterpriseBoard" method = "post" id = "insertEnterpriseBoard">
	<table>
		<tr>
			<td>말머리:
				<select id="enterpriseBoard_Tag" name="enterpriseBoard_Tag">
					<option value="문의">問とい合あわせ</option>
					<option value="건의">建議</option>
					<option value="기타"> その他</option>
				</select>
			</td>
			<td>게시글 비밀번호:
				<input type = "password" name = "enterpriseBoard_PW" id = "enterpriseBoard_PW">
			</td>
		</tr>
		<tr>
			<td>제목:
				<input type = "text" name = "enterpriseBoard_Title" id = "enterpriseBoard_Title">
			</td>	
		</tr>
		<tr >
			<td colspan='4'>
				<textarea name="editor" id="editor" rows="10" cols="80">
					問題について書いてください。
				</textarea> 
			</td>
		</tr>
		<tr>
			<td>
				<input type = "hidden" value = "${sessionScope.loginId}" id = "enterprise_ID">
				<input type = "button" value = "登録" id = "insertButton">
			</td>
		</tr>
	</table>
</form>
	
</body>
</html>