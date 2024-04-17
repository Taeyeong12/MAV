package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.Club;
import com.springmvc.domain.ClubMember;
import com.springmvc.domain.Member;

public interface ClubService 
{

	void addNewClub(Club club,Member member);
	void joinClub(Club club, ClubMember clubmember, Member member);
	Club getByClubName(String clubName);
	List<Club> getAllClubList();
	void addNewClubMember(Club club,ClubMember clubmember, Member member);
	Club getByClubNum(Club club);
	void updateClub(Club club,Member member);
	void deleteClub(String clubName,String c_memberId);
	List<Club> getMyClub(String c_memberId);
	ClubMember getMyClubMember(String c_memberId, String clubName);
	void leaveClub(String clubName, String c_memberId);
	List<ClubMember> getClubMemberList(String clubName);
	void ejectionMember(String ClubName, String c_memberId);
	void memberUpdate(ClubMember clubmember);
	ClubMember serchingC_member(String c_memberId, String clubName);
	
	//내가 동호회장인 클럽정보
	List<Club> getMyMasterClub(String c_memberId);
	
	// 클럽포인트 업데이트
	void updateClubPoint(String clubName, int clubPoint);

	// 클럽 인원수 확인용
	int clubMemberCount(String clubName);
	void memberUpdate2(ClubMember clubmember);
}
