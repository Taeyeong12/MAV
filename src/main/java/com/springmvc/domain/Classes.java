package com.springmvc.domain;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;
import com.springmvc.domain.*;

public class Classes
{	

	private int classNum; // 클래스 번호
	private String classId; // 클래스 아이디
	private String className; // 클래스 이름
	@DateTimeFormat(pattern="HH:mm")
	private String classLecturetime; // 강의 시간
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate classLecturedate; // 강의 날짜
	private int classNumberOfStudents; // 강의 수강 인원
	private String classCourseContents; // 강의 수강 내용
	private String classGrade; // 강의 등급
	private String classIntroduction; // 강의 소개글
	private String classImagesFileName1;
	private String classImagesFileName2;
	private String classImagesFileName3;
	private String classImagesFileName4;
	private String classImagesFileName5;	
	private MultipartFile classImages1; // 강의 이미지(경로)dto한개 생성
	private MultipartFile classImages2; // 강의 이미지(경로)dto한개 생성
	private MultipartFile classImages3; // 강의 이미지(경로)dto한개 생성
	private MultipartFile classImages4; // 강의 이미지(경로)dto한개 생성
	private MultipartFile classImages5; // 강의 이미지(경로)dto한개 생성
	private String classLocale; // 강의 주소
	private boolean classApprove; // 강의 신청 승인

	private Member classmember; // 강의신청하기 눌렷을떄 
	
	
	public Classes() {
		super();
		
	}
	public Classes(String className) {
		super();
		this.className = className;
		
	}

	public int getClassNum() {
		return classNum;
	}
	public void setClassNum(int classNum) {
		this.classNum = classNum;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public boolean isClassApprove() {
		return classApprove;
	}
	public void setClassApprove(boolean classApprove) {
		this.classApprove = classApprove;
	}
	
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public String getClassLecturetime() {
		return classLecturetime;
	}
	public void setClassLecturetime(String classLecturetime) {
		this.classLecturetime = classLecturetime;
	}
	public LocalDate getClassLecturedate() {
		return classLecturedate;
	}
	public void setClassLecturedate(LocalDate classLecturedate) {
		this.classLecturedate = classLecturedate;
	}
	public int getClassNumberOfStudents() {
		return classNumberOfStudents;
	}
	public void setClassNumberOfStudents(int classNumberOfStudents) {
		this.classNumberOfStudents = classNumberOfStudents;
	}
	public String getClassCourseContents() {
		return classCourseContents;
	}
	public void setClassCourseContents(String classCourseContents) {
		this.classCourseContents = classCourseContents;
	}
	public String getClassGrade() {
		return classGrade;
	}
	public void setClassGrade(String classGrade) {
		this.classGrade = classGrade;
	}
	public String getClassIntroduction() {
		return classIntroduction;
	}
	public void setClassIntroduction(String classIntroduction) {
		this.classIntroduction = classIntroduction;
	}
	public String getClassLocale() {
		return classLocale;
	}
	public void setClassLocale(String classLocale) {
		this.classLocale = classLocale;
	}

	public Member getClassmember() {
		return classmember;
	}
	public void setClassmember(Member classmember) {
		this.classmember = classmember;
	}
	public String getClassImagesFileName1() {
		return classImagesFileName1;
	}
	public void setClassImagesFileName1(String classImagesFileName1) {
		this.classImagesFileName1 = classImagesFileName1;
	}
	public String getClassImagesFileName2() {
		return classImagesFileName2;
	}
	public void setClassImagesFileName2(String classImagesFileName2) {
		this.classImagesFileName2 = classImagesFileName2;
	}
	public String getClassImagesFileName3() {
		return classImagesFileName3;
	}
	public void setClassImagesFileName3(String classImagesFileName3) {
		this.classImagesFileName3 = classImagesFileName3;
	}
	public String getClassImagesFileName4() {
		return classImagesFileName4;
	}
	public void setClassImagesFileName4(String classImagesFileName4) {
		this.classImagesFileName4 = classImagesFileName4;
	}
	public String getClassImagesFileName5() {
		return classImagesFileName5;
	}
	public void setClassImagesFileName5(String classImagesFileName5) {
		this.classImagesFileName5 = classImagesFileName5;
	}
	public MultipartFile getClassImages1() {
		return classImages1;
	}
	public void setClassImages1(MultipartFile classImages1) {
		this.classImages1 = classImages1;
	}
	public MultipartFile getClassImages2() {
		return classImages2;
	}
	public void setClassImages2(MultipartFile classImages2) {
		this.classImages2 = classImages2;
	}
	public MultipartFile getClassImages3() {
		return classImages3;
	}
	public void setClassImages3(MultipartFile classImages3) {
		this.classImages3 = classImages3;
	}
	public MultipartFile getClassImages4() {
		return classImages4;
	}
	public void setClassImages4(MultipartFile classImages4) {
		this.classImages4 = classImages4;
	}
	public MultipartFile getClassImages5() {
		return classImages5;
	}
	public void setClassImages5(MultipartFile classImages5) {
		this.classImages5 = classImages5;
	}
	
	
	
}