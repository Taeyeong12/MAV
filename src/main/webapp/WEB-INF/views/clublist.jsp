<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="utf-8">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>클럽 리스트</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        * 
        {
            font-family: 'Noto Sans KR', sans-serif;
        }
        body
        {
        	background-color: rgb(243,243,243);
        }
        .main-container
        {
           width:80%;
           margin: 0 auto;
        }
        .main {
            display: flex;
        }

        .col-4 {
            margin-right: auto;
        }

        .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            border: none;
        }


        .img1 {
            border-radius: 50%;
            width: 50%;
            margin: 0 auto;
        }

        .right, .right-name {
            display: flex;
        }

        .right img {
            width: 30%;
        }

        .card-title, .card-text {
            margin: 0;
        }

        .list-group-item a {
            text-decoration: none;
            color: #212529;
        }

        .list-group-item:hover {
            background-color: #f8f9fa;
        }

        .card-link {
            color: #007bff;
            text-decoration: none;
        }

        .card-link:hover {
            text-decoration: underline;
        }

        .card h5 {
            font-size: 1.2rem;
            margin-bottom: 1rem;
        }

        .card-1 
        {
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            padding: 1rem;
            margin-bottom: 1.5rem;
            margin-right : 1rem;
            border: 1px solid #dee2e6;
            border-radius: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align : center;
        }

        h1 {
            font-size: 2rem;
            margin-bottom: 1.5rem;
            color: #007bff;
        }

        a {
            color: black;
            text-decoration: none !important;
            
        }

        a:hover {
            text-decoration: underline;
        }

        .room-title {
            font-size: 1.2rem;
            margin-bottom: 1rem;
            margin-top : 1rem;
            color: #343a40;
        }

        .room-application-btn {
            padding: 0.5rem 1rem;
            background-color: #007bff;
            color: white;
            border-radius: 0.25rem;
            text-decoration: none;
        }

        .room-info {
            display: flex;
            justify-content: space-between;
            align-items: center;
            
        }
         .tab {
        overflow: hidden;
       
    }

    .tab button {
        background-color: inherit;
        float: left;
        border: none;
        outline: none;
        cursor: pointer;
        padding: 14px 16px;
        transition: 0.3s;
    }

    .tab button:hover {
      
    }

    .tab button.active {
       
    }

    .tabcontent {
        display: none;
        
    }
    .club-choose
    {
       list-style : none;
       display : flex;
       flex-direction : row;
       align-items: center;
       justify-content : space-around;
    }
    .body-btn
    {
       text-decoration : none;
       border : 1px solid silver;
       border-radius : 10px;
       color : black;
       padding : 10px;
    }
   .clublistimage
   {
      height : 450px;
   }    
   .clublistimage img 
   {
       max-width: 100%;
       max-height: 100%;
   }
   .card-container
   {
      display: flex;
      flex-wrap : wrap;
   }
    .default-image 
    {
        background-image: url("/resources/images/MAVlogo.png");
        /* 기본 이미지의 크기와 스타일을 조절할 수 있습니다. */
        max-width: 100%;
        max-height: 100%;
    }
    .card-1 img
    {
       height: 180px;
       width: 230px;
        margin-bottom : 15px;
        margin-top : 10px;
        
    }
    .clubCount
    {
    	background-color: #3A4CA8;
    	padding : 1px;
    	border-radius : 5px;
    	color : white;
    	width : 80px;
    }
    
    .clubPoint
    {
    	background-color: #FD9F28;
    	padding : 1px;
    	border-radius : 5px;
    	color : white;
    	width : 80px;

    }
    </style>
