package com.springmvc.controller;

import java.io.File;
import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;

import com.springmvc.domain.MatchRoom;
import com.springmvc.domain.Member;
import com.springmvc.domain.Room;
import com.springmvc.domain.Store;

import com.springmvc.service.MatchService;
import com.springmvc.service.StoreService;


@Controller
@RequestMapping("/store")
public class StoreController {


	@Autowired
	private StoreService storeService;

	@Autowired
	private MatchService matchService;

	// 해당 업체가 만든 모든 경기장룸/토너먼트/매칭룸을 가지고 스토어로감
	@GetMapping
	public String readStoreMypage(@RequestParam String storeId,HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		Store store = storeService.getStoreById(storeId);

		System.out.println("Store 정보: " + store.getStoreId() + ", " + store.getStoreName());

		// 입력한 방 모두의 정보를 가지고오는 로직
		storeId = store.getStoreId();
		model.addAttribute("member", member);
		model.addAttribute("store",store);

		return "store";
		
	}

	// 아작스 부분
	@GetMapping("/RoomManagement")
	public String roomManagement(HttpServletRequest request, Model model, Room room) {

		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		Store store = (Store) session.getAttribute("store");
		System.out.println(store.getStoreId() + ": 이 부분 확인");
		System.out.println("Store 정보: " + store.getStoreId() + ", " + store.getStoreName());

		// 입력한 방 모두의 정보를 가지고오는 로직
		String storeId = store.getStoreId();
		model.addAttribute("member", member);

		// room
		List<Room> myRooms = storeService.getRoomsByStoreId(storeId);
		System.out.println(myRooms.get(room.getRoomNum()) + "이걸 확인 할꺼야");
		model.addAttribute("myRooms", myRooms);

		return "sectionRoom";
	}

	@GetMapping("/MatchRoomManagement")
	public String MatchRoomManagement(HttpServletRequest request, Model model, MatchRoom matchRoom, Room room) {

		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		Store store = (Store) session.getAttribute("store");
		System.out.println(store.getStoreId() + ": 이 부분 확인");
		System.out.println("Store 정보: " + store.getStoreId() + ", " + store.getStoreName());

		// 입력한 방 모두의 정보를 가지고오는 로직
		String storeId = store.getStoreId();
		model.addAttribute("member", member);

		// MatchRoom
		List<MatchRoom> matchView = matchService.getMatchRoomsByStoreId(storeId);
		model.addAttribute("matchView", matchView);

		// room
		List<Room> myRooms = storeService.getRoomsByStoreId(storeId);
		System.out.println(myRooms.get(room.getRoomNum()) + "이걸 확인 할꺼야");
		model.addAttribute("myRooms", myRooms);

		return "sectionMatchRoom";
	}

	@GetMapping("/ResultManagement")
	public String ResultManagement(HttpServletRequest request, Model model, MatchRoom matchRoom, Room room) {

		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		Store store = (Store) session.getAttribute("store");
		System.out.println(store.getStoreId() + ": 이 부분 확인");
		System.out.println("Store 정보: " + store.getStoreId() + ", " + store.getStoreName());

		// 입력한 방 모두의 정보를 가지고오는 로직
		String storeId = store.getStoreId();
		model.addAttribute("member", member);

		// MatchRoom
		List<MatchRoom> matchView = matchService.getMatchRoomsByStoreId(storeId);
		model.addAttribute("matchView", matchView);

		// room
		List<Room> myRooms = storeService.getRoomsByStoreId(storeId);
		System.out.println(myRooms.get(room.getRoomNum()) + "이걸 확인 할꺼야");
		model.addAttribute("myRooms", myRooms);

		return "sectionResultManagement";
	}

	/*
	 * // 삭제 //룸 넘버 받아와서 삭제
	 * 
	 * @RequestMapping("/deleteRoom") public String
	 * deleteRoom(@RequestParam("roomNum") int roomNum) {
	 * 
	 * storeService.deleteRoom(roomNum); return "redirect:/store/myRooms"; }
	 */

	@GetMapping("/add")
	public String createStore(Model model, HttpServletRequest request) {

		HttpSession sessionId = request.getSession();
		Member member = (Member) sessionId.getAttribute("member");
		Store store = (Store) sessionId.getAttribute("store");
		if (store == null) {
			store = new Store();
		}
		System.out.println("member:" + member.getMemberId());
		model.addAttribute("store", store);
		model.addAttribute("member", member);
		sessionId.setAttribute("store", store);
		sessionId.setAttribute("member", member);

		System.out.println("현재 업체 등록시도중인 memberId : " + member.getMemberId());
		System.out.println("현재 업체 등록시도중인 storeId : " + store.getStoreId());

		return "addStore";
	}

