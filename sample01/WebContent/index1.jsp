<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- scriptlet의 영역 --%>
<%!
// 선언의 영역 : 변수(global(전역))를 선언, 함수선언, 클래스선언
int gl_var = 0;

public void func(){
	System.out.println("func() 호출");
}
%>

<%
// 코드부
gl_var++;	// 전역변수라서 계속 증가

int var = 0;	// 0으로 계속 셋팅되서 1만 나옴
var++;

out.println("gl_var = " + gl_var);
out.println("var = " + var);

func();

%>

<%=gl_var %>	<!-- value값만 취득 -->

</body>
</html>