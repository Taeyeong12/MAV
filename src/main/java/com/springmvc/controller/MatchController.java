package com.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.springmvc.domain.Club;
import com.springmvc.domain.Match;
import com.springmvc.domain.MatchRoom;
import com.springmvc.domain.Member;
import com.springmvc.domain.Room;
import com.springmvc.domain.RoomWithCoordinate;

import com.springmvc.domain.Store;

import com.springmvc.service.ClubService;
import com.springmvc.service.MatchService;
import com.springmvc.service.StoreService;

@Controller
@RequestMapping("/match")
public class MatchController {

	@Autowired
	private StoreService storeService;

	@Autowired
	private MatchService matchService;

	@Autowired
	private ClubService clubService;

	// 상세보기
	@GetMapping("/roomsDetail")

	public String detailmyRooms(@RequestParam int roomNum, Model model,RoomWithCoordinate roomWithCoordinate,HttpServletRequest request) {


		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");

		model.addAttribute("member", member);

		// 동호회장으로 있는 클럽의 정보를 가지고감
		List<Club> memberClubs = clubService.getMyMasterClub(member.getMemberId());
		model.addAttribute("memberClubs", memberClubs);

		model.addAttribute("matchForm", new Match());

		// 경기장 넘버에 맞는 업체의 좌표값 가지고 가기
		RoomWithCoordinate coordinate = storeService.getBycoordinate(roomNum);
		model.addAttribute("coordinate", coordinate);
		

		Room detailroom = storeService.getByroomNumAllRooms(roomNum);

		model.addAttribute("detailroom", detailroom);
		return "detailRoom";
	}

	// 매칭룸 만들기
	@PostMapping("/roomsDetail")
	public String createMatch(@ModelAttribute("matchForm") Match match, HttpServletRequest request, Model model) {

		// 매칭룸을 만들 때 세션에 저장된 멤버의 아이디를 설정
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");

		// 클럽 ID를 통해 클럽 정보를 가져옴
		match.setCreatorId(match.getSelectedClub());

		// 매칭룸 생성 및 해당 매칭룸으로 반환
		int roomNum = matchService.matchCreate(match);


		// 만든 매칭룸으로 이동
		return "redirect:/match/matchingDetail?roomNum=" + roomNum;
	}

	// create 매칭신청
	// 매칭룸에서 신청
	@GetMapping("/matchingDetail")
	public String detailmatchingForm(@RequestParam("roomNum") int roomNum, Model model,RoomWithCoordinate roomWithCoordinate, HttpServletRequest request) {


		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");

		model.addAttribute("member", member);

		// 신청자 동호회장으로 있는 클럽의 정보를 가지고감
		List<Club> memberClubs = clubService.getMyMasterClub(member.getMemberId());
		model.addAttribute("memberClubs", memberClubs);

		MatchRoom matching = matchService.getMatchByRoomNum(roomNum);
		model.addAttribute("matching", matching);

		// 만든이의 클럽정보를 가지고감
		Club clubInfos = clubService.getByClubName(matching.getCreatorId());
		model.addAttribute("clubInfos", clubInfos);
		
		// 경기장 넘버에 맞는 업체의 좌표값 가지고 가기
		RoomWithCoordinate coordinate = storeService.getBycoordinate(roomNum);
		System.out.println(coordinate.getLongitude()+"요것만 확인하자");	
		model.addAttribute("coordinate", coordinate);
		
		// 룸정보를 가지고감
		Room room = storeService.getByroomNumAllRooms(roomNum);
		model.addAttribute("room", room);

		return "matchingRoom";
	}

	// post
	@PostMapping("/matchingApply")
	public String matchingApply(@ModelAttribute("matching") Match match, @ModelAttribute("room") Room room,
			HttpServletRequest request) {

		// 추 후 함수를 옴겨야 할 것 같음
		// 'matched' 값을 2로 업데이트
		int matchedValue = 2;
		storeService.updateMatchedValue(room.getRoomNum(), matchedValue);

		// 원래의 매칭신청 로직 실행
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");

		match.setApplicantId(match.getSelectedClub());

		if (match.getCreatorId().equals(match.getApplicantId())) {
			return "redirect:/match/matchingDetail?roomNum=" + match.getRoomNum();
		}

		matchService.applyMatch(match);

		return "redirect:/match/matchingDetail?roomNum=" + match.getRoomNum();
	}

	// 점수 부여
	@PostMapping("/matchpoint")
	public String submitPoint(@ModelAttribute("matching") Match match, @RequestParam String result) {

		// 추 후 함수를 옴겨야 할 것 같음
		// 'matched' 값을 3로 업데이트
		int matchedValue = 3;
		storeService.updateMatchedValue(match.getRoomNum(), matchedValue);
		System.out.println("match.getRoomNum() 확인용" + match.getRoomNum());

		Club club = new Club();
		club.setClubName(match.getCreatorId());
		String creatorClubName = match.getCreatorId();
		club.setClubName(match.getApplicantId());
		String applicantClubName = match.getApplicantId();

		if (result.equals("승")) {
			clubService.updateClubPoint(creatorClubName, 3);
			clubService.updateClubPoint(applicantClubName, 0);
		} else if (result.equals("무")) {
			clubService.updateClubPoint(creatorClubName, 1);
			clubService.updateClubPoint(applicantClubName, 1);
		} else {
			clubService.updateClubPoint(creatorClubName, 0);
			clubService.updateClubPoint(applicantClubName, 3);
		}

		return "redirect:/store";
	}

	// read
	// 매칭뷰
	@GetMapping("/matchingView")
	public String matchingView(Model model, MatchRoom matchRoom) {

		List<MatchRoom> matchView = matchService.findAllMatchRooms(matchRoom);
		
		model.addAttribute("matchView", matchView);
		return "/matchingView";
	}

}