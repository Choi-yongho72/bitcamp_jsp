<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String strU = request.getParameter("isU");
String exid = request.getParameter("exid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
if(strU.equals("true")){
%>
<script type="text/javascript">
alert("성공");
location.href="custuserlist";
</script>	
<%	
} else if(strU.equals("false")){
%>
<script type="text/javascript">
alert("실패");
location.href="custuserdetail?id=<%=exid %>";

</script>

<%} %>



</body>
</html>