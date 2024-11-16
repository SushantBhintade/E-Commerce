<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
	
<style type="text/css">
.box {
	margin: 4rem auto;
}
</style>
</head>
<body class="bg-danger-subtle">

           
	
	<h1 class="text-center m-3 text-black-50 fw-bold">User SignUp</h1>
   
   <div class="container w-50 row box border p-5 bg-dark-subtle rounded-5 shadow-lg">
   <!-- msg include -->
	       <%@include file="msg.jsp"%>
		<form action="registeruser" method="post">
			<div class="col col-md-12">
				<label for="uname" class="form-label">Enter User Name</label> <input
					type="text" name="name" id="uname" class="form-control">
			</div>

			<div class="col col-md-12">
				<label for="upass" class="form-label">Enter User Password</label> <input
					type="password" name="password" id="upass" class="form-control">
			</div>

			<div class="col col-md-12">
				<label for="uemail" class="form-label">Enter User email </label> <input
					type="email" name="email" id="uemail" class="form-control">
			</div>

			<div class="col offset-md-5 col-md-4 m-6">
				<button class="btn btn-success">SignUp</button>
				<a href="userLogin" role="button" class="btn btn-info m-3">Login</a>
			</div>
		</form>
	</div>
   
</body>
</html>