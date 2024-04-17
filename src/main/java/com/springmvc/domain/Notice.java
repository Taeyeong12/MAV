package com.springmvc.domain;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

public class Notice 
{
	private int noticeNum; // 공지사항 글 번호
	private String noticeWriter; // 공지사항ID
	private String noticeTitle; // 공지사항 제목
	private String noticeContents; // 공지사항 글 내용
	private int noticeHits; // 공지사항 조회수
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate noticeDate;
	// 댓글
	// 이전글, 다음글 

	public int getNoticeNum() {
		return noticeNum;
	}

	public LocalDate getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(LocalDate noticeDate) {
		this.noticeDate = noticeDate;
	}

	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContents() {
		return noticeContents;
	}

	public void setNoticeContents(String noticeContents) {
		this.noticeContents = noticeContents;
	}

	public int getNoticeHits() {
		return noticeHits;
	}

	public void setNoticeHits(int noticeHits) {
		this.noticeHits = noticeHits;
	}


	
	

	
}
