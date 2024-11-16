<%@page import="com.MainApp.Pojo.ProductInfo"%>
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

<style>
    #scrollable-box {
      max-height: 40vh; /* Set the maximum height */
      min-height:40vh;
      overflow-y: auto; /* Allow scrolling when content overflows */
    }

    /* Hide the scrollbar for WebKit browsers (Chrome, Safari, etc.) */
    #scrollable-box::-webkit-scrollbar {
      display: none;
    }

    /* Hide the scrollbar for Firefox */
    #scrollable-box {
      scrollbar-width: none;
    }

    /* Hide the scrollbar for IE and Edge */
    #scrollable-box {
      -ms-overflow-style: none;
    }
  </style>

</head>
<body >



<%
String ucheck=(String)session.getAttribute("ucheck");
if(ucheck != null)
{
%>
       <!-- Navbar -->
       
 <nav class="navbar navbar-expand-lg bg-body-tertiary shadow fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand text-warning fst-italic fw-bold">Hello, <%=ucheck %></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active fw-normal"  href="gethome">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active fw-normal" href="getcart">Cart</a>
        </li>
        <li class="nav-item dropdown fw-normal">
          <a class="nav-link dropdown-toggle " href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Orders Info
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="getAddress">Address</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="comment">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a href="userlogout" class="nav-link btn btn-danger fw-normal" role="button">Logout</a>
        </li>
      </ul>
      <form action="searchkeyword" class="d-flex" role="search" method="post">
        <input name="searchkeyword" class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
      
      <form action="searchremoves">
        <button class="btn-close"></button>
      </form>
    </div>
  </div>
</nav>



                          <!-- display All product -->
    
    
    
 <%
  List<ProductInfo> allp=(List<ProductInfo>) session.getAttribute("Allp");
  if(allp.size()>0)
  {
 %>
    <div class="container-fluid  mb-3" style="margin-top: 10vh">  <!-- edit here -->
      <div class="row g-3 " >
       <%
       for(ProductInfo p:allp)
       {
       %>
        <div class="col col-md-4" >
           <div class="border p-3 "  id="scrollable-box"> <!-- editing here style="min-height: 40vh; max-height:40vh; overflow-y:auto;" -->
             <img alt="Loading..." src="/ProductImages/<%=p.getpImagename()%>" width="100">
             <h6><%=p.getName() %></h6>
             <p>
             <%=p.getDrescription() %> 
             
             </p>
             
             <h4>Price : <span class="text-danger"><%=p.getPrice() %></span> </h4>
             <form action="addtocart" method="post">
	 			  <input type="hidden" name="pid" value="<%=p.getId()%>">
	 			  <input type="hidden" name="uname" value="<%=ucheck%>">
                  <button class="btn btn-outline-info btn-sm">Add to cart</button>
                  <button class="btn btn-outline-success btn-sm">Add to wishlist</button>
             </form>
             
           </div>
        </div>
       <%
       } %>
      </div>
    </div>
    
 <%
}
else
{
%>
<h1 class="text-center text-danger mt-5">Products not Available</h1>
<%} %>
    
 <%
}     
else
{
	response.sendRedirect("userLogin.jsp");
}
%>
</body>
</html>