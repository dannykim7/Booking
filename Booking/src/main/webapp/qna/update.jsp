<%@page import="com.BookIng.qna.service.QnaUpdateService"%>
<%@page import="com.BookIng.qna.vo.QnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
// 여기가 자바 입니다.

// 1. 넘어오는 데이터 받기
String strNo = request.getParameter("no");
long no = Long.parseLong(strNo);
String title = request.getParameter("title");
String content = request.getParameter("content");

// Controller - Service - DAO : QnaVO 객체를 만달으서 전달한다.
QnaVO vo = new QnaVO();
vo.setNo(no);
vo.setTitle(title);
vo.setContent(content);

System.out.println("질문 답변 수정 - " + vo);
//QnaUdateService -> QnaDAO.update()
QnaUpdateService service = new QnaUpdateService();
service.service(vo);


// 게시판 리스트로 자동 이동 시킨다.
response.sendRedirect("view.jsp?no=" + no + "&inc=0");
%>