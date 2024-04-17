package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Classes;
import com.springmvc.repository.ClassesRepository;

@Service
public class ClassesServiceImpl implements ClasseService{
	@Autowired
	private ClassesRepository classesRepository;
	@Override
	public List<Classes> getAllClassesList() {
		// TODO Auto-generated method stub
		return classesRepository.getAllClassesList();
	}

	@Override
	public void setNewClasses(Classes classes) {
		classesRepository.setNewClasses(classes);
		
	}

	@Override
	public Classes getById(int classNum) {
		
		return classesRepository.getById(classNum);
	}

	@Override
	public void setdeleteClasses(int classNum) {
		// TODO Auto-generated method stub
		classesRepository.setdeleteClasses(classNum);
	}

	@Override
	public void setUpdateClasses(Classes classes) {
		// TODO Auto-generated method stub
		classesRepository.setUpdateClasses(classes);
	}

	@Override
	public void setApproveClasses(int classNum) 
	{
		classesRepository.setApproveClasses(classNum);
		
	}

	



}
