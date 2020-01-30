<%@page import="dto.CustUserDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.CustUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<CustUserDto> list = (List<CustUserDto>)request.getAttribute("custlist");
%>
			
  
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>검색 목록</h1>
<div align="center">
<form action="muldel" method="post">
<table style="width: 700">
<col width="100"><col width="300"><col width="300">
	<tr>
		<td height="2" bgcolor="#0000ff" colspan="3"></td>
	</tr>
	
	<tr>
		<th bgcolor="#ffff00">
			<input type="checkbox" name="alldel" onclick="deletechecks(this.checked)">
		</th>
		<th>ID</th>	
		<th>NAME</th>
	</tr>
	<tr>
		<td height="2" bgcolor="#0000ff" colspan="3"></td>
	</tr>
	
	<% 
	if(list.size()==0){
		%>
		<tr bgcolor="#f6f6f6">
			<td colspan="3" align="center">고객 정보가 없습니다</td>
		</tr>
		<tr>
		<td height="2" bgcolor="#0000ff" colspan="3"></td>
		</tr>	
	<%	
	}else{
		for(int i = 0; i <list.size(); i++){
			CustUserDto cust = list.get(i);
	%>
		<tr bgcolor="#f6f6f6">
			<td align="center" bgcolor="yellow">
				<input type="checkbox" name="delck" value="<%=cust.getId() %>">
			</td>
			<td>
				<%=cust.getId() %>
			</td>
			<td>
				<a href="custuserdetail?id=<%=cust.getId() %>">
				<%=cust.getName() %>
				</a>
			</td>
		</tr>
		<tr>
		<td height="2" bgcolor="#0000ff" colspan="3"></td>
		</tr>	
		<%} %>
	<% } %>
	
	<tr>	<!-- 다중삭제버튼 -->
		<td align="center" height="1" bgcolor="#c0c0c0" colspan="3">
			<input type="submit" value="고객 정보 삭제">
		</td>
	</tr>
	<tr>
		<td height="2" bgcolor="#0000ff" colspan="3"></td>
	</tr>	
	
	<tr bgcolor="#f6f6f6">
		<td colspan="2">
			<a href="custuseradd?command=add">고객 정보 추가</a>
		</td>
		<td>
		<select id="_searchType" name="searchType">
			<option value="id">id</option>
			<option value="name">name</option>
		</select>
			<input type="text" id ="_searchTxt" name="searchTxt">
			<button type="button" onclick="searchList()">검색</button>
		</td>
	</tr>
</table>

</form>

<button type="button" onclick="location.href='custuserlist'">전체목록보기</button>

</div>

</body>
</html>