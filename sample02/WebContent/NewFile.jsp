<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");

//String name = request.getParameter("name");

String name = (String)request.getAttribute("name");


%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>NewFile.jsp</h3>

<input type="text" value="<%=name %>"><br>

<p><%=name %></p>

</body>
</html>