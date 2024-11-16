<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style type="text/css">
 .box{
   margin: 4rem 25rem;
 }
</style>
</head>
<body class="bg-dark-subtle">

         
     
          
 <h1 class="text-center m-5 ">Admin Login</h1>
 
 <div class="container w-50 row box border p-5 bg-danger-subtle rounded-5 shadow-lg">
 
    <!-- msg include -->
     <%@include file="msg.jsp" %>
     
   <form action="adminlogin" method="post">
   
      <div class="col col-md-12">
        <label for="name" class="form-label">Enter Admin Name: </label>
        <input type="text" name="name" id="name" class="form-control">
      </div> 
      
      <div class="col col-md-12">
        <label for="password" class="form-label">Enter Admin Password: </label>
        <input type="password" name="password" id="password" class="form-control">
      </div> 
      
      <div class="col offset-md-5 col-md-4 mt-3">
          <button class="btn btn-success">Login</button>
      </div>
      
   </form>
   
 </div>
</body>
</html>