</head>
<body>
<jsp:include page="./section/nav.jsp"/>
	<div class="main-container">
		    <div class="mt-3 clublistimage">
	    		<img src="<c:url value="/resources/images/${adminImages.clublistImageName}"/>" style="width: 100%;">		    
		    </div>
	    	<div class="club-choose col-3 mt-3">	    	
	   			<a class="body-btn" href="/MAV/club/list" role="button">전체 보기</a>
	    		<li class="dropdown">
                    <a class="dropdown-toggle body-btn locale" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      <span id="selectedLocale">지역별</span>
                    </a>
                    <ul class="dropdown-menu">
                      <li><button class="dropdown-item" href="#" onclick="filterLocale('전체')">전체</button></li>
                      <li><hr class="dropdown-divider"></li>
                      <li><button class="dropdown-item" href="#" onclick="filterLocale('서울')">서울</button></li>
                      <li><hr class="dropdown-divider"></li>
                      <li><button class="dropdown-item" href="#" onclick="filterLocale('경기')">경기</button></li>
                      <li><hr class="dropdown-divider"></li>
                      <li><button class="dropdown-item" href="#" onclick="filterLocale('충청')">충청</button></li>
                      <li><hr class="dropdown-divider"></li>
                      <li><button class="dropdown-item" href="#" onclick="filterLocale('경상')">경상</button></li>
                      <li><hr class="dropdown-divider"></li>
                      <li><button class="dropdown-item" href="#" onclick="filterLocale('전라')">전라</button></li>
                      <li><hr class="dropdown-divider"></li>
                      <li><button class="dropdown-item" href="#" onclick="filterLocale('강원')">강원</button></li>
                      <li><hr class="dropdown-divider"></li>
                      <li><button class="dropdown-item" href="#" onclick="filterLocale('제주')">제주</button></li>
                    </ul>
               </li>
               <li class="dropdown">
                    <a class="dropdown-toggle body-btn category" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <span id="selectedCategory">종목별</span>
                    </a>
                    <ul class="dropdown-menu">
                      <li><button class="dropdown-item" href="#" onclick="filterCategory('전체')">전체</button></li>
                      <li><hr class="dropdown-divider"></li>
                      <li><button class="dropdown-item" href="#" onclick="filterCategory('축구')">축구</button></li>
                      <li><hr class="dropdown-divider"></li>
                      <li><button class="dropdown-item" href="#" onclick="filterCategory('풋살')">풋살</button></li>
                      <li><hr class="dropdown-divider"></li>
                      <li><button class="dropdown-item" href="#" onclick="filterCategory('당구')">당구</button></li>
                      <li><hr class="dropdown-divider"></li>
                      <li><button class="dropdown-item" href="#" onclick="filterCategory('농구')">농구</button></li>
                      <li><hr class="dropdown-divider"></li>
                      <li><button class="dropdown-item" href="#" onclick="filterCategory('야구')">야구</button></li>
                      <li><hr class="dropdown-divider"></li>
                      <li><button class="dropdown-item" href="#" onclick="filterCategory('족구')">족구</button></li>
                      <li><hr class="dropdown-divider"></li>
                      <li><button class="dropdown-item" href="#" onclick="filterCategory('기타')">기타</button></li>
                    </ul>
	            </li>
	    	</div>
		 <div class="main col-12">
				    <div class="col-12">
				        <div class="room-title">동호회 리스트</div>
				        <div class="card-container">
				            <c:forEach items="${club}" var="club">
				                <div class="card-1" style="width: 18rem;">
				                    <a href="<c:url value="/club/clubinfo"/>?clubName=${club.clubName}">
				                        <img class="card-img-top" src="<c:url value="/resources/images/${club.imageFileName1}"/>" onerror="this.classList.add('default-image');" />
				                        <div class="card-body">
				                            <h5 class="card-title">${club.clubName}</h5>
				                            <div class="d-flex" style="justify-content : space-around; ">
				                            	<p class="card-text clubCount mt-3 mb-3">M.${club.clubMemberCount}</p>
				                            	<p class="card-text clubPoint mt-3 mb-3">P.${club.clubPoint}</p>
				                            </div>
				                            <p class="card-text clubCategory">동호회 종류 : ${club.clubCategory}</p>
				                            <p class="card-text clubLocale">동호회 지역 : ${club.clubLocale}</p>
				                        </div>
				                    </a>
				                </div>
				            </c:forEach>
				        </div>
				    </div>
				</div>
		   	</div>
		<script>
		    var currentLocale = '전체';
		    var currentCategory = '전체';
		    function filterLocale(locale) {
		        currentLocale = locale; // 선택한 지역을 현재 지역으로 설정
		        document.getElementById('selectedLocale').textContent = locale; // 선택한 지역을 표시
		        filterCards(); // 카드 필터링 함수 호출
		    }
		    function filterCategory(category) {
		        currentCategory = category; // 선택한 종목을 현재 종목으로 설정
		        document.getElementById('selectedCategory').textContent = category; // 선택한 종목을 표시
		        filterCards(); // 카드 필터링 함수 호출
		    }
		
		    function filterCards() {
		        const clubCards = document.querySelectorAll('.card-1');
		        clubCards.forEach(card => {
		            const clubLocale = card.querySelector('.clubLocale').textContent.trim().split(':')[1].trim();
		            const clubCategory = card.querySelector('.clubCategory').textContent.trim().split(':')[1].trim();
		            
		            // 지역 및 종목이 '전체'인 경우 모든 카드를 표시
		            if ((currentLocale === '전체' || clubLocale === currentLocale) && 
		                (currentCategory === '전체' || clubCategory === currentCategory)) {
		                card.style.display = 'block';
		            } else {
		                card.style.display = 'none';
		            }
		        });
		    }
		</script>
	    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
