package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.Club;
import com.springmvc.domain.ClubMember;
import com.springmvc.domain.Member;

public interface ClubRepository 
{
	void addNewClub(Club club, Member member);
	void addNewClubMember(Club club,ClubMember clubmember, Member member);
	void joinClub(Club club, ClubMember clubmember, Member member);
	List<Club> getAllClubList();
	Club getByClubName(String clubName);
	Club getByClubNum(Club club);
	Club getClubInfo(Club club);
	List<Club> getMyClub(String c_memberId);
	void updateClub(Club club, Member member);
	void deleteClub(String clubName ,String c_memberId);
	ClubMember getMyClubMember(String c_memberId,String clubName);
	void leaveClub(String clubName, String c_memberId);
	List<ClubMember> getClubMemberList(String clubName);
	void ejectionMember(String ClubName, String c_memberId);
	void memberUpdate(ClubMember clubmember);
	ClubMember serchingC_member(String c_memberId, String clubName);
	//내가 동호회장인 클럽정보
	List<Club> getMyMasterClub(String c_memberId);
	//클럽 포인트 업데이트
	void updateClubPoint(String ClubName, int clubPoint);
	int clubMemberCount(String clubName);
	void memberUpdate2(ClubMember clubmember);
}
