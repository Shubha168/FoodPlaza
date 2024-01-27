<!DOCTYPE html>
<html lang="en">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ShoppingCart</title>

<link href="templatemo_style.css" rel="stylesheet" type="text/css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous"></head>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>

<!-- Style Start -->

<style type="text/css">

table{
font-size: 15px;
font-family: sans-serif;
}

th, td {
	padding: 8px;
	text-align: center;
	width:190px;
}

th {
	background-color: #ebdcdcd6;
	text-align: center;
}

tr:nth-child(even):hover {
	background-color: #ebdcdc61;
}

.container tbody {
	background-color: #50e7ceb0;
}

#tablefood th {
	border-collapse: collapse;
	width: 0 1000px;
	text-align: center;
	font-family: sans-serif;
	font-size: 16px;
}

#tablefood tr {
	font-size: 15px;
	font-family: sans-serif;
}

#cartid,#fname,#subTotal{
	margin: 0;
    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
    background: transparent;
    border: none;
    text-align: center;

}

#fquantity{
	margin: 0;
    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
    text-align: center;
    width: 90px;

}

#totalBill
{
margin: 0;
    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
    background: transparent;
    border: none;
    
}

</style>

<!-- Style End -->


<script type="text/javascript">
$(function(){
	
	var arr=document.getElementsByClassName("totalPrice");
	var total=0;
	
	for(var i=0; i<arr.length; i++){
		
		total+=parseInt(arr[i].value);
	}
	
	$("#totalBill").val(total);
});


function updateQuantity(element){
	
	var cartid=element.previousSibling.value;
	var fquantity=element.value;
	
	if(fquantity<1){
		
		element.value=1;
		fquantity=1;
	}
	
	$.post("CartServlet", {"cartid": cartid, "fquantity":fquantity, "process":"updateCartQuantity"}, function(data, message){
		
		element.nextSibling.value=data;
		
		var arr=document.getElementsByClassName("totalPrice");
		var total=0;
		
		for(var i=0; i<arr.length; i++){
			
			total+=parseInt(arr[i].value);
		}
		
		$("#totalBill").val(total);
	});
}
</script>
</head>

<body>
	<div id="templatemo_container">

	<jsp:include page="Header.jsp"></jsp:include>

	<form action="OrderServlet" method="post" style="width: 960px;">
		<input type="hidden" name="process" value="placeOrder">

		<table class="table table-success" style="text-align: center;">
			<tr>
				<th>Cart id</th>
				<th>Food name</th>
				<th>Quantity </th>
				<th>Sub total<br>(RS)</th>
				<th>Action</th>
			</tr>

			<c:forEach var="cart" items="${clist }">
				<tr>
					<td><input type="text" readonly="readonly"
						value="${cart.cartid }" name="cartid" id="cartid"></td>
					<td><input type="text" readonly="readonly"
						value="${cart.fname }" name="fname" id="fname"></td>
						
					<td><input type="hidden" value="${cart.cartid }"><input
						type="number" value="${cart.fquantity }" name="fquantity"
						id="fquantity" onchange="updateQuantity(this);"></td>
						<td><input
						type="text" readonly="readonly" value="${cart.totalPrice }"
						id="subTotal" class="totalPrice" name="totalPrice"></td>
						
					<td><a class="btn btn-outline-danger" style="text-decoration: none;"
						href="CartServlet?process=deleteCartItem&cartid=${cart.cartid }">Delete</a></td>
				</tr>
			</c:forEach>

			<tr>
				<td colspan="5" style="text-align: right;">Total bill: Rs.<input
					id="totalBill" value="" type="text" readonly="readonly"
					name="totalBill"></td>
			</tr>

			<tr>
				<td colspan="2" style="text-align: right;"><a
					class="btn btn-outline-danger" style="text-decoration: none;" href="CartServlet?process=clearCart">Clear</a></td>
				<td colspan="3" style="text-align: left;"><input
					class="btn btn-outline-warning" type="submit" value="Order"></td>
			</tr>

		</table>
	</form>
	<jsp:include page="Footer.jsp"></jsp:include>
</div>
</body>

</html>