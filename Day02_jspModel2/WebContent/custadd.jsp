<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>회원 추가</h3>
<div align="center">
<form action="custuseradd">
	<input type="hidden" name="command" value="addAf">

<table>
	<tr>
	<td height="2" bgcolor="#0000ff" colspan="2"></td>
	</tr>
	<tr>
		<td>id</td>
		<td>
			<input type="text" name="id">
		</td>
	</tr>
	<tr>
	<td height="2" bgcolor="#0000ff" colspan="2"></td>
	</tr>
	<tr>
		<td>name</td>
		<td>
			<input type="text" name="name">
		</td>
	</tr>
	<tr>
	<td height="2" bgcolor="#0000ff" colspan="2"></td>
	</tr>
	<tr>
		<td>address</td>
		<td>
			<input type="text" name="address">
		</td>
	</tr>
	<tr>
	<td height="2" bgcolor="#0000ff" colspan="2"></td>
	</tr>
</table>

<input type="submit" value="고객 추가">
<input type="reset" value="취소">
</form>
</div>

</body>
</html>