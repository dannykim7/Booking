<%@page import="com.BookIng.qna.vo.QnaVO"%>
<%@page import="com.BookIng.qna.service.QnaViewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
// 여기가 자바 부분 입니다.
// 데이터 받기 - 글번호 --> 글보기 : view.jsp
String strNo = request.getParameter("no");
long no = Long.parseLong(strNo);

// DB 글번호에 맞는 데이터 가져오기 - QnaViewService 생성 - 호출
QnaViewService service = new QnaViewService();
QnaVO vo = service.service(no, 0);
System.out.println("updateForm.jsp - vo : " + vo);

//EL 이나 JSTL에서 데이터를 사용하기 위해서 기본 저장 객체에 저장해 둔다.
request.setAttribute("vo", vo);
%>
<html>
<head>
<meta charset="UTF-8">
<title>질문 답변 수정</title>
<style type="text/css">
h2 { /* 문의답변보기 : 공간 */
	margin-bottom: 50px;
}
body form {
 font-family: "Trebuchet MS", Tahoma, sans-serif;
 font-size: large;
}
</style>
</head>
<body>
	<div class="container">
	<h2 style="text-align:center;"><b>질문 답변 수정</b></h2>
		<form action="update.jsp" method="post" class="form-horizontal">

			<div class="form-group">
				<label for="no" class="control-label col-sm-2">번호</label>
				<!-- input 데이터 입력, value : 입력란의 초기값 -->
				<!-- readonly : 수정불가능 하게 만든다.  -->
				<div class="col-sm-10">
					<input type="text" name="no" value="${vo.no }" readonly="readonly"
						id="no" class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for="title" class="control-label col-sm-2">제목</label>
				<!-- input 데이터 입력, type : 입력형태 name : 전달 이름, maxlength : 최대입력 -->
				<div class="col-sm-10">
					<input type="text" name="title" maxlength="10" value="${vo.title }"
						id="title" class="form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for="content" class="control-label col-sm-2">내용</label>
				<div class="col-sm-10">
					<textarea rows="7" name="content" id="content" class="form-control">${vo.content }</textarea>
				</div>
			</div>

			<div class="text-center">
				<!-- button이 form tag 안에 있으면 데이터를 전달하는 동작을 하게 된다. -->
				<button type="submit" class="btn btn-default">수정</button>
				<button type="reset" class="btn btn-default">다시 입력</button>
				<button type="button" onclick="history.back()"
					class="btn btn-default">취소</button>
			</div>

		</form>
	</div>
</body>
</html>