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
	$("#button").click(function () {
		$.ajax({
			////////////////////////////////////////////////////////송신용
			url:"data.jsp",					// 가야할곳
			type:"get",						// get/post
//			data: "t1=XYZ&t2=자차카",		// 보내주는 파라미터
			data:{ t1:"home", t2:"성공" },
			////////////////////////////////////////////////////////
			
			////////////////////////////////////////////////////////수신용
			success:function(data, status, xhr) {
		//		alert("성공");
				$("#demo").text(data);
				alert(status);
				alert(xhr);
			},
			error:function(xhr, status, error) {
				alert("실패");
			},
			complete:function(xhr, status) {
				alert("통신 종료");
			}
		});
	});
});

</script>





</body>
</html>