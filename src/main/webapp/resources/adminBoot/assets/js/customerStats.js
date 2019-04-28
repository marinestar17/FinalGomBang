(function ($) {
    'use strict';
    $(function () {

    	customerGenderStats();
    	customerAgeStats();

        //Init line chart
      /*  function initLineChart() {
            Morris.Line({
                element: 'line_chart',
                data: [
                    { y: '2011', a: 60, b: 50, c: 40 },
                    { y: '2012', a: 40, b: 30, c: 20 },
                    { y: '2013', a: 60, b: 50, c: 40 },
                    { y: '2014', a: 40, b: 30, c: 20 },
                    { y: '2015', a: 60, b: 50, c: 40 },
                    { y: '2016', a: 40, b: 30, c: 20 }
                ],
                xkey: 'y',
                ykeys: ['a', 'b', 'c'],
                labels: ['Series A', 'Series B', 'Series C'],
                hideHover: 'auto',
                resize: true,
                lineColors: ['#f6b225', '#DA4453', '#16a085']
            });
        }*/

        //Init bar chart
      /*  function initBarChart() {
            Morris.Bar({
                element: 'bar_chart',
                data: [
                    { y: '2016 Q1', a: 5, b: 2, c: 3 },
                    { y: '2016 Q2', a: 2, b: 3, c: 1 },
                    { y: '2016 Q3', a: 3, b: 2, c: 4 },
                    { y: '2016 Q4', a: 2, b: 4, c: 3 }
                ],
                xkey: 'y',
                ykeys: ['a', 'b', 'c'],
                labels: ['Series A', 'Series B', 'Series C'],
                barColors: ['#f6b225', '#DA4453', '#01C0C8']
            });
        }*/

        //Init area chart
        /*function initAreaChart() {
            Morris.Area({
                element: 'area_chart',
                data: [
                    { y: '2011', a: 60, b: 50 },
                    { y: '2012', a: 40, b: 30 },
                    { y: '2013', a: 60, b: 50 },
                    { y: '2014', a: 40, b: 30 },
                    { y: '2015', a: 60, b: 50 },
                    { y: '2016', a: 40, b: 30 }
                ],
                xkey: 'y',
                ykeys: ['a', 'b'],
                labels: ['Series A', 'Series B'],
                pointSize: 2,
                hideHover: 'auto',
                lineColors: ['#DA4453', '#16a085']
            });
        }
*/
        //Init donut chart - 기업 분류별 통계
    	function customerGenderStats(){
        	$.ajax({
        		url:"customerGenderStats"
        		,data:{}
        		,type:"post"
        		,success:function(list){
        			var data = [];
        			$.each(list, function(index,item){
        				data.push( {label: item.customer_Gender, value: item.stats_Count});
        			})
        			   Morris.Donut({
        		            element: "donut_chart",
        		            data: data,
        		            colors: ['#f6b225', '#DA4453', '#16a085'], 
        		            fomatter: function(y){
        		            	return y;
        		            }
        		        });
        		}
        	});
        }
        
    	function  customerAgeStats(){
    		$.ajax({
    			url: "customerAgeStats"
    			,data:{}
    			,type: "post"
    			,success: function(list){
    				var data = [];
    				var age10 = 0;
    				var age20 = 0;
    				var age30 = 0;
    				var age40 = 0;
    				var age50 = 0;
    				
    				$.each(list, function(index,item){
    					data.push(item.stats_Count);
    					if (data[index] <20) {
    						age10 = (age10)+1;
    					} else if (data[index]<30 && data[index]>19 ){
    						age20 =(age20)+1;
    					} else if(data[index]<40 && data[index]>29 ){
    						age30 =(age30)+1;
    					} else if(data[index]<50 && data[index]>39 ){
    						age40 =(age40)+1;
    					} else{
    						age50 =(age50)+1;
    					}
    				})
    				  new Morris.Bar({
    			        	element: "bar_chart",
    			        	data: [
    			        		    { y: '1~19', a: age10},
    			        		    { y: '20~29', a: age20},
    			        		    { y: '30~39', a: age30},
    			        		    { y: '40~49', a: age40},
    			        		    { y: '50~', a: age50},
    			        		  ],   
    			        		  xkey: 'y',
    			        		  ykeys: ['a'],
    			        		  labels: ['Number'],
    				  			  gredTextSize: 15,
    				  			  barColors: ['blue']
    			        });
    			} //function
    		})
    	}

        //고객 성별 통계용
     /*   function customerGenderStats(){
        	$.ajax({
        		url:"customerGenderStats"
        		,data:{}
        		,type:"get"
        		,success:function(list){
        			var data = [];
        			$.each(eList, function(index,item){
        				data.push( {label: item.customer_Gender, value: item.stats_Count});
        			})
        			   Morris.Donut({
        		            element: "donut_chart",
        		            data: data,
        		            colors: ['#f6b225', '#DA4453', '#16a085'], 
        		            fomatter: function(y){
        		            	return y + "개";
        		            }
        		        });
        		}
        	});
        }*/
        
        //Init switch buttons
        var $switchButtons = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));
        $switchButtons.forEach(function (e) {
            var size = $(e).data('size');
            var options = {};
            options['color'] = '#009688';
            if (size !== undefined) options['size'] = size;

            var switchery = new Switchery(e, options);
        });
    });
}(jQuery));
