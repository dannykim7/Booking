<%@page import="com.BookIng.grade.vo.GradeVO"%>
<%@page import="com.BookIng.grade.service.GradeUpdateService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 한글처리
request.setCharacterEncoding("utf-8");
// 데이터 수집
String strGradeNo = request.getParameter("gradeNo");
int gradeNo = Integer.parseInt(strGradeNo);
String gradeName = request.getParameter("gradeName");
System.out.println("gradeNo : " + gradeNo);
System.out.println("gradeName : " + gradeName);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등급 수정 폼</title>
<style type="text/css">
th, td {
	border: 1px solid #444;
	padding: 5px;
}
</style>
</head>
<body>
	<h2>등급 수정 폼</h2>
	<div class="container">
		<form action="update.jsp" method="post">
			<div class="form-group">
				<!-- <table> -->
				<%-- <tr>
						<th>등급번호</th>
						<td><input name="gradeNo" value="<%=gradeNo%>"
							readonly="readonly"></td>
					</tr> --%>
				<div>
					<label for="gradeNo" class="control-label col-sm-2">등급번호</label>
					<!-- value : 입력란의 초기값 -->
					<div class="col-sm-10">
						<input type="text" name="gradeNo" value="<%= gradeNo %>"
							readonly="readonly" id="gradeNo" class="form-control" />
					</div>
				</div>
				<%-- <tr>
						<th>등급명</th>
						<td><input name="gradeName" value="<%=gradeName%>"></td>
					</tr> --%>
				<div class="form-group">
					<label for="gradeName" class="control-label col-sm-2">등급명</label> <input
						type="text" name="gradeName" maxlength="100" value="<%= gradeName %>"
						id="gradeName" class="form-control" />
					<tr>
						<td colspan="2"><button class="btn btn-default">수정</button>
							<button class="btn btn-default" onclick="reset">다시입력</button>
							<button class="btn btn-default" onclick="history.back()">취소</button></td>
					</tr>
					<!-- </table> -->

				</div>
		</form>
	</div>
</body>
</html>