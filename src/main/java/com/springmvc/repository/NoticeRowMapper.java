package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.Notice;


public class NoticeRowMapper implements RowMapper<Notice> {

	@Override
	public Notice mapRow(ResultSet rs, int rowNum) throws SQLException {
    	Notice notice = new Notice();
        notice.setNoticeNum(rs.getInt("noticeNum"));
        notice.setNoticeWriter(rs.getString("noticeWriter"));
        notice.setNoticeTitle(rs.getString("noticeTitle"));
        notice.setNoticeContents(rs.getString("noticeContents"));
        notice.setNoticeHits(rs.getInt("noticeHits"));
        notice.setNoticeDate(rs.getDate("noticeDate").toLocalDate());
        // notice.setFileAttached(rs.getInt("fileAttached"));

        return notice; // 수정된 부분
	}
}
