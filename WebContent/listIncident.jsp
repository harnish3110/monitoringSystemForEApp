<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List Incident</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>

	<div class="container">
			<div class="row">
		<div class="col-sm-9">
				<h3>
					Welcome
					<%=session.getAttribute("firstName")%></h3>
			</div>
					<div>
				<br/> <a href="Logout">Logout</a>
					</div>
				<br/>
				<br> <a href="index.jsp">Home</a>
			<div id='incidentList'></div>
		</div>
	</div>



	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

	<!-- JQuery -->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"
		type="text/javascript"></script>

	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"
		type="text/javascript"></script>
	<script
		src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"
		type="text/javascript"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$.ajax({
				type : 'GET',
				url : 'ListAllIncident',
				success : function(response) {
					console.log(response);
					console.log('success');
					$('#incidentList').html(response);
					$('#listAllIncident').DataTable({
						"paging" : true,
						"ordering" : false,
						"info" : false,
						"pageLength": 5
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