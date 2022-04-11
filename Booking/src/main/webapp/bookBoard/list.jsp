<%@page import="com.webjjang.util.PageObject"%>
<%@page import="com.BookIng.bookBoard.vo.BookBoardVO"%>
<%@page import="com.BookIng.bookBoard.service.BookBoardListService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%
// 페이지 처리를 위해 request를 받아 PageObject의 getInstance로 저장한다.
PageObject pageObject = PageObject.getInstance(request);
pageObject.setPerPageNum(12);
// list에 데이터 수집은 없다.
// DB에서 데이터를 가져온다. 
BookBoardListService Service = new BookBoardListService();
List <BookBoardVO> list = Service.service(pageObject);
System.out.println(list);

//el 객체는 getter를 사용해서 데이터를 꺼낸다.
request.setAttribute("list", list); 
request.setAttribute("pageObject", pageObject); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 목록</title>
<script type="text/javascript">
</script>
<style type="text/css">
/* 리스트 데이터를 각각의 네모안에 보기좋게 넣어준다 */
#card .thumbnail{
    display: inline-flex;
}
th{
	background: black;
	color: white;
}
/* 마우스를 올려둘때 그림자효과를 발동한다 */
.dataRow:hover {
 	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2), 0 10px 20px 0 rgba(0, 0, 0, 0.2);
	cursor: pointer;
	
	opacity: 1;
    transition: all 0.2s;
 } 
 #cover {
	width: 130px; 
	height: 160px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.2);
}

#title {
	font-size: 20px;
	border-left: none;
	border-right: none;
	border-bottom: none;
	border-top: none;
}
</style>
</head>
<body>
<!-- bootstrap을 이용해 보기좋게 만들어준다. -->
<div class="container">
 <h2>도서 목록</h2>
 <div class="row">
<!--  리스트에 데이터가 존재하지 않을때 출력할 화면 -->
  	<c:if test="${empty list }">
<tr>
	<td colspan="5">데이터가 존재하지 않습니다.</td>
</tr>
</c:if>
<!-- 줄넘김을 위한 함수 -->
<%	int i = 0;
	for(BookBoardVO vo : list) { %>
 <div id="card" class="col-md-4" >
    <div class="thumbnail dataRow" onclick="document.location='view.jsp?bookNo=<%= vo.getBookNo() %>&page=${pageObject.page }&perPageNum=${pageObject.perPageNum }'" >
        <div class="col-md-5">
<!--         받아온 BookNo를 화면에 출력한다 -->
            <p>[<%= vo.getBookNo() %>]</p>
<!--             책표지를 화면에 출력한다 -->
            <img src="<%= vo.getCover() %>" alt="thumbnail" id="cover"  >
        </div>
        <div class="col-md-7">
          <br>
          <!-- 받아온 list 데이터를 화면에 출력한다 -->
          <ul>
            <li><p id="title"><%= vo.getTitle() %></p></li>
            <li><p><%= vo.getWriter() %></p></li>
            <li><p><%= vo.getGenre() %></p></li>
            <li><p><%= vo.getPublisher() %></p></li>
            <li><p><%= vo.getPubDate() %></p></li>
            <li><p><fmt:formatNumber value="<%= vo.getPrice() %>" pattern="#,###" />원</p></li>
          </ul>
        </div>
	</div>
</div>
  
	<% i++;
	// 이미지 3개를 출력하면 새로운 줄을 만든다. 만약 출력된 이미지가 총 데이터의 갯수와 같다면 그만 만든다.
	System.out.print(i );
	if(i % 3 == 0 && i != list.size() ){%>
<!-- 	 한 줄을 마감하고 새로운 줄을 시작한다.  -->
	</div>
	<div class="row">
	
	<% }
	 } %>
	 </div>
</div>
<!-- 	도서 등록 페이지로 넘어간다. -->
		<c:if test="${!empty login && login.gradeNo == 9}">
	<div class="text-center">
			<a href="writeForm.jsp" class="btn btn-default">도서 등록</a>
			</div>
			</c:if>
<!-- 	페이지를 이동하는 버튼을 생성한다. -->
	<div class="text-center">
			<pageNav:pageNav listURI="list.jsp" pageObject="${pageObject }"></pageNav:pageNav>
	</div>	
</body>
</html>

	