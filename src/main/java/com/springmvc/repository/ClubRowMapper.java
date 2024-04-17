package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Club;

public class ClubRowMapper implements RowMapper<Club> 
{

	@Override
	public Club mapRow(ResultSet rs, int rowNum) throws SQLException 
	{
		Club club = new Club();
		
		
		club.setClubCategory(rs.getString("clubCategory"));
		club.setImageFileName1(rs.getString("imageFileName1"));
		club.setImageFileName2(rs.getString("imageFileName2"));
		club.setImageFileName3(rs.getString("imageFileName3"));
		club.setImageFileName4(rs.getString("imageFileName4"));
		club.setImageFileName5(rs.getString("imageFileName5"));
		club.setClubInfo(rs.getString("clubInfo"));
		club.setClubLocale(rs.getString("clubLocale"));
		club.setClubName(rs.getString("clubName"));
		club.setClubNum(rs.getInt("clubNum"));
		club.setClubPoint(rs.getInt("clubPoint"));
		club.setClubMaster(rs.getString("clubMaster"));
		
		return club;
	}
	
}
