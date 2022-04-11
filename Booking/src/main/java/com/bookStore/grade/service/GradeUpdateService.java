package com.bookStore.grade.service;

import com.bookStore.grade.dao.GradeDAO;
import com.bookStore.grade.vo.GradeVO;

public class GradeUpdateService {
public int service(GradeVO vo) throws Exception {
	GradeDAO dao = new GradeDAO();
	return dao.update(vo);
}
}
