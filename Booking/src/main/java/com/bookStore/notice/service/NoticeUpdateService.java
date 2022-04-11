package com.bookStore.notice.service;


import com.bookStore.notice.dao.NoticeDAO;
import com.bookStore.notice.vo.NoticeVO;

public class NoticeUpdateService {

	public int service(NoticeVO vo) throws Exception {
		NoticeDAO dao = new NoticeDAO();
		return dao.update(vo);
	}
}
