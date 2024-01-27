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
<form action="LoginServlet" method="post">
<table class="table table-success">
<tr>
<th>Your email id:- </th>
<td><input class="form-control-sm" type="email" name="username"></td>
</tr>
<tr>
<th>Password:- </th>
<td><input class="form-control-sm" type="password" name="password"></td>
</tr>
<tr>
<td><input class="btn btn-outline-danger" type="reset" value="Clear" ></td>
<td><input class="btn btn-outline-danger" type="submit" value="Login"></td>
</tr>
</table>
</form>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>