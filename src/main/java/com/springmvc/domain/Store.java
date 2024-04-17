package com.springmvc.domain;

import org.springframework.web.multipart.MultipartFile;

public class Store 
{
   private String storeId; // 업체 ID
   private String storeName; // 업체명
   private String storeAddr; // 업체 주소
   private String storeCategory; // 업체 종목
   private String storeCode; // 업체 사업자등록번호
   private String storePhone01; // 업체 전화번호 첫번째 
   private String storePhone02; // 업체 전화번호 두번째
   private String storePhone03; // 업체 전화번호 세번째
   private String storeImageName1; // 이미지 경로저장 
   private String storeImageName2; // 이미지 경로저장
   private String storeImageName3; // 이미지 경로저장
   private String storeImageName4; // 이미지 경로저장
   private String storeImageName5; // 이미지 경로저장
   private String storeInfomation; // 업체 소개글
   private String storeNotice; // 업체 공지사항
   private boolean storeApprove; // 업체 승인 신청
   private MultipartFile storeImage1; // 업체 이미지
   private MultipartFile storeImage2; // 업체 이미지
   private MultipartFile storeImage3; // 업체 이미지
   private MultipartFile storeImage4; // 업체 이미지
   private MultipartFile storeImage5; // 업체 이미지
   private Double latitude;
   private Double longitude;
   public String getStoreId() {
      return storeId;
   }
   public void setStoreId(String storeId) {
      this.storeId = storeId;
   }
   public String getStoreName() {
      return storeName;
   }
   public void setStoreName(String storeName) {
      this.storeName = storeName;
   }
   public String getStoreAddr() {
      return storeAddr;
   }
   public void setStoreAddr(String storeAddr) {
      this.storeAddr = storeAddr;
   }
   public String getStoreCategory() {
      return storeCategory;
   }
   public void setStoreCategory(String storeCategory) {
      this.storeCategory = storeCategory;
   }
   public String getStoreCode() {
      return storeCode;
   }
   public void setStoreCode(String storeCode) {
      this.storeCode = storeCode;
   }
   public String getStorePhone01() {
      return storePhone01;
   }
   public void setStorePhone01(String storePhone01) {
      this.storePhone01 = storePhone01;
   }
   public String getStorePhone02() {
      return storePhone02;
   }
   public void setStorePhone02(String storePhone02) {
      this.storePhone02 = storePhone02;
   }
   public String getStorePhone03() {
      return storePhone03;
   }
   public void setStorePhone03(String storePhone03) {
      this.storePhone03 = storePhone03;
   }
   public String getStoreImageName1() {
      return storeImageName1;
   }
   public void setStoreImageName1(String storeImageName1) {
      this.storeImageName1 = storeImageName1;
   }
   public String getStoreImageName2() {
      return storeImageName2;
   }
   public void setStoreImageName2(String storeImageName2) {
      this.storeImageName2 = storeImageName2;
   }
   public String getStoreImageName3() {
      return storeImageName3;
   }
   public void setStoreImageName3(String storeImageName3) {
      this.storeImageName3 = storeImageName3;
   }
   public String getStoreImageName4() {
      return storeImageName4;
   }
   public void setStoreImageName4(String storeImageName4) {
      this.storeImageName4 = storeImageName4;
   }
   public String getStoreImageName5() {
      return storeImageName5;
   }
   public void setStoreImageName5(String storeImageName5) {
      this.storeImageName5 = storeImageName5;
   }
   public String getStoreInfomation() {
      return storeInfomation;
   }
   public void setStoreInfomation(String storeInfomation) {
      this.storeInfomation = storeInfomation;
   }
   public String getStoreNotice() {
      return storeNotice;
   }
   public void setStoreNotice(String storeNotice) {
      this.storeNotice = storeNotice;
   }
   public boolean isStoreApprove() {
      return storeApprove;
   }
   public void setStoreApprove(boolean storeApprove) {
      this.storeApprove = storeApprove;
   }
   public MultipartFile getStoreImage1() {
      return storeImage1;
   }
   public void setStoreImage1(MultipartFile storeImage1) {
      this.storeImage1 = storeImage1;
   }
   public MultipartFile getStoreImage2() {
      return storeImage2;
   }
   public void setStoreImage2(MultipartFile storeImage2) {
      this.storeImage2 = storeImage2;
   }
   public MultipartFile getStoreImage3() {
      return storeImage3;
   }
   public void setStoreImage3(MultipartFile storeImage3) {
      this.storeImage3 = storeImage3;
   }
   public MultipartFile getStoreImage4() {
      return storeImage4;
   }
   public void setStoreImage4(MultipartFile storeImage4) {
      this.storeImage4 = storeImage4;
   }
   public MultipartFile getStoreImage5() {
      return storeImage5;
   }
   public void setStoreImage5(MultipartFile storeImage5) {
      this.storeImage5 = storeImage5;
   }
   public Double getLatitude() {
      return latitude;
   }
   public void setLatitude(Double latitude) {
      this.latitude = latitude;
   }
   public Double getLongitude() {
      return longitude;
   }
   public void setLongitude(Double longitude) {
      this.longitude = longitude;
   }   
    
}