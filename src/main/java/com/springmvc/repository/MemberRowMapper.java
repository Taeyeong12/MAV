package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Member;

public class MemberRowMapper implements RowMapper<Member>
{
	@Override
	public Member mapRow(ResultSet rs, int rowNum) throws SQLException 
	{
		Member member = new Member();
		
		member.setMemberId(rs.getString("memberId"));
		member.setMemberPassword(rs.getString("memberPassword"));
		member.setMemberBirth(rs.getDate("memberBirth").toLocalDate());
		member.setMemberPhone01(rs.getString("memberPhone01"));
		member.setMemberPhone02(rs.getString("memberPhone02"));
		member.setMemberPhone03(rs.getString("memberPhone03"));
		member.setMemberGender(rs.getString("memberGender"));
		member.setMemberName(rs.getString("memberName"));
		member.setMemberAddr(rs.getString("memberAddr"));
		member.setMemberEmail(rs.getString("memberEmail"));
		member.setAdminApprove(rs.getBoolean("adminApprove"));
		return member;
	}	
}
