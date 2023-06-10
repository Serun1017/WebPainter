<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//요청 파라미터 가져오기
	String rowIndex = request.getParameter("row");
	String col = request.getParameter("col");
	String color = request.getParameter("color");
	
	session.setAttribute("row", rowIndex);
	session.setAttribute("col", col);
	session.setAttribute("color", color);
	
	response.sendRedirect("paint.do");
%>
