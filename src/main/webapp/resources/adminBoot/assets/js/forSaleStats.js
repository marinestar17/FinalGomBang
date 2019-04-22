(function ($) {
    'use strict';
    $(function () {
    	countForSaleRent();
    	countHouseType();
    	enterpriseItemCount();
    	bestItemCity();
    	shikirei();
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
    function enterpriseItemCount(){
    	var data = [];
    	$.ajax({
    		url:"enterpriseItemCount"
    		,data:{}
    		,type:"get"
    		,success: function(list){
    			$.each(list, function(index,item){
    				data.push({ y: item.enterprise_ID, a:item.stats_Count});
    			}) //each
    				Morris.Bar({
    	                element: 'bar_chart',
    	                data:data,
    	                xkey: 'y',
    	                ykeys: ['a'],
    	                labels: ['최대 매물 수'],
    	                barColors: ['#f6b225']
    	            });
    		} //success 
    	});
    }
    
    function bestItemCity(){
    	var data = [];
    	$.ajax({
    		url:"bestItemCity"
    		,data:{}
    		,type:"get"
    		,success:function(list){
    			$.each(list,function(index,item){
    				data.push({y:item.geoapi_cities, a:item.stats_Count});
    			})
    			Morris.Bar({
	                element: 'bar_chart2',
	                data:data,
	                xkey: 'y',
	                ykeys: ['a'],
	                labels: ['최대 매물 수'],
	                barColors: ['#6B9900']
	            });
    		}
    	});
    }
    
    function shikirei(){
    	var all = 0;
    	var deposit = 0;
    	var reward = 0;
    	var no = 0;
    	
    	$.ajax({
    		url:"countShikiRei"
    		,data:{}
    		,type:"get"
    		,success:function(hMap){
    			all = hMap["ALL_ZERO"];
    			no = hMap["NO_ZERO"];
    			deposit = hMap["D_ZERO"];
    			reward = hMap["R_ZERO"];
    			
    			Morris.Donut({
                    element: 'donut_chart3',
                    data: [
                        { label: '둘 다 0', value: all },
                        { label: '시키킹=0', value: reward },
                        { label: '레이킹=0', value: deposit },
                        { label: '둘 다 존재', value: no },
                    ],
                    colors: ['#F2CB61', '#670000' , '#A566FF' , '#0054FF'],
                    formatter: function (y) {
                        return y + '개';
                    }
                });
    		}
    	});
    }
    //Init donut chart - 기업 분류별 통계
    function countForSaleRent() {
    	var r_count;
    	var s_count;
    	
    	$.ajax({
    		url:"countForSaleRent"
    		,data:{}
    		,type:"get"
    		,success:function(hMap){
    			r_count = hMap["R_COUNT"];
    			s_count = hMap["S_COUNT"];
    			Morris.Donut({
                    element: 'donut_chart',
                    data: [
                        { label: '임대', value: r_count },
                        { label: '판매', value: s_count },
                    ],
                    colors: ['#f6b225', '#DA4453'],
                    formatter: function (y) {
                        return y + '개';
                    }
                });
    		}
    		
    	});
      }
        
    
    function countHouseType(){
		var data = [];
		$.ajax({
			url:"countHouseType"
			,data:{}
			,type:"get"
			,success:function(list){
				$.each(list, function(index,item){
					data.push({ label: item.forSale_HouseType, value: item.stats_Count });
				})//each
				Morris.Donut({
                    element: 'donut_chart2',
                    data: data,
                    colors: ['red', 'blue','green','black', 'pink'],
                    formatter: function (y) {
                        return y + '개';
                    }
                });
			}//success
			,error: function(){
				alert("!");
			}
		}); //ajax
	}//function
       
        
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
