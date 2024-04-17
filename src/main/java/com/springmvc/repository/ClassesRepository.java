package com.springmvc.repository;

import java.util.ArrayList;
import java.util.List;

import com.springmvc.domain.Classes;
public interface ClassesRepository  {
	List<Classes> getAllClassesList();
	void setNewClasses(Classes classes);
	public Classes getById(int classNum);
	public void setdeleteClasses(int classNum);	
	void setUpdateClasses(Classes classes);
	void setApproveClasses(int classNum);
	
	//강좌신청한 사람 목록 
	
	

}
