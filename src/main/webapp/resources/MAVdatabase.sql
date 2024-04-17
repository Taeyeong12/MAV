create database MAV;

use MAV;

-- -----------------------------대경 🎇
create table Member
(
    memberId varchar(15) primary key, -- 회원 아이디
    memberName varchar(10) not null, -- 멤버 이름
    memberPassword varchar(20) not null,   -- 회원 비밀번호
    memberBirth date not null, -- 회원 생년월일
    memberAddr varchar(100) not null, -- 회원 주소
    memberPhone01 varchar(3) not null, -- 회원 전화번호01
    memberPhone02 varchar(4) not null, -- 회원 전화번호02
    memberPhone03 varchar(4) not null, -- 회원 전화번호03
    memberGender varchar(2) not null, -- 회원 성별
    memberEmail varchar(30) not null, -- 회원 이메일
    adminApprove boolean default false
);

update member set adminApprove = true where memberId="rkdtlsrl55";

create table Club
(
    clubNum int auto_increment primary key, -- 동호회 번호
    clubName varchar(30) not null unique, -- 동호회 이름
    clubMaster varchar(15) not null, -- 동호회장 아이디
    clubCategory varchar(5) not null, -- 동호회 종류
    clubLocale varchar(5) not null, -- 동호회 지역
    clubPoint int default 0, -- 동호회 포인트
    imageFileName1 text, -- 동호회 이미지1
    imageFileName2 text, -- 동호회 이미지2
    imageFileName3 text, -- 동호회 이미지3
    imageFileName4 text, -- 동호회 이미지4
    imageFileName5 text, -- 동호회 이미지 5   
    clubInfo text -- 동호회 소개글
);


create table ClubBoard
(
    boardNum int auto_increment primary key, -- 동호회 게시판 글번호
    boardId varchar(15) not null,
    boardTitle varchar(20) not null, -- 동호회 게시판 글제목
    boardDetail text not null, -- 동호회 게시판 글내용
    boardViews int not null, -- 동호회 게시판 글 조회수
    foreign key(boardId) references Member(memberId)
);

create table ClubMember
(
   clubName varchar(20) , -- 동호회 이름
   c_memberId varchar(15) , -- 동호회원 아이디
    clubGrade varchar(5) default "준회원", -- 동호회 등급
    clubApprove boolean default false -- 동호회 가입신청
);
delete from club where clubName="변수와함수";
create table AdminImages
(
	clublistImage text,
    classlistImage text,
    mainslideImage1 text,
    mainslideImage2 text,
    mainslideImage3 text
);
-- ----------------------------------------------------------

-- 태영 ------------------------------------------------------
create table Store
(
    storeId varchar(15) primary key, -- 업체 아이디
    storeName varchar(20) unique not null, -- 업체 이름
    storeAddr varchar(100) not null, -- 업체 주소
    storeCategory varchar(50) not null, -- 업체 종목(종류)
    storePhone01 varchar(3) not null, -- 업체 전화번호01
    storePhone02 varchar(4) not null, -- 업체 전화번호02
    storePhone03 varchar(4) not null, -- 업체 전화번호03
    storeImageName1 text, -- 강의 이미지
    storeImageName2 text, -- 강의 이미지
    storeImageName3 text, -- 강의 이미지
    storeImageName4 text, -- 강의 이미지
    storeImageName5 text, -- 강의 이미지
    storeInfomation text, -- 소개글
    storeNotice text, -- 공지사항
    storeCode varchar(15) not null, -- 업체 사업자등록번호
    storeApprove boolean default false, -- 강사 승인
	latitude DECIMAL(10, 8), -- 위도
    longitude DECIMAL(11, 8), -- 경도

    foreign key(storeId) references Member(memberId)
);

CREATE TABLE Room (
    roomNum INT AUTO_INCREMENT PRIMARY KEY, -- 경기장 번호
    storeId varchar(15) NOT NULL, -- 업체 ID
    roomName varchar(20) NOT NULL, -- 경기장 이름
    roomCapacity int NOT NULL, -- 경기장 수용인원
    roomCount int NOT NULL, -- 경기장 참가인원
    roomCategory varchar(10) NOT NULL, -- 경기 종류(종목)
    roomDetail text, -- 경기장 소개글
    roomDate date NOT NULL, -- 경기 날짜
    roomTime time NOT NULL, -- 경기 시간
    Matched int default 0,
    FOREIGN KEY(storeId) REFERENCES Store(storeId) on delete cascade on update cascade
);

CREATE TABLE Matching (
    matchNum INT PRIMARY KEY AUTO_INCREMENT,
    matchTitle  varchar(30)  NOT NULL,
    roomNum int,
    creatorId varchar(15),
    applicantId varchar(15),
    matchStatus VARCHAR(255), -- 매칭 상태 (예: 신청, 성공)
    matchResult VARCHAR(255), -- 매칭 결과 (예: 유저1 승리, 유저2 패배, 무)
    FOREIGN KEY (roomNum) REFERENCES Room(roomNum) on delete cascade on update cascade,
    FOREIGN KEY (creatorId) REFERENCES Club(clubName),
    FOREIGN KEY (applicantId) REFERENCES Club(clubName)
);



