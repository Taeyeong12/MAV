package com.springmvc.service;

import java.util.List;

import com.springmvc.domain.Match;
import com.springmvc.domain.MatchRoom;
import com.springmvc.domain.Room;

public interface MatchService {
	int matchCreate(Match match); 	
	List<MatchRoom> findAllMatchRooms(MatchRoom matchroom);
	List<MatchRoom> getMatchRoomsByStoreId(String storeId);
	MatchRoom getMatchByRoomNum(int roomNum);
	void applyMatch(Match match);
}
