<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Food Item</title>
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>
	
</head>
<body>
<div id="templatemo_container">
		<jsp:include page="Header.jsp"></jsp:include>

		<form action="FoodServlet" method="post" style="width: 960px">
			<input type="hidden" name="process" value="deleteFood">

			<table class="table table-success"
				style="font-size: 15px; font-family: sans-serif;">
				
				<tr>
					<th>Enter the Food ID you want to Deleted  :</th>
					<td><input type="text" class="form-control form-control-sm"
						name="foodID"></td>
				</tr>

				<tr>
					<td align="right"><input type="reset" class="btn btn-danger"
						onclick="#"
						value="Cancel"></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="submit" class="btn btn-success" value="Delete">
					</td>
				</tr>

			</table>
		</form>

		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</body>
</html>