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
var target = [];
var link = [];
var aname = [];


$(function name() {
	$("button").click(function () {
		
		$.ajax({
			url:"data.xml",
			datatype:"xml",
			success:function ( data ) {
		//		alert('success');
				var xml = $(data).find("xmldata");		// root
				var len = xml.find("news").length;
		//		alert(len);
				
				for(i = 0; i < len; i++) {
					target[i] = xml.find("news").eq(i).find("target").text();
					link[i] = xml.find("news").eq(i).find("link").text();
					aname[i] = xml.find("news").eq(i).find("aname").text();
					
				}
				
				for(i = 0; i < len; i++) {
					$("#demo").append(target[i] + " " + link[i] + " " + aname[i] + "<br>");
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