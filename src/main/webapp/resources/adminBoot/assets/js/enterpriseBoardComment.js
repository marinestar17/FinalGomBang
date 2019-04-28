(function ($) {
    'use strict';
    $(function () {
    	 enterpriseComment();
         printEnterpriseComment();	
         insertEnterpriseComment();
         deleteEnterpriseBoard();

         
        //관리자가 기업 게시물에 덧글달기 ...
           function insertEnterpriseComment(){
        	   $("#adminEnterpriseCommentButton").on("click", function(){
        		   var seq = $("#enterpriseBoard_Seq").val();
            	   var content = $("#enterpriseComment_Content").val();
        		   $.ajax({
            		   url:"adminInsertEnterpriseComment"
            		   ,data:{enterpriseComment_Content:content, enterpriseBoard_Seq:seq}
            	       ,type:"post"
            	       ,success:function(result){
            	    	   if (result ==1) {
    						enterpriseComment();
    						$("#enterpriseComment_Content").val("");
    						//location.reload();
            	    	   }
            	       } //success
            	   });//ajax
        	   }) //button function
           }
           
        //게시판 덧글 가져오기
		   function enterpriseComment(){
			   var seq = $("#enterpriseBoard_Seq").val();
			   $.ajax({
				   url:"adminEnterpriseBoardComment"
				   ,data:{enterpriseBoard_Seq:seq}
			   	   ,type:"get"
			   	   ,success:function(list){
			   		   printEnterpriseComment(list);
			   	   }//success
			   });
		   }
    	   
    	   //게시판 덧글 출력하기
    	   function printEnterpriseComment(list){
    		   var table = '';
    		   table+= '<table class="table">';
    	       table+='<thead><tr>';
    	       table+='<th width = "10%";>ID</th>';  
    	       table+='<th width = "60%";>Content</th>';  
    	       table+='<th width = "20%";>INDATE</th>';
    	       table+='<th width = "10%";>Delete</th>';
    	       table+='</tr></thead>';
    	       table+='<tbody>';
    	       $.each(list,function(index,item){
    	    	 table+='<tr>';
    	    	 table+='<td>'+item.enterprise_ID +'</td>';
    	      	 table+='<td>'+item.enterpriseComment_Content +'</td>';
    	      	 table+='<td>'+item.enterpriseComment_Indate+'</td>';
    	      	 table+='<td> <button type="button" data_cSeq = "'+item.enterpriseComment_Seq+'" class="btn btn-default deleteEnterpriseComment">x</button></td>'
    	      	 table+='</tr>';
    	       })//each
    	       table+='</tbody></table>';
    	       table+='<table>';
    	       $(".enterpriseBoardCommentList").html(table);
    	       $(".deleteEnterpriseComment").on("click", function(event){
    	    	   deleteEnterpriseComment($(event.target));
    	       })
    	   }
    	   
    	   //기업 게시물 덧글 삭제
    	   function deleteEnterpriseComment(target){
    		   var seq = $(target).attr('data_cSeq');
    		   $.ajax({  
    			   url:"adminDeleteEnterpriseComment"
    			   ,type:"post"
    			   ,data:{enterpriseComment_Seq:seq}
    		       ,success:function(result){
    		    	   if (result == 1) {
    		    		   enterpriseComment();
					} else {
						alert(seq);
					}
    		       }//success
    		   }); //ajax
    	   }
    	   
    	//기업 게시판 글 삭제
    	function deleteEnterpriseBoard(){
    		$(".enterpriseBoardDelete").on("click", function(){
    			var seq = $(this).attr("data_bSeq");
    			$.ajax({
    				url:"adminDeleteEnterpriseBoard"
    				,data:{enterpriseBoard_Seq:seq}
    				,type:"post"
    				,success: function(result){
    					if (result == 1) {
    						var url = "adminEnterpriseBoardList"; 
    			    		$(location).attr('href',url);
						}
    				}//success
    			});//ajax
    		})
    	}// function
    	
    });
}(jQuery));
