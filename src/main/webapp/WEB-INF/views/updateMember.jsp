<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        * 
        {
            font-family: 'Noto Sans KR', sans-serif;
        }
        .main-container
        {
            width: 80%;
            margin: 0 auto;
        }
        .container
        {
            margin-top: 20px;
        }
        .btn-container
        {
        	display:flex;
        }
		.room-application-btn4 {
		   padding: 0.5rem 1rem;
		   background-color: #3A4CA8;
		   color: white;
		   border-radius: 0.25rem;
		   text-decoration: none;
		   border: none;
		}
    </style>
    <script>
		function goBack() 
		{
		    window.history.back();
		}
	</script>
  </head>
  <body>
  <jsp:include page="./section/nav.jsp" />
    <div class="main-container">
        <div class="container">
            <div class="input-form-backgroud row">
                <div class="input-form col-md-12 mx-auto">
                    <h4 class="mb-3">회원 정보 수정</h4>
                    <form:form modelAttribute="member" class="form-horizontal" action="/MAV/member/update/member" method="post">
						<fieldset>
					 	<div class="row">
	                      	<div class="col-md-6 mb-3">
	                       		<label for="memberId">아이디</label>
	                         	<form:input path="memberId" class="form-control" value="${member.memberId}" readonly="true" />                          
	                       	</div>
                            <div class="invalid-feedback">
                                아이디를 입력해주세요.
                            </div>
	                        <div class="col-md-6 mb-3">
	                            <label for="memberPassword">비밀번호</label>
	                            <form:password class="form-control" path="memberPassword" value="${member.memberPassword}"/>
	                        </div>
                            <div class="invalid-feedback">
                                비밀번호를 입력해주세요.
                            </div>
	                        <div class="col-md-6 mb-3">
	                           	<label for="memberBirth">생년월일</label>
	                           	<form:input type="date" class="form-control" path="memberBirth" value="${member.memberBirth}" />
	                       	</div>
                            <div class="invalid-feedback">
                                생년월일을 입력해주세요.
                            </div>
	                        <div class="col-md-2 mb-3">
	                            <label for="memberPhone01">휴대폰</label>
	                            <form:select class="form-select" aria-label="Default select example" path="memberPhone01" value="${member.memberPhone01}">
	                                <form:options items="${phone01Options}"/>
	                            </form:select>
	                        </div>
	                        <div class="col-md-2 mb-3">
	                            <label for="memberPhone02"></label>
	                            <form:input class="form-control" path="memberPhone02" value="${member.memberPhone02}"/>
	                        </div>
	                        <div class="col-md-2 mb-3">
	                            <label for="memberPhone03"></label>
	                            <form:input class="form-control" path="memberPhone03" value="${member.memberPhone03}"/>
	                        </div>
                            <div class="invalid-feedback">
                                휴대폰번호를 입력해주세요.
                            </div>
	                        <div class="col-md-6 mb-3">
	                            <label for="memberGender">성별</label>
	                            <form:select class="form-select" aria-label="Default select example" path="memberGender" value="${member.memberGender}">
	                             	<form:options items="${genderOptions}"/>
	                            </form:select>
	                        </div>
                            <div class="invalid-feedback">
                                성별을 입력해주세요.
                            </div>
	                        <div class="col-md-6 mb-3">
	                            <label for="memberName">이름</label>
	                            <form:input class="form-control" path="memberName" value="${member.memberName}"/>                        
	                        </div>
                            <div class="invalid-feedback">
                                이름을 입력해주세요.
                            </div>                        
                    	</div>
	                    <div class="mb-3">
	                        <label for="memberEmail">이메일</label>
	                        <form:input  class="form-control" path="memberEmail" value="${member.memberEmail}"/>
	                    </div>
                        <div class="invalid-feedback">
                            이메일을 입력해주세요.
                        </div>
	                    <div class="row">
	                     <div class="col-md-6">
						    <form:input type="hidden" id="memberAddr" class="form-control" path="memberAddr" /> 
						    <label for="sample6_postcode">주소</label><br>
						    <div class="row mb-2">
						        <div class="col-md-4">
						            <input type="text" id="sample6_postcode" placeholder="우편번호" class="form-control">
						        </div>
						        <div class="col-md-4" style="margin-left: -1rem; padding: 0 -1rem;">
						            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="form-control btn btn-outline-primary">
						        </div>
						    </div>
						    <div>
						        <input type="text" id="sample6_address" placeholder="주소" class="form-control mb-2" />
						        <div class="d-flex">
						            <input type="text" id="sample6_detailAddress" placeholder="상세주소" class="form-control mb-2" />
						            <input type="text" id="sample6_extraAddress" placeholder="참고항목" class="form-control mb-2" style="margin-left: 5px;"/>
						        </div>
						    </div>
						</div>
						</div>
						<hr class="mb-4">
						<div class="mb-4"></div>
						<div class="btn-container">
							<input class="room-application-btn4 btn-lg btn-block" style="margin-right : 15px;" type="submit" value="수정 완료" onclick="combineAddr()"/>
							<input class="room-application-btn4 btn-lg btn-block" type="button" value="취소 하기" onclick="goBack()"/>
						</div>
						</fieldset>			
						</form:form>
						
					</div>
                </div>
            </div>
        </div>    
    <script
      src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
		  function combineAddr() {
		       var addr = document.getElementById('sample6_address').value; // 주소
		       var detailAddr = document.getElementById('sample6_detailAddress').value; // 상세주소
		       var extraAddr = document.getElementById('sample6_extraAddress').value; // 참고항목
		
		       // 문자열로 합침
		       var fullAddr = addr + ' ' + detailAddr + ' ' + extraAddr;
		
		       // 히든 input 태그에 값 저장
		       document.getElementById('memberAddr').value = fullAddr;
		   }
		  
		  function sample6_execDaumPostcode() {
		       new daum.Postcode({
		           oncomplete: function(data) {
		               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		               // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		               var addr = ''; // 주소 변수
		               var extraAddr = ''; // 참고항목 변수
		
		               //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		               if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                   addr = data.roadAddress;
		               } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                   addr = data.jibunAddress;
		               }
		
		               // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		               if(data.userSelectedType === 'R'){
		                   // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                   // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                   if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                       extraAddr += data.bname;
		                   }
		                   // 건물명이 있고, 공동주택일 경우 추가한다.
		                   if(data.buildingName !== '' && data.apartment === 'Y'){
		                       extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                   }
		                   // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                   if(extraAddr !== ''){
		                       extraAddr = ' (' + extraAddr + ')';
		                   }
		                   // 조합된 참고항목을 해당 필드에 넣는다.
		                   document.getElementById("sample6_extraAddress").value = extraAddr;
		               
		               } else {
		                   document.getElementById("sample6_extraAddress").value = '';
		               }
		
		               // 우편번호와 주소 정보를 해당 필드에 넣는다.
		               document.getElementById('sample6_postcode').value = data.zonecode;
		               document.getElementById("sample6_address").value = addr;
		               // 커서를 상세주소 필드로 이동한다.
		               document.getElementById("sample6_detailAddress").focus();
		           }
		       }).open();
		   }		  		  
	</script>
  </body>
</html>