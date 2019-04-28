<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://geoapi.heartrails.com/api/geoapi.js"></script>
 <script src="./resources/ckeditor/ckeditor.js"></script>

<script>
	/* var geoapi_prefectures = "";
	var geoapi_cities = "";
	var geoapi_towns = ""; */
	
	$(function(){
		/* var geoapi_prefectures = ""; */
		/* var geoapi_cities = ""; */
		/* var geoapi_towns = ""; */
		/* var geoapi_remain = ""; */
		/* var geoapi_postCode = ""; */
		var customerBoard_Title = "";
		$("#insertItem").on("click",insertItem);		
		/* $("#searchAddress").on("click",searchAddress); */
		
		ck = CKEDITOR.replace("editor", editorConfig);
		
		
		
		
	});
	
	// 매물 등록
	function insertItem(){
		/* geoapi_prefectures = $("#geoapi-prefectures option:selected").val(); */
		/* geoapi_cities = $("#geoapi-cities option:selected").val(); */
		/* geoapi_towns = $("#geoapi_towns").val(); */
	/* 	geoapi_remain = $("#geoapi_remain").val(); */
		/* var forSale_Address = geoapi_prefectures + "//" + geoapi_cities + "//" + geoapi_towns + "//" + geoapi_remain; */
		/* geoapi_postCode = $("#geoapi_postCode").val(); */
		/* var forSale_Rent = $("#forSale_Rent").val(); */
		/* var forSale_Deposit = $("#forSale_Deposit").val(); */
		/* var forSale_Reward = $("#forSale_Reward").val(); */
		/* var forSale_Option = ""; */
		/* $("input[name=forSale_Option]:checked").each(function() {
			forSale_Option += $(this).val()+"//"; 
		}); */
		var customerBoard_Title = $("#customerBoard_Title").val();
		var customerBoard_Content = CKEDITOR.instances.editor.getData();
		var customerBoard_Tag = $("#customerBoard_Tag").val();
		var customer_ID = $("#customer_ID").val();
		var customerBoard = {
				/* "forSale_Address":forSale_Address,
				"forSale_Rent":forSale_Rent,
				"forSale_Deposit":forSale_Deposit,
				"forSale_Reward":forSale_Reward,
				"forSale_Option":forSale_Option,*/
				"customerBoard_Title":customerBoard_Title,
				"customerBoard_Content":customerBoard_Content,
				/* "forSale_PostCode":geoapi_postCode, */
				"customerBoard_Tag":customerBoard_Tag,
				"customer_ID":customer_ID
				}
		console.log(customerBoard);
		$.ajax({
				url:"insertCustomeritem",
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
	
	// 주소로 우편번호 리스트 출력
	/* function searchAddress(){
		geoapi_prefectures = $("#geoapi-prefectures option:selected").val();
		geoapi_cities = $("#geoapi-cities option:selected").val();
		geoapi_towns = $("#geoapi-towns option:selected").val();
		var postCodeList = "<table>";
		$.ajax({
			url:"https://apis.postcode-jp.com/api/v2/search?apiKey=ISdegT3BVbqK3v41cl1yinQOc0LfWelSsdNBPWr&q="+geoapi_prefectures+" "+geoapi_cities,
			type:"get",
			success:function(res){
				
				$.each(res.data,function(index,item){
					var town = item.town.replace("&#39;","");
					postCodeList+="<tr><td class='postcode' data-town='"+ item.town+"' data-code='"+item.postcode+"'>"+item.postcode+"<td><td>"+item.town+"</td></tr>";
				})
				postCodeList+="</table>";
				$("#postCodeTd").html(postCodeList);
				$(".postcode").on("click",selectPostCode);
			}
		});
	} */
	// 우편번호 선택
	/* function selectPostCode(){
		var town = $(this).attr('data-town');
		var postCode = $(this).attr('data-code');
		$("#geoapi_towns").val(town);
		$("#geoapi_postCode").val(postCode);
		$("#postCodeTd").html("");
		/* nearByStation(); */
	/* $.ajax({
			url:"http://geoapi.heartrails.com/api/json?method=getStations&postal="+postCode,
			type:"get",
			dataType:"jsonp",
			jsonpCallback:"getStations",
			success:function(res){
				$("#customerBoard_Title").val(res.response.station[0].name);
			}
		}); */
	
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
<h1>Q/A</h1>
<h1>${sessionScope.customerLoginID}</h1>
	<form id="insertItemForm" method="post">
	<table>
		<!-- <tr>
			<th>말머리태그</th>
			<td>
				<select id="customerBoard_Tag" name="customerBoard_Tag">
					<option value="주택" >주택</option>
					<option value="맨션" >맨션</option>
					<option value="아파트" >아파트</option>
					<option value="공단주택" >공단주택</option>
					<option value="원룸" >원룸</option>
				</select>
			</td>
		</tr> -->
		<!-- <tr>
			<th>매물주소</th>
			<td>
				<select id="geoapi-prefectures" name="geoapi-prefectures">
  					<option value="都道府県を選択してください">都道府県を選択してください</option>
				</select>
				<select id="geoapi-cities" name="geoapi-cities">
  					<option value="市区町村名を選択してください">市区町村名を選択してください</option>
				</select>
				<select id="geoapi-towns" name="geoapi-towns">
  					<option value="町域を選択してください">町域を選択してください</option>
				</select>
				<input type="button" id="searchAddress" value="주소검색">
			</td>
		</tr>
		<tr>
			<th></th>
			<td><input type="text" id="geoapi_towns" placeholder="도시,마을"></td>
		</tr>
		<tr>
			<th></th>
			<td><input type="text" id="geoapi_remain" placeholder="나머지 주소"></td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td><input type="text" id="geoapi_postCode" placeholder="우편번호"></td>
		</tr>
		<tr>
			<th></th>
			<td id="postCodeTd"></td>
		</tr>
		
		<tr>
			<th>집세</th>
			<td><input type="text" id="forSale_Rent" name="forSale_Rent"></td>
		</tr>
		<tr>
			<th>시키킹</th>
			<td><input type="text" id="forSale_Deposit" name="forSale_Deposit"></td>
		</tr>
		<tr>
			<th>레이킹</th>
			<td><input type="text" id="forSale_Reward" name="forSale_Reward"></td>
		</tr>
		<tr>
			<th>옵션</th>
			<td>
				승강기<input type="checkbox" class="forSale_Option" value="승강기" name="forSale_Option">
				베란다<input type="checkbox" class="forSale_Option" value="베란다" name="forSale_Option">
				주차장<input type="checkbox" class="forSale_Option" value="주차장" name="forSale_Option">
			</td>
		</tr> -->
		<tr>
			<th>TITLE</th>
			<td><input type="text" id="customerBoard_Title" name="customerBoard_Title"></td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td>
			<textarea name="editor" id="editor" rows="10" cols="80">
            This is my textarea to be replaced with CKEditor.
       		 </textarea>
			</td>
		</tr>
		<tr>
			<td><input type="hidden" id="customer_ID" name="customer_ID" value="${sessionScope.customerLoginID}"></td>
			<td><input type="button" id="insertItem" value="등록"></td>
		</tr>
	</table>
	</form>
</body>
</html>