package com.springmvc.repository;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.Member;
import com.springmvc.domain.Store;
import com.springmvc.exception.MemberIdException;

@Repository
public class MemberRepositoryImpl implements MemberRepository 
{
	private JdbcTemplate template;
	
	@Autowired
	public void setJdbcTemplate(DataSource dataSource)
	{
		this.template = new JdbcTemplate(dataSource);
	}
	
	private List<Member> listOfMembers = new ArrayList<Member>();
	
	@Override
	public void setNewMember(Member member) 
	{
		String SQL = "insert into Member"
				+ "(memberId, memberName, memberPassword, memberBirth, memberAddr, memberPhone01, memberPhone02, memberPhone03, "
				+ "memberGender, memberEmail)"
				+ "values(?,?,?,?,?,?,?,?,?,?);";
		
		template.update(SQL, member.getMemberId(),member.getMemberName(), member.getMemberPassword(), member.getMemberBirth(), member.getMemberAddr()
				        , member.getMemberPhone01(), member.getMemberPhone02(), member.getMemberPhone03(), member.getMemberGender()
				        , member.getMemberEmail());
	}

	
	
	@Override
	public Member getById(String memberId) 
	{
		Member memberInfo = null;
		String SQL = "SELECT count(*) FROM Member where memberId=?";
		int rowCount = template.queryForObject(SQL, Integer.class, memberId);
		if(rowCount!=0)
		{
			SQL = "SELECT * FROM Member where memberId=?";
			memberInfo = template.queryForObject(SQL, new Object[] {memberId}, new MemberRowMapper());
		}
		for(int i=0; i<listOfMembers.size(); i++)
		{
			Member member=listOfMembers.get(i);
			if(member!=null && member.getMemberId()!= null && member.getMemberId().equals(memberId))
			{
				memberInfo=member;
				break;
			}
		}
		if(memberInfo==null)
		{
			throw new MemberIdException(memberId);
		}
		return memberInfo;
	}



	@Override
	public List<Member> getAllMemberList() 
	{
		String SQL = "select * from Member";		
		List<Member> getAllmemberlist = template.query(SQL, new MemberRowMapper());
		return getAllmemberlist;
	}



	@Override
	public void updateMember(Member member) 
	{
		String SQL = "update Member set memberPassword=?, memberBirth=? ,memberPhone01=?, memberPhone02=?, memberPhone03=?,"
				   + "memberGender=?, memberName=?,"
				   + "memberEmail=?, memberAddr=? where memberId=?";
		
		template.update(SQL, member.getMemberPassword() , member.getMemberBirth(), member.getMemberPhone01(), member.getMemberPhone02(), 
						member.getMemberPhone03(),member.getMemberGender(), member.getMemberName(), member.getMemberEmail(), member.getMemberAddr(),
						member.getMemberId());
		System.out.println("업데이트 처리중인 멤버의 주소 : "+member.getMemberAddr());
	}



	@Override
	public void deleteMember(String memberId) 
	{
		String SQL = "delete from Member where memberId=?";		
		this.template.update(SQL, memberId);
	}



	@Override
	public Member getLogin(String memberId, String memberPassword) 
	{
		String SQL = "select * from Member where memberId=? and memberPassword=?";
		
		Member loginMember = template.queryForObject(SQL, new Object[]{memberId, memberPassword}, new MemberRowMapper());
		return loginMember;
	}



	@Override
	public void setStoreMember(Store store) 
	{
		String SQL = "insert into Store values(storeName=?, storeAddr=?, storeCategory=?,"
				 							+ "storePhone01=? storePhone02=?, storePhone03=?,storeCode=?);";		
		template.update(SQL, store.getStoreName());		
	}



	@Override
	public int countMemberById(String memberId) {
	    String sql = "SELECT COUNT(*) FROM Member WHERE memberId = ?";
	    return template.queryForObject(sql, Integer.class, memberId);
	}	
	
	
}
