<%@page import="sample02.Human"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

response(응답): sendRedirect -> HttpServletResponse

<%--


request.setCharacterEncoding("utf-8");

String name = "최용호";

name = URLEncoder.encode(name);

response.sendRedirect("NewFile.jsp?name=최용호");


--%>

<%--
String name = "김도연";

request.setAttribute("name", name);		// 짐싸
// pageContext : 내장객체
pageContext.forward("NewFile.jsp");		// 잘가



--%>

<%--

int num = 1;
String name = "최용호";

Human human = new Human(num, name);

request.setAttribute("human", human);	// 짐싸
pageContext.forward("NewFile1.jsp");	// 잘가


--%>

<%
int num = 2;
String name = "김현식";

Human human = new Human(num, name);

session.setAttribute("hman", human);
response.sendRedirect("NewFile2.jsp");

%>
</body>
</html>