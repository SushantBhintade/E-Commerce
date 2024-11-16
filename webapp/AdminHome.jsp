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


<style type="text/css">
 .addproductbox{
  position: absolute;
  top:7rem;
  left: 2rem;
  width: 30%;
 }
 
 .productdisplaybox{
position: absolute;
top: 7rem;
left: 33%;
width: 50%;
}
</style>


</head>

<body>
<%
String acheck=(String) session.getAttribute("acheck");
if(acheck!=null)
{
%>

<nav class="navbar navbar-expand-lg bg-body-tertiary shadow">
  <div class="container-fluid">
    <a class="navbar-brand text-warning fst-italic fw-bold">Hello, <%=acheck %></a>
    <button class="navbar-toggler" type="button" 
      data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" 
      aria-controls="#navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
          <a class="nav-link active fw-medium" aria-current="page" href="#">Home</a>       
          <a class="nav-link fw-medium" href="#">Featurs</a>
          <a class="nav-link fw-medium" href="#">pricing</a>
		  <a class="nav-link btn btn-danger fw-medium" role="button" href="adminlogout">Logout</a> 

    </div>  
    </div>
  </div>
</nav>

               <!-- Add Product -->
               
               
 <%
	 ProductInfo pi=(ProductInfo) request.getAttribute("p");
	 if(pi == null)
	 {
		 pi=new ProductInfo();
		 pi.setName("");
		 pi.setPrice(0);
		 pi.setQuantity(0);
		 pi.setCategory("");
		 pi.setpImagename("");
		 pi.setDrescription("");
	 }
	 %>
 
        <div class="container border p-5 addproductbox rounded border-primary-subtle bg-warning-subtle">
          <form action="addproduct" method="post" enctype="multipart/form-data">  
            <div class="row g-3">
               
               <div class="col col-md-6">
                 <label for="pname" class="form-label">Enter Name:</label>
                 <input type="text" id="pname" name="name" class="form-control" value="<%=pi.getName()%>">
               </div>
               <div class="col col-md-6">
                 <label for="pprice" class="form-label">Enter Price:</label>
                 <input type="number" id="pprice" name="price" class="form-control" value="<%=pi.getPrice()%>">
               </div>
               <div class="col col-md-6">
                 <label for="pq" class="form-label">Enter Quantity:</label>
                 <input type="number" id="pq" name="quantity" class="form-control" value="<%=pi.getQuantity()%>" >
               </div>
               <div class="col col-md-6">
                 <label for="pc" class="form-label">Enter Category:</label>
                 <input type="text" id="pc" name="category" class="form-control" value="<%=pi.getCategory()%>">
               </div>
               <div class="col col-md-12">
                 <label for="pii" class="form-label">Upload Image:</label>
                 <input type="file" id="pii" name="file" class="form-control">
               </div>
               <div class="col col-md-12">
                 <label for="pd" class="form-label">Enter Description:</label>
                 <textarea class="form-control" rows="10" cols="10" id="pd" name="drescription"><%=pi.getDrescription()%></textarea>
               </div>
               <div class="col offset-md-5 col-md-4">
                  <button class="btn btn-success">Add Product</button>
               </div>
            <input type="hidden" name="aname" value="<%=acheck%>">
			<%
			if(pi != null)
			{
			%>
			<input type="hidden" name="pid" value="<%=pi.getId()%>">
			<%} %>
            </div>
           </form>
        </div>
        
        
        
        
        <!-- display product -->
       
   <%
    List<ProductInfo> apl = (List<ProductInfo>) session.getAttribute("apl");
   if(apl.size() > 0)
   {
   %>
   
   <div class="container productdisplaybox">
    <table class="table border rounded border-primary-subtle border border-3">
      <thead>
       <tr>
         <th>Name</th>
         <th>Description</th>
         <th>Price</th>
         <th>Quantity</th>
         <th>Category</th>
         <th>Image</th>
         <th>Edit</th>
         <th>Delete</th>
       </tr>
      </thead>
      <tbody>
   <%  
   for(ProductInfo p:apl)
   {
   %>
   <tr>
     <td><%=p.getName() %></td>
     <td><%=p.getDrescription() %></td>
     <td><%=p.getPrice() %></td>
     <td><%=p.getQuantity() %></td>
     <td><%=p.getCategory() %></td>
     <td><img alt="loading..." loading="lazy" width="100" src="/ProductImages/<%=p.getpImagename()%>"></td>
     <td>
       <form action="updateproduct" method="post">
         <input class="from-control" type="hidden" name="pid" value="<%=p.getId()%>">
         <input class="from-control" type="hidden" name="aname" value="<%=acheck%>">
         <button class="btn btn-sm btn-info">Edit</button>
       </form>  
     </td>
     <td>
       <form action="deleteproduct" method="post">
          <input class="from-control" type="hidden" name="pid" value="<%=p.getId()%>">
          <input class="from-control" type="hidden" name="aname" value="<%=acheck%>">
          <button class="btn btn-sm btn-danger">Delete</button>
       </form> 
     </td>
   </tr>
 
   <%
   }%>
   </tbody>
   </table>
   <%  
   }
   else
   {
%>
     <h1 class="text-center">Add Product</h1>
<%	   
   }
   %>
     </div>


<%
}
else
{
	response.sendRedirect("AdminLogin.jsp"); 
}

%>
</body>
</html>