package com.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.springmvc.domain.Club;
import com.springmvc.domain.MatchRoom;
import com.springmvc.domain.Room;
import com.springmvc.domain.adminImages;
import com.springmvc.service.AdminImagesService;
import com.springmvc.service.ClubService;
import com.springmvc.service.MatchService;
import com.springmvc.service.StoreService;

@Controller
public class MainController {
   
    @Autowired
    private StoreService storeService;
    
   @Autowired
   private MatchService matchService;
   
   @Autowired
   private ClubService clubService;
   
   @Autowired
   private AdminImagesService adminImagesService;

   // 메인 페이지 호출
   @GetMapping("/main")
   public String goHome(Model model,Room room,MatchRoom matchRoom,adminImages adminImages) {
	   
	  // 사진 들고오기
	   adminImages = adminImagesService.getAllImages();
	   
	    if (adminImages != null) {
	        model.addAttribute("adminImages", adminImages);
	    } else {
	        model.addAttribute("errorMessage", "현재 등록된 이미지가 없습니다.");
	    }
	 // 클럽리스트 들고오기
	   List<Club> club = clubService.getAllClubList();
	  
	   if (club.isEmpty()) {
           // 데이터베이스에서 동호회 정보를 가져오지 못한 경우
           model.addAttribute("errorMessage", "현재 등록된 동호회가 없습니다.");
       } else {
           model.addAttribute("club", club);
       }
	  
      //매칭룸
       List<MatchRoom> matchView = matchService.findAllMatchRooms(matchRoom);
       model.addAttribute("matchView",matchView);
       
       
       //경기장
        List<Room> myRooms = storeService.getAllRooms(room);
        model.addAttribute("myRooms", myRooms);
       
      return "main";
   }

}

