<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Home</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	var socialGraphData = '';
	$.ajax({
		type : 'GET',
		url : 'api/getData/socialData',
		success : function(data) {
			console.log('success');
			console.log(data);
			socialGraphData = data;
		},
		error : function(err) {
			console.log('error');
			console.log(err);
		},
	});
</script>
<style type="text/css">
#socialnetwork {
	width: 600px;
	height: 400px;
	border-style: inset;
    margin-left: 30%;
    border-width: medium;
    border-color: cadetblue;
}
</style>


</head>
<body>
	<%
		if (session.getAttribute("firstName") == null) {
			response.sendRedirect("login.jsp");
		}
	%>
	<jsp:include page="./header.jsp" />


	<!-- Header -->
	<header class="w3-display-container w3-content w3-wide"
		style="max-width: 1500px;" id="home">
		<img class="w3-image" src="img/architect.jpg" alt="Architecture"
			width="1500" height="800">
		<div class="w3-display-middle w3-margin-top w3-center">
			<h1 class="w3-xxlarge w3-text-white">
				<span class="w3-padding w3-black w3-opacity-min"><b>E-App</b></span>
				<span class="w3-hide-small w3-text-light-grey">Monitoring</span>
			</h1>
		</div>
	</header>

	<!-- Users content -->
	<div class="w3-content w3-padding" style="max-width: 1564px">
	<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Social Interaction for Users</h3>
		<div id="socialnetwork" class="d-flex justify-content-center"></div>

		<!-- Project Section -->
		<div class="w3-container w3-padding-32" id="users">
			<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Users</h3>

			<div class="w3-row-padding">
				<div class="w3-col" id="listAll">
					<form action="#" method="get">
						<table id="listAllUser"
							class='display table table-striped table-bordered'
							cellspacing='0' width='100%'>
							<thead>
								<tr>
									<th>Id</th>
									<th>Name</th>
									<th>Email</th>
									<th>UserType</th>
									<th>Last Active</th>
									<th>Details</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${allUsers}" var="users">
									<tr>
										<td><c:out value="${users.id}" /></td>
										<td><c:out value="${users.name}" /></td>
										<td><c:out value="${users.email}" /></td>
										<td><c:out value="${users.type}" /></td>
										<td><c:out value="${users.lastUpdated}" /></td>
										<td><a
											href="UserDetails?userId=${users.id}&uName=${users.name}"
											class="btn btn-primary">Details</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>

		<!-- Incidents  Section -->

		<div class="w3-container w3-padding-32" id="incidents">
			<h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">Incidents</h3>
			<table id='listAllIncident'
				class='display table table-striped table-bordered' cellspacing='0'
				width='100%'>
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
					<c:forEach items="${Incidents}" var="incident">
						<tr>
							<td id="incidentId"><c:out
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
	<jsp:include page="./footer.jsp" />

	<script type="text/javascript">
		$(document).ready(function() {

			$('#listAllUser').DataTable({
				"paging" : true,
				"ordering" : false,
				"info" : false,
				"pageLength" : 5
			});
			var element2 = document.getElementById("listAllUser_wrapper");
			element2.classList.remove("form-inline");

			$('#listAllIncident').DataTable({
				"paging" : true,
				"ordering" : false,
				"info" : false,
				"pageLength" : 5
			});
			var element = document.getElementById("listAllIncident_wrapper");
			element.classList.remove("form-inline");

			//Social Graph
			//http://visjs.org/docs/network/index.htm
			var nodes = new vis.DataSet(socialGraphData.nodes);
			var edges = new vis.DataSet(socialGraphData.edges);

			// create a network
			var container = document.getElementById('socialnetwork');

			// provide the data in the vis format
			var data = {
				nodes : nodes,
				edges : edges
			};
			var options = {
				autoResize : true,
				height : '100%',
				width : '100%',
				layout : {
					randomSeed : undefined,
					improvedLayout : true,
					hierarchical : {
						enabled : false,
						levelSeparation : 150,
						nodeSpacing : 100,
						treeSpacing : 200,
						blockShifting : true,
						edgeMinimization : true,
						parentCentralization : true,
						direction : 'UD', // UD, DU, LR, RL
						sortMethod : 'hubsize' // hubsize, directed
					}
				},
				physics : {
					enabled : true,
					barnesHut : {
						gravitationalConstant : -2000,
						centralGravity : 0.3,
						springLength : 95,
						springConstant : 0.04,
						damping : 0.09,
						avoidOverlap : 0
					},
					forceAtlas2Based : {
						gravitationalConstant : -50,
						centralGravity : 0.01,
						springConstant : 0.08,
						springLength : 100,
						damping : 0.4,
						avoidOverlap : 0
					},
					repulsion : {
						centralGravity : 0.2,
						springLength : 200,
						springConstant : 0.05,
						nodeDistance : 100,
						damping : 0.09
					},
					hierarchicalRepulsion : {
						centralGravity : 0.0,
						springLength : 100,
						springConstant : 0.01,
						nodeDistance : 120,
						damping : 0.09
					},
					maxVelocity : 50,
					minVelocity : 0.1,
					solver : 'barnesHut',
					stabilization : {
						enabled : true,
						iterations : 1000,
						updateInterval : 100,
						onlyDynamicEdges : false,
						fit : true
					},
					timestep : 0.5,
					adaptiveTimestep : true
				}
			};

			// initialize your network!
			var network = new vis.Network(container, data, options);
		});
		
	</script>

</body>
</html>