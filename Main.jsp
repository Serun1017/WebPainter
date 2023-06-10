<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	session.setMaxInactiveInterval(-1);
%>
<body>
	<table width="100%">
		<tr>
			<th><h1>웹 페인터</h1></th>
		</tr>
		<tr>
			<td><jsp:include page="menu.jsp"/></td>
		</tr>
		<tr>
 			<td><iframe width="59%" height="1130" src="DotPainter.jsp"></iframe>
 				<iframe width="39%" height="1130" src="chat.jsp"></iframe>
 			</td>
 		</tr>
	</table>
</body>
</html>