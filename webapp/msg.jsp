<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
  /*  setTimeout(function() {
        var msg = document.getElementById("msg");
        if (msg) {
            msg.style.display = 'none';
        }
    }, 3000); // 3000 milliseconds = 3 seconds*/
</script>

</head>
<body>

<%
String msg=(String)request.getAttribute("msg");
if(msg!=null)
{
%>
<h3 class="text-center text-danger"><%=msg %></h3>
<%}
%>

</body>
</html>