$(document).ready(function(){
	var context = document.getElementById('middleSort').getContext('2d');
	var myChart = new Chart(context, {
	    type: 'pie',
	    data: {
	        labels: ['볶음밥','치킨,만두','국','반찬','컵밥,햇반'],
	        datasets: [{
	            data: [
	                $("input[name='볶음밥']").val(),
	                $("input[name='치킨,만두']").val(),
	                $("input[name='국']").val(),
	                $("input[name='반찬']").val(),
	                $("input[name='컵밥,햇반']").val()
	            ],
	            backgroundColor: [
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(153, 102, 255, 0.2)'
	            ],
	            borderWidth: 2,
	            hoverBorderWidth: 5,
	            borderColor: [
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 99, 132, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(153, 102, 255, 1)'
	            ]
	    	}]
	    }
	});

	var ctx2 = document.getElementById('revenue').getContext('2d');
	var chart = new Chart(ctx2, {
	    type: 'bar',
	    data: {
	        labels: ['상품 수익','배송비','쿠폰비','적립금'],
	        datasets: [{
                data: [
					$("input[name='상품 수익']").val(),
	                $("input[name='배송비']").val(),
	                $("input[name='쿠폰비']").val(),
	                $("input[name='적립금']").val()
	            ],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.5)',
                    'rgba(255, 159, 64, 0.5)',
                    'rgba(54, 162, 235, 0.5)',
                    'rgba(153, 102, 255, 0.5)',
                ],

                borderWidth: 2,

                borderColor: [
                    'red',
                    'rgba(255, 159, 64, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(153, 102, 255, 1)'
                ],

                hoverBorderWidth: 3
	        }]
	    },
        options: {
            plugins: {
                legend: {
                    display: false
                }
            }
        }
    });
    
	var ctx3 = document.getElementById('revenue2').getContext('2d');
	var chart = new Chart(ctx3, {
	    type: 'bar',
	    data: {
	        labels: ['상품 수익','배송비','쿠폰비','적립금'],
	        datasets: [{
                data: [
					$("input[name='상품 수익']").val(),
	                $("input[name='배송비']").val(),
	                $("input[name='쿠폰비']").val(),
	                $("input[name='적립금']").val()
	            ],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.5)',
                    'rgba(255, 159, 64, 0.5)',
                    'rgba(54, 162, 235, 0.5)',
                    'rgba(153, 102, 255, 0.5)',
                ],

                borderWidth: 2,

                borderColor: [
                    'red',
                    'rgba(255, 159, 64, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(153, 102, 255, 1)'
                ],

                hoverBorderWidth: 3
	        }]
	    },
        options: {
            plugins: {
                legend: {
                    display: false
                }
            }
        }
    });
	
})
