(function ($) {
    'use strict';
    $(function () {

    	enterpriseCodeStats();

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
        function enterpriseCodeStats() {
        	
           /* Morris.Donut({
                element: 'donut_chart',
                data: [
                    { label: 'Series A', value: 40 },
                    { label: 'Series B', value: 32 },
                    { label: 'Series C', value: 28 }
                ],
                colors: ['#f6b225', '#DA4453', '#16a085'],
                formatter: function (y) {
                    return y + '%';
                }
            });*/
        	
        	$.ajax({
        		url: "enterpriseCodeStats"
        		,data:{}
        		,type:"get"
        		,success:function(eList){
        			var data = [];
        			$.each(eList, function(index,item){
        				data.push( {label: item.enterprise_Code, value: item.stats_Count});
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
        	});//ajax
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
