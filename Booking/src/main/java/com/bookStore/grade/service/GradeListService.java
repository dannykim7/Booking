package com.bookStore.grade.service;

import java.util.List;

import com.bookStore.grade.dao.GradeDAO;
import com.bookStore.grade.vo.GradeVO;

public class GradeListService {
	public List<GradeVO> service() throws Exception {
		GradeDAO dao = new GradeDAO();
		return dao.list();
	}
}
