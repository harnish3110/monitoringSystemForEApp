<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Home</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Bootstrap -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"
	type="text/javascript"></script>

<script type="text/javascript">
	
</script>



</head>
<body>
	<%
		if (session.getAttribute("firstName") == null) {
			response.sendRedirect("login.jsp");
		}
	%>



	<div class="container">
		<div class="row">
			<div class="col-sm-9">
				<h3>
					Welcome
					<%=session.getAttribute("firstName")%></h3>
			</div>
			<div>
				<br /> <a href="Logout">Logout</a><br /> <br /> <a
					href="listIncident.jsp">Incidents</a>
			</div>
			<div id='listAll'></div>
			<div>
				<canvas id="pie-chart" width="600" height="300"></canvas>
			</div>
		</div>
	</div>
	<!-- JQuery Chart -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

	<!-- JQuery -->


	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"
		type="text/javascript"></script>
	<script
		src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"
		type="text/javascript"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			new Chart(document.getElementById("pie-chart"), {
				type : 'pie',
				data : {
					labels : [ "Recieved", "Not Recieved", ],
					datasets : [ {
						label : "Incident Track in %",
						backgroundColor : [ "#3e95cd", "#c45850" ],
						data : [ 4, 6 ]
					} ]
				},
				options : {
					title : {
						display : true,
						text : 'Incident Track For Amber Alert in %'
					}
				}
			});
			$.ajax({
				type : 'GET',
				url : 'RetrieveData',
				success : function(response) {
					console.log(response);
					console.log('success');
					$('#listAll').html(response);
					$('#listAllUser').DataTable({
						"paging" : true,
						"ordering" : false,
						"info" : false,
						"pageLength" : 5
					});

				},
				failure : function(error) {
					console.log('fail');
					console.log(error)
				}
			});
			console.log('data');
		});
	</script>

</body>
</html>