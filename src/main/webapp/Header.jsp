
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
String login=null, msg=null, errormsg=null;

login = (String)session.getAttribute("login");
msg = (String)session.getAttribute("msg");
errormsg = (String)session.getAttribute("errormsg");
%>
</head>
<body>
<!--  Free CSS Template by TemplateMo.com  --> 

	<div id="templatemo_header" style="width: 960px">
    	<div id="site_title" style="heigth: 120px"></div>
    </div> <!-- end of header -->
    
    <div id="templatemo_menu">
        <ul>
        	<li class="current"><a href="MyIndex.jsp"><b>Home</b></a></li>
            <li><a href="FoodServlet?process=allFood"><b>Food Menu</b></a></li>
            <li ><a href="#"><b>Contact</b></a></li>
            
            <% if(login != null && login.equals("admin")){%>
            <li><a href="addfood.jsp"><b>Add Food</b></a></li>
            <%} %>
            
            <% if(login != null && login.equals("customer")){ %>
            <li><a href="customerServlet?process=updateProfile"><b>Profile</b></a></li>
            <li><a href="CartServlet?process=showMyCart"><b>My Cart</b></a></li>
            <li><a href="OrderServlet?process=myOrders"><b>My Order</b></a></li>
            <% } %>
            
            
            <% if(login == null){%>
            <li><a href="Login.jsp"><b>Login</b></a></li>
            <li><a href="AddCustomer.jsp"><b>Register</b></a></li>
            <% } else if(login != null){ %>
            <li><a href="LogoutServlet"><b>Logout</b></a></li>
            <%} %>
            
            
        </ul>
    </div> <!-- end of menu -->
</body>
</html>