<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
					<h4 class="mb-3">업체등록</h4>
					<form:form modelAttribute="store" class="form-horizontal"
						action="add" method="post" enctype="multipart/form-data">
						<fieldset>
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="storeName">업체명</label>
									<form:input path="storeName" class="form-control" />
									<form:hidden class="form-control" path="storeId"
										value="${member.memberId}" />
								</div>
								<div class="invalid-feedback">업체명을 입력해주세요.</div>
								<div class="col-md-6 mb-3">
									<label for="storeCategory">업체종목</label>
									<form:input class="form-control" path="storeCategory" />
								</div>
								<div class="invalid-feedback">업체종목을 입력해주세요.</div>
								<div class="col-md-2 mb-3">
									<label for="storePhone01">업체번호</label>
									<form:input class="form-control" path="storePhone01" />
								</div>
								<div class="col-md-2 mb-3">
									<label for="storePhone02"></label>
									<form:input class="form-control" path="storePhone02" />
								</div>
								<div class="col-md-2 mb-3">
									<label for="storePhone03"></label>
									<form:input class="form-control" path="storePhone03" />
								</div>
								<div class="invalid-feedback">업체번호를 입력해주세요.</div>
								<div class="col-md-6 mb-3">
									<label for="storeCode">사업자번호</label>
									<form:input class="form-control" path="storeCode" />
								</div>
								<div class="invalid-feedback">사업자번호를 입력해주세요</div>

								<div class="col-md-6 mb-3">
									<label for="storeImage1" class="form-label">대표사진</label>
									<form:input class="form-control" type="file" path="storeImage1" />
								</div>
								<div class="col-md-6 mb-3">
									<label for="storeImage2" class="form-label">업체사진</label>
									<form:input class="form-control" type="file" path="storeImage2" />
								</div>
								<div class="col-md-6 mb-3">
									<label for="storeImage3" class="form-label">업체사진</label>
									<form:input class="form-control" type="file" path="storeImage3" />
								</div>
								<div class="col-md-6 mb-3">
									<label for="storeImage4" class="form-label">업체사진</label>
									<form:input class="form-control" type="file" path="storeImage4" />
								</div>
								<div class="col-md-6 mb-3">
									<label for="storeImage5" class="form-label">업체사진</label>
									<form:input class="form-control" type="file" path="storeImage5" />
								</div>
								<div class="mb-3">
									<label for="storeInfomation">업체소개<span
										class="text-muted">&nbsp;(필수 아님)</span></label>
									<form:textarea cols="50" rows="3" class="form-control"
										path="storeInfomation" />
								</div>
								<div class="row">
									<div class="col-12">
										<label for="storeAddr">업체주소</label>
										<div class="row mb-2">
											<div class="col-md-4">
												<input type="text" id="sample6_postcode" placeholder="우편번호"
													class="form-control">
											</div>
											<div class="col-md-2"
												style="margin-left: -1rem; padding: 0 -1rem;">
												<input type="button" onclick="sample6_execDaumPostcode()"
													value="우편번호 찾기"
													class="form-control btn btn-outline-primary">
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

								<div class="mb-3">
									<br>
									<label for="storeNotice"><h3>업체공지사항</h3>
										<span class="text-muted">&nbsp;(필수 아님)</span></label>
									<form:textarea cols="50" rows="10" class="form-control"
										path="storeNotice" />
								</div>
								<form:input type="hidden" id="storeAddr" class="form-control"
									path="storeAddr" />
							</div>
							<hr class="mb-4">
							<div class="mb-4"></div>
							<input class="room-application-btn4 btn-lg btn-block" type="submit"
								onclick="combineAddr()" value="신청 완료" />
						</fieldset>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
</body>
<script type="text/javascript">
	function combineAddr() {

		var addr = document.getElementById('sample6_address').value; // 주소
		var detailAddr = document.getElementById('sample6_detailAddress').value; // 상세주소
		var extraAddr = document.getElementById('sample6_extraAddress').value; // 참고항목
		// 문자열로 합침
		var fullAddr = addr + ' ' + detailAddr + ' ' + extraAddr;
		// 히든 input 태그에 값 저장
		document.getElementById('storeAddr').value = fullAddr;
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
