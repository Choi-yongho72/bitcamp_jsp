<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String str = request.getParameter("isS");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
if(str.equals("true")){
%>
<script type="text/javascript">
alert("성공");
location.href="custuserlist"
</script>	
<%	
} else if(str.equals("false")){
%>
<script type="text/javascript">
alert("실패");
location.href="custuseradd?command=add";
</script>

<%} %>



</body>
</html>