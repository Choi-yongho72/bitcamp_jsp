<%@page import="sample03.DtoClass"%>
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
String addr = "경기도";
int age = 25;
%>

<%
//request.setAttribute("addr", addr);
//request.setAttribute("age", age);

request.setAttribute("dto", new DtoClass(addr, age));
//session.setAttribute("dto", new DtoClass(addr, age));
//application.setAttribute("dto", new DtoClass(addr, age));

pageContext.forward("NewFile3.jsp");	// request.setAttribute, session.setAttribute
//response.sendRedirect("NewFile3.jsp");	// session.setAttribute

//response.sendRedirect("NewFile3.jsp?addr=" + addr + "&age=" + age);
%>


<%-- 
<form action="NewFile3.jsp" method="post">
	<input type="text" id="addr" value="<%=addr %>"><br>
	<input type="text" id="age" value="<%=age %>"><br>
	<button type="button" onclick="sendData()">전송</button>
</form>


 --%>



























</body>
</html>