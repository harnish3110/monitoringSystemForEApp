<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Details</title>
</head>
<body>
	<%
		if (session.getAttribute("firstName") == null) {
			response.sendRedirect("login.jsp");
		}
	%>
	<jsp:include page="./header.jsp" />

	<div class="w3-top">
		<div class="w3-bar w3-white w3-wide w3-padding w3-card">
			<a href="#home" class="w3-bar-item w3-button"><b>E-App</b>
				Monitoring</a>
			<!-- Float links to the right. Hide them on small screens -->
			<div class="w3-right w3-hide-small">
				<a href="./index.jsp" class="w3-bar-item w3-button">Home</a> <a
					href="Logout" class="w3-bar-item w3-button">Logout</a>
			</div>
		</div>
	</div>


	<div class="w3-content w3-padding" style="max-width: 1564px">

		<!-- Project Section -->
		<div class="w3-container w3-padding-32" id="users">
			<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">
				<c:out value="${uName}" />
			</h3>

			<div class="w3-row-padding">
				<div class="w3-col" id="listAll">
					<table class='display table table-striped table-bordered'
						cellspacing='0' width='100%'>
						<thead>
							<tr>
								<th>ID</th>
								<th>Description</th>
								<th>Time Of Event</th>
								<th>Type</th>
								<th>Source ID</th>
								<th>Source</th>
								<th>URL</th>
								<th>Size</th>
								<th>Details</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${incidentsRecieved}" var="incident">
								<tr>
									<td id="incidentId" name="incidentId"><c:out
											value="${incident.incidentId}" /></td>
									<td><c:out value="${incident.description}" /></td>
									<td><c:out value="${incident.timeOfEvent}" /></td>
									<td><c:out value="${incident.incidentType}" /></td>
									<td><c:out value="${incident.sourceId}" /></td>
									<td><c:out value="${incident.source}" /></td>
									<td><a href="${incident.url}" target="_blank"><c:out
												value="${incident.url}" /></a></td>
									<td><c:out value="${incident.incidentSize}" /></td>
									<td><a id="incident_${incident.incidentId}"
										class="btn btn-primary login-button"
										href="IncidentDetails?incidentId=${incident.incidentId}&desc=${incident.description}">Details</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="w3-container">
				<!-- <img src="/w3images/map.jpg" class="w3-image" style="width: 100%"> -->
				<h1 class="w3-border-bottom w3-border-light-grey w3-padding-16">
					Pie Chart</h1>
				<canvas id="pie-chart" class="chartjs" width="900" height="300"></canvas>
			</div>
		</div>
		<div class="w3-container w3-padding-32" id="users">
			<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">
				Bluetooth List for
				<c:out value="${uName} " />
			</h3>

			<div class="w3-row-padding">
				<div class="w3-col" id="listAll">
					<table class='display table table-striped table-bordered'
						cellspacing='0' width='100%'>
						<thead>
							<tr>
								<th>Id</th>
								<th>User</th>
								<th>Name</th>
								<th>Type</th>
								<th>Address</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${bluetooths}" var="bluetooth">
								<tr>
									<td><c:out value="${bluetooth.blutoothId}" /></td>
									<td><c:out value="${bluetooth.userId}" /></td>
									<td><c:out value="${bluetooth.name}" /></td>
									<td><c:out value="${bluetooth.type}" /></td>
									<td><c:out value="${bluetooth.address}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>


	</div>



	<jsp:include page="./footer.jsp" />
	<script type="text/javascript">
		$(document).ready(function() {
			recieved = '${incidentsRecCount}';
			total = '${tottalIncidents}';
			new Chart(document.getElementById("pie-chart"), {
				type : 'doughnut',
				data : {
					labels : [ "Recieved", "Not Recieved", ],
					datasets : [ {
						label : "Incident Track in %",
						backgroundColor : [ "#3e95cd", "#c45850" ],
						data : [ recieved, total ]
					} ]
				},
				options : {
					title : {
						display : true,
						text : 'Incident Track For ${uName} in %'
					}
				}
			});
		});
	</script>

</body>
</html>