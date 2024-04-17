package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.adminImages;

public class AdminImagesRowMapper implements RowMapper
{

	@Override
	public Object mapRow(ResultSet rs, int rowNum) throws SQLException 
	{
		adminImages adminImages = new adminImages();
		
		adminImages.setClublistImageName(rs.getString("clublistImage"));
		adminImages.setClasslistImageName(rs.getString("classlistImage"));
		adminImages.setMainslideImageName1(rs.getString("mainslideImage1"));
		adminImages.setMainslideImageName2(rs.getString("mainslideImage2"));
		adminImages.setMainslideImageName3(rs.getString("mainslideImage3"));
		
		return adminImages;
	}

}
