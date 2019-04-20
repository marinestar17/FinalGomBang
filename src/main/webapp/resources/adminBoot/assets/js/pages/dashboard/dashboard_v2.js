(function ($) {
    'use strict';
    $(function () {
    	$(function(){
    		mainPageChart();
    	}) 
    	
    	
        //Init sparkline
        $('[data-sparkline="true"]')
            .each(function (i, key) {
                var type = $(key).data('type');
                var height = $(key).data('height');
                var barColor = $(key).data('barColor');

                height = height === undefined ? 24 : height;
                barColor = barColor === undefined ? '#d2d2d2' : barColor;

                $(key)
                    .sparkline('html',
                    {
                        type: type,
                        barColor: barColor,
                        height: height,
                        chartRangeMin: 0
                    });
            });

        //Init flot chart
        
        function mainPageChart(){
	        var customer = [];
	        var enterprise = [];
	        var forSale = [];
        	var data = [];
        	var reservation = [];
        	var y = [];
        	
        	
	        $.ajax({
	        	url:"mainPageEnterprise"
	        	,type:"get"
	        	,data:{}
	        	,success:function(list){
	        		$.each(list,function(index,item){
	        			enterprise[index]=item.stats_Count;
	        		})// each
	        		
	        		
	        		 $.ajax({
	        	url:"mainPageCustomer"
	        	,type:"get"
	        	,data:{}
	        	,success:function(list){
	        		$.each(list,function(index,item){
	        			//customer.push([item.customer_Indate , item.stats_Count]);
	        			y[index]=item.customer_Indate;
	        			customer[index]=item.stats_Count;
	        		})// each
	        		
	        		  $.ajax({
	      	        	url:"mainPageItem"
	      	        	,type:"get"
	      	        	,data:{}
	      	        	,success:function(list){
	      	        		$.each(list,function(index,item){
	      	        			forSale[index]=item.stats_Count;
	      	        		})// each
	      	        		
	      	        		$.ajax({
			      	        			url:"mainPageReservation"
			      	        			,type:"get"
			      	        			,data:{}
			      	        			,success:function(list){
			      	        				$.each(list,function(index,item){
					      	        			reservation[index]=item.stats_Count;
					      	        		})// each
					      	        		
					      	        	  for(var i=0;i<8;i++){
						    	      	    	data[i]={y:y[i],a:enterprise[i],b:customer[i],c:forSale[i], d:reservation[i]};
						    	      	      }
						    	      	      
						    	      	    Morris.Line({
						    	                element: 'line_chart',
						    	                data: data,
						    	                xkey: 'y',
						    	                ykeys: ['a', 'b', 'c', 'd'],
						    	                labels: ['Enterprises', 'Customers', 'Items', 'Reservation'],
						    	                hideHover: 'auto',
						    	                resize: true,
						    	                lineColors: ['#f6b225', '#DA4453', '#16a085', '#050099']
						    	            }); //MORRIS
						      	        	} //success
						      	        }); //ajax 
	      	        	} //success
	      	        }); //ajax 
	      	       
	        	} //success
	        }); //ajax
	        		
	        	} //success
	        }); //ajax
	        
	       
	         
	      
	        /*for(var i=0;i<5;i++){
	        	enterprise[i]
	        	customer[i]
	        	forSale[i]
	        }*/
	        
	   
	        
        } //function
        
        //Init peity chart
        $("span.pie")
            .peity("pie",
            {
                fill: ['#009688', '#ddd']
            });

        //Exportable table
        $('.js-exportable').DataTable({
            responsive: true,
            dom: '<"html5buttons"B>lTfgtip',
            buttons: ['copy', 'csv', 'excel', 'pdf', 'print']
        });

        //To-Do List
        //Check or uncheck to-do item
        $('.todo-list').on('click', 'li', function (e) {
            if ($(e.target).closest('.controls, .move-handle').length === 0) {
                $(this).find('input').iCheck('toggle');
            }
        });

        //Init sortable
        $('.todo-list').sortable({
            handle: '.move-handle'
        });

        //Delete to-do item
        $('.todo-list').on('click', '.js-delete-todo', function() {
           $(this).parents('li').fadeOut(500, function () {
        	   var seq = $(this).attr('data-seq');
        	   $.ajax({
        		   url:"deleteTODO"
        		  ,type:"post"
        		  ,data:{adminTodo_Seq:seq}
        	      ,success: function(){
        	    	  $(this).remove();
        	      }
        	   });;//ajax
            });
        	
        });
        
        //update todo
        $('.todo-list').on('click', '.updateTODO', function(event) {
        	$(".js-btn-add-item").val("수정");
        	var seq= $(this).attr('data-seq');
        	var content = $("li[data-seq='"+seq+"'] .item_Content").html();
        	$(".js-input").val(content);
        	$("#insert_update").val(seq);
        	
         });
        

        //Init switch buttons
        var $switchButtons = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));
        $switchButtons.forEach(function (e) {
            var size = $(e).data('size');
            var options = {};
            options['color'] = '#009688';
            if (size !== undefined) options['size'] = size;

            var switchery = new Switchery(e, options);
        });

        //Add item
        $('.js-btn-add-item').on('click', addToItem);
        $('.js-input').on('keyup', function (event) {
            var key = event.keyCode || event.which;
            if (key === 13) addToItem();
        });

        //Init iCheckbox
        setICheckbox();
        function setICheckbox() {
            $('input:not(.js-switch)').iCheck({
                checkboxClass: 'icheckbox_flat-green',
                radioClass: 'iradio_flat-green'
            });

            $('input:not(.js-switch)').on('ifToggled', function (e) {
                $(this).parents('li').toggleClass('closed');
            });
        }

        //Add to-do item to list
        function addToItem() {
            var $input = $('.js-input');
            var $toDoList = $('.todo-list');
            var item = $input.val();
            var id = $(".admin_ID").val();
            var seq = $("#insert_update").val();
            
            if (seq == 0) {
            	 $.ajax({
                 	url:"insertTODO"
                 	,data: {admin_ID:id, adminTodo_Content:item}
                 	,type:"post"
                 	,success: function(result){
                 		printItem();
                 	}
                 }); //ajax
			} else {
				$.ajax({
					url:"updateTODO"
					,data:{admin_ID:id, adminTodo_Content:item, adminTodo_Seq:seq}
					,type:"post"
					,success:function(){
						printItem();
						$("#insert_update").val(0);
						$(".js-btn-add-item").val("등록");
					}
				}); //ajax
			} //else
           
          /*  if (item !== '') {
                var newItemHtml = '<li>' +
                                  '   <a href="javascript:void(0);" title="Move"><i class="fa fa-arrows move-handle"></i></a>' +
                                  '   <input type="checkbox" />' +
                                  '   <span>' + item + '</span>' +
                                  '   <span class="controls pull-right">' +
                                  '       <a href="javascript:void(0);" title="Edit"><i class="fa fa-pencil"></i></a>' +
                                  '       <a href="javascript:void(0);" title="Delete"><i class="fa fa-trash js-delete-todo"></i></a>' +
                                  '   </span>' +
                                  '</li>';

                $toDoList.append(newItemHtml);
                $input.val('');
            }

            $input.focus();
            setICheckbox();*/
        }
        
        function printItem(){
         	 var $input = $('.js-input');
              var $toDoList = $('.todo-list');
              var item = $input.val();
              var id = $(".admin_ID").val();
         	$.ajax({
         		url:"printTODO"
         		,data:{admin_ID : id}
         		,type:"get"
         		,success: function(list){
         			$toDoList.empty();
         			var table  = '';
         			console.log([list]);
         			$.each(list, function(index,item){
         				table +=	'<li data-seq="'+item.adminTodo_Seq+'">' +
   	                    '   <a href="javascript:void(0);" title="Move"><i class="fa fa-arrows move-handle"></i></a>' +
   	                    '   <input type="checkbox" />' +
   	                    '   <span class = "item_Content" data-seq="'+item.adminTodo_Seq+'">' + item.adminTodo_Content + '</span>' +
   	                    '   <span class="controls pull-right">' +
   	                    '       <a href="javascript:void(0);" title="Edit"><i class="fa fa-pencil updateTODO" data-seq="'+item.adminTodo_Seq+'"></i></a>' +
   	                    '       <a href="javascript:void(0)" title="Delete"><i class="fa fa-trash js-delete-todo" ></i></a>' +
   	                    '   </span>' +
   	                    '</li>';
         			})//each
         			
         			$toDoList.append(table);
                     $input.val('');
                     $input.focus();
                     setICheckbox();
         		} //success
         	})
         }// function
        
        
    });
}(jQuery));
