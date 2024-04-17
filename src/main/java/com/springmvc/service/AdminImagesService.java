package com.springmvc.service;

import com.springmvc.domain.adminImages;

public interface AdminImagesService 
{
	void addImages(adminImages images);
	adminImages getAllImages();
	void updateImages(adminImages images);
}
