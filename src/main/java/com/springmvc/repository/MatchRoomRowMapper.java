package com.springmvc.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.springmvc.domain.MatchRoom;

public class MatchRoomRowMapper implements RowMapper<MatchRoom> {
	
 
	
	@Override
	public MatchRoom mapRow(ResultSet rs, int rowNum) throws SQLException{
		
		

		
        MatchRoom matchRoom = new MatchRoom();
        matchRoom.setMatchNum(rs.getInt("matchNum"));
        matchRoom.setMatchTitle(rs.getString("matchTitle"));
		matchRoom.setCreatorId(rs.getString("creatorId"));
		matchRoom.setApplicantId(rs.getString("applicantId"));
        matchRoom.setRoomNum(rs.getInt("roomNum"));
        matchRoom.setMatchStatus(rs.getString("matchStatus"));
        matchRoom.setMatchResult(rs.getString("matchResult"));
        matchRoom.setStoreId(rs.getString("storeId"));
        matchRoom.setRoomName(rs.getString("roomName"));
        matchRoom.setRoomCapacity(rs.getInt("roomCapacity"));
        matchRoom.setRoomCount(rs.getInt("roomCount"));
        matchRoom.setRoomCategory(rs.getString("roomCategory"));
        matchRoom.setRoomDetail(rs.getString("roomDetail"));
        matchRoom.setMatched(rs.getInt("matched"));
        
        matchRoom.setRoomDate(rs.getDate("roomDate").toLocalDate());
        matchRoom.setRoomTime(rs.getTime("roomTime").toLocalTime());

        return matchRoom;

	}

}