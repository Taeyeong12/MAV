<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>매칭 뷰</title>
<script src="https://kit.fontawesome.com/1a6288a620.js"
	crossorigin="anonymous"></script>
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
	
	.innershadow:hover {
		color: red;
	}
	
	.innershadow2:hover {
		color: rgb(14, 14, 192);
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
		<div class="p-4 p-md-5 mb-4 rounded text-bg-dark">
			<div class="col-md-6 px-0">
				<h1 class="display-4 fst-italic">3월 oo컵 시작</h1>
				<p class="lead my-3">어쩌구 저쩌구 샬러샬러</p>
				<p class="lead mb-0">
					<a href="#" class="text-white fw-bold">참여하기</a>
				</p>
			</div>
		</div>
		<!-- 매칭룸 -->
		<div class="my-3 p-3 bg-body rounded shadow">
			<h6 class="border-bottom pb-2 mb-0 fw-bold innershadow">MatchRoom</h6>
			<c:forEach items="${matchView}" var="matchView">
				<c:if test="${matchView.matched == 1}">
					<div class="d-flex text-body-secondary pt-3">
						<img style="border-radius: 4px; border: 0.5px solid lightgray;"
							src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzEwMzFfMjk5%2FMDAxNjk4NzI2ODMzODM1.IwC69pz2-KkLOuYdY_bfKkY_kwPodTHsYabwstlFRJgg.HVut_PkKzsY07RqP-frp2roB5BKgqJpedPttcdFfhHwg.JPEG.renoma4339%2F20231023%25A3%25DF220440.jpg"
							alt="" width="100" height="100"> &nbsp;&nbsp;&nbsp;
						<div class="pb-3 mb-0 small lh-sm border-bottom w-100">
							<div class="d-flex justify-content-between">
								<strong class="text-gray-dark"><h5>
										<b>${matchView.matchTitle}</b>
									</h5></strong> <a
									href="<c:url value='/match/matchingDetail'/>?roomNum=${matchView.roomNum}"
									class="room-application-btn4">매칭 신청하기</a>
							</div>
							<b> <span class="d-block">${matchView.roomDate}</span> <span
								class="d-block">${matchView.roomTime}</span>
							</b>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<footer class="footer spad">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="footer__about">
							<div class="footer__about__logo">
								<a href="./index.html"><img src="img/logo.png" alt=""></a>
							</div>
							<ul>
								<li>Address: 60-49 Road 11378 New York</li>
								<li>Phone: +65 11.188.888</li>
								<li>Email: hello@colorlib.com</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
						<div class="footer__widget">
							<h6>Useful Links</h6>
							<ul>
								<li><a href="#">About Us</a></li>
								<li><a href="#">About Our Shop</a></li>
								<li><a href="#">Secure Shopping</a></li>
								<li><a href="#">Delivery infomation</a></li>
								<li><a href="#">Privacy Policy</a></li>
								<li><a href="#">Our Sitemap</a></li>
							</ul>

						</div>
					</div>
					<div class="col-lg-4 col-md-12">
						<div class="footer__widget">
							<h6>Join Our Newsletter Now</h6>
							<p>Get E-mail updates about our latest shop and special
								offers.</p>
							<form action="#">
								<input type="text" placeholder="Enter your mail">
								<button type="submit" class="site-btn">Subscribe</button>
							</form>
							<div class="footer__widget__social">
								<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
									class="fa fa-instagram"></i></a> <a href="#"><i
									class="fa fa-twitter"></i></a> <a href="#"><i
									class="fa fa-pinterest"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="footer__copyright">
							<div class="footer__copyright__text">
								<p>
									<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
									Copyright &copy;
									<script>
										document
												.write(new Date().getFullYear());
									</script>
									All rights reserved | This template is made with <i
										class="fa fa-heart" aria-hidden="true"></i> by <a
										href="https://colorlib.com" target="_blank">Colorlib</a>
									<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								</p>
							</div>
							<div class="footer__copyright__payment">
								<img src="img/payment-item.png" alt="">
							</div>
						</div>
					</div>
				</div>
			</div>
	</div>
	</footer>


	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>