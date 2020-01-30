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
	$("button").click(function () {
		$.ajax({
			url:"data.json",
			type:'get',
			datatype:'json',
			success:function(json) {
		//		alert('success');
		//		alert(json);
		//		alert(json[0].nate + " " + json[0].age);
				/*
				for(i = 0; i < josn.length; i++) {
					$("#demo").append(json[i].name + " ");
					$("#demo").append(json[i].age + " ");
					$("#demo").append(json[i].address + " ");
					$("#demo").append(json[i].phone + "<br>");
				}
				*/
				$.each(json, function (index, item)) {
					$("#demo").append(index + " ");
					$("#demo").append(item.name + " ");
					$("#demo").append(item.age + " ");
					$("#demo").append(item.address + " ");
					$("#demo").append(item.phone + "<br>");
					
				}
			},
			error:function() {
				alert('error');
			}
		});
	});
});

</script>





</body>
</html>

<!--
	boot	    	->		Ajax : Json
	view(Client)			model(Server)
	Ajax					get/post, send
	-> Vue, react
-->




















