package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Member;
import com.springmvc.repository.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService 
{
	@Autowired
	private MemberRepository memberRepository;


	@Override
	public List<Member> getAllMemberList() 
	{
		return memberRepository.getAllMemberList();
	}


	@Override
	public void deleteMember(String memberId) 
	{
		memberRepository.deleteMember(memberId);		
	}


	@Override
	public Member getById(String memberId) 
	{
		return memberRepository.getById(memberId);
	}


	@Override
	public Member getLogin(String memberId, String memberPassword) 
	{
	
		return memberRepository.getLogin(memberId, memberPassword);
	}


	@Override
	public void updateMember(Member member) 
	{
		memberRepository.updateMember(member);
	}


	@Override
	public int countMemberById(String memberId) {
		return memberRepository.countMemberById(memberId);
	}	
}
