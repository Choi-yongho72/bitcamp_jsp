<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<p id="demo"></p>
<br>
<button type="button">click</button>

<script type="text/javascript">
$(function () {
	$("button").click(function () {
		$.ajax({
			url:"custuser",				// servlet
			type:"get",
			datatype:"json",
			data:"id=abc&pwd=123",
			success:function(json) {
			//	alert("success");				// int, string, 다수의 데이터
				
			//	alert(json.title);
				alert(json.map.list);
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