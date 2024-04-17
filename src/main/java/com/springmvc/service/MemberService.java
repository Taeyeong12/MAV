package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.Member;

public interface MemberService 
{
	List<Member> getAllMemberList();
	void deleteMember(String memberId);
	Member getById(String memberId);
	Member getLogin(String memberId, String memberPassword);
	void updateMember(Member member);
	int countMemberById(String memberId);
}


