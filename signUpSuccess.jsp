<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String signUpSuccess = request.getParameter("signUpSuccess");

	if (signUpSuccess != null && signUpSuccess.equals("true")) {
        out.println("<script>alert('계정 등록 성공');</script>");
        response.setHeader("Refresh", "0;url=loginForm.jsp");

	} else {
        out.println("<script>alert('계정 등록 실패');</script>");
        response.setHeader("Refresh", "0;url=signUp.jsp");

	}
%>