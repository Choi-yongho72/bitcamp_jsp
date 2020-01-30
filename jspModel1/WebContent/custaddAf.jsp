<%@page import="dao.CustUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String name = request.getParameter("name");
String address = request.getParameter("address");

System.out.println("확인해볼거야");
System.out.println("아이디는 " + id);
System.out.println("이름은 " + name);
System.out.println("주소는 " + address);
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

boolean isS = dao.addCustUser(id, name, address);
/*
if(isS) {
	response.sendRedirect("custuserlist.jsp");
}
*/
if(isS) {
	%>
	<script type="text/javascript">
	alert("정상적으로 추가됨");
	location.href = "custuserlist.jsp";
	</script>
	<%
}else {
	%>
	<script type="text/javascript">
	alert("추가되지 않음, retry");
	location.href = "custadd.jsp";
	</script>
	<%
}
%>






</body>
</html>