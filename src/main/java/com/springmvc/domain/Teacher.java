package com.springmvc.domain;

import org.springframework.web.multipart.MultipartFile;

public class Teacher 
{
   private String teacherId; // 강사 아이디
   private MultipartFile teacherImages; // 강사 이미지
   private String teacherimageFileName;  //이미지 파일이름
   private String teacherCategory; // 강사 종류
   private String teacherRecode; // 강사 이력
   private MultipartFile teacherLicense1; // 강사 자격증1
   private MultipartFile teacherLicense2; // 강사 자격증2
   private MultipartFile teacherLicense3; // 강사 자격증3
   private MultipartFile teacherLicense4; // 강사 자격증4
   private MultipartFile teacherLicense5; // 강사 자격증5
   private String licenseImageFileName1; //  자격증이미지 파일이름1
   private String licenseImageFileName2; //  자격증이미지 파일이름2
   private String licenseImageFileName3; //  자격증이미지 파일이름3
   private String licenseImageFileName4; //  자격증이미지 파일이름4
   private String licenseImageFileName5; //  자격증이미지 파일이름5
   private String teacherInfomation; // 강사 소개 
   private boolean teacherApprove; // 강사 승인 신청

   
   
   
   public Teacher() {
	super();	
   }




public String getTeacherId() {
	return teacherId;
}




public void setTeacherId(String teacherId) {
	this.teacherId = teacherId;
}




public MultipartFile getTeacherImages() {
	return teacherImages;
}




public void setTeacherImages(MultipartFile teacherImages) {
	this.teacherImages = teacherImages;
}




public String getTeacherimageFileName() {
	return teacherimageFileName;
}




public void setTeacherimageFileName(String teacherimageFileName) {
	this.teacherimageFileName = teacherimageFileName;
}




public String getTeacherCategory() {
	return teacherCategory;
}




public void setTeacherCategory(String teacherCategory) {
	this.teacherCategory = teacherCategory;
}




public String getTeacherRecode() {
	return teacherRecode;
}




public void setTeacherRecode(String teacherRecode) {
	this.teacherRecode = teacherRecode;
}




public MultipartFile getTeacherLicense1() {
	return teacherLicense1;
}




public void setTeacherLicense1(MultipartFile teacherLicense1) {
	this.teacherLicense1 = teacherLicense1;
}




public MultipartFile getTeacherLicense2() {
	return teacherLicense2;
}




public void setTeacherLicense2(MultipartFile teacherLicense2) {
	this.teacherLicense2 = teacherLicense2;
}




public MultipartFile getTeacherLicense3() {
	return teacherLicense3;
}




public void setTeacherLicense3(MultipartFile teacherLicense3) {
	this.teacherLicense3 = teacherLicense3;
}




public MultipartFile getTeacherLicense4() {
	return teacherLicense4;
}




public void setTeacherLicense4(MultipartFile teacherLicense4) {
	this.teacherLicense4 = teacherLicense4;
}




public MultipartFile getTeacherLicense5() {
	return teacherLicense5;
}




public void setTeacherLicense5(MultipartFile teacherLicense5) {
	this.teacherLicense5 = teacherLicense5;
}




public String getLicenseImageFileName1() {
	return licenseImageFileName1;
}




public void setLicenseImageFileName1(String licenseImageFileName1) {
	this.licenseImageFileName1 = licenseImageFileName1;
}




public String getLicenseImageFileName2() {
	return licenseImageFileName2;
}




public void setLicenseImageFileName2(String licenseImageFileName2) {
	this.licenseImageFileName2 = licenseImageFileName2;
}




public String getLicenseImageFileName3() {
	return licenseImageFileName3;
}




public void setLicenseImageFileName3(String licenseImageFileName3) {
	this.licenseImageFileName3 = licenseImageFileName3;
}




public String getLicenseImageFileName4() {
	return licenseImageFileName4;
}




public void setLicenseImageFileName4(String licenseImageFileName4) {
	this.licenseImageFileName4 = licenseImageFileName4;
}




public String getLicenseImageFileName5() {
	return licenseImageFileName5;
}




public void setLicenseImageFileName5(String licenseImageFileName5) {
	this.licenseImageFileName5 = licenseImageFileName5;
}




public String getTeacherInfomation() {
	return teacherInfomation;
}




public void setTeacherInfomation(String teacherInfomation) {
	this.teacherInfomation = teacherInfomation;
}




public boolean isTeacherApprove() {
	return teacherApprove;
}




public void setTeacherApprove(boolean teacherApprove) {
	this.teacherApprove = teacherApprove;
}



}