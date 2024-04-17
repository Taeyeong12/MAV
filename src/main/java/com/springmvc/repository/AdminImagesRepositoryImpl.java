package com.springmvc.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.adminImages;

@Repository
public class AdminImagesRepositoryImpl implements AdminImageRepository 
{
	@Autowired
	private JdbcTemplate template;

	@Override
	public void addImages(adminImages images) 
	{
		String SQL = "insert into adminImages values(?,?,?,?,?)";
		template.update(SQL, images.getClublistImageName(),images.getClasslistImageName(),
						images.getMainslideImageName1(), images.getMainslideImageName2(), images.getMainslideImageName3());
		
	}

	@Override
	public adminImages getAllImages() {
	    try 
	    {
	        String SQL = "select * from adminImages";
	        adminImages images = (adminImages) template.queryForObject(SQL, new AdminImagesRowMapper());
	        return images;
	    }
	    catch (EmptyResultDataAccessException e) 	    
	    {
	        return null;	        
	    } 
	    catch (DataAccessException e) 
	    {	   
	        e.printStackTrace();
	        return null;
	    }
	}


	@Override
	public void updateImages(adminImages images) 
	{
		String SQL = "update adminImages set clublistImage=? , classlistImage=? , mainslideImage1=?, mainslideImage2=?, mainslideImage3=?";
		template.update(SQL, images.getClublistImageName(),images.getClasslistImageName(),
						images.getMainslideImageName1(), images.getMainslideImageName2(), images.getMainslideImageName3());
		
	}
	
	
	
}
