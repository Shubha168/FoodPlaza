<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<jsp:include page="Header.jsp"></jsp:include>
<form action="FoodServlet" method="post">
<input type="hidden" name="process" value="editFood">

<table class="table table-success">

<tr>
<th>Id: </th>
<td><input type="number" class="form-control form-control-sm" name="foodId" value="${foodObj.foodId}" readonly="readonly"></td>
</tr>

<tr>
<th>Name: </th>
<td><input type="text" class="form-control form-control-sm" name="foodName" value="${foodObj.foodName}"></td>
</tr>

<tr>
<th>Type: </th>
<td><input type="text" class="form-control form-control-sm" name="foodType" value="${foodObj.foodType}" ></td>
</tr>

<tr>
<th>Category: </th>
<td><input type="text" class="form-control form-control-sm" name="foodCategory" value="${foodObj.foodCategory}"></td>
</tr>

<tr>
<th>Description:  </th>
<td><input type="text" class="form-control form-control-sm" name="foodDesc" value="${foodObj.foodDesc}"></td>
</tr>

<tr>
<th>Price: </th>
<td><input type="number" class="form-control form-control-sm" name="foodPrice" value="${foodObj.foodPrice}"></td>
</tr>

<tr>
<th>Image: </th>
<td><input type="text" class="form-control form-control-sm" name="image" value="${foodObj.image}"></td>
</tr>

<tr>
<td><input type="reset" class="btn btn-outline-danger" value="Clear"></td>
<td><input class="btn btn-outline-warning" type="submit" value="Update"></td>
</tr>
</table>
</form>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>