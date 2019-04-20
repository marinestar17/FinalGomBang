/**
 * 개인제작 jquery,ajax
 */
(function ($) {
    'use strict';
    $(function () {
       countAccount();
       countBoard();
       countForSale();
       countEnterpriseTask();
       denyEnterprise();
       acceptEnterprise();
       waitEnterprise();
       allEnterprise();
       permissionDeny();
       permissionAccept();
       insertAdminMessage();
       printMessage();
       outputMessage();
       mainMessage();
       adminCustomerBoard();
       printCustomerBoard();
       adminEnterpriseBoard();
       printEnterpriseBoard();
       adminItemBoard();
       printItemBoard();
       adminItemDelete();
    });
    
    //회원수 count
    function countAccount(){
    	var c_count;
    	var e_count;
    	
    	$.ajax({
    		url:"countAccount"
    		,data:{}
    		,type:"get"
    		,success:function(hMap){
    			c_count = hMap["C_COUNT"];
    			e_count = hMap["E_COUNT"];
    			var result=  '기업:' + e_count + ' 소비자:' + c_count;  
    	    	$(".number").html(result);
    		}
    	});//ajax
    } //function
    
    //게시물 수 count  --> 예약 갯수로 바꿈
    function countBoard(){
    	var y_reservation;
    	var n_reservation;
    	
    	$.ajax({
    		url:"countReservation"
    		,data:{}
    		,type:"get"
    		,success: function(hMap){
    			y_reservation = hMap["Y_RESERVATION"];
    			n_reservation = hMap["N_RESERVATION"];
    			var result=  y_reservation + '건 / ' + n_reservation + '건' 
    	    	$(".number2").html(result);
    		}  
    	}); //ajax
    } //function
    
    //매물 수 count
    function countForSale(){
    	
    	$.ajax({
    		url:"countForSale"
    		,data:{}
    		,type:"get"
    		,success: function(count){
    			var result = count + '개';
    			$(".number3").html(result);
    		}
    	}); //ajax
    } //function
    
    //기업관련 업부 count
    function countEnterpriseTask(){
    	var b_count;
    	var e_count;
    	
    	$.ajax({
    		url:"countEnterpriseTask"
    			,data:{}
    			,type: "get"
    			,success: function(hMap){
    				b_count = hMap["B_COUNT"];
    				e_count = hMap["E_COUNT"];
    				var result = (b_count)+ '건/' + (e_count) + '건';
    				
    				$(".number4").html(result);
    			}
    	})
    }
    
    //거부상태 기업
    function denyEnterprise(){
    	$("#denyButton").on("click", function(){
    		$.ajax({
    			url:"enterprisePermissionDenyList"
    			,type:"get"
    			,data:{}
    			,success:function(list){
    				$("#databody").html(list);

    			}//success
    		}); //ajax
    	}) //function
    }
    
    //승인상태 기업
    function acceptEnterprise(){
    	$("#acceptButton").on("click", function(){
    		$.ajax({
    			url:"enterpriseAcceptList"
    			,type:"get"
    			,data:{}
    			,success:function(list){
    				$("#databody").html(list);


    			}//success
    		}); //ajax
    	}) //function
    }

    //대기상태 기업
    function waitEnterprise(){
    	$("#waitingButton").on("click", function(){
    		$.ajax({
    			url:"enterprisePermissionList"
    			,type:"get"
    			,data:{}
    			,success:function(list){
    				$("#databody").html(list);


    			}//success
    		}); //ajax
    	}) //function
    }
    
    //전체 기업 출력으로 back
    function allEnterprise(){
    	$("#allButton").on("click",function(){
    		var url = "allEnterprisePrint"; 
    		$(location).attr('href',url);
    	})
    }
    
    function permissionDeny(){
    	$("#permissionDenyButton").on("click", function(){
    		var id = $(this).attr("data-ID");
    		$.ajax({
    			url:"enterprisePermissionDeny"
    			,data:{enterprise_ID:id}
    			,type:"post"
    			,error: function(){
    				alert("????");
    			}
    			,success:function(){
    				alert("거부 완료");
    				location.href = "allEnterprisePrint";
    			}
    		});//ajax
    	})
    } //function
    
    function permissionAccept(){
    	$("#permissionAcceptButton").on("click", function(){
    		var id = $(this).attr("data-ID");
    		alert(id);
    		$.ajax({
    			url:"enterprisePermissionAccept"
    			,data:{enterprise_ID:id}
    			,type:"post"
    			,async: false
    			,success:function(){
    				alert("허가 완료");
    				location.href = "allEnterprisePrint";
    			}
    		});
    	})
    }
    
    //admin message insert
    function insertAdminMessage(){
    	$("#adminMessageButton").on("click", function(){
    		var content = $("#adminMessage_Content").val();
        	var id = $("#admin_ID").val();
        	var name = $('#admin_Name').val();
    		$.ajax({
    			url:"insertAdminMessage"
    			,data:{adminMessage_Content:content, admin_ID:id, admin_Name:name}
    			,type:"post"
    			,success: function(){
    				$("#adminMessage_Content").val("");
    				printMessage();
    			}
    		}); 
    	});
    }
    
    //admin message 출력
    function printMessage(searchSelect, search){
    	$.ajax({
    		url:"printMessage"
    		,data:{searchSelect:searchSelect, search:search}
    		,type:"get"
    		,success: function(list){
    			outputMessage(list);
    		} //success
    	}); //ajax
    } //function
    
    //메세지 출력
    function outputMessage(list){
    	var table = '';
		table+= '<table class="table">';
        table+='<thead><tr>';
        table+='<th>#</th>';
        table+='<th>ID</th>';  
        table+='<th>CONTENT</th>';
        table+='<th>INDATE</th>';
        table+='</tr></thead>';
        table+='<tbody><tr>';
        $.each(list,function(index,item){
        	 table+='<td>'+item.adminMessage_Seq +'</td>';
        	 table+='<td>'+item.admin_ID +'</td>';
        	 table+='<td>'+item.adminMessage_Content+'</td>';
        	 table+='<td>'+item.adminMessage_Indate  +'</td>';
        	 table+='</tr>';
        })
        table+='</tbody></table>';
        table+='<table>';
        table+='<tr><td> <div class="col-sm-4">';
        table+='<select class="selectpicker form-control show-tick">';
        table+='<option value="admin_ID">ID로 검색</option>';
        table+='<option value="adminMessage_Content">내용으로 검색</option>';
        table+='<option value="adminMessage_Indate">날짜로 검색</option>';
        table+='</select></div>';
        table+='<div class="col-sm-8">';
        table+='<div class="input-group">';
        table+='<input type="text" class="form-control" id = "search" placeholder="검색">';
        table+='<span class="input-group-btn">';
        table+='<button class="btn btn-default" type="button">Search</button></span></div></div></td>';
        table+='</tr>';
        table+='</table>';
        $(".printTable").html(table);
        
        $(".btn-default").on("click", function(){
        	var searchSelect = $(".show-tick").val();
        	var search = $("#search").val();
        	printMessage(searchSelect, search);
        })
    }
    
    //메인화면 간편 멧지 5개 출력하는거
    function mainMessage(){
    	$.ajax({
    		url:"mainPageMessage"
    		,type:"get"
    		,data:{}
    		,success:function(list){
    			var table = '';  
    			table+= '<ul>';
    			$.each(list, function(index, item){
    				table+='<li>';
    				table+='<div class="media"><div class="media-left">';
    				table+='<a href="javascript:void(0);"><img src="resources/adminBoot/assets/images/avatars/face5.jpg" alt="User Avatar" /> </a></div>';
    				table+='<div class="media-body">';
    				table+='<div class="username">'+item.admin_Name+'('+ item.admin_ID+')</div>';
    				table+='<div class="comment">'+item.adminMessage_Content+'</div>';
    				/*table+='<div class="time"><fmt:formatDate value="'+item.adminMessage_Indate+ '" pattern="yyyy-MM-dd" /></div>';*/
    				table+=' <div class="time">'+item.adminMessage_Indate+'</div>';
    				table+='</div></div></li>';
    			});
    				table+='<ul>';
    				$(".print").html(table);
    		} //success
    	}); //ajax
    } //function
    
    //고객 게시판 불러오기
    function adminCustomerBoard(searchSelect, search){
    	$.ajax({
    		url:"adminCustomerBoard"
    		,data:{searchSelect:searchSelect, search:search}
    		,type:"get"
    		,success:function(list){
    			printCustomerBoard(list);
    		}
    	})//ajax
    } //function
    
    //고객 게시판 출력
    function printCustomerBoard(list){
    	var table = '';
		table+= '<table class="table">';
        table+='<thead><tr>';
        table+='<th>#</th>';
        table+='<th>ID</th>';  
        table+='<th>TAG</th>';  
        table+='<th>TITLE</th>';
        table+='<th>INDATE</th>';
        table+='<th>HITCOUNT</th>';
        table+='</tr></thead>';
        table+='<tbody><tr>';
        $.each(list,function(index,item){
        	 table+='<td>'+item.customerBoard_Seq +'</td>';
        	 table+='<td>'+item.customer_ID +'</td>';
        	 table+='<td>'+item.customerBoard_Tag+'</td>';
        	 table+='<td><a href="admincustomerBoardDetail?customerBoard_Seq='+item.customerBoard_Seq+'">'+item.customerBoard_Title  +'</a></td>';
        	 table+='<td>'+item.customerBoard_Indate  +'</td>';
        	 table+='<td>'+item.customerBoard_Hitcount  +'</td>';
        	 table+='</tr>';
        })
        table+='</tbody></table>';
        table+='<table>';
        table+='<tr><td> <div class="col-sm-4">';
        table+='<select class="selectpicker form-control show-tick show2">';
        table+='<option value="customer_ID">ID로 검색</option>';
        table+='<option value="customerboard_Title">제목으로 검색</option>';
        table+='<option value="customerboard_Tag">태그로 검색</option>';
        table+='<option value="customerboard_Indate">날짜로 검색</option>';
        table+='</select></div>';
        table+='<div class="col-sm-8">';
        table+='<div class="input-group">';
        table+='<input type="text" class="form-control" id = "search2" placeholder="검색">';
        table+='<span class="input-group-btn">';
        table+='<button class="btn btn-default default2" type="button">Search</button></span></div></div></td>';
        table+='</tr>';
        table+='</table>';
        $(".customerTable").html(table);
        
        $(".default2").on("click", function(){
        	var searchSelect = $(".show2").val();
        	var search = $("#search2").val();
        	adminCustomerBoard(searchSelect, search);
        })
    } //function
    
    //기업 게시판 불러오기
    function adminEnterpriseBoard(searchSelect, search){
    	$.ajax({
    		url:"adminEnterpriseBoard"
    		,data:{searchSelect:searchSelect, search:search}
    		,type:"get"
    		,success:function(list){
    			printEnterpriseBoard(list)
    		}
    	});
    } //function

    function printEnterpriseBoard(list){
    	var table = '';
		table+= '<table class="table">';
        table+='<thead><tr>';
        table+='<th>#</th>';
        table+='<th>ID</th>';  
        table+='<th>TAG</th>';  
        table+='<th>TITLE</th>';
        table+='<th>INDATE</th>';
        table+='<th>HITCOUNT</th>';
        table+='<th>ADMINCHECK</th>';
        table+='</tr></thead>';
        table+='<tbody><tr>';
        $.each(list,function(index,item){
        	 table+='<td>'+item.enterpriseBoard_Seq +'</td>';
        	 table+='<td>'+item.enterprise_ID +'</td>';
        	 table+='<td>'+item.enterpriseBoard_Tag+'</td>';
        	 table+='<td><a href="adminEnterpriseBoardDetail?enterpriseBoard_Seq='+item.enterpriseBoard_Seq+'">'+item.enterpriseBoard_Title  +'</a></td>';
        	 table+='<td>'+item.enterpriseBoard_Indate  +'</td>';
        	 table+='<td>'+item.enterpriseBoard_HitCount  +'</td>';
        	 table+='<td>'+item.enterpriseBoard_AdminCheck  +'</td>';
        	 table+='</tr>';
        })
        table+='</tbody></table>';
        table+='<table>';
        table+='<tr><td> <div class="col-sm-4">';
        table+='<select class="selectpicker form-control show-tick show3">';
        table+='<option value="enterprise_ID">ID로 검색</option>';
        table+='<option value="enterpriseBoard_Title">제목으로 검색</option>';
        table+='<option value="enterpriseBoard_Tag">태그로 검색</option>';
        table+='<option value="enterpriseBoard_Indate">날짜로 검색</option>';
        table+='<option value="enterpriseBoard_AdminCheck">체크 여부로 검색</option>';
        table+='</select></div>';
        table+='<div class="col-sm-8">';
        table+='<div class="input-group">';
        table+='<input type="text" class="form-control" id = "search3" placeholder="검색">';
        table+='<span class="input-group-btn">';
        table+='<button class="btn btn-default default3" type="button">Search</button></span></div></div></td>';
        table+='</tr>';
        table+='</table>';
        $(".enterpriseTable").html(table);
        
        $(".default3").on("click", function(){
        	var searchSelect = $(".show3").val();
        	var search = $("#search3").val();
        	adminEnterpriseBoard(searchSelect, search);
        })
    }//function
    
    //매물 리스트 불러오기
    function adminItemBoard(searchSelect, search){
    	$.ajax({
    		url:"adminItemBoard"
    		,data:{searchSelect:searchSelect, search:search}
    		,type:"get"
    		,success:function(list){
    			printItemBoard(list);
    		}
    	});//ajax
    }
    
    function printItemBoard(list){
    	var table = '';
		table+= '<table class="table">';
        table+='<thead><tr>';
        table+='<th>#</th>';
        table+='<th>ID</th>';  
        table+='<th>STATUS</th>';  
        table+='<th>TITLE</th>';
        table+='<th>INDATE</th>';
        table+='<th>HOUSE TYPE</th>';
        table+='</tr></thead>';
        table+='<tbody><tr>';
        $.each(list,function(index,item){
        	 table+='<td>'+item.forSale_Seq +'</td>';
        	 table+='<td>'+item.enterprise_ID +'</td>';
        	 table+='<td>'+item.forSale_Status+'</td>';
        	 table+='<td><a href="adminItemDetail?forSale_Seq='+item.forSale_Seq+'">'+item.forSale_Title  +'</a></td>';
        	 table+='<td>'+item.forSale_Indate  +'</td>';
        	 table+='<td>'+item.forSale_HouseType  +'</td>';
        	 table+='</tr>';
        })
        table+='</tbody></table>';
        table+='<table>';
        table+='<tr><td> <div class="col-sm-4">';
        table+='<select class="selectpicker form-control show-tick show4">';
        table+='<option value="enterprise_ID">기업ID로 검색</option>';
        table+='<option value="forSale_Title">제목으로 검색</option>';
        table+='<option value="forSale_Status">거래 형태로 검색</option>';
        table+='<option value="forSale_Indate">날짜로 검색</option>';
        table+='<option value="forSale_HouseType">매물 종류로 검색</option>';
        table+='</select></div>';
        table+='<div class="col-sm-8">';
        table+='<div class="input-group">';
        table+='<input type="text" class="form-control" id = "search4" placeholder="검색">';
        table+='<span class="input-group-btn">';
        table+='<button class="btn btn-default default4" type="button">Search</button></span></div></div></td>';
        table+='</tr>';
        table+='</table>';
        $(".itemTable").html(table);
        
        $(".default4").on("click", function(){
        	var searchSelect = $(".show4").val();
        	var search = $("#search4").val();
        	adminItemBoard(searchSelect, search);
        })
    }
    
    function adminItemDelete(){
    	$(".itemBoardDelete").on("click", function(){
    		var seq = $(this).attr("data_bSeq");
    		$.ajax({
    			url:"adminItemDelete"
    			,data:{forSale_Seq:seq}
    			,type:"post"
    			,success:function(result){
    				if (result == 1) {
    					var url = "adminItemList"; 
			    		$(location).attr('href',url);
					}
    			} //success
    		}); //ajax
    	});
    }
}(jQuery));
