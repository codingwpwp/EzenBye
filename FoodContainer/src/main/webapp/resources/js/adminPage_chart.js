$(document).ready(function(){
	var context = document.getElementById('settlementChart').getContext('2d');
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
	    },
	    options: {responsive : false}
	});
})
