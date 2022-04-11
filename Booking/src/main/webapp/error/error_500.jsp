<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>에러 페이지</title>
</head>
<body>
<h2>에러 페이지</h2>
원인 : <%= exception.getMessage() %>
<p>
다시 한번 시도해 보십시오. 그래도 오류가 난다면 고객센터로 문의 부탁드립니다.
<p>
<a href="../main/main.jsp" class="btn btn-default">메인으로 돌아가기</a>
</p>
</body>
</html>