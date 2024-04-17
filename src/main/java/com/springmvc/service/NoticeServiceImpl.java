package com.springmvc.service;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Notice;
import com.springmvc.repository.NoticeRepository;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeRepository noticeRepository; 
	
	@Override
	public void noticeWrite(String noticeWriter,String title, String content, LocalDate now) {
		noticeRepository.noticeWrite(noticeWriter,title, content, now);
	}

	@Override
	public List<Notice> getAllNotice(Notice notice) {
		return noticeRepository.getAllNotice(notice);
	}

	@Override
	public Notice getByNotice(int noticeNum) {
		return noticeRepository.getByNotice(noticeNum);
	}

	@Override
	public void updateNotice(Notice updateNotice) {
		
		noticeRepository.updateNotice(updateNotice);		
	}

	@Override
	public void deleteNotice(int noticeNum) {
		noticeRepository.deleteNotice(noticeNum);		
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return noticeRepository.getTotalCount();
	}

	@Override
	public List<Notice> getNotices(int page) {
		return noticeRepository.getNotices(page);
	}

	@Override
	public void updateHits(int noticeNum) {
		noticeRepository.updateHits(noticeNum);
		
	}



}

