package com.springmvc.repository;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.Club;
import com.springmvc.domain.ClubMember;
import com.springmvc.domain.Member;

@Repository
public class ClubRepositoryImpl implements ClubRepository 
{

	private JdbcTemplate template;
	
	private List<Club> listOfClubs = new ArrayList<Club>();
	
	@Autowired
	public void setJdbcTemplate(DataSource dataSource)
	{
		this.template = new JdbcTemplate(dataSource);
	}
	
	@Override
	public void addNewClub(Club club, Member member) 

	{		
		club.setClubPoint(0);
		club.setClubMaster(member.getMemberId());
		String SQL = "insert into Club values(null,?,?,?,?,?,?,?,?,?,?,?)";
		template.update(SQL,
				club.getClubName(),
				club.getClubMaster(),
				club.getClubCategory(),
				club.getClubLocale(),
				club.getClubPoint(),
				club.getImageFileName1(),
				club.getImageFileName2(),
				club.getImageFileName3(),
				club.getImageFileName4(),
				club.getImageFileName5(),
				club.getClubInfo());
		
		System.out.println("리파짓토리에서 클럽 생성시 가져온 이미지파일 이름 : "+club.getImageFileName1());
	}

	
	@Override
	public void addNewClubMember(Club club, ClubMember clubmember, Member member) 
	{
		clubmember.setClubGrade("동호회장");
		clubmember.setClubApprove(true);
		clubmember.setC_memberId(member.getMemberId());
		String SQL = "insert into clubmember values(?,?,?,?)";
		
		template.update(SQL, club.getClubName(),clubmember.getC_memberId(),
						clubmember.getClubGrade(),clubmember.isClubApprove());
		
		System.out.println("1 : "+clubmember.getC_memberId());
		System.out.println("2 : "+clubmember.getClubGrade());
		System.out.println("3 : "+clubmember.isClubApprove());

	}

	@Override
	public Club getByClubName(String clubName) {
	    String SQL = "SELECT * FROM club WHERE clubName=?";
	    Club club = null;
	    try 
	    {
	        club = template.queryForObject(SQL, new Object[]{clubName}, new ClubRowMapper());
	    } catch (EmptyResultDataAccessException ex) 
	    {
	    	
	    }
	    return club;
	}

	
	@Override
	public void updateClub(Club club,Member member) 
	{
		System.out.println("수정 처리할 클럽ID : "+club.getClubName());
		String SQL = "update Club set clubName=?, clubLocale=?, clubCategory=?, clubInfo=?, imageFileName1=?, imageFileName2=?"
				+ ", imageFileName3=?, imageFileName4=?, imageFileName5=?  where clubNum=? and clubMaster=?";
		template.update(SQL, club.getClubName(),club.getClubLocale(), club.getClubCategory(), 
						club.getClubInfo(),club.getImageFileName1(), club.getImageFileName2(), 
						club.getImageFileName3(), club.getImageFileName4(), club.getImageFileName5(), 
						club.getClubNum(), member.getMemberId());
	}

	@Override
	public void deleteClub(String clubName,String c_memberId) 
	{
		String SQL1 = "delete from clubMember where clubName=?";
		this.template.update(SQL1,clubName);
		String SQL = "delete from club where clubName=? and clubMaster=?";
		this.template.update(SQL, clubName,c_memberId);
	}

	@Override
	public Club getClubInfo(Club club) 
	{
		String SQL = "select * from club where clubNum=? and clubName=?";
		template.update(SQL, club.getClubNum(), club.getClubName());
		return club;
	}

	@Override
	public void joinClub(Club club, ClubMember clubmember, Member member) 
	{
		clubmember.setClubGrade("준회원");
		clubmember.setClubApprove(false);
		clubmember.setC_memberId(member.getMemberId());
		
		String SQL = "insert into ClubMember values(?,?,?,?)";
		
		
		template.update(SQL, club.getClubName(),clubmember.getC_memberId(),
						clubmember.getClubGrade(),clubmember.isClubApprove());
	}

	@Override
	public List<Club> getAllClubList() 
	{
		String SQL = "select * from Club";
		List<Club> getAllClubList = template.query(SQL, new ClubRowMapper());
		return getAllClubList;
	}

	@Override
	public Club getByClubNum(Club club) 
	{		
		String SQL = "select * from club where clubNum=?";
		 Club getByClubNum = (Club) template.queryForObject(SQL, new Object[] {club.getClubNum()}, new ClubRowMapper());
		 return getByClubNum;
	}

