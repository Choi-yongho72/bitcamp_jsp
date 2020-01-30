<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
%>



<%
String age = request.getParameter("age");
String addr = request.getParameter("addr");
String command = request.getParameter("command");
%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<p>age:<%=age %></p>
<p>addr:<%=addr %></p>
<p>command:<%=command %></p>




















</body>
</html>