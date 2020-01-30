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
if(str.equals("true")) {
%>
	<script type="text/javascript">
	alert("성공적으로 추가됬어!");
	location.href = "custuserlist";
	</script>
<%
}else {
%>
	<script type="text/javascript">
	alert("추가되지 않았어!");
	location.href = "custuseradd?command=add";
	</script>

<%
}
%>
</body>
</html>