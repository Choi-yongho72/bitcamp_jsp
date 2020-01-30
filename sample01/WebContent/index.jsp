<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String str = "여기보세요";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- HTML 주석문 -->

<%--
	JSP 주석문
	
	JSP : Java Server Page
	
	
	client	------- >			server(WAS)		< ------- > server(DB)
			request				java + html
		localhost:8080/sample
								web server
								web container	
								servlet, jsp
								(get, post)	-> 보안	
			< -------			해석
			response
								Spring Framework		MyBatis Framework
			
	Servlet = Java(HTML)
	JSP 	= HTML(Java)
			= html, javascript, css, jquery, java
 --%>
 
 <h1>Hello JSP</h1>
 
<%
 	// Java 영역
 	// Scriptlet = script + applet
 	System.out.println("console 출력");
 
 	/*
 		내장(암시)객체 : new를 하지 않고 바로 사용할 수 있는 Object
 		request, response, session, out
	// 	HttpServletRequest
 	*/ 	
 	out.println("Web 출력");	// Web으로 내보내는 내장객체
 	
%>

<% 
out.println("<h3>Hello Jsp</h3>");
%>

<%
System.out.println("str = " + str);
out.println("str = " + str);
%>
<br>
<%=str %>	<!-- value만 취득 -->
<br><br>

<%
for(int i = 0; i < 10; i++){
%>
	<p class="demo">P Tag <%=i + 1 %></p>
<%
}
%>

<%
for(int i = 0;i < 10; i++){
	out.println("<p class='demo'>P Tag " + (i + 1) + "</p>");
}
%>

<p id="demo">p demo</p>

<script type="text/javascript">
document.getElementById("demo").innerHTML = "change p tag content";
</script>
</body>
</html>