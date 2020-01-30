<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>regi.jsp</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>

<h1>회원가입</h1>
<p>환영해~</p>

<div align="center">
<form action="regiAf.jsp" method="post">

<table border="1">
<tr>
	<td>아이디</td>
	<td>
		<input type="text" id="id" name="id" size="20">
		id 확인
		<p id="idcheck" style="font-size: 8px"></p>
		<input type="button" id="btn" value="id확인">
	</td>
</tr>
<tr>
	<td>패스워드</td>
	<td>
		<input type="text" name="pwd" size="20">
	</td>
</tr>
<tr>
	<td>이름</td>
	<td>
		<input type="text" name="name" size="20">
	</td>
</tr>
<tr>
	<td>이메일</td>
	<td>
		<input type="text" name="email" size="20">
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="회원가입">
	</td>
</tr>
</table>


</form>
</div>

<script type="text/javascript">
$(function () {
	$("#btn").click(function () {
	//	alert("btn click");
		
		$.ajax({
			type:"post",
			url:"./idcheck.jsp",
	//		data:"id=" + $("#id").val(),
			data:{ "id":$("#id").val() },
			success:function(data) {
	//			alert("success");
	//			alert(data.trim());
				if(data.trim() == "사용가능해!") {
					$("#idcheck").css("color", "#0000ff");
					$("#idcheck").html('사용할수 있는 id야!');
				}else {
					$("#idcheck").css("color", "#ff0000");
					$("#idcheck").html('사용 중인 아이디야!');
					$("#id").val("");
				}
			},
			error:function() {
				alert("error");
			}
		});
	});
});
</script>

</body>
</html>



















