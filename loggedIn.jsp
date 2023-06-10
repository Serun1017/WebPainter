<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String loggedIn = request.getParameter("loggedIn");
	String userName = request.getParameter("userName");
		
	if (loggedIn.equals("true")) {
		session.setAttribute("loggedIn", loggedIn);
		session.setAttribute("userName", userName);
		
		out.println("<script>alert('로그인 성공');</script>");
        response.setHeader("Refresh", "0;url=Main.jsp");
	} else {
		out.println("<script>alert('아이디 또는 비밀번호가 일치하지 않습니다.');</script>");
        response.setHeader("Refresh", "0;url=loginForm.jsp");
	}
%>