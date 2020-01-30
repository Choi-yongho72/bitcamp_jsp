<%@page import="dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.BbsDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
// 댓글의 여백과 이미지를 추가하는 함수
public String arrow(int depth){
	String rs = "<img src='./image/arrow.png' width='20px' height='20px'/>";
	String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";
	
	String ts = "";
	for(int i = 0;i < depth; i++){
		ts += nbsp;
	}
	return depth==0?"":ts + rs;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
<%
Object ologin = session.getAttribute("login1");
//request.getSession().getAttribute(name);
MemberDto mem = null;
if(ologin == null) {	// 세션 기간이 만료됐어!
%>
	<script type="text/javascript">
	alert("다시 로그인 해줄래?");
	location.href = "login1.jsp";
	</script>
<%
}
mem = (MemberDto)ologin;

BbsDao dao = BbsDao.getInstance();	
//List<BbsDto> list = dao.getBbsList();

//request.setAttribute("list", list);

// paging
String spageNumber = request.getParameter("pageNumber");
int pageNumber = 0;
if(spageNumber != null && !spageNumber.equals("")) {
	pageNumber = Integer.parseInt(spageNumber);
}

List<BbsDto> list = dao.getBbsPagingList(choice, searchWord, pageNumber);

int len = dao.getAllBbs();
System.out.println("총 글의 갯수 : " + len);

// 페이지의 갯수를 구해줘
int bbsPage = len / 10;		// 예 : 22개의 글 -> 3페이지
if(len % 10 > 0) {
	bbsPage = bbsPage + 1;
}
%>
<h4 align="right" style="background-color: #f0f0f0">
	환영해 <%=mem.getId() %>님!
</h4>

<h1>게시판</h1>

<div align="center">

<table border="1">
<col width="70"><col width="600"><col width="150">

<tr>
	<th>번호</th><th>제목</th><th>작성자</th>
</tr>
<%
if(list == null || list.size() == 0){
	%>
	<tr>
		<td colspan="3">작성된 글이 없습니다</td>
	</tr>
	<%
}else{
	
	for(int i = 0;i < list.size(); i++){
		BbsDto bbs = list.get(i);		
	%>
	<tr>
		<th><%=i + 1 %></th>
		<td style="color: red">
			<%
			if(bbs.getDel() == 0) {
				%>
				<%=arrow(bbs.getDepth()) %>
				<a href="bbsdetail.jsp?seq=<%=bbs.getSeq() %>">
					<%=bbs.getTitle() %>	
				</a>
			<%
			} else if(bbs.getDel() == 1 && bbs.getStep() > 0) {
			%>
				<%=arrow(bbs.getDepth()) %> (삭제된 댓글입니다.)
			<%
			} else {
			%>
			-----(삭제된 글입니다.)-----
			<%
			}
			%>
		</td>
		<td align="center"><%=bbs.getId() %></td>
	</tr>
	<%
	}
}
%>
</table>

<form action="bbssearchlist.jsp" method="get">
<table>
<col width="220"><col width="600">
<tr>
	<td align="left">
		<input type="button" value="글쓰기" onclick="location.href='bbswrite.jsp'">
	</td>
	<td align="right">
		<select name="_type">
			<option value="0">제목</option>
			<option value="1">내용</option>
			<option value="2">제목+내용</option>
			<option value="3">작성자</option>
		</select> 
		<input type="search" name="keyword">
		<input type="submit" value="검색">
	</td>
</tr>
</table>
</form>

<%
for(int i = 0; i < bbsPage; i++) {
	if(pageNumber == i) {		// 현재 페이지
		%>
		<span style="font-size: 15pt; color: #0000ff; font-weight: bold;">
			<%=i + 1 %>
		</span>&nbsp;
		<%
	}else {						// 그 외의 페이지
		%>
		<a href="#none" title="<%=i + 1 %>페이지" onclick="goPage(<%=i %>)"
			style="font-size: 15pt; color: #000; font-weight: bold;">
			[<%=i + 1 %>]
		</a>&nbsp;
		<%
	}
}

%>
<br><br>




</div>
<a href="bbswrite.jsp">글쓰기</a>















<script type="text/javascript">
function goPage( pageNum) {
//	alert("pageNum은 " + pageNum);
	location.href = "bbslist.jsp?pageNumber=" + pageNum;
}

</script>





</body>
</html>