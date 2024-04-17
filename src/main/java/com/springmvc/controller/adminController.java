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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.springmvc.domain.Classes;
import com.springmvc.domain.Member;
import com.springmvc.domain.Store;
import com.springmvc.domain.Teacher;
import com.springmvc.domain.adminImages;
import com.springmvc.service.AdminImagesService;
import com.springmvc.service.ClasseService;
import com.springmvc.service.StoreService;
import com.springmvc.service.TeacherService;

@Controller
@RequestMapping("/admin")
public class adminController 
{

	@Autowired
	private TeacherService teacherService;
	@Autowired
	private StoreService storeService;
	@Autowired
	private ClasseService classesService;
	@Autowired
	private AdminImagesService adminImagesService;
	
	@GetMapping("/adminpage")
	public String adminPage(Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		Teacher teacher = (Teacher) session.getAttribute("teacher");
		Store store = (Store) session.getAttribute("store");
		List<Teacher> allTeacher = teacherService.AllTeacher();
		List<Store> allStore = storeService.getAllStore();
		List<Classes> allClasses = classesService.getAllClassesList();		
		model.addAttribute("member", member);
		model.addAttribute("store", store);
		model.addAttribute("teacher",teacher);
		model.addAttribute("teachers", allTeacher);
		model.addAttribute("allstore", allStore);
		model.addAttribute("allclasses", allClasses);
		
		return "adminpage";
	}
	
	@GetMapping("/approveTeacher")
	public String approveTeacher(@RequestParam ("teacherId") String teacherId)
	{
		teacherService.setApproveTeacher(teacherId);
		return "redirect:/admin/adminpage";
	}
	
	@GetMapping("/approveClasses")
	public String approveClasses(@RequestParam ("classNum") int classNum)
	{
		classesService.setApproveClasses(classNum);
		return "redirect:/admin/adminpage";
	}
	@GetMapping("/approveStore")
	public String approveStore(@RequestParam ("storeId") String storeId)
	{
		storeService.setApproveStore(storeId);
		return "redirect:/admin/adminpage";
	}
	@GetMapping("/adminImages")
	public String addImagepage(@ModelAttribute ("adminImages") adminImages adminImages,Model model,HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		Store store = (Store) session.getAttribute("store");
		Teacher teacher = (Teacher) session.getAttribute("teacher");		
		
		model.addAttribute("adminImages", adminImages);
		return "addImagepage";		
	}
	
	@PostMapping("/adminImages")
    public String adminImageUpload(@ModelAttribute("adminImages") adminImages adminImages,HttpServletRequest request) {

		 HttpSession session = request.getSession();
		 
		 List<MultipartFile> adminImage = new ArrayList<MultipartFile>();
	     List<String> adminImagesFileName = new ArrayList<String>();
	     
	     String save = request.getSession().getServletContext().getRealPath("/resources/images");
	     
	     adminImage.add(adminImages.getClublistImage());
	     adminImage.add(adminImages.getClasslistImage());
	     adminImage.add(adminImages.getMainslideImage1());
	     adminImage.add(adminImages.getMainslideImage2());
	     adminImage.add(adminImages.getMainslideImage3());
	     
	     for(int i = 0; i<adminImage.size(); i++)
	     {
	    	 MultipartFile file = adminImage.get(i);
	    	 String saveName = file.getOriginalFilename();			
	    	 adminImagesFileName.add(saveName);
	    	 
	    	 File saveFile= new File(save, saveName);
	    	 
	    	 if(file !=null && !file.isEmpty())
				{
					try 
					{
						file.transferTo(saveFile);
						adminImages.setClublistImageName(saveName);
						adminImages.setClasslistImageName(saveName);
						adminImages.setMainslideImageName1(saveName);
						adminImages.setMainslideImageName2(saveName);
						adminImages.setMainslideImageName3(saveName);
						
					} 
					catch (Exception e) 
					{
						throw new RuntimeException("관리자 이미지 업로드가 실패했습니다.", e);
					}
					
				}
	     }
      
     	adminImages.setClublistImageName(adminImagesFileName.get(0));
		adminImages.setClasslistImageName(adminImagesFileName.get(1));
		adminImages.setMainslideImageName1(adminImagesFileName.get(2));
		adminImages.setMainslideImageName2(adminImagesFileName.get(3));
		adminImages.setMainslideImageName3(adminImagesFileName.get(4));
		
	
		adminImagesService.addImages(adminImages);
		
		
		session.setAttribute("adminImages", adminImages);
			
        return "redirect:/admin/adminpage";
    }
	
	@GetMapping("/Imagesupdate")
	public String updateImages(@ModelAttribute ("adminImages") adminImages adminImages,Model model)
	{
		model.addAttribute("adminImages", adminImages);
		return "adminImagesupdate";
	}
	
	@PostMapping("/Imagesupdate")
	public String updateImages(@ModelAttribute("adminImages") adminImages adminImages,HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		 
		 List<MultipartFile> adminImage = new ArrayList<MultipartFile>();
	     List<String> adminImagesFileName = new ArrayList<String>();
	     
	     String save = request.getSession().getServletContext().getRealPath("/resources/images");
	     
	     adminImage.add(adminImages.getClublistImage());
	     adminImage.add(adminImages.getClasslistImage());
	     adminImage.add(adminImages.getMainslideImage1());
	     adminImage.add(adminImages.getMainslideImage2());
	     adminImage.add(adminImages.getMainslideImage3());
	     
	     for(int i = 0; i<adminImage.size(); i++)
	     {
	    	 MultipartFile file = adminImage.get(i);
	    	 String saveName = file.getOriginalFilename();			
	    	 adminImagesFileName.add(saveName);
	    	 
	    	 File saveFile= new File(save, saveName);
	    	 
	    	 if(file !=null && !file.isEmpty())
				{
					try 
					{
						file.transferTo(saveFile);
						adminImages.setClublistImageName(saveName);
						adminImages.setClasslistImageName(saveName);
						adminImages.setMainslideImageName1(saveName);
						adminImages.setMainslideImageName2(saveName);
						adminImages.setMainslideImageName3(saveName);
						
					} 
					catch (Exception e) 
					{
						throw new RuntimeException("관리자 이미지 업로드가 실패했습니다.", e);
					}
					
				}
	     }
     
    	adminImages.setClublistImageName(adminImagesFileName.get(0));
		adminImages.setClasslistImageName(adminImagesFileName.get(1));
		adminImages.setMainslideImageName1(adminImagesFileName.get(2));
		adminImages.setMainslideImageName2(adminImagesFileName.get(3));
		adminImages.setMainslideImageName3(adminImagesFileName.get(4));
		
	
		adminImagesService.updateImages(adminImages);
		
		
		session.setAttribute("adminImages", adminImages);
		return "redirect:/admin/adminpage";
	}

}
