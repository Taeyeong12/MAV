package com.springmvc.repository;

import java.util.List;

import com.springmvc.domain.Match;
import com.springmvc.domain.MatchRoom;

public interface MatchRepository {
	void matchCreate(Match match);
    List<MatchRoom> findAllMatchRooms(MatchRoom matchroom);
    List<MatchRoom> getMatchRoomsByStoreId(String storeId);
    MatchRoom getMatchByRoomNum(int roomNum);
    void applyMatch(Match match);
}
