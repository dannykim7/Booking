<%@page import="com.BookIng.bookCart.service.BookCartDeleteCartService"%>
<%@page import="com.BookIng.bookCart.service.BookCartDeleteService"%>
<%@page import="com.BookIng.bookCart.vo.BookCartVO"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
BookCartDeleteCartService service = new BookCartDeleteCartService();
BookCartVO vo = new BookCartVO();
vo.setId(id);

service.service(id);

response.sendRedirect("/bookBoard/list.jsp");
%>
