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
<!--
	AJAX : Asynchronous JavaScript And XML
	목적: 비동기 상태로 데이터를 보내 송수신의 목적
	
	synchronous : 동기
	CustUserAdd.jsp -> CustUserAddAf.jsp
	form		name	DB insert
	
	CustUserAdd.jsp < - DB, Controller, Dao
	현재 form을 유지한 상태로 데이터 통신을 수행한다.
	
	JQuery 소속
-->
<p id="demo"></p>
<br>
<button type="button">click</button>

<script type="text/javascript">
$(function () {
	$("button").on("click", function () {
//	$("button").click(function () {
//		$("#demo").load("data.html");	data.html의 모든데이터르 ㄹ가져와
		
//		$("#demo").load("data.html #data2");	 data.html의 data2만 가져와
		
//		$("#demo").load("data.jsp", "t1=abc&t2=가나다");
		
//		$("#demo").load("data.jsp", {t1:"ABC", t2:"라마다"});

		$("#demo").load("data.jsp", {t1:"ABC", t2:"라마다"}, function (data, status, xhr) {
//			alert(data);
			$("#demo").append("data = " + data + "<br>");
			$("#demo").append("status = " + status + "<br>");
			$("#demo").append("xhr = " + xhr);
		});
	});
});
</script>
</body>
</html>














