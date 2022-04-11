package com.webjjang.utill.init;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

/**
 * Servlet implementation class Init
 */
//@WebServlet("/Init") --> web.xml 에서 servlet으로 등록
public class Init extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// url 등급에 대한 정보를 저장하는 map 변수 - map<url, 권한번호>
	public static Map<String, Integer> authorityMap = new HashMap<String, Integer>();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    public Init(){
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
    // 서버가 시작될 때 초기화 작업
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		   
        // 서버가 실행될 때 실행이 되는지 확인하는 출력
        System.out.println("Init.init() 실행되고 있다.-----------------------------");
        
        // 1. db 드라이버 확인 -> db class 확인을 한다.
        try {
			Class.forName("com.webjjang.utill.db.DB");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        // 2. 실행하려는 객체를 생성하고 조립해 둔다. -> 생략한다. 대신 필요할 때 new하는 것으로 한다.
        // 3. 페이지 권한을 등록한다.
        // 회원관리 권한 ( 9: 관리자, 1: 일반회원)
        authorityMap.put("/member/list.jsp", 9);
        authorityMap.put("/member/view.jsp", 1);
        authorityMap.put("/member/updateForm.jsp", 1);
        authorityMap.put("/member/upadte.jsp", 1);
        authorityMap.put("/member/delete.jsp", 1);
        
        // 공지사항 권한
        authorityMap.put("/notice/writeForm.jsp", 9);
        authorityMap.put("/notice/write.jsp", 9);
        authorityMap.put("/notice/updateForm.jsp", 9);
        authorityMap.put("/notice/update.jsp", 9);
        authorityMap.put("/notice/delete.jsp", 9);
        
        // 질문답변 권한
        authorityMap.put("/qna/writeForm.jsp", 1);
        authorityMap.put("/qna/write.jsp", 1);
        authorityMap.put("/qna/answerForm.jsp", 1);
        authorityMap.put("/qna/answer.jsp", 1);
        authorityMap.put("/qna/updateForm.jsp", 1);
        authorityMap.put("/qna/update.jsp", 1);
        authorityMap.put("/qna/delete.jsp", 1);
        
        // bookBoard 권한
        authorityMap.put("/bookBoard/writeForm.jsp", 1);
        authorityMap.put("/bookBoard/write.jsp", 1);
        authorityMap.put("/bookBoard/updateForm.jsp", 1);
        authorityMap.put("/bookBoard/update.jsp", 1);
        authorityMap.put("/bookBoard/delete.jsp", 1);
        authorityMap.put("/bookBoard/changeCover.jsp", 1);

        // bookCart 권한
        authorityMap.put("/bookCart/addCart.jsp", 1);
        authorityMap.put("/bookCart/cart.jsp", 1);
        authorityMap.put("/bookCart/cartList.jsp", 1);
        authorityMap.put("/bookCart/deleteBooks.jsp", 1);
        authorityMap.put("/bookCart/deleteCart.jsp", 1);
        authorityMap.put("/bookCart/purchase.jsp", 1);
        authorityMap.put("/bookCart/removeBook.jsp", 1);
	}

}
