package com.springmvc.service;

import java.time.LocalDate;
import java.util.List;

import com.springmvc.domain.Notice;

public interface NoticeService {

	
	void noticeWrite (String noticeWriter, String title, String content, LocalDate now);
    List<Notice> getAllNotice(Notice notice);
    Notice getByNotice(int noticeNum);
    void updateNotice(Notice updateNotice);
    void deleteNotice(int noticeNum);
    
    //공지사항
	int getTotalCount();
	List<Notice> getNotices(int page);
	void updateHits(int noticeNum);

}

