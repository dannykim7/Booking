package com.BookIng.bookBoard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.BookIng.bookBoard.vo.BookBoardVO;
import com.BookIng.util.db.DB;
import com.webjjang.util.PageObject;


public class BookBoardDAO {
	
	// 필요한 객체
	// 전역변수인 경우는 참조형 변수를 선언하면 초기값이 null로 자동 세팅이 되므로 = null;를 안해줘도 됨
	public Connection con;
	public PreparedStatement pstmt;
	public ResultSet rs;
	
	public List<BookBoardVO> list(PageObject pageObject) throws Exception{
		List<BookBoardVO> list = null;
		
		// 예외처리
		try {
			// 1. 드라이버 확인, 2. 연결
			//Connection으로 db에 연결한다.
			con = DB.getConnection();
			// 3. sql
			//db데이터를 불러올 sql 쿼리문을 String sql에 입력한다.
			String sql = "select bookNo, title, writer, genre, publisher, "
					+ " to_char(pubDate, 'yyyy-mm-dd')pubDate, price, cover "
					+ " from bookBoard "
					+ " order by bookNo desc " ;
			// 3-1. 페이지 처리를 위한 sql
			sql = "select rownum rnum, bookNo, title, writer, genre, publisher, pubDate, price, cover"
				+ " from (" + sql + ") ";
			// 3-2. 페이지에 맞는 데이터 가져오기
			sql = "select rnum, bookNo, title, writer, genre, publisher, pubDate, price, cover "
				+ " from (" + sql + ") WHERE rnum between ? AND ? ";
			// 4. 실행객체
			// Connection으로 sql을 prepareStatement에 전달해 실행객체를 생성한다.
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, pageObject.getStartRow()); 
			pstmt.setLong(2, pageObject.getEndRow()); 
			// 5. 실행
			// executeQuery를 호출하여 sql 쿼리문을 실행한다.
			rs = pstmt.executeQuery();
			// 6. 표시 또는 담기
			// ResultSet에 저장된 결과값이 null이 아닐시 db에 저장된 데이터를 출력한다.
			if(rs != null) {
				// rs에 저장되어있는 데이터를 반복처리 하여 한 행씩 불러온다.
				while (rs.next()) {
					if (list == null) list = new ArrayList<BookBoardVO>();
					BookBoardVO vo = new BookBoardVO();
					// setter를 이용해서 데이터 담기
					vo.setBookNo(rs.getLong("bookNo"));
					vo.setTitle(rs.getString("title"));
					vo.setWriter(rs.getString("writer"));
					vo.setGenre(rs.getString("genre"));
					vo.setPublisher(rs.getString("publisher"));
					vo.setPubDate(rs.getString("pubDate"));
					vo.setPrice(rs.getString("price"));
					vo.setCover(rs.getString("cover"));
					
					
					// vo를 list에 담기
					list.add(vo);
				}
			} // if문의 끝
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			// 7. 닫기
			// 각각 객체에 더 이상 전달될 데이터가 존재하지 않을때 객체를 닫는다.
			try {
				DB.close(con, pstmt, rs);
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
//		System.out.println("BookBoardDAO.list().list" + list);
		return list;
		
	}
	// 페이지 처리를 위한 dao
	public long getTotalRow(PageObject pageObject) {
		// TODO Auto-generated method stub
		long totalRow = 0;
		
		try {
			
		// 1. 드라이버 확인, 2. 연결
		//Connection으로 db에 연결한다.
		con = DB.getConnection();
		
		// 3. sql
		//db데이터를 불러올 sql 쿼리문을 String sql에 입력한다.
		String sql = "SELECT count(*) from bookBoard ";
		// 4. 실행객체
		// Connection으로 sql을 prepareStatement에 전달해 실행객체를 생성한다.
		pstmt = con.prepareStatement(sql);
		
		// 5. 실행
		// executeQuery를 호출하여 sql 쿼리문을 실행한다.
		rs = pstmt.executeQuery();
		
		// 6. 표시 또는 담기
		// ResultSet에 저장된 결과값이 null이 아닐시 db에 저장된 데이터를 출력한다.
		if(rs != null && rs.next()) {
			totalRow = rs.getLong(1);
		}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			// 7. 닫기
			// 각각 객체에 더 이상 전달될 데이터가 존재하지 않을때 객체를 닫는다.
			try {
				DB.close(con, pstmt, rs);
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
//		System.out.println("BoardDAO.view().vo - " + vo);
		return totalRow;
	}

	public BookBoardVO view(long bookNo) throws Exception {
		// TODO Auto-generated method stub
		BookBoardVO vo = null;
		
		// 예외처리
		try {
		
		// 1. 드라이버 확인, 2. 연결
		// Connection으로 db에 연결한다.
		con = DB.getConnection();
		
		// 3. sql
		// db데이터를 불러올 sql 쿼리문을 String sql에 입력한다.
		String sql = "select bookNo, title, writer, genre, publisher, "
				+ " to_char(pubDate, 'yyyy-mm-dd')pubDate, summary, price, cover "
				+ " from bookBoard "
				+ " where bookNo = ? ";

		// 4. 실행객체
		// Connection으로 sql을 prepareStatement에 전달해 실행객체를 생성한다.
		pstmt = con.prepareStatement(sql);
		pstmt.setLong(1, bookNo);
		
		// 5. 실행
		// executeQuery를 호출하여 sql 쿼리문을 실행한다.
		rs = pstmt.executeQuery();
		
		// 6. 표시 또는 담기
		// ResultSet에 저장된 결과값이 null이 아닐시 db에 저장된 데이터를 출력한다.
		if(rs != null && rs.next()) {
			// rs에 데이터를 한 행씩 받아온다.
			vo = new BookBoardVO();
			vo.setBookNo(rs.getLong("bookNo"));
			vo.setTitle(rs.getString("title"));
			vo.setWriter(rs.getString("writer"));
			vo.setGenre(rs.getString("genre"));
			vo.setPublisher(rs.getString("publisher"));
			vo.setPubDate(rs.getString("pubDate"));
			vo.setSummary(rs.getString("summary"));
			vo.setPrice(rs.getString("price"));
			vo.setCover(rs.getString("cover"));
	}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				// 7. 닫기
				// 각각 객체에 더 이상 전달될 데이터가 존재하지 않을때 객체를 닫는다.
				DB.close(con, pstmt, rs);
			}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
//		System.out.println("BookBoardDAO.view().vo - " + vo);
		return vo;
	}
		public BookBoardVO write (BookBoardVO vo) throws Exception {

			// 예외처리
			try {
				
				// 1. 드라이버 확인, 2. 연결
				// Connection으로 db에 연결한다.
				con = DB.getConnection();
				
				// 3. sql
				// db데이터를 입력할 sql 쿼리문을 String sql에 입력한다.
				String sql = "INSERT INTO bookBoard(bookNo, title, writer, genre, publisher, pubDate, summary, price, cover) "
						+ " VALUES(bookBoard_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?) ";
				
				// 4. 실행객체
				// Connection으로 sql을 prepareStatement에 전달해 실행객체를 생성한다.
				pstmt = con.prepareStatement(sql);
				// 각각 데이터를 받아와 입력시킨다.
				pstmt.setString(1, vo.getTitle());
				pstmt.setString(2, vo.getWriter());
				pstmt.setString(3, vo.getGenre());
				pstmt.setString(4, vo.getPublisher());
				pstmt.setString(5, vo.getPubDate());
				pstmt.setString(6, vo.getSummary());
				pstmt.setString(7, vo.getPrice());
				pstmt.setString(8, vo.getCover());
				
				// 5. 실행
				// executeUpdate에 sql 쿼리문을 실행해 데이터를 입력시킨다.
				int result = pstmt.executeUpdate();
				System.out.println((result == 1)? "도서가 등록 되었습니다." : "도서 등록에 실패하였습니다.");
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				try {
					// 6. 닫기
					// 각각 객체에 더 이상 전달될 데이터가 존재하지 않을때 객체를 닫는다.
					DB.close(con, pstmt);
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
			return vo;
	}
			public int update(BookBoardVO vo) throws Exception {
				// TODO Auto-generated method stub
			int result = 0;
			
			// 예외처리
			try {
				// 1. 드라이버 확인, 2. 연결
				// Connection으로 db에 연결한다.
				con = DB.getConnection();
				
				// 3. sql
				// db데이터를 수정할 sql 쿼리문을 String sql에 입력한다.
				String sql = "UPDATE bookBoard "
						+ " set title = ?, writer = ?, genre = ?, publisher = ?, pubDate = ?, price = ?, summary = ? "
						+ " WHERE bookNo = ?  ";
				
				// 4. 실행객체
				// Connection으로 sql을 prepareStatement에 전달해 실행객체를 생성한다.
				pstmt = con.prepareStatement(sql);
				// 각각 데이터를 받아와 입력시킨다.
				pstmt.setString(1, vo.getTitle());
				pstmt.setString(2, vo.getWriter());
				pstmt.setString(3, vo.getGenre());
				pstmt.setString(4, vo.getPublisher());
				pstmt.setString(5, vo.getPubDate());
				pstmt.setString(6, vo.getPrice());
				pstmt.setString(7, vo.getSummary());
				pstmt.setLong(8, vo.getBookNo());
				
				// 5. 실행
				// executeUpdate에 sql 쿼리문을 실행해 데이터를 입력시킨다.
				result = pstmt.executeUpdate();
				if (result == 1) System.out.println("수정 완료.");
				else System.out.println("수정불가 - 없는 도서번호입니다.");
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				try {
					// 6. 닫기
					// 각각 객체에 더 이상 전달될 데이터가 존재하지 않을때 객체를 닫는다.
					DB.close(con, pstmt);
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}return result;
		}

			public int delete(long bookNo) {
				// TODO Auto-generated method stub
				int result = 0;
				
				// 예외처리
					try {
						
						// 1. 드라이버 확인, 2. 연결
						// Connection으로 db에 연결한다.
						con = DB.getConnection();
						
						// 3. sql
						// db데이터를 삭제할 sql 쿼리문을 String sql에 입력한다.
						String sql = "delete from bookBoard where bookNo = ?";
						
						// 4. 실행객체
						// Connection으로 sql을 prepareStatement에 전달해 실행객체를 생성한다.
						pstmt = con.prepareStatement(sql);
						pstmt.setLong(1, bookNo);
						
						// 5. 실행
						// executeUpdate에 sql 쿼리문을 실행해 데이터를 삭제시킨다.
						result = pstmt.executeUpdate();
						
						if(result >= 1) System.out.println("도서 정보가 삭제되었습니다.");
						else System.out.println("삭제 실패");
						
					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					} finally {
						try {
							// 6. 닫기
							// 각각 객체에 더 이상 전달될 데이터가 존재하지 않을때 객체를 닫는다.
							DB.close(con, pstmt);
						} catch (Exception e) {
							// TODO: handle exception
							e.printStackTrace();
						}
					}
				return result;
			}
			
			// 책표지를 수정하는 dao
			public int coverChange(BookBoardVO vo) throws Exception {
				// TODO Auto-generated method stub
				int result = 0;
				
				// 예외처리
				try {
					
					// 1. 드라이버 확인, 2. 연결
					// Connection으로 db에 연결한다.
					con = DB.getConnection();
					
					// 3. sql
					// db데이터를 수정할 sql 쿼리문을 String sql에 입력한다.
					String sql = "UPDATE bookBoard set cover = ? WHERE bookNo = ?  "; 
					
					// 4. 실행객체
					// Connection으로 sql을 prepareStatement에 전달해 실행객체를 생성한다.
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, vo.getCover());
					pstmt.setLong(2, vo.getBookNo());
					
					// 5. 실행
					// executeUpdate에 sql 쿼리문을 실행해 데이터를 삭제시킨다.
					result = pstmt.executeUpdate();
					System.out.println("표지 수정 완료.");
					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				} finally {
					try {
						// 6. 닫기
						// 각각 객체에 더 이상 전달될 데이터가 존재하지 않을때 객체를 닫는다.
						DB.close(con, pstmt);
					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					}
				}return result;
			}
}
				
