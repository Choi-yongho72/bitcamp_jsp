<%@page import="dto.CustUserDto"%>
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
CustUserDto dto = dao.getDetail(id);
%>

<div align="center">
<form action="custuserupdate">
	<input type="hidden" name="command" value="updateAf">
<table>
	<tr>
		<th>ID</th>
		<td>
			<input type="text" value="<%=dto.getId() %>" name="id">
		</td>
	</tr>
		<tr>
		<th>주소</th>
		<td>
			<input type="text" value="<%=dto.getAddress() %>" name="address">
		</td>
	</tr>
	
</table>
<input type="submit" value="수정">
<input type="reset" value="취소">
</form>
</div>

</body>
</html>