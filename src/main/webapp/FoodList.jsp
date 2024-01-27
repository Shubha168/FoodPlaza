<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</head>
<body>
<%
String login = (String)session.getAttribute("login");
if(login == null)
{
	request.setAttribute("errormsg", "Please login to have a better experience.");
}

%>


<jsp:include page="Header.jsp"></jsp:include>
<jsp:include page="Messages.jsp"></jsp:include>
<table class="table table-sucess" style="test-align: center">
<tr>
<th>Id</th>
<th>Name</th>
<th>Type</th>
<th>Category</th>
<th>Description</th>
<th>Price</th>
<th>Images</th>
<th>Action</th>
</tr>
<c:forEach var="f" items="${flist}">
<tr>
<td>${f.foodId}</td>
<td>${f.foodName}</td>
<td>${f.foodType}</td>
<td>${f.foodCategory}</td>
<td>${f.foodDesc}</td>
<td>${f.foodPrice}</td>
<td><img alt="" src="${f.image}" height="100px" width="100px"></td>

<%if(login!=null && login.equals("admin")){ %>
<td><a class="btn btn-outline-warning" href="FoodServlet?process=updateFood&foodId=${f.foodId}">Update</a></td>
<td><a class="btn btn-outline-danger" href="FoodServlet?process=deleteFood&foodId=${f.foodId}">Delete</a></td>
<%} else if(login != null && login.equals("customer")){ %>
<td><a class="btn btn-outline-warning" href="CartServlet?process=addToCart&foodId=${f.foodId}" >Add To Cart</a></td>
<%} %>
</tr>
</c:forEach>

</table>

<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>