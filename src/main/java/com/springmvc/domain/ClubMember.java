package com.springmvc.domain;

public class ClubMember 
{
	private String clubName;
	private String c_memberId;
	private String clubGrade;
	private boolean clubApprove;
	
	public ClubMember(){};

	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	public String getC_memberId() {
		return c_memberId;
	}
	public void setC_memberId(String c_memberId) {
		this.c_memberId = c_memberId;
	}
	public String getClubGrade() {
		return clubGrade;
	}
	public void setClubGrade(String clubGrade) {
		this.clubGrade = clubGrade;
	}
	public boolean isClubApprove() {
		return clubApprove;
	}
	public void setClubApprove(boolean clubApprove) {
		this.clubApprove = clubApprove;
	}
	
	
}
