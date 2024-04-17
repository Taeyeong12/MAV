package com.springmvc.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springmvc.domain.Club;
import com.springmvc.domain.ClubMember;
import com.springmvc.domain.Member;
import com.springmvc.domain.adminImages;
import com.springmvc.service.AdminImagesService;
import com.springmvc.service.ClubService;
import com.springmvc.service.MemberService;

@Controller
@RequestMapping("/club")
public class ClubController 
{
	@Autowired
	private ClubService clubService;
	@Autowired
	private MemberService memberService;
	 @Autowired
	 private AdminImagesService adminImagesService;
	
	@ModelAttribute("categoryOptions")
    public Map<String, String> getCategoryOptions() 
    {
        Map<String, String> categoryOptions = new HashMap<>();
        categoryOptions.put("기타", "기타");
        categoryOptions.put("농구", "농구");
        categoryOptions.put("풋살", "풋살");
        categoryOptions.put("족구", "족구");
        categoryOptions.put("당구", "당구");
        categoryOptions.put("야구", "야구");
        categoryOptions.put("축구", "축구");
        return categoryOptions;
    }
	@ModelAttribute("localeOptions")
	public Map<String, String> getLocaleOptions()
	{
		Map<String, String> localeOptions = new HashMap<>();
		localeOptions.put("강원", "강원");
		localeOptions.put("제주", "제주");
		localeOptions.put("전라", "전라");
		localeOptions.put("경상", "경상");
		localeOptions.put("충청", "충청");
		localeOptions.put("경기", "경기");
		localeOptions.put("서울", "서울");
		
		return localeOptions;
	}
	
	@GetMapping("/add")
	public String addClub(HttpServletRequest request,Model model)
	{
		
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		Club club = new Club();
			
		model.addAttribute("club",club);
		model.addAttribute("member", member);
		
		session.setAttribute("club", club);
		System.out.println("club컨트롤러의 getmapping에서 담긴 정보 : "+ member.getMemberId());
		System.out.println("club컨트롤러의 getmapping에서 담긴 클럽명 : "+ club.getClubName());
		
		return "addClub";
	}
	
	@PostMapping("/add")
	public String addClubDone(@ModelAttribute("club") Club club, @ModelAttribute("member") Member member, 
							  HttpServletRequest request, BindingResult bindingResult, Model model)
	{
		System.out.println("클럽 생성 postmapping 도착");
		if(bindingResult.hasErrors())
		{
			return "addClub";
		}
		HttpSession session = request.getSession();
		member = (Member) session.getAttribute("member");
		String save = request.getSession().getServletContext().getRealPath("/resources/images");
		List<MultipartFile> clubImages = new ArrayList<MultipartFile>();
	    List<String> imageFileNames = new ArrayList<String>();
	    
		clubImages.add(club.getClubImages1());
		clubImages.add(club.getClubImages2());
		clubImages.add(club.getClubImages3());
		clubImages.add(club.getClubImages4());
		clubImages.add(club.getClubImages5());
		
		for(int i=0; i<clubImages.size(); i++)
		{
			MultipartFile file = clubImages.get(i);
			String saveName = file.getOriginalFilename();			
			imageFileNames.add(saveName);			
			System.out.println("post에서 받아온 saveName 파일이름 : "+saveName);
			
			File saveFile= new File(save, saveName);
			
			if(file !=null && !file.isEmpty())
			{
				try 
				{
					file.transferTo(saveFile);
					club.setImageFileName1(saveName);
					
				} 
				catch (Exception e) 
				{
					throw new RuntimeException("동호회 이미지 업로드가 실패했습니다.", e);
				}
			}
			
		}
		club.setImageFileName1(imageFileNames.get(0));
		club.setImageFileName2(imageFileNames.get(1));
		club.setImageFileName3(imageFileNames.get(2));
		club.setImageFileName4(imageFileNames.get(3));
		club.setImageFileName5(imageFileNames.get(4));
		ClubMember clubmember = new ClubMember();
	
		model.addAttribute("member", member);
		model.addAttribute("club", club);
		model.addAttribute("clubmember", clubmember);
		
	
		System.out.println("동호회 가입신청 오류 : "+bindingResult.hasErrors());
		
		clubService.addNewClub(club,member);
		clubService.addNewClubMember(club, clubmember, member);

		session.setAttribute("club", club);
		session.setAttribute("member", member);

		return "redirect:/member/mypage";
	}
	
