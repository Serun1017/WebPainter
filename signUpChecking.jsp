<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String userName = request.getParameter("userName");
	String email = request.getParameter("email");

	session.setAttribute("id", id);
	session.setAttribute("pw", pw);
	session.setAttribute("userName", userName);
	session.setAttribute("email", email);

	
	response.sendRedirect("signUp.do");

%>