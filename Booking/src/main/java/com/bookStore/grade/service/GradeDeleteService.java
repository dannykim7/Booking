package com.bookStore.grade.service;

import com.bookStore.grade.dao.GradeDAO;

public class GradeDeleteService {
	public int service(int gradeNo) throws Exception{
		GradeDAO dao = new GradeDAO();
		return dao.delete(gradeNo);
		
	} 
	}

