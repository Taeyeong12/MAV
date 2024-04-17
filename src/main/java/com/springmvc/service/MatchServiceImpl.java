package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springmvc.domain.Match;
import com.springmvc.domain.MatchRoom;
import com.springmvc.repository.MatchRepository;

@Service
public class MatchServiceImpl implements MatchService {
	
	@Autowired
	private MatchRepository matchRepository;
	
	@Override
	public int matchCreate(Match match) {
		matchRepository.matchCreate(match);
		return match.getRoomNum(); 
	}

	@Override
	public List<MatchRoom> findAllMatchRooms(MatchRoom matchroom) {
		return 	matchRepository.findAllMatchRooms(matchroom);

	}

	@Override
	public List<MatchRoom> getMatchRoomsByStoreId(String storeId) {
		return matchRepository.getMatchRoomsByStoreId(storeId);
	}

	@Override
	public MatchRoom getMatchByRoomNum(int roomNum) {
		// TODO Auto-generated method stub
		return matchRepository.getMatchByRoomNum(roomNum);

	}

	@Override
	public void applyMatch(Match match) {
		matchRepository.applyMatch(match) ;
		
	}


	
}
