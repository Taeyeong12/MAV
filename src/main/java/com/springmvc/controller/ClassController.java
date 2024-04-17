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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springmvc.domain.Classes;
import com.springmvc.domain.Member;
import com.springmvc.domain.Teacher;
import com.springmvc.domain.adminImages;
import com.springmvc.repository.ClassesRepository;
import com.springmvc.service.AdminImagesService;
import com.springmvc.service.ClasseService;
import com.springmvc.service.TeacherService;

@Controller
@RequestMapping("/Class")
public class ClassController {
	@Autowired
	private ClasseService ClassesService;
	@Autowired
	private TeacherService teacherService;
	 @Autowired
	 private AdminImagesService adminImagesService;
//	@GetMapping
//	public String teacher(Model model ,Classes classes) {
//		model.addAttribute("allclass",ClassesService.getAllClassesList(classes));
//		return "teacher";
//	}
	
	@ModelAttribute("gradeOptions")
    public Map<String, String> getGradeOptions() 
    {
        Map<String, String> gradeOptions = new HashMap<>();
        gradeOptions.put("중급 (51~100)", "중급 (51~100)");
        gradeOptions.put("고급 (101 이상)", "고급 (101 이상)");
        gradeOptions.put("초급 (0~50)", "초급 (0~50)");
      
        return gradeOptions;
    }

	@GetMapping("/addclass")
	public String addclassform(@ModelAttribute("newclasses")Classes claases, Model model,HttpServletRequest request,Member member,Teacher teacher) {
		HttpSession sessionId=request.getSession();	
		member= (Member)sessionId.getAttribute("member");
		teacher= (Teacher)sessionId.getAttribute("teacher");
		Classes classes = new Classes();
		System.out.println("Getadd:"+teacher.getTeacherId());
		model.addAttribute("classes", classes);
		model.addAttribute("member", member);
		model.addAttribute("teacher",teacher);
		classes.setClassIntroduction("ex)"
		+ "■강의 특이사항\r\n"
        + " 학원 가는 길: 엘리베이터를 이용하여 10층  \r\n"
        + "\r\n"
        + "■주차: 학원수강생 선착순 3대 2시간 무료 \r\n"
        + "-주차 미등록자는 사무실 직원에게 문의 /010-0000-0000)\r\n"
        + "-21시 이후 입차 시 주차비용 발생\r\n"
        + "\r\n"
        + "■무단 출입 금지\r\n"
        + "\r\n"
        + "■수강대상 \r\n"
        + "비전공자 가능 \r\n"
        + "■00강의란 ?\r\n"
        + "간단한 설명 \r\n"
        + "■관련자격증 ?\r\n"
        + "간단한 설명 \r\n" 
        + "■환불 정책 \r\n"
        + "신청 취소 시 환불 기준\r\n"
        + "매치 2일 전   무료 취소\r\n"
        + "매치 1일 전   80% 환급\r\n"
        + "당일 ~ 첫수강 시작 90분 전까지   20% 환급\r\n"
        + "취소 수수료 발생 시 사용된 포인트를 우선 차감 후 차액을 캐시로 지급 합니다.\r\n"
        + "■그 외 취소 기준\r\n");
       

		return "addclass";
	}

