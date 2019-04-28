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
       adminReservation();
       printReservation();
       adminTrade();
       printTrade();
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
    			var result=  'En:' + e_count + ' Cus:' + c_count;  
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
    			var result=  y_reservation + ' / ' + n_reservation  
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
    			var result = count + 'Items';
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
    				var result = (b_count)+ '/' + (e_count);
    				
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
    				alert("Deny Complete");
    				location.href = "allEnterprisePrint";
    			}
    		});//ajax
    	})
    } //function
    
    function permissionAccept(){
    	$("#permissionAcceptButton").on("click", function(){
    		var id = $(this).attr("data-ID");
    		$.ajax({
    			url:"enterprisePermissionAccept"
    			,data:{enterprise_ID:id}
    			,type:"post"
    			,async: false
    			,success:function(){
    				alert("Accept Complete");
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
        table+='<option value="admin_ID">ID</option>';
        table+='<option value="adminMessage_Content">Content</option>';
        table+='<option value="adminMessage_Indate">Date</option>';
        table+='</select></div>';
        table+='<div class="col-sm-8">';
        table+='<div class="input-group">';
        table+='<input type="text" class="form-control" id = "search" placeholder="Search">';
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
        table+='<option value="customer_ID">ID</option>';
        table+='<option value="customerboard_Title">Title</option>';
        table+='<option value="customerboard_Indate">Date</option>';
        table+='</select></div>';
        table+='<div class="col-sm-8">';
        table+='<div class="input-group">';
        table+='<input type="text" class="form-control" id = "search2" placeholder="Search">';
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

    //기업 게시판 출ㄺ
    function printEnterpriseBoard(list){
    	var table = '';
		table+= '<table class="table">';
        table+='<thead><tr>';
        table+='<th>#</th>';
        table+='<th>ID</th>';  
        table+='<th>TITLE</th>';
        table+='<th>INDATE</th>';
        table+='<th>HITCOUNT</th>';
        table+='<th>ADMINCHECK</th>';
        table+='</tr></thead>';
        table+='<tbody><tr>';
        $.each(list,function(index,item){
        	 table+='<td>'+item.enterpriseBoard_Seq +'</td>';
        	 table+='<td>'+item.enterprise_ID +'</td>';
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
        table+='<option value="enterpriseBoard_Title">Title</option>';
        table+='<option value="enterpriseBoard_Indate">Date</option>';
        table+='<option value="enterpriseBoard_AdminCheck">Check</option>';
        table+='</select></div>';
        table+='<div class="col-sm-8">';
        table+='<div class="input-group">';
        table+='<input type="text" class="form-control" id = "search3" placeholder="Search">';
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
    
    //매물 게시판 출력
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
        table+='<option value="enterprise_ID">ID</option>';
        table+='<option value="forSale_Title">Title</option>';
        table+='<option value="forSale_Status">Status</option>';
        table+='<option value="forSale_Indate">Date</option>';
        table+='<option value="forSale_HouseType">HouseType</option>';
        table+='</select></div>';
        table+='<div class="col-sm-8">';
        table+='<div class="input-group">';
        table+='<input type="text" class="form-control" id = "search4" placeholder="Search">';
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
    
    //매물 삭제
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
    
    //예약 리스트 불러오기
    function adminReservation(searchSelect, search){
    	$.ajax({
    		url:"adminReservation"
    		,data:{searchSelect:searchSelect, search:search}
    		,type:"get"
    		,success:function(list){
    			printReservation(list)
    		}
    		,error: function(){
    			alert("zzz");
    		}
    	});
    }
    
    //예약 리스트 출력
    function printReservation(list){
    	var table = '';
		table+= '<table class="table">';
        table+='<thead><tr>';
        table+='<th>#</th>';
        table+='<th>EnterpriseID</th>';  
        table+='<th>CustomerID</th>';  
        table+='<th>ITEM</th>';
        table+='<th>INDATE</th>';
        table+='<th>STATUS</th>'
        table+='</tr></thead>';
        table+='<tbody><tr>';
        $.each(list,function(index,item){
        	 table+='<td>'+item.reservation_Seq +'</td>';
        	 table+='<td>'+item.enterprise_ID +'</td>';
        	 table+='<td>'+item.customer_ID+'</td>';
        	 table+='<td><a href="adminReservationDetail?reservation_Seq='+item.reservation_Seq+'">'+item.forSale_Title  +'</a></td>';
        	 table+='<td>'+item.reservation_Indate  +'</td>';
        	 table+='<td>'+item.reservation_Complete  +'</td>';
        	 table+='</tr>';
        })
        table+='</tbody></table>';
        table+='<table>';
        table+='<tr><td> <div class="col-sm-4">';
        table+='<select class="selectpicker form-control show-tick show5">';
        table+='<option value="enterprise_ID">EnterpriseID</option>';
        table+='<option value="customer_ID">CustomerID</option>';
        table+='<option value="reservation_Complete">Complete</option>';
        table+='<option value="reservation_Indate">Date</option>';
        table+='<option value="forSale_Title">Title</option>';
        table+='</select></div>';
        table+='<div class="col-sm-8">';
        table+='<div class="input-group">';
        table+='<input type="text" class="form-control" id = "search5" placeholder="Search">';
        table+='<span class="input-group-btn">';
        table+='<button class="btn btn-default default5" type="button">Search</button></span></div></div></td>';
        table+='</tr>';
        table+='</table>';
        $(".reservationTable").html(table);
        
        $(".default5").on("click", function(){
        	var searchSelect = $(".show5").val();
        	var search = $("#search5").val();
        	adminReservation(searchSelect, search);
        })
    }
    
    //거래 완료 리스트 가져오기...
    function adminTrade(searchSelect, search){
    	$.ajax({
    		url:"adminTradeBoard"
			,data:{searchSelect:searchSelect, search:search}
			,type:"get"
			,success:function(list){
				printTrade(list);
			}
    	});
    }
    
    //거래 완료 리스트 출력
    function printTrade(list){
    	var table = '';
		table+= '<table class="table">';
        table+='<thead><tr>';
        table+='<th>Reservation NO</th>';
        table+='<th>EnterpriseID</th>';  
        table+='<th>CustomerID</th>';  
        table+='<th>ITEM</th>';
        table+='<th>Reservation Indate</th>';
        table+='<th>TRADE Indate</th>'
        table+='</tr></thead>';
        table+='<tbody><tr>';
        $.each(list,function(index,item){
        	 table+='<td>'+item.reservation_Seq +'</td>';
        	 table+='<td>'+item.enterprise_ID +'</td>';
        	 table+='<td>'+item.customer_ID+'</td>';
        	 table+='<td><a href="adminTradeDetail?reservation_Seq='+item.reservation_Seq+'">'+item.forSale_Title  +'</a></td>';
        	 table+='<td>'+item.reservation_Indate  +'</td>';
        	 table+='<td>'+item.forSale_TradeIndate  +'</td>';
        	 table+='</tr>';
        })
        table+='</tbody></table>';
        table+='<table>';
        table+='<tr><td> <div class="col-sm-4">';
        table+='<select class="selectpicker form-control show-tick show6">';
        table+='<option value="enterprise_ID">EnterpriseID</option>';
        table+='<option value="customer_ID">CustomerID</option>';
        table+='<option value="reservation_Indate">Reser_Date</option>';
        table+='<option value="forSale_TradeIndate">Trade_Date</option>';
        table+='<option value="forSale_Title">Title</option>';
        table+='</select></div>';
        table+='<div class="col-sm-8">';
        table+='<div class="input-group">';
        table+='<input type="text" class="form-control" id = "search6" placeholder="Search">';
        table+='<span class="input-group-btn">';
        table+='<button class="btn btn-default default6" type="button">Search</button></span></div></div></td>';
        table+='</tr>';
        table+='</table>';
        $(".tradeTable").html(table);
        
        $(".default6").on("click", function(){
        	var searchSelect = $(".show6").val();
        	var search = $("#search6").val();
        	adminTrade(searchSelect, search);
        })
    }
}(jQuery));
