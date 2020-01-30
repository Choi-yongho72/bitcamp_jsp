<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%--
	EL:표현식(값, 판별)
	Core: 제어문 (for, if) -> EL tag와 같이 사용한다.
--%>

<%
request.setAttribute("data", "JSTL입니다.");
%>

${ data }
<br>

<%--	<c:set var="cdata" value="core JSTL입니다."></c:set>
		이거랑 동일 코드
String cdata = "core JSTL입니다.";
--%>
<!-- set -->
<c:set var="cdata" value="core JSTL입니다."></c:set>
${ cdata }
<br><br>

<!-- out(내장객체) -->
<%--
out.println(cdata);
--%>
<%
session.setAttribute("sessionData", "저장된 데이터");
%>
<c:set var="sdate" value="${ sessionData }"></c:set>
<c:out value="${ sdate }"/>

<br><br>

<!-- if -->
<%
request.setAttribute("count", "10");
%>
<%
String sCount = (String)request.getAttribute("count");
int count = Integer.parseInt(sCount);
if(count >= 10) {
	%>
	<p>count:<%=count %></p>
	<%
}
%>

<c:if test="${ count >= 10 }">
	<p>Core count:<c:out value="${ count }"/></p>
</c:if>

<br><br>

<%
request.setAttribute("name", "최용호");
%>

<c:if test="${ name eq '최용호' }">
	<p>나 최용호 맞아!</p>
</c:if>

<%
request.setAttribute("name", "김현식");
%>

<c:if test="${ name == '김현식' }" var="flg"/>
	
<c:if test="${ flg }">
	<p>이름은 김현식!</p>
</c:if>

<br><br>

<!-- for -->
<%
for(int i = 0; i < 10; i++) {
	%>
	<%=i %>
	<%
}
%>

<br>

<c:forEach begin="0" end="9" step="1" varStatus="i">
	<c:out value="${ i.index }"></c:out>

</c:forEach>

<%
List<MemberDto> list = new ArrayList<MemberDto>();

MemberDto mem = new MemberDto();
mem.setMessage("안녕");
list.add(mem);

mem = new MemberDto();
mem.setMessage("진짜?");
list.add(mem);

request.setAttribute("list", list);
%>

<%--
for(int i = 0; i < list.size(); i++) {
	MemberDto m = list.get(i);
}
for(MemberDto m : list) {
	
}
--%>

<c:forEach begin="0" end="2" var="m" items="${ list }" varStatus="i">
	<p>index는 <c:out value="${ i.index }"/></p>
	<p>data는 <c:out value="${ m.message }"/>
</c:forEach>

<!-- Map -->
<%
Map<String, String> map = new HashMap<String, String>();

map.put("apple", "사과");
map.put("pear", "배");
map.put("banana", "바나나");

request.setAttribute("map", map);
%>

<c:forEach var="obj" items="${ map }">
	key는 <c:out value="${ obj.key }"></c:out>
	value는<c:out value="${ obj.value }"></c:out>
</c:forEach>





























</body>
</html>