	@GetMapping("/clubinfo")
	public String myclub(String clubName,HttpServletRequest request, Model model)
	{
		List<ClubMember> memberList = new ArrayList();
		System.out.println("클럽페이지 도착");
		HttpSession session = request.getSession();
		Member memberSession = (Member) session.getAttribute("member");
		ClubMember clubmember = new ClubMember();
		Club club= (Club) session.getAttribute("club");
		club = clubService.getByClubName(clubName); // 클럽 ID를 통해 클럽 정보를 가져옴
		clubmember = clubService.getMyClubMember(memberSession.getMemberId(), club.getClubName());
		memberList = (List<ClubMember>) clubService.getClubMemberList(clubName);
        model.addAttribute("club", club); // 모델에 클럽 정보를 추가
        model.addAttribute("clubmember",clubmember);
        model.addAttribute("memberList", memberList);
        model.addAttribute("member", memberSession);
        session.setAttribute("club", club);
        
        System.out.println("현재 로그인한 아이디 : "+memberSession.getMemberId());
        System.out.println("현재 조회중인 동호회장 아이디 : "+club.getClubMaster());
        
        return "clubinfo"; // 클럽 정보를 보여주는 뷰 페이지로 이동
	}
	
	@GetMapping("/list")
	public String clubList(Model model) 
	{
	    System.out.println("클럽 리스트 페이지 도착");
	    adminImages images = adminImagesService.getAllImages();
	    
	    List<Club> getAllClubList = clubService.getAllClubList();
	    for (Club club : getAllClubList)
	    {
	        int countMember = clubService.clubMemberCount(club.getClubName());
	        club.setClubMemberCount(countMember);
	    }
	    model.addAttribute("adminImages", images);
	    model.addAttribute("club", getAllClubList);
	    return "clublist";
	}

	@GetMapping("/update")
	public String updateClub(HttpServletRequest request,Model model)
	{
		System.out.println("클럽 업데이트 getmapping 도착");
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		Club club = (Club) session.getAttribute("club");
		
		System.out.println("GET member에 담긴 아이디 : "+member.getMemberName());
		
		model.addAttribute("club", club);
		model.addAttribute("member", member);
		session.setAttribute("club", club);
		return "updateclub";
	}
	@PostMapping("/update")
	public String updateClubDone(@ModelAttribute Club club, HttpServletRequest request, BindingResult bindingResult, Model model) {
	    HttpSession session = request.getSession();
	    Member member = (Member) session.getAttribute("member");
	    String save = request.getSession().getServletContext().getRealPath("/resources/images");
	    List<MultipartFile> clubImages = new ArrayList<MultipartFile>();
	    List<String> imageFileNames = new ArrayList<String>();
	    
		clubImages.add(club.getClubImages1());
		clubImages.add(club.getClubImages2());
		clubImages.add(club.getClubImages3());
		clubImages.add(club.getClubImages4());
		clubImages.add(club.getClubImages5());
		
		for(int i=0; i<clubImages.size(); i++)
		{
			MultipartFile file = clubImages.get(i);
			String saveName = file.getOriginalFilename();			
			imageFileNames.add(saveName);			
			System.out.println("post에서 받아온 saveName 파일이름 : "+saveName);
			
			File saveFile= new File(save, saveName);
			
			if(file !=null && !file.isEmpty())
			{
				try 
				{
					file.transferTo(saveFile);
					club.setImageFileName1(saveName);
					
				} 
				catch (Exception e) 
				{
					throw new RuntimeException("동호회 이미지 업로드가 실패했습니다.", e);
				}
			}
			
		}
		club.setImageFileName1(imageFileNames.get(0));
		club.setImageFileName2(imageFileNames.get(1));
		club.setImageFileName3(imageFileNames.get(2));
		club.setImageFileName4(imageFileNames.get(3));
		club.setImageFileName5(imageFileNames.get(4));

	    System.out.println("POST member에 담긴 아이디 : " + member.getMemberName());
	    System.out.println("POST member에 담긴 클럽명 : " + club.getClubName());
	    
	    clubService.updateClub(club, member);

	    return "redirect:/member/mypage";
	}

