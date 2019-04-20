(function ($) {
    'use strict';
    $(function () {
    	 customerComment();
         printCustomerComment();	
         insertCustomerComment();
         deleteCustomerBoard();
         
         
        //관리자가 고객 게시물에 덧글달기 ...
           function insertCustomerComment(){
        	   $("#adminCustomerCommentButton").on("click", function(){
        		   var seq = $("#customerBoard_Seq").val();
            	   var content = $("#customerComment_Content").val();
        		   $.ajax({
            		   url:"adminInsertCustomerComment"
            		   ,data:{customerComment_Content:content, customerBoard_Seq:seq}
            	       ,type:"post"
            	       ,success:function(result){
            	    	   if (result ==1) {
    						customerComment();
    						$("#customerComment_Content").val("");
            	    	   }
            	       } //success
            	   });//ajax
        	   }) //button function
           }
           
        //게시판 덧글 가져오기
		   function customerComment(){
			   var seq = $("#customerBoard_Seq").val();
			   $.ajax({
				   url:"adminCustomerBoardComment"
				   ,data:{customerBoard_Seq:seq}
			   	   ,type:"get"
			   	   ,success:function(list){
			   		   printCustomerComment(list);
			   	   }//success
			   });
		   }
    	   
    	   //게시판 덧글 출력하기
    	   function printCustomerComment(list){
    		   var table = '';
    		   table+= '<table class="table">';
    	       table+='<thead><tr>';
    	       table+='<th width = "10%";>ID</th>';  
    	       table+='<th width = "60%";>내용</th>';  
    	       table+='<th width = "20%";>INDATE</th>';
    	       table+='<th width = "10%";>삭제</th>';
    	       table+='</tr></thead>';
    	       table+='<tbody>';
    	       $.each(list,function(index,item){
    	    	 table+='<tr>';
    	    	 table+='<td>'+item.customer_ID +'</td>';
    	      	 table+='<td>'+item.customerComment_Content +'</td>';
    	      	 table+='<td>'+item.customerComment_Indate+'</td>';
    	      	 table+='<td> <button type="button" data_cSeq = "'+item.customerComment_Seq+'" class="btn btn-default deleteCustomerComment">x</button></td>'
    	      	 table+='</tr>';
    	       })//each
    	       table+='</tbody></table>';
    	       table+='<table>';
    	       $(".customerBoardCommentList").html(table);
    	       $(".deleteCustomerComment").on("click", function(event){
    	    	   deleteCustomerComment($(event.target));
    	       })
    	   }
    	   
    	   //고객 게시물 덧글 삭제
    	   function deleteCustomerComment(target){
    		   var seq = $(target).attr('data_cSeq');
    		   alert(seq);
    		   $.ajax({  
    			   url:"adminDeleteCustomerComment"
    			   ,type:"post"
    			   ,data:{customerComment_Seq:seq}
    		       ,success:function(result){
    		    	   if (result == 1) {
    		    		   customerComment();
					} else {
						alert(seq);
					}
    		       }//success
    		   }); //ajax
    	   }
    	   
    	//고객 게시판 글 삭제
    	function deleteCustomerBoard(){
    		$(".customerBoardDelete").on("click", function(){
    			var seq = $(this).attr("data_bSeq");
    			$.ajax({
    				url:"adminDeleteCustomerBoard"
    				,data:{customerBoard_Seq:seq}
    				,type:"post"
    				,success: function(result){
    					if (result == 1) {
    						var url = "adminCustomerBoardList"; 
    			    		$(location).attr('href',url);
						}
    				}//success
    			});//ajax
    		})
    	}// function
    	
    });
}(jQuery));
