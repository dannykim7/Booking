<%@page import="com.BookIng.member.vo.LoginVO"%>
<%@page import="com.BookIng.notice.vo.NoticeVO"%>
<%@page import="com.BookIng.notice.service.NoticeViewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String strNo = request.getParameter("no");
long no = Long.parseLong(strNo);

NoticeViewService service = new NoticeViewService();
NoticeVO vo = service.service(no);
request.setAttribute("vo", vo);
vo.setContent(vo.getContent().replace("\n", "<br>"));

System.out.println(vo);
// LoginVO loginVO = (LoginVO) session.getAttribute("login");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 보기</title>
</head>
<body>
<div class="container">
	<h2>공지사항 보기</h2>
<table class="table">
   <tbody>
		<tr>
			<th>번호</th>
			<td>${vo.no }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${vo.title }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${vo.content }</td>
		</tr>
		<tr>
			<th>시작일</th>
			<td>${vo.startDate }</td>
		</tr>
		<tr>
			<th>종료일</th>
			<td>${vo.endDate }</td>
		</tr>
		<tr>
			<th>등록</th>
			<td>${vo.updateDate }</td>
		</tr>
<tr>
	<td colspan="2">
<%-- 		<c:if test="${!empty login && login.gradeNo == 9}"> --%>
				<a href="updateForm.jsp?no=${vo.no }" class="btn btn-default">수정</a>
				<a href="delete.jsp?no=${vo.no }"class="btn btn-default"> 삭제</a>
<%-- 			</c:if>			 --%>
				<a href="list.jsp?page=${param.page }&perPageNum=${param.perPageNum }" class="btn btn-default"> 리스트</a>
</td>
</tr>
    </tbody>
	</table>
</div>
</body>
</html>