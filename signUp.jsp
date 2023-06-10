<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<script type="text/javascript">
		function check() {
			if (!signUp.id.value) {
				alert("아이디를 입력하세요");
				signUp.id.focus();
				return false;
			}
			if (!signUp.pw.value) {
				alert("비밀번호를 입력하세요");
				signUp.pw.focus();
				return false;
			}
			if (!signUp.userName.value) {
				alert("닉네임을 입력하세요");
				signUp.userName.focus();
				return false;
			}
			if (!signUp.email.value) {
				alert("이메일을 입력하세요");
				signUp.email.focus();
				return false;
			}
			return true;
		}
	</script>

<body>
	<h2>&#10030; 계정 등록 화면 &#10030;</h2>
	<form action="signUpChecking.jsp" name="signUp" method="GET" onsubmit="return check()">
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
				<td>닉네임</td>
				<td><input type="text" name="userName"></td>
			</tr>
			<tr align="center">
				<td>이메일</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="계정 생성">
			</tr>
		</table>
	</form>
</body>
</html>