    @PostMapping("/addclass") 
    public String createaddclass(@ModelAttribute Classes classes,
          BindingResult bindingResult, 
          Model model,HttpServletRequest request,Teacher teacher)
    { 
    HttpSession sessionId=request.getSession();   
    teacher= (Teacher)sessionId.getAttribute("teacher");
    classes = (Classes) model.getAttribute("classes");
    System.out.println("addteacherId:"+teacher.getTeacherId());
    List<MultipartFile> classImages = new ArrayList<MultipartFile>();
     List<String> classImagesFileName = new ArrayList<String>();
     String save = request.getSession().getServletContext().getRealPath("/resources/images");
     //이미지 경로 =SAVE
     System.out.println("이미지경로:"+save);      
     classImages.add(classes.getClassImages1());
     classImages.add(classes.getClassImages2());
     classImages.add(classes.getClassImages3());
     classImages.add(classes.getClassImages4());
     classImages.add(classes.getClassImages5());
     
     for(int i=0; i<classImages.size(); i++)
     {
        MultipartFile file = classImages.get(i);
        String saveName = file.getOriginalFilename();         
        classImagesFileName.add(saveName);         
        System.out.println("post에서 받아온 saveName 파일이름 : "+saveName);
        
        File saveFile= new File(save, saveName);
        
        if(file !=null && !file.isEmpty())
        {
           try {
                 file.transferTo(saveFile);
                 // 여기에 각 이미지 이름을 store 객체에 설정하는 로직을 추가합니다.
                 switch(i) {
                     case 0: classes.setClassImagesFileName1(saveName); break;
                     case 1: classes.setClassImagesFileName2(saveName); break;
                     case 2: classes.setClassImagesFileName3(saveName); break;
                     case 3: classes.setClassImagesFileName4(saveName); break;
                     case 4: classes.setClassImagesFileName5(saveName); break;
                 }
             } catch (Exception e) {
                 throw new RuntimeException("이미지 업로드가 실패했습니다.", e);
             }
        }
        
     }
     classes.setClassImagesFileName1(classImagesFileName.get(0));
     classes.setClassImagesFileName2(classImagesFileName.get(1));
     classes.setClassImagesFileName3(classImagesFileName.get(2));
     classes.setClassImagesFileName4(classImagesFileName.get(3));
     classes.setClassImagesFileName5(classImagesFileName.get(4));
    
    model.addAttribute("teacher",teacher); 
    model.addAttribute("classes",classes); 
    ClassesService.setNewClasses(classes);
   // return "redirect:/teacher";
    return "redirect:/teacher?teacherId="+teacher.getTeacherId();

    }
//	  @GetMapping("/allclass")
//	  public String readclasses(Model model ,Classes classes) {
//		  System.out.println("allclass 도착");
//		  List<Classes> allclasses=Classesservice.getAllClassesList(classes);
//		  System.out.println("allclasses:"+allclasses);
//		  System.out.println("classgrade:"+classes.getClassGrade());
//		  System.out.println("className:"+classes.getClassName());
//		  model.addAttribute("allclass",allclasses);
//		  return "teacher";
//	  }
    @GetMapping("/updateclass")
    public String updateclass(@RequestParam ("classNum")int classNum, Model model,HttpServletRequest request,Member member,Teacher teacher) {
       HttpSession sessionId=request.getSession();   
       member= (Member)sessionId.getAttribute("member");
         teacher= teacherService.teacherId(member.getMemberId());
       System.out.println("updateclass도착:"+classNum);
       Classes getById=ClassesService.getById(classNum);
       model.addAttribute("classes",getById);
       model.addAttribute("teacher",teacher);
       model.addAttribute("member",member);
//       뷰페이지에  <form:form modelAttribute="classes" 와 매핑
       return "classupdateform";
    }
    @PostMapping("/updateclass")
    public String updateclass2(@ModelAttribute("classes")  Classes classes,Model model,HttpServletRequest request){
       System.out.println("update2도착");
       System.out.println("classname"+classes.getClassName());
       System.out.println("classnum"+classes.getClassNum());
       List<MultipartFile> classImages = new ArrayList<MultipartFile>();
        List<String> classImagesFileName = new ArrayList<String>();
        String save = request.getSession().getServletContext().getRealPath("/resources/images");
        //이미지 경로 =SAVE
        System.out.println("이미지경로:"+save);      
        classImages.add(classes.getClassImages1());
        classImages.add(classes.getClassImages2());
        classImages.add(classes.getClassImages3());
        classImages.add(classes.getClassImages4());
        classImages.add(classes.getClassImages5());
        
        for(int i=0; i<classImages.size(); i++)
        {
           MultipartFile file = classImages.get(i);
           String saveName = file.getOriginalFilename();         
           classImagesFileName.add(saveName);         
           System.out.println("post에서 받아온 saveName 파일이름 : "+saveName);
           
           File saveFile= new File(save, saveName);
           
            if(file !=null && !file.isEmpty()) {
                   try {
                       file.transferTo(saveFile);
                       // 여기에 각 이미지 이름을 store 객체에 설정하는 로직을 추가합니다.
                       switch(i) {
                           case 0: classes.setClassImagesFileName1(saveName); break;
                           case 1: classes.setClassImagesFileName2(saveName); break;
                           case 2: classes.setClassImagesFileName3(saveName); break;
                           case 3: classes.setClassImagesFileName4(saveName); break;
                           case 4: classes.setClassImagesFileName5(saveName); break;
                       }
                   } catch (Exception e) {
                       throw new RuntimeException("이미지 업로드가 실패했습니다.", e);
                   }
               }
           
        }
        classes.setClassImagesFileName1(classImagesFileName.get(0));
        classes.setClassImagesFileName2(classImagesFileName.get(1));
        classes.setClassImagesFileName3(classImagesFileName.get(2));
        classes.setClassImagesFileName4(classImagesFileName.get(3));
        classes.setClassImagesFileName5(classImagesFileName.get(4));   

       ClassesService.setUpdateClasses(classes);
      
       return "redirect:/teacher";
    }

