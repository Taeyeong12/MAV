package com.springmvc.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springmvc.domain.Club;
import com.springmvc.domain.Member;
import com.springmvc.repository.MemberRepository;
import com.springmvc.service.ClubService;
import com.springmvc.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController 
{
   @Autowired
   private MemberService memberService;
   @Autowired
   private MemberRepository memberRepository;
   @Autowired
   private ClubService clubService;
   
   @InitBinder
   public void initBinder(WebDataBinder binder) 
   {
       SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
       binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
   }
   
   @GetMapping("/add/member")
   public String addMember(Model model)
   {
      System.out.println("회원가입 페이지 도착");
      model.addAttribute("member", new Member());
      return "addMember";
   }
   
   @PostMapping("/add/member")
   public String addDone(@ModelAttribute Member member, BindingResult bindingResult, Model model)
   {   
	   


      if(bindingResult.hasErrors())
      {
         return "addMember";
      }
      model.addAttribute("member", member);
      memberRepository.setNewMember(member);
      return "redirect:/";
   }

    @ModelAttribute("genderOptions")
    public Map<String, String> getGenderOptions() 
    {
        Map<String, String> genderOptions = new HashMap<>();
        genderOptions.put("남성", "남성");
        genderOptions.put("여성", "여성");
        return genderOptions;
    }
    
    @ModelAttribute("phone01Options")
    public Map<String, String> getPhone01Options() 
    {
        Map<String, String> phone01Options = new HashMap<>();
        phone01Options.put("010", "010");
        phone01Options.put("011", "011");
        return phone01Options;
    }

    @GetMapping("/test")
    public String testingPage(Member member,Model model)
    {
       List<Member> getAllmemberlist = memberService.getAllMemberList();
       model.addAttribute("member", getAllmemberlist);
       return "testmember";
    }
    @GetMapping("/mypage")
    public String memberMyPage(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Member member = (Member) session.getAttribute("member");
        Club club = (Club) session.getAttribute("club");
        
        List<Club> clubs = clubService.getMyClub(member.getMemberId());
   
        model.addAttribute("club", club);
        model.addAttribute("clubs", clubs);
        model.addAttribute("member", member);
        session.setAttribute("member", member);
        session.setAttribute("club", club);
        session.setAttribute("clubs", clubs);
     
        return "mypage";
    }

    @GetMapping("/update/member")
    public String updateMember(@RequestParam String memberId, Model model)
    {       
       System.out.println("업데이트 페이지 도착");
       Member member = memberService.getById(memberId);
       
       model.addAttribute("member", member);
       
       return "updateMember";
    }
    @PostMapping("/update/member")
    public String updateDone(@ModelAttribute("member") Member member, HttpServletRequest request)
    {
       memberService.updateMember(member);
       HttpSession session = request.getSession();       
       session.setAttribute("member", member);
       System.out.println("member 변경후 저장된 주소 : "+member.getMemberAddr());
       
       return "redirect:/member/mypage";
    }
    @RequestMapping(value="/delete/member")
    public String deleteMember(@RequestParam String memberId)
    {
       System.out.println("delete 라인 도착");
       System.out.println("삭제할 ID : " +memberId);       
       memberService.deleteMember(memberId);
       return "redirect:/member/mypage";
    }
    
    
    //태영 :)
    
    //아이디 검증
    @PostMapping("/checkMemberId")
    @ResponseBody
    public String checkMemberId(@RequestParam String memberId) {
    	
    	System.out.println("회원가입 왔니??");
    	
    	
        int count = memberService.countMemberById(memberId); // 데이터베이스에서 memberId를 이용하여 중복 검사
        if(count > 0) {
            return "duplicate"; // 중복되는 경우 "duplicate" 반환
        } else {
            return "valid"; // 중복되지 않는 경우 "valid" 반환
        }
        
    
    }
    
}