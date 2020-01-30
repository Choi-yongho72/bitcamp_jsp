<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="insertAf.jsp" method="get">
아이디:<input type="text" size="20" name="id"><br>
패스워드:<input type="text" size="20" name="pwd"><br>
<br><br>
취미:
<br>
<input type="checkbox" name="hobby" value="sleep" checked="checked">잠자기
<input type="checkbox" name="hobby" value="sing">노래하기
<input type="checkbox" name="hobby" value="game">게임하기
<br><br>

연령대:
<input type="radio" name="age" value="10" checked="checked">10대
<input type="radio" name="age" value="20">20대
<input type="radio" name="age" value="30">30대
<input type="radio" name="age" value="40">40대
<input type="radio" name="age" value="50">50대
<input type="radio" name="age" value="60">60대이상
<br><br>

기타하고 싶은 말<br>
<textarea rows="5" cols="50" name="story"></textarea>
<br><br>

<input type="submit" value="전송">
<input type="reset" value="취소">
</form>


</body>
</html>