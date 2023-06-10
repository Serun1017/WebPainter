<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	session.setAttribute("id", id);
	session.setAttribute("pw", pw);
    response.sendRedirect("login.do");
%>
