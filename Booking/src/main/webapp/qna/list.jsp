<%@page import="com.webjjang.util.PageObject"%>
<%@page import="com.BookIng.qna.vo.QnaVO"%>
<%@page import="java.util.List"%>
<%@page import="com.BookIng.qna.service.QnaListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- JSTL : 적용 --%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- pageNav : 적용 --%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
    
<%
// 여기가 자바 부분 입니다.

// 넘어오는 페이지 정보를 받아서 페이지 객체 생성
PageObject pageObject = PageObject.getInstance(request);

// 리스트 데이터를 가져오기 위한 객체 생성
QnaListService service = new QnaListService();
List<QnaVO> list = service.service(pageObject);

// 데이터 확인
System.out.println("QnaList.jsp : " + list);

// EL 객체나 JSTL 객체로 사용하기 위해서 기본 저장 객채(request)에 닿는다.
// EL 라이브러리는 톰캣에 포함되어 있다. 
request.setAttribute("list", list);
request.setAttribute("pageObject", pageObject);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 게시판</title>
<style type="text/css">
.dataRow:hover {  /* hover : 커서 해당부분만 모양 변경 및 백그라운드 색깔 바꾸기 */
	cursor : pointer;
	background: #eee;
}
h2 { /* 문의게시판 : 공간 */
	margin-bottom: 50px;
}
body table {
 font-family: "Trebuchet MS", Tahoma, sans-serif;
 font-size: medium;
}
.grayTd {
	color: #b4b0b0;
}
.tr1{
 	border-top-style: solid;
 	border-top-width: 2px;
 	border-top-color: black;
}
#cell{
	padding: 15px;
}
#posi{
	position: relative; 
	top: -80px;
}

</style>
</head>
<body>
<div class="container">
<h2 style="text-align:center;"><b>문의게시판</b></h2>
<table class="table">
	<tr class="tr1">
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<!-- 데이터가 있는 만큼 JSTL의 반복문을 이용해서 tr을 만들어서 표시. 한개의 데이터를 vo에 담는다. -->
	<c:forEach items="${list }" var="vo">
	<!-- 데이터 한줄 정의 : class="dataRow", 글번호를 tr 태그 안에 data-no로 숨겨둔다. -->
	<tr onclick="document.location='view.jsp?no=${vo.no }&inc=1&page=${pageObject.page }&perPageNum=${pageObject.perPageNum }'" class="dataRow">
		<td>${vo.no }</td>
		<td>
			<!-- 들여쓰기 levNo를 이용해서 공백문자 표시 3칸 적용. &nbsp; : 공백문자 
				 begin : 시작 숫자, end : 끝 숫자 -->
			<c:forEach begin="1" end="${vo.levNo * 2 }">
				&nbsp;
			</c:forEach>	 
			<!-- 답변글 기호 표시 -->
		    <!-- c:if 만약에 levNo가 0보다 크면 답변아이콘 표시 -->
		    <c:if test="${vo.levNo > 0 }">
		    	<i class="material-icons">&#xe5da;</i>
		    </c:if>
		    ${vo.title }
		</td>
		<td>${vo.name }(${vo.id })</td>
		<td class="grayTd">${vo.writeDate }</td>
		<td class="grayTd">${vo.hit }</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="5">
			<pageNav:pageNav listURI="list.jsp" pageObject="${pageObject }"></pageNav:pageNav>
		</td>
	</tr>
		<!-- 로그인을 한 경우만 질문하기 버튼이 나타난다. -->
<%-- 		<c:if test="${!empty login }"> --%>
	<tr id="posi">
		<td colspan="5" class="text-right" style="border-top:none;">
			<a href="writeForm.jsp" class="btn btn-default text-right">질문하기</a>
		</td>	
	</tr>
<%-- 	</c:if> --%>
</table>
</div>
</body>
</html>