package com.springmvc.domain;

public class Match 
{
    private int matchNum; // 매칭 번호
    private String matchTitle; //매칭방 제목
    private int roomNum; // 방 번호
    private String creatorId;
    private String applicantId;
    private String matchStatus; // 매칭 상태
    private Room room;
    private String matchResult; // 매칭 결과
    
    
    //디비연결 x    
    private String selectedClub;

    
    public String getSelectedClub() {
		return selectedClub;
	}

	public void setSelectedClub(String selectedClub) {
		this.selectedClub = selectedClub;
	}

	public String getCreatorId() {
		return creatorId;
	}

	public void setCreatorId(String creatorId) {
		this.creatorId = creatorId;
	}

	public String getApplicantId() {
		return applicantId;
	}

	public void setApplicantId(String applicantId) {
		this.applicantId = applicantId;
	}

	
        
    public String getMatchTitle() {
		return matchTitle;
	}

	public void setMatchTitle(String matchTitle) {
		this.matchTitle = matchTitle;
	}
	
   public int getMatchNum() {
      return matchNum;
   }

   public void setMatchNum(int matchNum) {
      this.matchNum = matchNum;
   }

   public int getRoomNum() {
      return roomNum;
   }

   public void setRoomNum(int roomNum) {
      this.roomNum = roomNum;
   }

   public String getMatchStatus() {
      return matchStatus;
   }

   public void setMatchStatus(String matchStatus) {
      this.matchStatus = matchStatus;
   }

   public String getMatchResult() {
      return matchResult;
   }

   public void setMatchResult(String matchResult) {
      this.matchResult = matchResult;
   }

   public Room getRoom() {
      return room;
   }

   public void setRoom(Room room) {
      this.room = room;
   }
    
    
      
}
