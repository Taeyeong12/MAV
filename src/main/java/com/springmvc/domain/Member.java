package com.springmvc.domain;

import java.time.LocalDate;

import javax.validation.constraints.Email;

import org.springframework.format.annotation.DateTimeFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Member 
{
	private String memberId; // 멤버 ID
	private String memberPassword; // 멤버 비밀번호
	private String memberName; // 멤버 이름
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate memberBirth; // 멤버 생년월일	
	private String viewBirth; // 보여주기위한 임시 생년월일
	private String memberDetailAddr; // 멤버 상세주소
	private String memberExtraAddr; // 멤버 추가주소
	private String memberAddr; // 멤버 주소
	private String memberPhone01; // 멤버 핸드폰 첫번째
	private String memberPhone02; // 멤버 핸드폰 두번째
	private String memberPhone03; // 멤버 핸드폰 세번째
	private String memberGender; // 멤버 성별
	private String memberEmail; // 멤버 이메일
	private boolean adminApprove;

	
	public Member()
	{
	
	}
	public String getViewBirth() {
		return viewBirth;
	}


	public void setViewBirth(String viewBirth) {
		this.viewBirth = viewBirth;
	}

	public String getMemberId()  
	{
		return memberId;
	}
	public void setMemberId(String memberId) 
	{
		this.memberId = memberId;
	}
	public String getMemberPassword() {
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public LocalDate getMemberBirth() {
		return memberBirth;
	}
	public void setMemberBirth(LocalDate memberBirth) {
		this.memberBirth = memberBirth;
	}
	public String getMemberAddr() {
		return memberAddr;
	}
	public void setMemberAddr(String memberAddr) {
		this.memberAddr = memberAddr;
	}
	public String getMemberPhone01() {
		return memberPhone01;
	}
	public void setMemberPhone01(String memberPhone01) {
		this.memberPhone01 = memberPhone01;
	}
	public String getMemberPhone02() {
		return memberPhone02;
	}
	public void setMemberPhone02(String memberPhone02) {
		this.memberPhone02 = memberPhone02;
	}
	public String getMemberPhone03() {
		return memberPhone03;
	}
	public void setMemberPhone03(String memberPhone03) {
		this.memberPhone03 = memberPhone03;
	}
	public String getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public boolean isAdminApprove() {
		return adminApprove;
	}
	public void setAdminApprove(boolean adminApprove) {
		this.adminApprove = adminApprove;
	}
	public String getMemberDetailAddr() {
		return memberDetailAddr;
	}
	public void setMemberDetailAddr(String memberDetailAddr) {
		this.memberDetailAddr = memberDetailAddr;
	}
	public String getMemberExtraAddr() {
		return memberExtraAddr;
	}
	public void setMemberExtraAddr(String memberExtraAddr) {
		this.memberExtraAddr = memberExtraAddr;
	}
	
	
}