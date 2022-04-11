package com.bookStore.notice.service;


import com.bookStore.notice.dao.NoticeDAO;

public class NoticeDeleteService {

	public int service(long no) throws Exception {
		NoticeDAO dao = new NoticeDAO();
		return dao.delete(no);
	}
}
