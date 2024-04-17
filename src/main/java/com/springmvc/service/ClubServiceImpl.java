package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Club;
import com.springmvc.domain.ClubMember;
import com.springmvc.domain.Member;
import com.springmvc.repository.ClubRepository;

@Service
public class ClubServiceImpl implements ClubService
{
	@Autowired
	private ClubRepository clubRepository;
	
	@Override
	public void addNewClub(Club club, Member member) 
	{
		clubRepository.addNewClub(club, member);
	}

	@Override
	public Club getByClubName(String clubName) 
	{
		
		Club getByClubName = clubRepository.getByClubName(clubName);
		return getByClubName;
	}
	@Override
	public void addNewClubMember(Club club, ClubMember clubmember, Member member) 
	{
		clubRepository.addNewClubMember(club, clubmember, member);

	}

	@Override
	public void updateClub(Club club,Member member) 
	{
		clubRepository.updateClub(club,member);
	}

	@Override
	public void deleteClub(String clubName,String c_memberId) 
	{
		clubRepository.deleteClub(clubName,c_memberId);
	}

	@Override
	public void joinClub(Club club, ClubMember clubmember, Member member) 
	{
		clubRepository.joinClub(club, clubmember, member);
	}

	@Override
	public List<Club> getAllClubList() 
	{
		List<Club> getAllClubList = clubRepository.getAllClubList();
		return getAllClubList;
	}

	@Override
	public Club getByClubNum(Club club) 
	{
		Club getByClubNum = clubRepository.getByClubNum(club);
		return getByClubNum;
	}

	@Override
	public List<Club> getMyClub(String c_memberId) 
	{
		return clubRepository.getMyClub(c_memberId);
	}

	@Override
	public ClubMember getMyClubMember(String c_memberId,String clubName) {
		
		ClubMember clubmember = clubRepository.getMyClubMember(c_memberId,clubName);
		
		return clubmember;
		
	}

	@Override
	public void leaveClub(String clubName, String c_memberId) 
	{
		clubRepository.leaveClub(clubName, c_memberId);
	}

	@Override
	public List<ClubMember> getClubMemberList(String clubName) 
	{
		return clubRepository.getClubMemberList(clubName);
	}

	@Override
	public void ejectionMember(String ClubName, String c_memberId) 
	{
		clubRepository.ejectionMember(ClubName, c_memberId);
	}

	@Override
	public void memberUpdate(ClubMember clubmember) 
	{
		clubRepository.memberUpdate(clubmember);
	}

	@Override
	public ClubMember serchingC_member(String c_memberId, String clubName) 
	{
		ClubMember clubmember = clubRepository.serchingC_member(c_memberId, clubName);
		return clubmember;
	}

	@Override
	public List<Club> getMyMasterClub(String c_memberId) {
		// TODO Auto-generated method stub
		return clubRepository.getMyMasterClub(c_memberId);
	}
	
	//클럽포인트 업데이트
	@Override
	public void updateClubPoint(String clubName, int clubPoint) {
		 clubRepository.updateClubPoint(clubName,clubPoint);
		 
		 
	}

	@Override
	public int clubMemberCount(String clubName) 
	{
		int count = clubRepository.clubMemberCount(clubName);
		return count;
	}

	@Override
	public void memberUpdate2(ClubMember clubmember) 
	{
		clubRepository.memberUpdate2(clubmember);
	}

	
}
