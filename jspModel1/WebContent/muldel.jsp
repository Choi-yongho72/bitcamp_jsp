<%@page import="dao.CustUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String delArr[] = request.getParameterValues("delck");

if(delArr != null) {
	for(int i = 0; i < delArr.length; i++) {
		System.out.println(delArr[i]);
	}
}
%>
<%
CustUserDao dao = CustUserDao.getInstance();
/* 
for(int i = 0; i < delArr.length; i++) {
	dao.deleteCustUser(delArr[i]);
}
*/
boolean isS = dao.deleteCustUser(delArr);

if(isS) {
%>
	<script>
	alert("정상적으로 삭제되었습니다.");
	location.href = "custuserlist.jsp";
	</script>
<%
}else {
%>
	<script>
	alert("삭제되지 않았어!");
	locatoin.href = "custuserlist.jsp";
	</script>
<%
}
%>