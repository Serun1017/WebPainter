<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#menu {
		background-color: #424242;
		padding-left: 10%;
	}
	#menu a {
		color: white;
		padding-left: 20px;
		text-decoration: none;
	}
</style>
</head>
<body>
	<div id="menu" >
		<h3>
			<a href="">HOME</a>
			<% String loggedIn = (String) session.getAttribute("loggedIn");
				if (loggedIn != null && loggedIn.equals("true")) {
			%>
				<a href="logout.jsp">로그아웃</a>
			<%
				} else {
			%>			
				<a href="loginForm.jsp">로그인</a>
			<%
				}
			%>
		</h3>
	</div>
</body>
</html>