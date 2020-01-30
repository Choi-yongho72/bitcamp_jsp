<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
Date nowTime = new Date();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<p>시간출력</p>
<p>
	현재 시간은<%=nowTime %> 입니다.
</p>

<input type="text" value="<%=nowTime %>">

</body>
</html>