<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// DB
String userName = "홍길동";
int userNumber = 1001;

String json = "{ \"num\":" + userName + ", \"name\":\"" + userName + "\" }";

// { "num":1001, "name":"홍길동" }

out.println(json);
%>