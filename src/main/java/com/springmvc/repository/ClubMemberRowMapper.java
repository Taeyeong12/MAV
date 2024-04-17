package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.ClubMember;

public class ClubMemberRowMapper implements RowMapper 
{

	@Override
	public Object mapRow(ResultSet rs, int rowNum) throws SQLException 
	{
		ClubMember clubMember = new ClubMember();
		
		clubMember.setC_memberId(rs.getString("c_memberId"));
		clubMember.setClubApprove(rs.getBoolean("ClubApprove"));
		clubMember.setClubGrade(rs.getString("clubGrade"));
		clubMember.setClubName(rs.getString("clubName"));
		return clubMember;
	}
	
}
