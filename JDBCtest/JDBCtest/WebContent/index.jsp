<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>HR Tables</h1>

<p>모든 테이블의 목록을 출력한다</p>

<%!
public boolean has$(String msg){
	// $가 포함되어 있는 테이블은 링크가 되지 않도록 하기 위한 함수
	return msg.contains("$");
}
%>

<%
Class.forName("oracle.jdbc.driver.OracleDriver");

String url = "jdbc:oracle:thin:@192.168.2.75:1521:xe";
String user = "hr";
String password = "hr";

Connection conn = DriverManager.getConnection(url, user, password);

String sql = "SELECT * FROM TAB";	// table의 모든 정보 불러오기
PreparedStatement psmt = conn.prepareStatement(sql);

ResultSet rs = psmt.executeQuery();

ResultSetMetaData rsmd = rs.getMetaData();	// column 정보
int count = rsmd.getColumnCount();			// column 수

%>

<table border="1">
<tr>
	<%
	for(int i = 1;i < count + 1; i++){	// DB는 1부터
	%>
		<td><%=rsmd.getColumnName(i) %></td>
	<%
	}
	%>
</tr>

<%
while( rs.next() ){
	%>
	<tr>
		<%
		for(int i = 1;i < count + 1; i++){
			String cols = rs.getString(i);
			if(i == 1 && !has$(cols)){	// i = 1 테이블명
				%>
				<td>
					<a href="table.jsp?tname=<%=cols %>"><%=cols %></a>
				</td>
				<%					
			}else{
				%>
				<td>
					<%=rs.getString(i) %>
				</td>				
				<%
			}			
		}		
		%>	
	</tr>	
	<%
}
%>

</table>

<%
if(rs != null) rs.close();
if(psmt != null) psmt.close();
if(conn != null) conn.close();
%>


</body>
</html>