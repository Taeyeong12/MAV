package com.springmvc.repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.springmvc.domain.Notice;

@Repository
public class NoticeRepositoryImpl implements NoticeRepository {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    public NoticeRepositoryImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    
    public NoticeRepositoryImpl() {
 	   
    }
    
    
    //게시글 등록하기
	@Override
	public void noticeWrite(String noticeWritor,String title, String content, LocalDate now) {
		
		String sql = "insert into notice(noticeWriter,noticeTitle,noticeContents,noticeDate) values(?,?,?,?)";
		
		jdbcTemplate.update(
				sql,
				noticeWritor,
				title,
				content,
				now
				
				);
	
	}
	
	
	//리스트 페이지에 뿌리기
	@Override
	public List<Notice> getAllNotice(Notice notice) {
	
		String sql = "select * from notice order by noticeNum desc";
		return jdbcTemplate.query(sql, new NoticeRowMapper());
	}

	
	//상세페이지 뿌리기
	@Override
	public Notice getByNotice(int noticeNum) {
		String sql = "select * from notice where noticeNum = ?";
		return jdbcTemplate.queryForObject(sql,new Object[]{noticeNum}, new NoticeRowMapper());
	}

	@Override
	public void updateNotice(Notice updateNotice) {
		System.out.println(updateNotice.getNoticeNum() + " : updateNotice.getNoticeNum()" );
	    String sql = "update notice set noticeTitle = ?, noticeContents = ? where noticeNum = ?";
		
		jdbcTemplate.update(
				sql,
				updateNotice.getNoticeTitle(),
				updateNotice.getNoticeContents(),
				updateNotice.getNoticeNum()

				);
	}

	@Override
	public void deleteNotice(int noticeNum) {
		String sql = "delete from notice where noticeNum=?";
		jdbcTemplate.update(sql,noticeNum);
	}
	
	
	//공지사항
	@Override
	public int getTotalCount() {
        String sql = "select count(*) as total_count from notice"; // 무조건 1건의 데이터가 나온다.
        Integer totalCount = jdbcTemplate.queryForObject(sql, Integer.class);
        return totalCount.intValue();
	}
	
	@Override
	public List<Notice> getNotices(int page) {
	    int start = (page - 1) * 10;  // 페이지당 10개 가져가기 디비인덱스 계산
	    String sql = "select n.noticeNum, n.noticeWriter, m.memberId, n.noticeTitle, n.noticeContents, n.noticeHits, n.noticeDate from Notice n join Member m on n.noticeWriter = m.memberId order by noticeNum desc limit ?, 10";
	    return jdbcTemplate.query(sql, new NoticeRowMapper(), start);
	}

	@Override
	public void updateHits(int noticeNum) {
		
		System.out.println("noticeNum : 여기" + noticeNum);
		String sql = "update notice SET noticeHits = COALESCE(noticeHits, 0) + 1  where noticeNum = ?";
		jdbcTemplate.update(sql,noticeNum);		
	}
	
	
}



