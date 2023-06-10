<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chatServer</title>
</head>
<script>
  function validateForm() {
    var loggedIn = <%= session.getAttribute("loggedIn") %>;

    if (loggedIn === null || loggedIn === false) {
      alert("로그인 후 이용해 주세요.");
      return false; // 페이지 전환을 막습니다.
    }

    return true; // 페이지 전환을 허용합니다.
  }
</script>
<body>
 	<iframe width="100%" height="1000" src="chatData.jsp"></iframe>
  	<form action="chatChecking.jsp" method="GET" onsubmit="return validateForm()">
  		<input type="text" name="chatMessage" autoFocus="autoFocus">
	  	<input type="submit" value="전송">
	</form>
	
</body>
</html>