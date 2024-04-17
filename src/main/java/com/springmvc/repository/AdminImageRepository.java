package com.springmvc.repository;

import com.springmvc.domain.adminImages;

public interface AdminImageRepository 
{
	void addImages(adminImages images);
	adminImages getAllImages();
	void updateImages(adminImages images);
}
