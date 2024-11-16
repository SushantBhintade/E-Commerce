<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</head>
<body>

<%
 String ucheck = (String)session.getAttribute("ucheck");
 String name = (String)session.getAttribute("name");
 
 if(ucheck != null)
 {
%>

 <!-- 
nav bar
 -->
 
 <nav class="navbar navbar-expand-lg bg-body-tertiary shadow fixed-top">
   <div class="container-fluid">
     <a class="navbar-brand fst-italic fw-bold text-warning">Hello,  <%= ucheck %></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
     <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active fw-normal" aria-current="page" href="gethome">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active fw-normal" href="getcart">Cart</a>
        </li>
        <li class="nav-item dropdown fw-normal">
          <a class="nav-link dropdown-toggle active" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Orders Info
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="getAddress">Address</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li> 
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="comment">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item fw-normal">
          <a href="userlogout" class="nav-link btn btn-danger" role="button">Logout</a>
        </li>
      </ul>
    </div>
   </div>
 </nav>
 
               <!-- 
               display Content
                -->
 
 			<div class="container-fluid w-50 " style="margin-top: 15vh; ">
 			 <form action="comment" method="post">
 			   <div class="col col-md-12">
 			     <input type="hidden" name="pid" value="<%=name%>">
                 <input type="hidden" name="uname" value="<%=ucheck%>">
                <h4> <label for="com" class="form-label fst-italic fw-semibold ">Give Your Advice here :</label></h4> 
                 <textarea class="form-control border border-info" rows="10" cols="10" id="com" name="drescription" placeholder="Type here......"></textarea>
                 
                 <button type="submit" class="btn btn-success mt-3" >Comment</button>
               </div>
             </form>
 			</div>
 			
  <%
 }
 else
 {
	 response.sendRedirect("UserLogin.jsp");
 }
 %>  

</body>
</html>