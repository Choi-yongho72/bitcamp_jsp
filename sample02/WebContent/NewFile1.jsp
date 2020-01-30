<%@page import="sample02.Human"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
Object obj = request.getAttribute("human");
Human human = (Human)obj;

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h3>NewFile1.jsp</h3>

num:<input type="text" value="<%=human.getNum() %>">
<br>
name:<p><%=human.getName() %></p>

</body>
</html>