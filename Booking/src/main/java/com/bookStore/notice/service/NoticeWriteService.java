package com.bookStore.notice.service;

import com.bookStore.notice.dao.NoticeDAO;
import com.bookStore.notice.vo.NoticeVO;

public class NoticeWriteService {

	public int service (NoticeVO vo) throws Exception {
		NoticeDAO dao = new NoticeDAO();
		return dao.write(vo);
	}
}
