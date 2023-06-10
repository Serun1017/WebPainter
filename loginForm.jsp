<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
<script type="text/javascript">
		function check() {
			if (!login.id.value) {
				alert("아이디를 입력하세요");
				login.id.focus();
				return false;
			}
			if (!login.pw.value) {
				alert("비밀번호를 입력하세요");
				login.pw.focus();
				return false;
			}
			return true;
		}
	</script>
	<h2>&#10030; 로그인 화면 &#10030;</h2>
	
	<form action="checking.jsp" name="login" method="GET" onsubmit="return check()">
		<table border="1">
			<tr align="center">
				<td>아이디</td>
				<td><input type="text" name="id" autoFocus="autoFocus"></td>
			</tr>
			<tr align="center">
				<td>비밀번호</td>
				<td><input type="password" name="pw"></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="로그인">
				<button onclick="location.href='signUp.jsp'">계정생성</button></td>
			</tr>
		</table>
	</form>
	
	<script type="text/javascript">
    	document.querySelector('button').addEventListener('click', function(event) {
        event.preventDefault();
        location.href = 'signUp.jsp';
    });
</script>
	
</body>
</html>