	@GetMapping("/delete")
	public String deleteClub(Club club, Member member, HttpServletRequest request)
	{
		System.out.println("클럽 삭제 컨트롤러 도착");
		HttpSession session = request.getSession();
		member = (Member) session.getAttribute("member");
		club = (Club) session.getAttribute("club");
		System.out.println("삭제 처리할 클럽명 : "+club.getClubName());
		clubService.deleteClub(club.getClubName(),member.getMemberId());
		
		return "redirect:/member/mypage";
	}
	@GetMapping("/join")
	public String joinClub(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		Club club = (Club) session.getAttribute("club");
		ClubMember clubmember = new ClubMember();
		
		System.out.println("가입하려는 동호회명 : "+club.getClubName());
		System.out.println("가입하려는 동호회장 아이디 : "+club.getClubMaster());
		clubService.joinClub(club, clubmember, member);
		return "redirect:/member/mypage";
	}
	
	@GetMapping("/leaveclub")
	public String leaveclub(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		Club club = (Club) session.getAttribute("club");
		clubService.leaveClub(club.getClubName(), member.getMemberId());
		return "redirect:/member/mypage";
	}
	@GetMapping("/memberDetails")
	public String showMemberDetails(@RequestParam("memberId") String memberId, Model model) {
	    // memberId를 사용하여 회원 정보를 데이터베이스에서 조회합니다.
	    Member member = memberService.getById(memberId);
	    
	    // 조회된 회원 정보를 모델에 추가하여 JSP로 전달합니다.
	    model.addAttribute("member", member);
	    
	    return "clubMemberPage"; // 회원 상세 정보를 보여주는 페이지로 이동
	}
	@GetMapping("/ejection")
	public String ejectionMember(@RequestParam("c_memberId") String c_memberId, @RequestParam("clubName") String clubName)
	{
		clubService.ejectionMember(clubName, c_memberId);
		return "redirect:/member/mypage";
	}
	@GetMapping("/memberupdate")
	public String memberUpdate(@RequestParam("c_memberId") String c_memberId, @RequestParam("clubName") String clubName,Model model)
	{
		System.out.println("동호회원 수정페이지 도착");
		ClubMember clubMember = clubService.serchingC_member(c_memberId,clubName);
		System.out.println("등업 처리하려는 동호회원 아이디 : "+clubMember.getC_memberId());
		System.out.println("등업 처리하려는 동호회 이름 : "+clubMember.getClubName());
		clubService.memberUpdate(clubMember);
		return "redirect:/member/mypage";		
	}
	@GetMapping("/memberupdate2")
	public String memberUpdate2(@RequestParam("c_memberId") String c_memberId, @RequestParam("clubName") String clubName,Model model)
	{
		System.out.println("동호회원 수정페이지 도착");
		ClubMember clubMember = clubService.serchingC_member(c_memberId,clubName);
		System.out.println("등업 처리하려는 동호회원 아이디 : "+clubMember.getC_memberId());
		System.out.println("등업 처리하려는 동호회 이름 : "+clubMember.getClubName());
		clubService.memberUpdate2(clubMember);
		return "redirect:/member/mypage";		
	}
	
	@GetMapping("/clubsetting")
	public String clubsetting(@RequestParam("clubName")String clubName,HttpServletRequest request, Model model)
	{
		List<ClubMember> memberList = new ArrayList();
		System.out.println("클럽관리페이지 도착");
		HttpSession session = request.getSession();
		Member memberSession = (Member) session.getAttribute("member");
		ClubMember clubmember = new ClubMember();
		Club club = clubService.getByClubName(clubName);
		clubmember = clubService.getMyClubMember(memberSession.getMemberId(), club.getClubName());
		memberList = (List<ClubMember>) clubService.getClubMemberList(clubName);
        model.addAttribute("club", club); // 모델에 클럽 정보를 추가
        model.addAttribute("clubmember",clubmember);
        model.addAttribute("memberList", memberList);
        model.addAttribute("member", memberSession);
        
        System.out.println("현재 로그인한 아이디 : "+memberSession.getMemberId());
        System.out.println("현재 조회중인 동호회장 아이디 : "+club.getClubMaster());
        
        return "clubsetting"; // 클럽 정보를 보여주는 뷰 페이지로 이동		
	}

}
