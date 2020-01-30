<%@page import="dao.CustUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String isS = request.getParameter("isS");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	if(isS.equals("true")){
	%>
		<script type="text/javascript">
		alert("정상적으로 삭제되었습니다")
		location.href="custuserlist";
		</script>	
	<% 	
	}else{
	%>
		<script type="text/javascript">
		alert("수정되지 않았습니다. 다시시도해주세요")
		location.href="custuserdetail";
		</script>
		<% 
	} %>

</body>
</html>