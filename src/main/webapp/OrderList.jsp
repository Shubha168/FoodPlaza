<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="POJO.OrderFood"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous"></head>
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

</head>

<body>

<jsp:include page="Header.jsp"></jsp:include>
<table class="table table-success" style="text-align: center;">

<tr>
<th>Order number</th>
<th>Order date</th>
<th>Total bill</th>
<th>Status</th>
<th>Action</th>
</tr>

<%
List<OrderFood> olist=(List<OrderFood>)session.getAttribute("olist");

for(OrderFood o:olist){
%>
<tr>
<th><%= o.getOrderId() %></th>		
<th>

<%= o.getOrderDate().format(DateTimeFormatter.ofPattern("dd-LLL-yyyy HH:mm:ss")) %></th>
<th><%= o.getTotalBill() %></th>
<th><%= o.getOrderStatus() %> </th>
<th><a href="OrderServlet?process=getDetails&orderId=<%= o.getOrderId() %>">Details</a></th>
</tr>

<%} %>

</table>

<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>