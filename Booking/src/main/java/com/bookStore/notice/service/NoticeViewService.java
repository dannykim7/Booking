package com.bookStore.notice.service;

import com.bookStore.notice.dao.NoticeDAO;
import com.bookStore.notice.vo.NoticeVO;

public class NoticeViewService {

	public NoticeVO service(long no) throws Exception {
		NoticeDAO dao = new NoticeDAO();
		return dao.view(no);
	}
}
