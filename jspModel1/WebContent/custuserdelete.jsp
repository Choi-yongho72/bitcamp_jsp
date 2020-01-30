<%@page import="dao.CustUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
CustUserDao dao = CustUserDao.getInstance();
boolean isS = dao.deleteCustUser(id);

if(isS) {
%>
	<script type="text/javascript">
	alert("정상적으로 삭제됫어");
	location.href = "custuserlist.jsp";
	</script>
<%
}else {
%>
	<script type="text/javascript">
	alert("삭제에 실패했어!");
	location.href = "custuserlist.jsp";
	</script>
<%
}
%>
</body>
</html>