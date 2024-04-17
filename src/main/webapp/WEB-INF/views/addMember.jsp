<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
   crossorigin="anonymous">
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
   rel="stylesheet">
<style>
* {
   font-family: 'Noto Sans KR', sans-serif;
}

.main-container {
   width: 80%;
   margin: 0 auto;
}

.container {
   margin-top: 20px;
}

.wrong_text {
   font-size: 1rem;
   color: #f44e38;
   letter-spacing: -.2px;
   font-weight: 300;
   margin: 8px 0 2px;
   line-height: 1em;
   display: none
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
   <jsp:include page="./section/nav.jsp" />
   <div class="main-container">
      <div class="container">
         <div class="input-form-backgroud row">
            <div class="input-form col-md-12 mx-auto">
               <h4 class="mb-3">회원가입</h4>
               <form:form modelAttribute="member" class="form-horizontal"
                  action="../add/member" method="post">
                  <fieldset>
                     <div class="row">
                        <!-- 유효성검사-->
                        <div class="col-md-6 mb-3">
                        <label for="memberId">아이디</label>
                        <div class="d-flex">
                           <div class="col-md-8">
                              <form:input id="memberId" path="memberId" class="form-control" />
                           </div>
                           <div class="col-md-2" style="margin-left: 1rem;">
                              <input type="button" id="checkDuplicate" value="중복확인"
                                 class="form-control btn btn-outline-primary">
                           </div>
                        </div>
                        </div>
                        <div class="invalid-feedback">아이디를 입력해주세요.</div>

                        <div class="col-md-6 mb-3">
                           <label for="memberPassword">비밀번호</label>
                           <form:password class="form-control" path="memberPassword" />
                        </div>
                        <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
                        <div class="col-md-6 mb-3">
                           <label for="memberBirth">생년월일</label>
                           <form:input type="date" class="form-control" path="memberBirth" />
                        </div>
                        <div class="invalid-feedback">생년월일을 입력해주세요.</div>
                        <div class="col-md-2 mb-3">
                           <label for="memberPhone01">휴대폰</label>
                           <form:select class="form-select"
                              aria-label="Default select example" path="memberPhone01">
                              <form:options items="${phone01Options}" />
                           </form:select>
                        </div>
                        <div class="col-md-2 mb-3">
                           <label for="memberPhone02"></label>
                           <form:input class="form-control" path="memberPhone02" />
                        </div>
                        <div class="col-md-2 mb-3">
                           <label for="memberPhone03"></label>
                           <form:input class="form-control" path="memberPhone03" />
                        </div>
                        <div class="invalid-feedback">휴대폰번호를 입력해주세요.</div>
                        <div class="col-md-6 mb-3">
                           <label for="memberGender">성별</label>
                           <form:select class="form-select"
                              aria-label="Default select example" path="memberGender">
                              <form:options items="${genderOptions}" />
                           </form:select>
                        </div>
                        <div class="invalid-feedback">성별을 입력해주세요.</div>
                        <div class="col-md-6 mb-3">
                           <label for="memberName">이름</label>
                           <form:input class="form-control" path="memberName" />
                        </div>
                        <div class="invalid-feedback">이름을 입력해주세요.</div>
                     </div>
                     <div class="mb-3">
                        <label for="memberEmail">이메일</label>
                        <form:input class="form-control" path="memberEmail" />
                     </div>
                     <div class="invalid-feedback">이메일을 입력해주세요.</div>
                     <div class="row">
                        <div class="col-md-6">
                           <label for="sample6_postcode">주소</label><br>
                           <div class="row mb-2">
                              <div class="col-md-4">
                                 <input type="text" name="memberPostCode"
                                    id="sample6_postcode" placeholder="우편번호"
                                    class="form-control">
                              </div>
                              <div class="col-md-4"
                                 style="margin-left: -1rem; padding: 0 -1rem;">
                                 <input type="button" onclick="sample6_execDaumPostcode()"
                                    value="우편번호 찾기" class="form-control btn btn-outline-primary">
                              </div>
                           </div>
                           <div>
                              <input type="text" id="sample6_address" placeholder="주소"
                                 class="form-control mb-2">
                              <div class="d-flex">
                                 <input type="text" id="sample6_detailAddress"
                                    placeholder="상세주소" class="form-control mb-2"> <input
                                    type="text" id="sample6_extraAddress" placeholder="참고항목"
                                    class="form-control mb-2" style="margin-left: 5px;">
                              </div>
                           </div>
                        </div>
                     </div>
                     <form:input type="hidden" id="memberAddr" class="form-control"
                        path="memberAddr" />
                     <div class="invalid-feedback">주소를 입력해주세요.</div>
                     <hr class="mb-4">
                     <div class="mb-4"></div>
                     <input class="room-application-btn4 btn-lg btn-block" type="submit"
                        onclick="combineAddr(event)" value="가입 완료" />
                  </fieldset>
               </form:form>
            </div>
         </div>
      </div>
   </div>
   <script
      src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

</body>
<script type="text/javascript">
   var checking = false;

   /*  유효성검사*/
   $('#checkDuplicate').click(
         function() { // "중복검사" 버튼을 클릭했을 때
            var memberId = $('#memberId').val(); // 사용자가 입력한 memberId 가져오기

            // AJAX를 통해 서버로 memberId 전송
            $.ajax({
               url : '/MAV/member/checkMemberId', // 서버측 URL
               type : 'POST', // HTTP 메소드 (여기서는 POST를 사용하여 데이터를 전송)
               data : {
                  'memberId' : memberId
               }, // 서버로 보낼 데이터
               success : function(data) { // 성공적으로 응답을 받았을 때 실행
                  if (data === 'duplicate') {
                     checking = false; // 중복이면 false
                     alert('이미 존재하는 아이디입니다.');
                  } else {
                     checking = true; // 사용 가능하면 true

                     alert('사용할 수 있는 아이디입니다.');
                  }
               },
               error : function(request, status, error) { // 에러 발생 시 실행
                  alert('아이디 중복 체크에 실패했습니다. 다시 시도해주세요.');
                  console.error("code:" + request.status + "\n"
                        + "message:" + request.responseText + "\n"
                        + "error:" + error);
               }
            });
         });

   //아이디 중복검사와 회원가입 시 주소 문자열 합치기
   function combineAddr(event) {
      if (checking === false) {
         alert('아이디 중복검사를 해주세요');
         event.preventDefault(); // 폼 제출을 방지합니다.
         return; // 여기서 함수 실행을 종료합니다.
      }

      // 주소 관련 값들을 가져옵니다.
      var addr = document.getElementById('sample6_address').value; // 주소
      var detailAddr = document.getElementById('sample6_detailAddress').value; // 상세주소
      var extraAddr = document.getElementById('sample6_extraAddress').value; // 참고항목

      // 주소 값을 하나의 문자열로 합칩니다.
      var fullAddr = addr.trim() + ' ' + detailAddr.trim()
            + (extraAddr.trim() !== '' ? ' ' + extraAddr.trim() : '');

      // 합쳐진 주소 값을 히든 필드에 설정합니다.
      document.getElementById('memberAddr').value = fullAddr;

      // 설정된 주소 값을 확인하기 위해 콘솔에 출력합니다.
      console.log('fullAddr:', fullAddr);
      console.log('The hidden field value:', document
            .getElementById('memberAddr').value);

      // 모든 검증이 완료되었으므로, 실제 폼을 제출합니다.
      document.getElementById('yourFormId').submit(); // 폼 ID로 수정해야 합니다.
   }

   function sample6_execDaumPostcode() {
      new daum.Postcode(
            {
               oncomplete : function(data) {
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
                  if (data.userSelectedType === 'R') {
                     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                     if (data.bname !== ''
                           && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                     }
                     // 건물명이 있고, 공동주택일 경우 추가한다.
                     if (data.buildingName !== ''
                           && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', '
                              + data.buildingName : data.buildingName);
                     }
                     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                     if (extraAddr !== '') {
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
                  document.getElementById("sample6_detailAddress")
                        .focus();
               }
            }).open();
   }
</script>

</html>