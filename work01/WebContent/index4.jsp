<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
public String setColorHTML(String str, String color) {
	return "<font color=\"" + color + "\">" + str + "</font>";
}
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String redText = setColorHTML("빨간 텍스트", "#ff0000");
String greenText = setColorHTML("녹색 텍스트", "#00ff00");
String blueText = setColorHTML("파란 텍스트", "#0000ff");
%>

<%=redText %><br>
<%=greenText %><br>
<%=blueText %>

</body>
</html>