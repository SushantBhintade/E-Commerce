<%@page import="com.MainApp.Pojo.Address"%>
<%@page import="java.util.List"%>
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
<body >
 <%
 String ucheck = (String)session.getAttribute("ucheck");
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
 
 
 
 <div class="container-fluid w-25" ms-3 style="margin-top: 10vh">
 
 <form action="addAddress" method="post">
  <label class="form-label">Enter house name/number:</label>
   <input type="text" name="house" class="form-control">
   
    <label class="form-label">Enter Street:</label>
    <input type="text" name="street" class="form-control">
   
    <label class="form-label">Enter city:</label>
    <input type="text" name="city" class="form-control">
   
    <label class="form-label">Enter pin:</label>
    <input type="text" name="pin" class="form-control">
    
    <input type="hidden" name="uname" value="<%=ucheck%>">
   
     <button class="btn btn-outline-success mt-3">Add Address</button>
    
 </form>
   
 </div>
 
 
 
        <!-- 
          display address
         -->
 <%
 List<Address> l =(List<Address>)session.getAttribute("ladd");
 %>
 
 <div class="container row ">
   <div class="col col-md-6 ">
     <%
      if(l.size()>0)
      {
    	for(Address a:l)
    	{
        
     %>
        <div class="border m-3 border rounded p-3 bg-danger-subtle">
        
           <p>House :<%=a.getHouse()%></p>
           <p>Street :<%=a.getStreet()%></p>
           <p>City :<%=a.getCity()%></p>
           <p>Pin :<%=a.getPin()%></p>
           
           <form action="deleteAddress" method="post">
             <input type="hidden" name="aid" value="<%=a.getId()%>">
             <button class="btn btn-outline-danger">Remove</button>
           </form>
         </div>
        
     <%
    	}
      }
      else
      {
    	  
     %>
     
     <h1 class="text-center">Address not Added</h1>
     
     <%
     }
     %>
   </div>
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