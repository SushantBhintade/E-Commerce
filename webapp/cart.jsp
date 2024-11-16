<%@page import="com.MainApp.Pojo.Address"%>
<%@page import="com.MainApp.Pojo.ProductInfo"%>
<%@page import="com.MainApp.Pojo.CartInfo"%>
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
<body class="bg-light-subtle">
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
     <a class="navbar-brand text-warning fst-italic fw-bold">Hello,  <%= ucheck %></a>
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
       display 
       cart products
          -->
  
 
 
 
 <%
 List<CartInfo> l = (List<CartInfo>) session.getAttribute("lci");
 List<ProductInfo> allp=(List<ProductInfo>) session.getAttribute("Allp");
 List<Address> la=(List<Address>) session.getAttribute("la");

 if(l.size()>0)
 {
	
	for(CartInfo c:l)
	{
	   for(ProductInfo p:allp)
	   {
		  if(c.getPid() == p.getId())  
		   {
    
 %>
      <div class="container w-25 position-relative" style="margin-top: 10vh" >
         <h6 class="display-6"><%=p.getName() %></h6>
         <img alt="loading...." src="/ProductImages/<%=p.getpImagename()%>" width="75">
         <br><br>
         <form action="deletecartp" method="post">
           <input type="hidden" name="pid" value="<%=p.getId()%>">
           <input type="hidden" name="uname" value="<%=ucheck%>">
           <button class="btn btn-sm btn-outline-danger">Remove</button>
         </form>
         
         <form action="buyproduct" method="post">
           <label class="form-label d-inline">Quantity :</label>
           <input name="quantity" value="1" type="number" class="w-25 form-control d-inline">
           <input type="hidden" name="pid" value="<%=p.getId()%>">
           <input type="hidden" name="uname" value="<%=c.getUname()%>">
           <input type="hidden" name="aname" value="<%=p.getAname()%>">
           
           <p>
           <a href="Address.jsp" class="text-decoration-none">Select Address</a>
           </p>
           <%
            if(la.size()>0)
            {
              for(Address a:la)
              {
            
           %>
           <label class="form-label">Aid : <%=a.getId() %></label>
           <input type="radio" name="aid" value="<%=a.getId()%>">
           <%
              }
            %>
            
            <p class="small">No Address Available</p>
            
            <%} %>
            
            <button class="btn btn-outline-success d-block">Buy</button>
         </form>
         <hr class="divider">
      </div>
  
 <%
		   }
	   }
	}
 }
 else
 {
 %>
 
  <h1 class="text-center text-info fst-italic">Cart is Empty</h1>
 
   
 
 <%
 }
 %>
 
 <%
 }
 else
 {
	 response.sendRedirect("UserLogin.jsp");
 }
 %>
   
 
</body>
</html>