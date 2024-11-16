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
   margin: 4rem auto;
 }
</style>
</head>
<body class="bg-dark-subtle">

     
          
 
 <div class="container w-50 row box border p-5 bg-warning rounded-5 shadow-lg">
 
     
  <h1 class="text-center  text-black-50 fw-bold">User Login</h1>
 
            <!-- msg include -->
     <%@include file="msg.jsp" %>
     
   <form action="userlogin" method="post">
   
      <div class="col col-md-12 m-4">
        <input type="text" name="name" class="form-control" placeholder="Enter User Name:">
      </div> 
      
      <div class="col col-md-12 m-4">
        <input type="password" name="password"  class="form-control" placeholder="Enter User Password:">
      </div> 
      
      <div class="col offset-md-5 col-md-4 mt-3">
          <button class="btn btn-success">Login</button>
      </div>
      
   </form>
   
 </div>
</body>
</html>