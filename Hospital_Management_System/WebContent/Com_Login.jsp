<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.img-fluid {
	max-width: 100%;
	height: auto;
}
</style>
</head>
<body>
<div class="navbar">
		<div class="col-md-3 col-sm-2 col-xs-4" style="width: 150px;">
			<h3 style="width: 102%;">
				<img src="ing/hospitalmanagemantlogo.png"
					class="img-circle head_logo" width="40" height="40"> <span style="font-size:22px; ">Hospital
					Management System</span>
			</h3>
		</div>
	</div>
<div>
	<section id="login" class="login">
		<div class="container" style="position: relative;">
			<div class="row">
				<div class="col-lg-6">
					<img src="ing/preview.png" width="500"
						height="620" style="margin-right: 10%">
				</div>
				<div class="col-lg-6">
					<div class="box" style="border: 1px solid white; background: white">
						<img src="ing/logo.png" class="img-fluid"
							width="130" height="130" style="margin-left: 203px">
						<p style="text-align: center;">Welcome back! Please loging to
							you account</p>
						<form style="margin-top: 20px" action="Login" method="post">
							<div class="form-group">

								<input type="email" name="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Email Id"
									style="border: none; border-bottom: 1px solid #e3e3e3">

							</div>
							<div class="form-group">

								<input type="password" name="pwd" class="form-control"
									id="exampleInputPassword1" placeholder="password"
									style="border: none; border-bottom: 1px solid #e3e3e3">
							</div>
							<div class="row">
								<div class="col">
									<div class="form-group form-check">
										<input type="checkbox" class="form-check-input"
											id="exampleCheck1" style="border-radius: 5px"> <label
											class="form-check-label" for="exampleCheck1">Remember
											Me</label>
									</div>
								</div>
							</div>
							<br>
							<input type="hidden" name="flag" value="verify">
							<button type="submit" class="btn btn-primary" style="width: 30%">Login</button>
						</form>
						<div class="col" style="margin-top: -103px;margin-left: 398px;">
								<a href="#"> Forget Password?</a>
							</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
</div>
</body>
<footer
	style=" color: black; position: fixed; bottom: 0%; width: 100%; text-align: center; margin-top: 15px;">
	<div class=" container">
		<p style="margin: 3px 98px -1px">
			© Copyright <strong>EXPERT WEB DESIGNING</strong> All Rights Reserved
		</p>
	</div>
</footer>
</html>