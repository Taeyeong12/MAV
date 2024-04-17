package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.Member;
import com.springmvc.domain.Teacher;

public interface TeacherRepository {
	public void CreateTeacher(Teacher teacher); 
	void UpdateTeacher(Teacher teacher);
	public List<Teacher> AllTeacher();
	public Teacher teacherId(String teacherId);	
	Teacher deleteTeacher(String teacherId);
	void setApproveTeacher(String teacherId);
}