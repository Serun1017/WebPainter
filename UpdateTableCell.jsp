<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String jsonData = request.getParameter("jsonData");

	session.setAttribute("jsonData", jsonData);
	
	response.sendRedirect("DotPainter.jsp");
%>