create table Notice
(
    noticeNum int auto_increment primary key, -- 공지사항 게시판 글 번호
    noticeWriter varchar(15) not null,
    noticeTitle varchar(50) not null, -- 공지사항 게시판 글제목
    noticeContents text, -- 공지사항 게시판 글내용
    noticeHits int, -- 공지사항 조회수
    noticeDate Date,
   foreign key(noticeWriter) references Member(memberId) on delete cascade
);

CREATE TABLE Tournament
(
tournamentNum INT AUTO_INCREMENT PRIMARY KEY, -- 토너먼트 번호
storeId VARCHAR(15) NOT NULL,
tournamentReward INT, -- 토너먼트 상금
tournamentPrice INT, -- 토너먼트 참가비
tournamentDate DATE NOT NULL, -- 토너먼트 날짜
tournamentTime TIME NOT NULL, -- 토너먼트 시간
FOREIGN KEY(storeId) REFERENCES Store(storeId)
);

CREATE TABLE TournamentPt (
participantNum  INT AUTO_INCREMENT PRIMARY KEY, -- 참가자번호
tournamentNum INT, -- 참가한 토너먼트 번호
clubName varchar(10), -- 참가자의 클럽이름
participantStatus VARCHAR(20), -- 참가 상태 (예: '신청중', '참가확정', '탈락' 등)
FOREIGN KEY (tournamentNum) REFERENCES Tournament(tournamentNum),
FOREIGN KEY (clubName) REFERENCES Club(clubName)
);

CREATE TABLE TournamentMatch (
matchId INT AUTO_INCREMENT PRIMARY KEY, -- 경기 ID
tournamentNum INT, -- 토너먼트 번호
round INT, -- 라운드 번호
clubName1 varchar(10), -- 참가자의 클럽이름 1
clubName2 varchar(10), -- 참가자의 클럽이름 2
winnerClubNum INT, -- 승리한 클럽
FOREIGN KEY (tournamentNum) REFERENCES Tournament(tournamentNum),
FOREIGN KEY (clubName1 ) REFERENCES Club(clubName),
FOREIGN KEY (clubName2 ) REFERENCES Club(clubName),
FOREIGN KEY (winnerClubNum) REFERENCES Club(clubNum)
); 

-- -------------------------------------

-- 민수
create table Teacher
(
    teacherId varchar(15) primary key, -- 강사 아이디
    teacherimageFileName text , -- 강사 이미지
    teacherCategory varchar(10), -- 강사 종류(종목)
    teacherRecode varchar(10), -- 강사 경력
    LicenseimageFileName1 text , -- 강사 자격증1
    LicenseimageFileName2 text , -- 강사 자격증2
   LicenseimageFileName3 text , -- 강사 자격증3
      LicenseimageFileName4 text , -- 강사 자격증4 
      LicenseimageFileName5 text , -- 강사 자격증5
    teacherInfomation text, -- 강사 소개글
    teacherApprove boolean default false, -- 강사 승인
    foreign key(teacherId) references Member(memberId)
);

create table Classes
(
    classNum int auto_increment primary key, -- 강의 번호
    classId varchar(15) not null, -- 강사아이디
    className varchar(15) not null unique, -- 강의 이름
    classLectureDate date not null, -- 강의 날짜
    classLectureTime time not null, -- 강의 시간
    classNumberOfStudents int not null, -- 강의 수강인원
    classCourseContents text, -- 강의 상세내용
    classGrade varchar(20) not null, -- 강의 등급
    classIntroduction text, -- 강의 소개글
    classImagesFileName1 text, -- 강의 이미지
    classImagesFileName2 text, -- 강의 이미지
    classImagesFileName3 text, -- 강의 이미지
    classImagesFileName4 text, -- 강의 이미지
    classImagesFileName5 text, -- 강의 이미지
    classLocale varchar(100) not null, -- 강의 주소
    classApprove boolean default false, -- 강의 등록 신청
    
    
    foreign key(classId) references Teacher(teacherId)
);

select * from classes;
DELIMITER //

CREATE TRIGGER update_clubMember_clubName
AFTER UPDATE ON Club
FOR EACH ROW
BEGIN
    DECLARE old_clubName VARCHAR(20);
    DECLARE new_clubName VARCHAR(20);

    -- 변경 전 clubName과 변경 후 clubName 할당
    SET old_clubName = OLD.clubName;
    SET new_clubName = NEW.clubName;

    -- clubMember 테이블의 clubName 업데이트
    UPDATE ClubMember
    SET clubName = new_clubName
    WHERE clubName = old_clubName;
END//

DELIMITER ;