<%@page import="dao.BbsDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

int seq = Integer.parseInt( request.getParameter("seq") );
String title = request.getParameter("title");
String content = request.getParameter("content");

System.out.println("seq : " +seq);
System.out.println("title : " +title);
System.out.println("content : " +content);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
/* 세션 얻어오는 방법 2 */
/* 1) */
Object ologin = session.getAttribute("login1");
/* 2) */
				//request.getSession().getAttribute("login");
MemberDto mem = null;

//MemberDto mem = (MemberDto)request.getSession().getAttribute("login");

if(ologin == null) {
	response.sendRedirect("login1.jsp");
	%>
	<script type="text/javascript">
		alert("로그인 해 주십시오")
		location.href="login1.jsp";
	</script>
	<%
}
mem = (MemberDto) ologin;

BbsDao dao = BbsDao.getInstance();
boolean isS = dao.updateBbs(seq, title, content);
if(isS){
%>
	<script type="text/javascript">
		alert("수정 완료!!")
		location.href = "bbsdetail.jsp?seq="+<%=seq%>;
	</script>
<%
} else {
%>
	<script type="text/javascript">
		alert("수정 실패!!")
		location.href = "bbsdetail.jsp";
	</script>
<%
}
%>
</body>
</html>