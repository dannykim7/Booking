package com.bookStore.notice.service;

import java.util.List;

import com.bookStore.notice.dao.NoticeDAO;
import com.bookStore.notice.vo.NoticeVO;
import com.webjjang.util.PageObject;

public class NoticeListService {

	// pt = pageObject.period
	public List<NoticeVO> service(PageObject pageObject) throws Exception {
		NoticeDAO dao = new NoticeDAO();
		pageObject.setTotalRow(dao.getTotalRaw(pageObject));
		return dao.list(pageObject);
	}
}
