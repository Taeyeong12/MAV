package com.springmvc.domain;

import java.time.LocalDate;
import java.time.LocalTime;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

public class Room 
{
	private int roomNum; // 경기장 번호    
    private String storeId; // 상점 ID
	private String roomName; // 경기장 이름
    private int roomCapacity; // 경기장 수용인원   
    private int roomCount; // 경기장 참가인원
    private String roomCategory; // 경기 종류(종목)
    private String roomDetail; // 경기장 소개글
    private Double latitude;
    private Double longitude;
    private Store store;



	@NotNull(message = "경기 날짜를 입력해주세요")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate roomDate; // 경기 날짜

    @NotNull(message = "경기 시간을 입력해주세요")
    @DateTimeFormat(pattern = "HH:mm")
    private LocalTime roomTime; // 경기 시간
    
   //상태에 따라 값을 다르게 해서 뷰페이지 보이는것 조절
    private int matched;
    

	public int getMatched() {
		return matched;
	}


	public void setMatched(int matched) {
		this.matched = matched;
	}


	public Room() {

      this.roomCapacity = 1;
      this.matched = 0;
	}
	
	

   
   public String getStoreId() {
      return storeId;
   }

   public void setStoreId(String storeId) {
      this.storeId = storeId;
   }
   
   public int getRoomNum() {
      return roomNum;
   }

   public void setRoomNum(int roomNum) {
      this.roomNum = roomNum;
   }

   public String getRoomName() {
      return roomName;
   }

   public void setRoomName(String roomName) {
      this.roomName = roomName;
   }

   public int getRoomCapacity() {
      return roomCapacity;
   }

   public void setRoomCapacity(int roomCapacity) {
      this.roomCapacity = roomCapacity;
   }

   public int getRoomCount() {
      return roomCount;
   }

   public void setRoomCount(int roomCount) {
      this.roomCount = roomCount;
   }

   public String getRoomCategory() {
      return roomCategory;
   }

   public void setRoomCategory(String roomCategory) {
      this.roomCategory = roomCategory;
   }

   public String getRoomDetail() {
      return roomDetail;
   }

   public void setRoomDetail(String roomDetail) {
      this.roomDetail = roomDetail;
   }

   public LocalDate getRoomDate() {
      return roomDate;
   }

   public void setRoomDate(LocalDate roomDate) {
      this.roomDate = roomDate;
   }

   public LocalTime getRoomTime() {
      return roomTime;
   }

   public void setRoomTime(LocalTime roomTime) {
      this.roomTime = roomTime;
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
	
    public Store getStore() {
		return store;
	}


	public void setStore(Store store) {
		this.store = store;
	}
} 
