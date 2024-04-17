<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
  <%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>강의등록 - Bootstrap</title>

  <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        * 
        {
            font-family: 'Noto Sans KR', sans-serif;
        }


    .container{
     width: 80%;
     margin: 0 auto;
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
</head>

<body>
 <jsp:include page="./section/nav.jsp"/>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">강의등록</h4>
                  
        <form:form modelAttribute="classes" class="validation-form"  method="post" action="./addclass" enctype="multipart/form-data">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>  
        <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="className">강의명</label>
                    <form:input path="className" class="form-control"  />
                </div>
       </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="classLecturedate">강의날짜</label>
                    <form:hidden class="form-control" path="classId" value="${member.memberId}"/>
        
                    <form:input type="date" class="form-control" path="classLecturedate" min="<%= LocalDate.now() %>"  />
					<div class="invalid-feedback">
                    	강의날짜를 선택해주세요.
               		</div>
                </div>

                <div class="col-md-6 mb-3">
                    <label for="classLecturetime">강의시간</label>
                   	<form:input type="time" class="form-control" path="classLecturetime" />
					<div class="invalid-feedback">
                    	강의시간를 선택해주세요.
               		</div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="classNumberOfStudents">강의수강인원</label>
                    <form:input class="form-control" path="classNumberOfStudents"   />
                    <div class="invalid-feedback">
                    강의수강인원을 입력해주세요
                    </div>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="classGrade">강의 등급</label>
                   <form:select class="form-select" aria-label="Default select example" path="classGrade">
                       <form:options items="${gradeOptions}"/>
                   </form:select>
                </div>
            </div>
            <div class="row">
                <div class=" col-md-6 mb-3">
                    <label for="classCourseContents">수강 내용</label>
                    <form:input   class="form-control" path="classCourseContents"  />
                    <div class="invalid-feedback">
                    수강내용을 입력해주세요.
                    </div>
                </div>
            </div>
            <div class="row">
		        <div class="col-md-6 mb-3">
		            <label for="classImages1" class="form-label">강의사진</label>
		            <form:input class="form-control" type="file" path="classImages1"/>
		        </div>
		        <div class="col-md-6 mb-3">
		            <label for="classImages2" class="form-label">강의사진</label>
		           <form:input class="form-control" type="file" path="classImages2"/>
		        </div>
		        <div  class="col-md-6 mb-3">
		            <label for="classImages3" class="form-label">강의사진</label>
		           <form:input class="form-control" type="file" path="classImages3"/>
		        </div>
		        <div  class="col-md-6 mb-3">
		            <label for="classImages4" class="form-label">강의사진</label>
		            <form:input class="form-control" type="file" path="classImages4"/>
		        </div>
		         <div  class="col-md-6 mb-3">
		            <label for="classImages5" class="form-label">강의사진</label>
		            <form:input class="form-control" type="file" path="classImages5"/>
		        </div>
	       </div> 

          <div class="mb-3">
            <label for="classIntroduction">강의소개<span class="text-muted">&nbsp;(필수 아님)</span></label>
           <form:textarea cols="50" rows="10" class="form-control" path="classIntroduction" />
            </div>


       		<div class="row">
                      <div class="col-md-6">
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
                             <input type="text" id="sample6_address" placeholder="주소" class="form-control mb-2">
                             <div class="d-flex">
                                   <input type="text" id="sample6_detailAddress" placeholder="상세주소" class="form-control mb-2">
                                <input type="text" id="sample6_extraAddress" placeholder="참고항목" class="form-control mb-2" style="margin-left: 5px;">
                             </div>
                          </div>
                      </div>
                  </div>
                          
                       <form:input type="hidden" id="classLocale" class="form-control" path="classLocale" /> 
                        <div class="invalid-feedback">
                            주소를 입력해주세요.
                        </div>
                       <hr class="mb-4">
                       <div class="mb-4"></div>   
                       <input class="btn btn-primary btn-lg btn-block room-application-btn4" type="submit" onclick="combineAddr()"  value="가입 완료"/>            

               </form:form>
               

               </div>
           </div>
       </div>
	 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>  
 </body>
   <script type="text/javascript">
  function combineAddr() {
       var addr = document.getElementById('sample6_address').value; // 주소
       var detailAddr = document.getElementById('sample6_detailAddress').value; // 상세주소
       var extraAddr = document.getElementById('sample6_extraAddress').value; // 참고항목

       // 문자열로 합침
       var fullAddr = addr + ' ' + detailAddr + ' ' + extraAddr;

       // 히든 input 태그에 값 저장
       document.getElementById('classLocale').value = fullAddr;
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

  <script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);

  </script>
</body>

</html>