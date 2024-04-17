package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Member;
import com.springmvc.domain.Teacher;
import com.springmvc.repository.TeacherRepository;

@Service
public class TeacherServiceImpl implements TeacherService{
	@Autowired
	private TeacherRepository teacherRepository;
	
	
	@Override
	public void CreateTeacher(Teacher teacher) {
		
		teacherRepository.CreateTeacher(teacher);
		System.out.println("서비스티처"+teacher.getTeacherCategory());
	}


	@Override
	public void UpdateTeacher(Teacher teacher) {
		// TODO Auto-generated method stub
		teacherRepository.UpdateTeacher(teacher);
	}


	@Override
	public List<Teacher> AllTeacher() {
		// TODO Auto-generated method stub
		return teacherRepository.AllTeacher();
	}


	@Override
	public Teacher teacherId(String teacherId) {
		// TODO Auto-generated method stub
		return teacherRepository.teacherId(teacherId);
	}


	@Override
	public Teacher deleteTeacher(String teacherId) {
		return teacherRepository.deleteTeacher(teacherId);
		
	}


	@Override
	public void setApproveTeacher(String teacherId) 
	{
		teacherRepository.setApproveTeacher(teacherId);
		
	}
	
}