package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.springmvc.domain.Member;

import com.springmvc.domain.Store;

import com.springmvc.domain.Teacher;
import com.springmvc.repository.TeacherRepository;

public interface TeacherService {

	public void CreateTeacher(Teacher teacher);
	void UpdateTeacher(Teacher teacher);
	public List<Teacher> AllTeacher();
	public Teacher teacherId(String teacherId);
    Teacher deleteTeacher(String teacherId);
    void setApproveTeacher(String teacherId);
}