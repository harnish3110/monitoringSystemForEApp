<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Login Page</title>

</head>
<body>

	<!--https://bootsnipp.com/snippets/92ezX-->
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<div class="card-header">Login</div>
					<div class="card-body">

						<form class="form-horizontal" method="post" action="Login">

							<div class="form-group">
								<label for="email" class="cols-sm-2 control-label">
									Email</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa fa-envelope fa" aria-hidden="true"></i></span> <input
											type="text" class="form-control" name="email" id="email"
											placeholder="Enter your Email" required="true" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="password" class="cols-sm-2 control-label">Password</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
											type="password" class="form-control" name="password"
											id="password" placeholder="Enter your Password"
											required="true" />
									</div>
								</div>
							</div>
							<div class="form-group ">
								<button class="btn btn-primary login-button">Login</button>
							</div>
							<h3 style="color: red;">
								<%
									if (null != request.getAttribute("msg")) {
										out.println(request.getAttribute("msg"));
									}
								%>

							</h3>
							<!-- <div class="login-register">
								<a href="signup.jsp">Sign Up</a>
							</div> -->
						</form>
					</div>
					
				</div>
			</div>
		</div>
	</div>

</body>
</html>