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
$(function () {
	
	// model1, model2
	$("button").click(function () {
		$.ajax({
			url:"data.jsp",
			type:"get",			// jsp
			datatype:"json",
			success:function( obj ) {
		//		alert("success");
		//		alert(obj);
		//		alert(obj.num);
				
				// String -> json
				var data = JSON.parse(obj);
				alert(data.num);
				alert(data.name);
				
				// json -> String
				var str = JSON.stringify(data);
				alert(str.num);
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