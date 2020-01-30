<%@page import="sample03.DtoClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

Object obj = request.getAttribute("DtoClass");
DtoClass dto = (DtoClass)obj;

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
주소:<input type="text" value="">
나이:<input type="text" value="">
 -->
<%=dto.getAddr() %>
<%=dto.getAge() %>
</body>
</html>