	//삭제하기
	  @GetMapping("/deleteclass")
	  public String deleteclass(Model model,@RequestParam("classNum")int classNum) {
		  ClassesService.setdeleteClasses(classNum);
		  return "redirect:/teacher";
	  }
	   //상세정보뿌려주기
	     @GetMapping("/detailclass")
	     public String detailclass(@RequestParam("classNum") int classNum, Model model,HttpServletRequest request,Member member) {
	        HttpSession sessionId=request.getSession(); 
	        
	        Classes classes = ClassesService.getById(classNum);
	        member= (Member)sessionId.getAttribute("member");
	        model.addAttribute("detailclass",ClassesService.getById(classNum));
	        model.addAttribute("classes",classes);
	        model.addAttribute("member",member);
	        System.out.println("cs.getby:"+ClassesService.getById(classNum));
	        return "detailclass";
	     }
	  //read classList
	  @GetMapping("/classlist")
	  public String ClassList( Model model,HttpServletRequest request,Member member,Teacher teacher, Classes classes) {
		  HttpSession sessionId=request.getSession();	
		  member= (Member)sessionId.getAttribute("member");
		  teacher= teacherService.teacherId(member.getMemberId());
		  adminImages images = adminImagesService.getAllImages();
		  List<Classes> classesall=(List<Classes>)ClassesService.getAllClassesList();
		  model.addAttribute("classes",classesall);
		  model.addAttribute("member", member);
		  model.addAttribute("teacher", teacher);
		  model.addAttribute("adminImages", images);

		  System.out.println("classlist도착 member는:"+member.getMemberId());
		  System.out.println("classes:"+classesall);
		  return "classlist";
	  }
	  @GetMapping("/addmember")
	  public String addclassmember(@ModelAttribute("detailclass") Classes classes, HttpServletRequest request,Model model) {
	        HttpSession sessionId = request.getSession();	
	        Member member = (Member)sessionId.getAttribute("member");
	        String memberlistname =member.getMemberName();
	        
	        classes = ClassesService.getById(classes.getClassNum());
	        List<Member> memberlist=new ArrayList<Member>();
	        if (classes != null && member != null) 
	        {
	        	 memberlist.add(member);	           
	        }
	        
	        System.out.println("classes 에 담긴 클래스 넘버 : "+classes.getClassNum());
	        System.out.println("member:"+memberlist);
	        model.addAttribute("memberlist",memberlist);
	        model.addAttribute("detailclass",classes);
	        return "detailclass";
	    }

	     
}
