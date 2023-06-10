<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String chatMessage = request.getParameter("chatMessage");

	session.setAttribute("chatMessage", chatMessage);
    
	response.sendRedirect("chat.do");
%>