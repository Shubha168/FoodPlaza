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
<input type="hidden" name="process" value="addFood">

<table class="table table-success">
 <tr>
 <th>Enter Name:</th>
 <td> <input type="text" class="form control form-control-sm" name="foodName"></td>
 </tr>
<tr>
<th>Enter Type :</th>
<td> <input type="text" class="form control form-control-sm" name="foodType"> </td>
</tr>

<tr>
<th>Enter category :</th>
<td> <input type="text" class="form control form-control-sm" name="foodCategory"> </td>
</tr>

<tr>
<th>Enter description :</th>
<td> <input type="text" class="form control form-control-sm" name="foodDesc"> </td>
</tr>

<tr>
<th>Enter Price :</th>
<td> <input type="number" class="form control form-control-sm" name="foodPrice"> </td>
</tr>

<tr>
<th>Image :</th>
<td> <input type="text" class="form control form-control-sm" name="image"> </td>
</tr>

<tr>
<td> </td>
<td> <input type="submit" class="btn btn-success" value="Add">
<input type="reset" class="btn btn-warning" value="clear"></td>
</tr>
</table>
</form>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>