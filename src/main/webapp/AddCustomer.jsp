<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

<link href="templatemo_style.css" rel="stylesheet" type="text/css" />

</head>
<body>

<jsp:include page="Header.jsp"></jsp:include>

<form action="customerServlet" method="post">


<input type="hidden" name="process" value="custRegister">

<table class="table table-success">

<tr>
<th>Enter customer name :</th>
<td><input type="text" class="form-control form-control-sm" name="custName"></td>
</tr>

<tr>
<th>Enter email Id :</th>
<td><input type="email" class="form-control form-control-sm" name="custEmail"></td>
</tr>

<tr>
<th>Enter password :</th>
<td><input type="password" class="form-control form-control-sm" name="custPass"></td>
</tr>

<tr>
<th>Enter address :</th>
<td><input type="text" class="form-control form-control-sm" name="custAddress"></td>
</tr>

<tr>
<th>Enter contact number :</th>
<td><input type="text" class="form-control form-control-sm" name="custContact"></td>
</tr>

<tr>
<th>Enter customer location :</th>
<td><input type="text" class="form-control form-control-sm" name="custLocation"></td>
</tr>

<tr>
<td></td>
<td><input type="reset" class="btn btn-warning" value="Clear">
<input type="submit" class="btn btn-danger" value="Register"></td>
</tr>

 </table>
 
 </form>

<jsp:include page="Footer.jsp"></jsp:include>


</body>
</html>