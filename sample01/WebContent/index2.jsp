<%@page import="sample01.MyUtil"%>
<%@page import="sample01.YouClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
public class MyClass{
	private int num;
	private String name;
	
	public MyClass(){
		num = 12;
		name = "World";
	}
	public String Print(){
		return num + " " + name;
	}
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
MyClass cls1 = new MyClass();
%>

<%=cls1.Print() %>
<br>
<%
out.println(cls1.Print());
%>
<br><br>
<%
YouClass ycls1 = new YouClass(100, "일지매");
%>

<%=ycls1.toString() %>

<%
MyUtil.myfunc();
%>

<%
String str = "Hello";
%>
<br><br>

<input type="text" size=20 value="<%=str %>">

</body>
</html>