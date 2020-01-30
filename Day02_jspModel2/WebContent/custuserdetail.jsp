<%@page import="dto.CustUserDto"%>
<%@page import="dao.CustUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CustUserDto dto = (CustUserDto)request.getAttribute("custdetail");
%>    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

%>
<h1>고객 세부 정보</h1>
<div align="center">
<table>
<tr>
	<th>ID</th>
	<td><%=dto.getId() %></td>
</tr>
<tr>
	<th>이름</th>
	<td><%=dto.getName() %></td>
</tr>
<tr>
	<th>주소</th>
	<td><%=dto.getAddress() %></td>
</tr>


</table>
<button onclick="updateList()">수정</button>
<button onclick="deleteList()">삭제</button><br>
<button id="backBtn" onclick="golist()" style="width:100px">뒤로</button>
</div>

<script type="text/javascript">
function golist(){
	location.href="custuserlist";
}
function updateList(){
	location.href="custuserupdate?id=<%=dto.getId() %>&command=update";
}
function deleteList(){
	location.href="custdelete?id=<%=dto.getId() %>";
}
</script>

</body>
</html>