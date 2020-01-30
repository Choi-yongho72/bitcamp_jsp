<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<p id="demo"></p>
<br>
<button type="button">click</button>

<script type="text/javascript">
$(document).ready(function () {
	$("button").click(function () {
		$.ajax({
			url:"./hello",
			type:"post",
			datatype:"json",
			data:"num=1",
			success:function(data) {
	//			alert("success");
	//			alert(data);
	//			alert(data[0].number);
	//			alert(data[0].name);
				
				$.each(data, function (i, val) {
					$("#demo").append("i:" + i + " id:" + val.id + " name:" + val.name + "<br>");
				});
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