	@PostMapping("/add")
	public String returnStore(@ModelAttribute("store") Store store, @ModelAttribute("member") Member member,
			Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		member = (Member) session.getAttribute("member");

		session.setAttribute("store", store);
		session.setAttribute("member", member);

		List<MultipartFile> storeImage = new ArrayList<MultipartFile>();
		List<String> storeImageName = new ArrayList<String>();
		String save = request.getSession().getServletContext().getRealPath("/resources/images");
		// 이미지 경로 =SAVE
		System.out.println("이미지경로:" + save);

		storeImage.add(store.getStoreImage1());
		storeImage.add(store.getStoreImage2());
		storeImage.add(store.getStoreImage3());
		storeImage.add(store.getStoreImage4());
		storeImage.add(store.getStoreImage5());

		for (int i = 0; i < storeImage.size(); i++) {
			MultipartFile file = storeImage.get(i);
			String saveName = file.getOriginalFilename();
			storeImageName.add(saveName);
			System.out.println("post에서 받아온 saveName 파일이름 : " + saveName);

			File saveFile = new File(save, saveName);

			if (file != null && !file.isEmpty()) {
				try {
					file.transferTo(saveFile);
					// 여기에 각 이미지 이름을 store 객체에 설정하는 로직을 추가합니다.
					switch (i) {
					case 0:
						store.setStoreImageName1(saveName);
						break;
					case 1:
						store.setStoreImageName2(saveName);
						break;
					case 2:
						store.setStoreImageName3(saveName);
						break;
					case 3:
						store.setStoreImageName4(saveName);
						break;
					case 4:
						store.setStoreImageName5(saveName);
						break;
					}
				} catch (Exception e) {
					throw new RuntimeException("이미지 업로드가 실패했습니다.", e);
				}
			}

		}

		storeService.CreateStore(store);
		model.addAttribute("store", store);
		System.out.println("현재 업체 등록시도중인 memberId : " + member.getMemberId());
		System.out.println("현재 업체 등록시도중인 storeId : " + store.getStoreId());
		return "redirect:/";
	}

	@GetMapping("/update")
	public String UpdateStore(@ModelAttribute("store") Store store, Model model,
			@RequestParam("storeId") String storeId) {
		Store storeById = storeService.getStoreById(storeId);
		model.addAttribute("store", storeById);
		System.out.println("컨트롤store:" + storeById.getStoreAddr());

		return "storeupdateform";
	}

	@PostMapping("/update")
	public String submitStore(@ModelAttribute("store") Store store, HttpServletRequest request,
			@RequestParam("storeId") String storeId) {
		System.out.println("컨트롤store2:" + store.getStoreId());
		List<MultipartFile> storeImage = new ArrayList<MultipartFile>();
		List<String> storeImageName = new ArrayList<String>();
		String save = request.getSession().getServletContext().getRealPath("/resources/images");
		// 이미지 경로 =SAVE
		System.out.println("이미지경로:" + save);

		storeImage.add(store.getStoreImage1());
		storeImage.add(store.getStoreImage2());
		storeImage.add(store.getStoreImage3());
		storeImage.add(store.getStoreImage4());
		storeImage.add(store.getStoreImage5());

		for (int i = 0; i < storeImage.size(); i++) {
			MultipartFile file = storeImage.get(i);
			String saveName = file.getOriginalFilename();
			storeImageName.add(saveName);
			System.out.println("post에서 받아온 saveName 파일이름 : " + saveName);

			File saveFile = new File(save, saveName);

			if (file != null && !file.isEmpty()) {
				try {
					file.transferTo(saveFile);
					// 여기에 각 이미지 이름을 store 객체에 설정하는 로직을 추가합니다.
					switch (i) {
					case 0:
						store.setStoreImageName1(saveName);
						break;
					case 1:
						store.setStoreImageName2(saveName);
						break;
					case 2:
						store.setStoreImageName3(saveName);
						break;
					case 3:
						store.setStoreImageName4(saveName);
						break;
					case 4:
						store.setStoreImageName5(saveName);
						break;
					}
				} catch (Exception e) {
					throw new RuntimeException("이미지 업로드가 실패했습니다.", e);
				}
			}

		}

		storeService.UpdateStore(store);
		return "redirect:/";
	}

	@GetMapping("/delete")
	public String DeleteStore(@RequestParam String storeId, HttpServletRequest request) {
		Store store = storeService.DeleteStore(storeId);
		HttpSession session = request.getSession();
		session.setAttribute("store", store);

		return "redirect:/";
	}

	/*
	 * @GetMapping("/myRooms") public String getMyRooms(Model model) { // 업체가 작성한 모든
	 * 방의 시간과 날짜를 가져오는 로직 // 실제로는 세션 등에서 업체 아이디를 가져와야 합니다. String storeId =
	 * "업체의 아이디 여기에";
	 * 
	 * List<Room> myRooms = storeService.getAllRoomsByStoreId();
	 * model.addAttribute("myRooms", myRooms); return "myRooms"; }
	 */
}