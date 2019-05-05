<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	var social = '';
	$.ajax({
		type : 'GET',
		url : 'api/getData/socialData',
		success : function(data) {
			console.log('success');
			console.log(data);
			social = data;
		},
		error : function(err) {
			console.log('error');
			console.log(err);
		},
	});
</script>

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/vis/4.21.0/vis.min.css"
	rel="stylesheet" type="text/css" />
<style type="text/css">
#mynetwork {
	width: 600px;
	height: 400px;
	border: 1px solid lightgray;
}
</style>
</head>
<body>
	<h1>ffff</h1>
	<div id="mynetwork"></div>

	<script type="text/javascript">
		// create an array with nodes
		var nodes = new vis.DataSet(social.nodes);

		// create an array with edges
		var edges = new vis.DataSet(social.edges);

		// create a network
		var container = document.getElementById('mynetwork');

		// provide the data in the vis format
		var data = {
			nodes : nodes,
			edges : edges
		};
		var options = {
			autoResize: true,
			height: '100%',
			width: '100%',
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
			}
		};

		// initialize your network!
		var network = new vis.Network(container, data, options);
	</script>


</body>
</html>