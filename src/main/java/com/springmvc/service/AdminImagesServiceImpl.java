package com.springmvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.adminImages;
import com.springmvc.repository.AdminImageRepository;

@Service
public class AdminImagesServiceImpl implements AdminImagesService 
{
	@Autowired
	private AdminImageRepository adminImagesRepository;

	@Override
	public void addImages(adminImages images) 
	{
		adminImagesRepository.addImages(images);		
	}

	@Override
	public adminImages getAllImages() 
	{
		
		return adminImagesRepository.getAllImages();
	}

	@Override
	public void updateImages(adminImages images) {
		
		adminImagesRepository.updateImages(images);		
	}
	
}
