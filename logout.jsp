<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	session.setAttribute("loggedIn", "false");
	session.setAttribute("userID", null);
	
	response.sendRedirect("Main.jsp");
%>