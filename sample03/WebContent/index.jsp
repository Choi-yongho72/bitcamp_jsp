<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>

<%
String address = "서울시";

%>



<form action="NewFile.jsp" method="post">
	<input type="text" name="age" value="10"><br>
	<input type="text" name="addr" value="<%=address %>"><br>
	<input type="hidden" name="command" value="<%="비밀데이터" %>"><br>

	<input type="submit" value="전송">

</form>

<br><br>

<form action="NewFile1.jsp" method="post">
	<input type="text" id="name" value="최용호"><br>
	<input type="text" id="email" value="cyh@naver.com"><br>
	<button type="button" onclick="sendData()">전송</button>
</form>

<script type="text/javascript">
function sendData() {
	var name = document.getElementById("name").value;
	var email = document.getElementById("email").value;
	
	location.href= "NewFile1.jsp?name=" + name + "&email=" + email;
};
</script>

<br><br>

<form id="frm" action="NewFile2.jsp" method="post">
	<input type="text" id="age" value="10"><br>
	<input type="text" id="addr" value="<%=address %>"><br>
	
	<input type="button" id="btn" value="전송">
</form>

<script type="text/javascript">
$(document).ready(function () {
	$("#btn").click(function () {
	//	alert("click");
		$("#frm").submit();
	});
});



</script>













</body>
</html>