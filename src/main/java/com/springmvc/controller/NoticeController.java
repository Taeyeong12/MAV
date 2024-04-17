package com.springmvc.controller;

import java.time.LocalDate;
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

import com.springmvc.domain.Member;
import com.springmvc.domain.Notice;
import com.springmvc.service.NoticeService;
import org.springframework.web.bind.annotation.RequestBody;


@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
    private  NoticeService noticeService;
		
	//공지사항
    @GetMapping("/list")
    public String list(@RequestParam(name="page", defaultValue = "1") int page,Model model, Notice notice) {
    	
        
        int totalCount = noticeService.getTotalCount(); // 11
        List<Notice> notices = noticeService.getNotices(page); // page가 1,2,3,4 ....
        int pageCount = totalCount / 10; // 1
        if(totalCount % 10 > 0){ // 나머지가 있을 경우 1page를 추가
            pageCount++;
        }
        int currentPage = page;

    	model.addAttribute("notices",notices);
        model.addAttribute("pageCount", pageCount);//전체페이지
        model.addAttribute("currentPage", currentPage);//현재페이지
        
        return "noticeList";

    }
    
    
    //공지사항 등록하기
    @GetMapping("/writeForm")
    public String noticeWriteForm() {

            return "noticeWriteForm";        
    }
    
    //등록하기 db저장
    @PostMapping("/write")
    public String noticeWrite(@RequestParam("noticeTitle") String title,
    		                 @RequestParam("noticeContents") String content,
    		                 HttpServletRequest request,
    		                 Model model
    		) {
    	

		 HttpSession session = request.getSession(); 
		 Member member = (Member)session.getAttribute("member"); 
		
		 System.out.println("member 정보: " + member.getMemberId());
		 model.addAttribute("member",member);
    	
        LocalDate now = LocalDate.now();
        
        String  noticeWriter = member.getMemberId();
        noticeService.noticeWrite(noticeWriter, title, content, now);
    	
		 		 
         //로그인한 사용자만 글을 써야한다. 로그인을 하지 않았다면 리스트보기로 자동 이동 시킨다.
         //세션에서 로그인한 정보를 읽어들인다.
    	
    	 //로그인한 회원 정보 + 제목, 내용을 저장한다.
    	
            return "redirect:./list";        
    }
    
    @GetMapping("/noticeDetail")
    public String noticeDetail(@RequestParam("noticeNum") int noticeNum, Model model) {
    	
    		
    	    Notice detailNotice =  noticeService.getByNotice(noticeNum);
    		System.out.println(detailNotice.getNoticeContents() + ": detailNotice.getNoticeContents()" );
    		
    		noticeService.updateHits(noticeNum);
    		model.addAttribute("detailNotice", detailNotice );
    	
            return "noticeDetail";        
    }

	

	 

    //업데이트 글쓴이만 수정가능
    @GetMapping("/updateForm")
    public String noticeupdateForm(@RequestParam("noticeNum") int noticeNum,Model model) {

	    Notice updateNotice =  noticeService.getByNotice(noticeNum);
		model.addAttribute("updateNotice", updateNotice );
    	
            return "noticeUpdate";        
    }
    
    @PostMapping("/noticeUpate")
    public String noticeUpate(@ModelAttribute("updateRooms")Notice updateNotice) {
    	noticeService.updateNotice(updateNotice);
    	
    	return "redirect:./list";
    }
    
    //삭제 
    @GetMapping("/deleteNotice")
    public String deleteNotice(@RequestParam("noticeNum") int noticeNum) {

    	noticeService.deleteNotice(noticeNum);
    	
            return "redirect:./list";        
    }

}