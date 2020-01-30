<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%--
	JSP : html, JavaScript, CSS, Java
	
	<%! 선언부(class, function, variable(global)) %>

	<% 코드부 %>
	
	<%=value %>
	: front end에서 Java를 사용하지 않기 위해서
	
	---------------------
	EL tag	-> value		<-- Java
	Core Tag -> 제어문
	---------------------
	jsp tag
	


	Expression Language
	표현			언어

	JSTL(Java Server Page Standard Tag Language)

--%>

<%
String str = "hello";
request.setAttribute("_str", str);		//request scope
%>

<%
String s = (String)request.getAttribute("_str");
%>

<%
out.println("s는 " + s);
%>
<br><br>
s는 <%=s %>

<br><br>

<%-- EL --%>
s는 ${ _str }

<br><br>

<%='값' %>
<br>
${ '값' }

<br>
<%=2+3 %>
<br>
${ 2 + 3 }

<br><br>

${ 3>2?100:200 }

<br><br>

<%
request.setAttribute("data", "안녕?어안녕");
%>

${ data }

<br><br>

Object가 할당되어 있는지?
<br>

data는 ${ empty data } <!-- true/false -->
<br>
data는 ${ not empty data }
<br><br>

1 < 9 : ${ 1 < 9 }		<!-- 판별식 --><!-- 9가 더커. 따라서 true야 -->
<br>
2 + 3 : ${ 2 + 3 }		<!-- 연산식  variable -->
<br><br>


<%
Integer a, b;
a = 10;
b = 3;

request.setAttribute("a", a);
request.setAttribute("b", b);

Boolean c;
c = false;

request.setAttribute("c", c);
%>

<pre>

a는 ${ a }
b는 ${ b }
c는 ${ c }

a+b는 ${ a + b }

eq:${ a eq b }
eq:${ a == b }

ne:${ a ne b }
ne:${ a != b }

gt:${ a gt b }
gt:${ a > b }

lt:${ a lt b }
lt:${ a < b }

le:${ a le b }		<!-- <= -->
ge:${ a ge b }		<!-- >= -->

div:${ a div b }	<!-- a / b -->
mod:${ a mod b }	<!-- a % b -->

c:${ !c }

${ a == 10 && !c }

</pre>

<br>

<%
MemberDto mem = new MemberDto();
mem.setMessage("안녕 el");

request.setAttribute("mem", mem);
%>

<%=mem.getMessage() %>
<br>
${ mem.message }	<!-- mem.getMessage() -->

<br><br>

<%
String array[] = {"안녕", "세상"};

request.setAttribute("array", array);
%>

<%=array[0] %>
<br>
${ array[0] }

<br><br>

<%
List<String> list = new ArrayList<String>();
list.add("세상");
list.add("el");

request.setAttribute("list", list);
%>

<%=list.get(0) %>
<br>
${ list[0] }
<br><br>

<%
List<MemberDto> memlist = new ArrayList<>();

MemberDto m = new MemberDto();
m.setMessage("첫째 메세지이ㅑ");
memlist.add(m);

m = new MemberDto();
m.setMessage("둘ㅉ'ㅐ  메시지");
memlist.add(m);

request.setAttribute("memlist", memlist);
%>

<%=memlist.get(1).getMessage() %>
<br>
${ memlist[1].message }
<br><br>

<%
HashMap<String, String> map = new HashMap<String, String>();

map.put("apple", "사과");
map.put("grape", "포도");

request.setAttribute("map", map);
%>

<%=map.get("apple") %>
<br>
${ map.apple }
<br>
${ map["apple"] }























</body>
</html>