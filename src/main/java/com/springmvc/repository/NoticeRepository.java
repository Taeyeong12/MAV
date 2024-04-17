package com.springmvc.repository;

import java.time.LocalDate;
import java.util.List;

import com.springmvc.domain.Notice;
import com.springmvc.domain.Room;


public interface NoticeRepository {

	
	void noticeWrite (String noticeWriter,String title,String content,LocalDate now);
    List<Notice> getAllNotice(Notice notice);
    Notice getByNotice(int noticeNum);
    void updateNotice(Notice updateNotice);
	void deleteNotice(int noticeNum);
	int getTotalCount();
	List<Notice> getNotices(int page);
	void updateHits(int noticeNum);


}
