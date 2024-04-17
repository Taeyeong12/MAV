package com.springmvc.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springmvc.domain.Classes;
import com.springmvc.domain.Member;
import com.springmvc.domain.Teacher;
import com.springmvc.service.ClasseService;
import com.springmvc.service.TeacherService;

@Controller
@RequestMapping("/teacher")
public class TeacherController {
	@Autowired
	private ClasseService ClassesService;
	@Autowired
	private TeacherService teacherService;
	//강사 마이페이지
	@GetMapping
	public String teacher(@RequestParam String teacherId,Model model ,Classes classes,Member member,HttpServletRequest request,Teacher teacher) {
	
		HttpSession sessionId=request.getSession();	
		member= (Member)sessionId.getAttribute("member");
        teacher= teacherService.teacherId(teacherId);
		model.addAttribute("allclass",ClassesService.getAllClassesList());
//		System.out.println("teachermember:"+member.getMemberId());
//		System.out.println("addmember:"+member.getMemberEmail());
		System.out.println("teachermypagecontroller:"+teacher.getTeacherCategory());
		model.addAttribute("teacher",teacher);
		
		model.addAttribute("member",member);
		
		return "teacher";
	}
	//강사등록하기 c
	@GetMapping("/add")
	public String addteacher(@ModelAttribute("addTeacher") Teacher teacher,Model model,HttpServletRequest request) {
		//세션만들기
		HttpSession sessionId=request.getSession();		
		//세션은 오브젝트 타입이라 (캐스팅)해주고 member에서 받은 sessionId.getAttribute("member");맞춰줘야함
		Member member= (Member)sessionId.getAttribute("member");
		System.out.println("addsessionId:"+member);
		System.out.println("addmemberid:"+member.getMemberId());
//		System.out.println("addmemberpw:"+member.getMemberPassword());	
		model.addAttribute("member", member);
		
		return "addTeacher";
	}
	//강사등록하기 서브밋c
	@PostMapping("/add")
	public String submitaddteacher(@ModelAttribute("addTeacher") Teacher teacher,
//            @RequestParam("teacherLicense") List<MultipartFile> teacherLicenses,
			  @RequestParam("teacherImages") MultipartFile teacherImages,
             Model model,BindingResult bindingResult,HttpServletRequest request)
	{

		List<MultipartFile> teacherLicense = new ArrayList<MultipartFile>();
        List<String> LicenseimageFileName = new ArrayList<String>();
		String save = request.getSession().getServletContext().getRealPath("/resources/images");
		//이미지 경로 =SAVE
		System.out.println("이미지경로:"+save);		
		
		teacherLicense.add(teacher.getTeacherLicense1());
		teacherLicense.add(teacher.getTeacherLicense2());
		teacherLicense.add(teacher.getTeacherLicense3());
		teacherLicense.add(teacher.getTeacherLicense4());
		teacherLicense.add(teacher.getTeacherLicense5());
		
		for(int i=0; i<teacherLicense.size(); i++)
		{
			MultipartFile file = teacherLicense.get(i);
			String saveName = file.getOriginalFilename();			
			LicenseimageFileName.add(saveName);			
			System.out.println("post에서 받아온 saveName 파일이름 : "+saveName);
			
			File saveFile= new File(save, saveName);
			
			if(file !=null && !file.isEmpty())
			{
				try 
				{
					file.transferTo(saveFile);
					teacher.setLicenseImageFileName1(saveName);
					
				} 
				catch (Exception e) 
				{
					throw new RuntimeException("자격증 이미지 업로드가 실패했습니다.", e);
				}
			}
			
		}
		 // 강사 이미지 처리
	    if (teacherImages != null && !teacherImages.isEmpty()) {
	        String teacherImageFileName = teacherImages.getOriginalFilename();
	        File teacherImageFile = new File(save, teacherImageFileName);
	        try {
	        	System.out.println("post에서 받아온 강사이미지 파일이름 : "+teacherImageFileName);
	            teacherImages.transferTo(teacherImageFile);
	            teacher.setTeacherimageFileName(teacherImageFileName);
	        } catch (Exception e) {
	            throw new RuntimeException("강사 이미지 업로드 실패", e);
	        }
	    }
		teacher.setLicenseImageFileName1(LicenseimageFileName.get(0));
		teacher.setLicenseImageFileName2(LicenseimageFileName.get(1));
		teacher.setLicenseImageFileName3(LicenseimageFileName.get(2));
		teacher.setLicenseImageFileName4(LicenseimageFileName.get(3));
		teacher.setLicenseImageFileName5(LicenseimageFileName.get(4));
		
		HttpSession sessionId=request.getSession();
		Member member=(Member)sessionId.getAttribute("member");
		model.addAttribute("member",member);
		sessionId.setAttribute("member", member);
		sessionId.setAttribute("teacher", teacher);
		System.out.println("memberid:"+member.getMemberId());
	//	System.out.println("teacheradd:"+teacher.getTeacherId());
		//에러확인코드 
		//System.out.println(bindingResult.hasErrors());		
		//System.out.println("강사등록서브밋:"+teacher.getTeacherCategory());
		
		teacherService.CreateTeacher(teacher);
		model.addAttribute("teacher",teacher);
		
		return "redirect:/";
	}
	// 강사수정 u
	@GetMapping("/update/teacher")
	public String updateteacher(@ModelAttribute("update") Teacher teacher,@RequestParam String teacherId,Model model, HttpServletRequest reqeust) {
		HttpSession sessionId=reqeust.getSession();
		Member member=(Member)sessionId.getAttribute("member");
		Teacher teacherById=teacherService.teacherId(teacherId);
		model.addAttribute("member",member);
		System.out.println("여기도착 teacherid는?:"+teacher.getTeacherCategory());
		model.addAttribute("teacher",teacherById);
		
		
		return "teacherupdateform";
	}
	@PostMapping("/update/formupdate")
	public String submitupdateteacher(@ModelAttribute("update")Teacher teacher,@RequestParam String teacherId,HttpServletRequest request) {
	System.out.println("submitupdateteacher도착");
	List<MultipartFile> teacherLicense = new ArrayList<MultipartFile>();
    List<String> LicenseimageFileName = new ArrayList<String>();
	String save = request.getSession().getServletContext().getRealPath("/resources/images");
	//이미지 경로 =SAVE
	System.out.println("이미지경로:"+save);		
	
	teacherLicense.add(teacher.getTeacherLicense1());
	teacherLicense.add(teacher.getTeacherLicense2());
	teacherLicense.add(teacher.getTeacherLicense3());
	teacherLicense.add(teacher.getTeacherLicense4());
	teacherLicense.add(teacher.getTeacherLicense5());
	
	for(int i=0; i<teacherLicense.size(); i++)
	{
		MultipartFile file = teacherLicense.get(i);
		String saveName = file.getOriginalFilename();			
		LicenseimageFileName.add(saveName);			
		System.out.println("post에서 받아온 saveName 파일이름 : "+saveName);
		
		File saveFile= new File(save, saveName);
		
		if(file !=null && !file.isEmpty())
		{
			try 
			{
				file.transferTo(saveFile);
				teacher.setLicenseImageFileName1(saveName);
				
			} 
			catch (Exception e) 
			{
				throw new RuntimeException("자격증 이미지 업로드가 실패했습니다.", e);
			}
		}
		
	}
	teacher.setLicenseImageFileName1(LicenseimageFileName.get(0));
	teacher.setLicenseImageFileName2(LicenseimageFileName.get(1));
	teacher.setLicenseImageFileName3(LicenseimageFileName.get(2));
	teacher.setLicenseImageFileName4(LicenseimageFileName.get(3));
	teacher.setLicenseImageFileName5(LicenseimageFileName.get(4));
		teacherService.UpdateTeacher(teacher);
		return "redirect:/teacher";
	}
	@GetMapping("delete")
	public String  deleteteacher (@RequestParam String teacherId,HttpServletRequest request) {
		Teacher teacher = teacherService.deleteTeacher(teacherId);
		HttpSession session = request.getSession();
		session.setAttribute("teacher", teacher);
		return "redirect:/";
	}

}