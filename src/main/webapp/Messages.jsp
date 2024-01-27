<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String msg = (String)request.getAttribute("msg");
String errormsg = (String)request.getAttribute("errormsg");
String Username = (String)session.getAttribute("username");
%>

<%
if(msg != null){%>
<h3 style="color: green">${msg} <%= Username %></h3>
<%}else if(errormsg != null){ %>
<h3>${errormsg}</h3>
<%} %>
</body>
</html>