	@Override
	public List<Club> getMyClub(String c_memberId) {
	    List<Club> clubs = new ArrayList<>();

	    String SQL = "SELECT * " +
	                 "FROM clubmember cm INNER JOIN club c ON cm.clubname = c.clubname " +
	                 "WHERE cm.c_memberId = ?";

	    try {
	        clubs = template.query(SQL, new Object[]{c_memberId}, new ClubRowMapper());
	        return clubs;
	    } catch (EmptyResultDataAccessException e) {
	        return null;
	    }
	}

	@Override
	public ClubMember getMyClubMember(String c_memberId, String clubName) {
	    String SQL = "select * from Clubmember where c_memberId=? and clubName=?";

	    // query 메소드를 사용하여 쿼리 실행
	    List<ClubMember> clubMembers = template.query(SQL, new Object[]{c_memberId, clubName}, new ClubMemberRowMapper());
	    
	    // queryForObject 대신 결과가 여러 개일 수 있으므로 리스트에서 첫 번째 객체를 반환합니다.
	    if (!clubMembers.isEmpty()) {
	        return clubMembers.get(0);
	    } else {
	        return null; // 또는 예외 처리
	    }
	}

	@Override
	public void leaveClub(String clubName, String c_memberId) 
	{
		String SQL = "delete from clubmember where clubName=? and c_memberId=?";
		
		template.update(SQL, clubName, c_memberId);
	}

	@Override
	public List<ClubMember> getClubMemberList(String clubName)
	{
		String SQL = "select * from clubmember cm inner join Member m on cm.c_memberId= m.memberId "
					+ "where clubName=?";
		
		List<ClubMember> clubMembers = template.query(SQL, new Object[]{clubName}, new ClubMemberRowMapper());
		return clubMembers;
	}

	@Override
	public void ejectionMember(String clubName, String c_memberId) 
	{
	    String SQL = "delete from clubmember where clubName=? and c_memberId=?";
	    
	    template.update(SQL, new Object[]{clubName, c_memberId});
	}

	@Override
	public void memberUpdate(ClubMember clubmember) 
	{
		clubmember.setClubApprove(true);
		clubmember.setClubGrade("정회원");
		String SQL = "update clubmember set clubGrade=?, clubApprove=? where c_memberId=? and clubName=?";
		
		System.out.println("1. "+clubmember.getC_memberId());
		System.out.println("2. "+clubmember.getClubName());
		
		
		template.update(SQL, clubmember.getClubGrade(), clubmember.isClubApprove(),
						clubmember.getC_memberId(), clubmember.getClubName());
	}

	@Override
	public ClubMember serchingC_member(String c_memberId, String clubName) 
	{
		String SQL = "select * from clubmember where c_memberId=? and clubName=?";
		ClubMember clubmember = (ClubMember) template.queryForObject(SQL, new Object[] {c_memberId, clubName}, new ClubMemberRowMapper());
		return clubmember;
	}
	//내가 동호회장인 클럽정보
	@Override
	public List<Club> getMyMasterClub(String c_memberId) {
	    List<Club> clubs = new ArrayList<>();

	    String SQL = "SELECT * " +
	                 "FROM clubmember cm INNER JOIN club c ON cm.clubname = c.clubname " +
	                 "WHERE cm.c_memberId = ? AND cm.clubGrade = '동호회장';";

	    try {
	        clubs = template.query(SQL, new Object[]{c_memberId}, new ClubRowMapper());
	        return clubs;
	    } catch (EmptyResultDataAccessException e) {
	        return null;
	    }
	}

	//클럽 포인트 업데이트
	@Override
	public void updateClubPoint(String ClubName, int clubPoint) {
        String sql = "UPDATE club SET clubPoint = clubPoint + ? WHERE clubName = ?";
        template.update(sql, clubPoint, ClubName);
		
	}

	@Override
	public int clubMemberCount(String clubName) 
	{
		 String SQL = "SELECT COUNT(c_memberId) FROM clubMember WHERE clubName=?";
		 int count = template.queryForObject(SQL, Integer.class, clubName);
		 return count;
	}

	@Override
	public void memberUpdate2(ClubMember clubmember) 
	{
		clubmember.setClubApprove(true);
		clubmember.setClubGrade("동호회장");
		String SQL = "update clubmember set clubGrade=?, clubApprove=? where c_memberId=? and clubName=?";
		
		System.out.println("1. "+clubmember.getC_memberId());
		System.out.println("2. "+clubmember.getClubName());
		
		
		template.update(SQL, clubmember.getClubGrade(), clubmember.isClubApprove(),
						clubmember.getC_memberId(), clubmember.getClubName());
		
	}

	
	
}