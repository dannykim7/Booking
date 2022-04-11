<%@page import="java.util.ArrayList"%>
<%@page import="kr.gov.dto.Product"%>
<%@page import="kr.gov.dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>해당상품 삭제</title>
</head>
<body>
	<%
		String id = request.getParameter("id"); //삭제할 상품 id
		
		//상품 id 넘어오지 않았을 때 강제로 products.jsp이동시키고 종료
		if(id == null || id.trim().equals("")) {
			response.sendRedirect("products.jsp");
			return;
		}
		
		//상품 데이터 접근 클레스의 인스턴스 생성
		ProductRepository dao = ProductRepository.getInstance();
		//해당 id값을 이용해서 상품상세정보를 얻어오는 코드
		Product product = dao.getProductById(id);
		if(product == null) {
			response.sendRedirect("exceptionNoProductId.jsp");
		}
		
		ArrayList<Product> cardList = (ArrayList<Product>)session.getAttribute("cardList");
		Product goodQnt = new Product();
		for(int i=0; i<cardList.size(); i++) {
			goodQnt = cardList.get(i);
			if(goodQnt.getProductId().equals(id)) {
				cardList.remove(goodQnt);
			}
		}
		
		response.sendRedirect("cart.jsp");
	%>
</body>
</html>