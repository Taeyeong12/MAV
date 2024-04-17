package com.springmvc.domain;

import java.time.LocalDate;
import java.time.LocalTime;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

public class MatchRoom {
    private int matchNum; // 매칭 번호
    private String matchTitle;
    private int roomNum; // 방 번호
   	private String creatorId; // 회원 ID
	private String applicantId; // 회원 ID
    private String matchStatus; // 매칭 상태
    private String matchResult; // 매칭 결과    
    private String storeId; // 상점 ID
    private String roomName; // 경기장 이름   
    private int roomCapacity; // 경기장 수용인원
    private int roomCount; // 경기장 참가인원
    private String roomCategory; // 경기 종류(종목)
    private int matched;

    
    public int getMatched() {
		return matched;
	}
	public void setMatched(int matched) {
		this.matched = matched;
	}
	public String getCreatorId() {
		return creatorId;
	}
	public void setCreatorId(String creatorId) {
		this.creatorId = creatorId;
	}
	public String getApplicantId() {
		return applicantId;
	}
	public void setApplicantId(String applicantId) {
		this.applicantId = applicantId;
	}
	private String roomDetail; // 경기장 소개글
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate roomDate; // 경기 날짜
    @DateTimeFormat(pattern = "HH:mm")
    private LocalTime roomTime; // 경기 시간
    
    
	public int getMatchNum() {
		return matchNum;
	}
	public void setMatchNum(int matchNum) {
		this.matchNum = matchNum;
	}
	public String getMatchTitle() {
		return matchTitle;
	}
	public void setMatchTitle(String matchTitle) {
		this.matchTitle = matchTitle;
	}
	public int getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}
	public String getMatchStatus() {
		return matchStatus;
	}
	public void setMatchStatus(String matchStatus) {
		this.matchStatus = matchStatus;
	}
	public String getMatchResult() {
		return matchResult;
	}
	public void setMatchResult(String matchResult) {
		this.matchResult = matchResult;
	}
	public String getStoreId() {
		return storeId;
	}
	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	
	public int getRoomCapacity() {
		return roomCapacity;
	}
	public void setRoomCapacity(int roomCapacity) {
		this.roomCapacity = roomCapacity;
	}
	public int getRoomCount() {
		return roomCount;
	}
	public void setRoomCount(int roomCount) {
		this.roomCount = roomCount;
	}
	public String getRoomCategory() {
		return roomCategory;
	}
	public void setRoomCategory(String roomCategory) {
		this.roomCategory = roomCategory;
	}
	public String getRoomDetail() {
		return roomDetail;
	}
	public void setRoomDetail(String roomDetail) {
		this.roomDetail = roomDetail;
	}
	public LocalDate getRoomDate() {
		return roomDate;
	}
	public void setRoomDate(LocalDate roomDate) {
		this.roomDate = roomDate;
	}
	public LocalTime getRoomTime() {
		return roomTime;
	}
	public void setRoomTime(LocalTime roomTime) {
		this.roomTime = roomTime;
	}

}
