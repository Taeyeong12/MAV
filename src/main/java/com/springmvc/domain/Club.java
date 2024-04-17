package com.springmvc.domain;

import org.springframework.web.multipart.MultipartFile;

public class Club 
{
	private int clubNum; // 클럽 넘버
	private String clubName; // 동호회명
	private String clubMaster; // 동호회장 아이디
	private int clubPoint; // 동호회 포인트
	private String clubCategory; // 동호회 종류
	private String clubInfo; // 동호회 소개글
	private String clubLocale; // 동호회 활동지역
	private MultipartFile clubImages1; // 동호회 이미지
	private MultipartFile clubImages2; // 동호회 이미지
	private MultipartFile clubImages3; // 동호회 이미지
	private MultipartFile clubImages4; // 동호회 이미지
	private MultipartFile clubImages5; // 동호회 이미지
	private String imageFileName1; // 이미지 파일 이름
	private String imageFileName2; // 이미지 파일 이름
	private String imageFileName3; // 이미지 파일 이름
	private String imageFileName4; // 이미지 파일 이름
	private String imageFileName5; // 이미지 파일 이름
	private int clubMemberCount; // 클럽 인원수 확인용
	
	
	public Club() {}
	
	public int getClubNum() {
		return clubNum;
	}

	public String getClubName() {
		return clubName;
	}

	public void setClubName(String clubName) {
		this.clubName = clubName;
	}

	public int getClubPoint() {
		return clubPoint;
	}

	public void setClubPoint(int clubPoint) {
		this.clubPoint = clubPoint;
	}

	public String getClubCategory() {
		return clubCategory;
	}

	public void setClubCategory(String clubCategory) {
		this.clubCategory = clubCategory;
	}
	public String getClubInfo() {
		return clubInfo;
	}

	public void setClubInfo(String clubInfo) {
		this.clubInfo = clubInfo;
	}

	public String getClubLocale() {
		return clubLocale;
	}

	public void setClubLocale(String clubLocale) {
		this.clubLocale = clubLocale;
	}

	public void setClubNum(int clubNum) {
		this.clubNum = clubNum;
	}

	public String getClubMaster() {
		return clubMaster;
	}

	public void setClubMaster(String clubMaster) {
		this.clubMaster = clubMaster;
	}

	public MultipartFile getClubImages1() {
		return clubImages1;
	}

	public void setClubImages1(MultipartFile clubImages1) {
		this.clubImages1 = clubImages1;
	}

	public MultipartFile getClubImages2() {
		return clubImages2;
	}

	public void setClubImages2(MultipartFile clubImages2) {
		this.clubImages2 = clubImages2;
	}

	public MultipartFile getClubImages3() {
		return clubImages3;
	}

	public void setClubImages3(MultipartFile clubImages3) {
		this.clubImages3 = clubImages3;
	}

	public MultipartFile getClubImages4() {
		return clubImages4;
	}

	public void setClubImages4(MultipartFile clubImages4) {
		this.clubImages4 = clubImages4;
	}

	public MultipartFile getClubImages5() {
		return clubImages5;
	}

	public void setClubImages5(MultipartFile clubImages5) {
		this.clubImages5 = clubImages5;
	}

	public String getImageFileName1() {
		return imageFileName1;
	}

	public void setImageFileName1(String imageFileName1) {
		this.imageFileName1 = imageFileName1;
	}

	public String getImageFileName2() {
		return imageFileName2;
	}

	public void setImageFileName2(String imageFileName2) {
		this.imageFileName2 = imageFileName2;
	}

	public String getImageFileName3() {
		return imageFileName3;
	}

	public void setImageFileName3(String imageFileName3) {
		this.imageFileName3 = imageFileName3;
	}

	public String getImageFileName4() {
		return imageFileName4;
	}

	public void setImageFileName4(String imageFileName4) {
		this.imageFileName4 = imageFileName4;
	}

	public String getImageFileName5() {
		return imageFileName5;
	}

	public void setImageFileName5(String imageFileName5) {
		this.imageFileName5 = imageFileName5;
	}

	public int getClubMemberCount() {
		return clubMemberCount;
	}

	public void setClubMemberCount(int clubMemberCount) {
		this.clubMemberCount = clubMemberCount;
	}
	
	
}
