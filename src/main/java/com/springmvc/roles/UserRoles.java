package com.springmvc.roles;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.springmvc.domain.Club;
import com.springmvc.domain.Member;
import com.springmvc.domain.Store;
import com.springmvc.domain.Teacher;


public class UserRoles 
{
	@Autowired
	private Member member;
	
	@Autowired
	private Store store;
	
	@Autowired
	private Teacher teacher;
	
	@Autowired
	private Club club;
	
	private String memberId;
	private boolean storeApprove;
	private boolean teacherApprove;
	private boolean clubApprove;
	private String clubGrade;
	private List<Roles> roles;
	
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = member.getMemberId();
	}
	public boolean isStoreApprove() {
		return storeApprove;
	}
	public void setStoreApprove(boolean storeApprove) {
		this.storeApprove = store.isStoreApprove();
	}
	public boolean isTeacherApprove() {
		return teacherApprove;
	}
	public void setTeacherApprove(boolean teacherApprove) {
		this.teacherApprove = teacher.isTeacherApprove();
	}
	public boolean isClubApprove() {
		return clubApprove;
	}
	public List<Roles> getRoles() {
		return roles;
	}
	public void setRoles(List<Roles> roles) {
		this.roles = roles;
	}
	
	
}
