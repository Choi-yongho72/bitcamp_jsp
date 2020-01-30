<%@page import="sample02.Human"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
Human human = (Human)session.getAttribute("hman");

int number = human.getNum();
String name = human.getName();

session.removeAttribute("hman");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<p>number:<%=number %></p>
name:<input type="text" value="<%=name %>">

</body>
</html>