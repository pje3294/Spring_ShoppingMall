<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>오늘의 GaGu 🪑</title>
<link rel="icon" href="img/favicon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet" href="css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<!-- nice select CSS -->
<link rel="stylesheet" href="css/nice-select.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="css/all.css">
<!-- flaticon CSS -->
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/themify-icons.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="css/magnific-popup.css">
<!-- swiper CSS -->
<link rel="stylesheet" href="css/slick.css">
<link rel="stylesheet" href="css/price_rangs.css">
<!-- style CSS -->
<link rel="stylesheet" href="css/style.css">
</head>

<body>
	<!--::header part start::-->
	<header class="main_menu home_menu">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-12">
					<nav class="navbar navbar-expand-lg navbar-light">
						<a class="navbar-brand" href="main.do"> <img
							src="img/gaguLogo.png" alt="logo">
						</a>
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="menu_icon"><i class="fas fa-bars"></i></span>
						</button>

						<div class="collapse navbar-collapse main-menu-item"
							id="navbarSupportedContent">
							<ul class="navbar-nav">
								<li class="nav-item"><a class="nav-link" href="main.do">Home</a>
								</li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" id="navbarDropdown_1"
									role="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> Chair </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
										<a class="dropdown-item"
											href="main.do?proCate=의자&proSubCate=인테리어">Interior Chair</a>
										<a class="dropdown-item"
											href="main.do?proCate=의자&proSubCate=좌식">Sitting Chair</a>

									</div></li>
								<li class="nav-item"><a class="nav-link"
									href="main.do?proCate=스툴">Stool</a></li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="blog.html"
									id="navbarDropdown_1" role="button" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false">Sofa</a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
										<a class="dropdown-item"
											href="main.do?proCate=소파&proSubCate=일반소파">Normal Sofa</a> <a
											class="dropdown-item"
											href="main.do?proCate=소파&proSubCate=빈백소파">BeanBag Sofa</a>
									</div></li>

							</ul>
						</div>

						<!--================================================================================  -->

						<!--  ====================== 상단바 아이콘  ====================== -->
						<!--로그인xxxxx -->
						<c:if test="${empty user && empty manager}">
							<div class="hearer_icon d-flex">
								<div class="dropdown">
									<a class="dropdown-toggle" href="#" id="navbarDropdown3"
										role="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> <i class="ti-user"></i>
									</a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown">
										<a class="dropdown-item" href="login.jsp">로그인</a> <a
											class="dropdown-item" href="join.jsp">회원가입</a>

									</div>
								</div>

								<a id="search_1" href="javascript:void(0)"><i
									class="ti-search"></i></a>

							</div>


						</c:if>

						<!-- ======= 로그인 시 마이페이지 이동  ========-->
						<c:if test="${!empty user}">
							<div class="hearer_icon d-flex">
								<div class="dropdown">
									<a class="dropdown-toggle" href="#" id="navbarDropdown3"
										role="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> <i class="ti-user"></i>
									</a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown">
										<a class="dropdown-item" href="logout.do">로그아웃</a> <a
											class="dropdown-item" href="myPage.jsp?id=${user.id}">마이페이지</a>
									</div>
								</div>

								<div class="dropdown cart">
									<a class="dropdown-toggle" href="cart.jsp" id="navbarDropdown3"
										role="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> <i class="fas fa-cart-plus"><span
											class="cartNew">${cartCnt}</span></i>
									</a>
								</div>

								<a id="search_1" href="javascript:void(0)"> <i
									class="ti-search"></i>
								</a>



							</div>
						</c:if>


						<!-- ======= 관리자 페이지 이동  ========-->
						<c:if test="${!empty manager}">
							<div class="hearer_icon d-flex">
								<div class="dropdown">
									<a class="dropdown-toggle" href="#" id="navbarDropdown3"
										role="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> <i class="ti-user"></i>
									</a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown">
										<a class="dropdown-item" href="logout.do">로그아웃</a> <a
											class="dropdown-item" href="myPage.jsp?id=${manager.id}">관리자페이지</a>
									</div>
								</div>


								<a id="search_1" href="javascript:void(0)"> <i
									class="ti-search"></i>
								</a>



							</div>
						</c:if>
						<!--================================================================================  -->

					</nav>
				</div>
			</div>
		</div>
		<!-- ============================ 상단 검색 입력칸 =========================== -->
		<div class="search_input" id="search_input_box">
			<div class="container ">
				<form class="d-flex justify-content-between search-inner"
					action="main.do" method="post">
					<input type="text" class="form-control" id="search_input"
						placeholder="찾으시는 상품의 일부를 입력해주세요." name="keyword">
					<button type="submit" class="btn"></button>
					<span class="ti-close" id="close_search" title="Close Search"></span>
				</form>
			</div>
		</div>
	</header>
	<!-- Header part end-->

	<!--================Home Banner Area =================-->
	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="breadcrumb_iner">
						<c:if test="${!empty user}">
							<div class="breadcrumb_iner_item">
								<h2>Order History</h2>
								<p>[${user.id}]님이 구매하신 상품입니다.</p>
							</div>
						</c:if>
						<c:if test="${!empty manager}">
						<div class="breadcrumb_iner_item">
							<h2>회원 목록</h2>
							<p>현재 가입된 회원목록입니다.</p>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->

	<!--================Category Product Area =================-->
	<section class="cat_product_area section_padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">

					<!-- ==============  구매내역  section ======================= -->

					<div class="row align-items-center latest_product_inner">
						<c:if test="${!empty user}">
							<c:forEach var="v" items="${ordHistory}">
								<div class="col-lg-4 col-sm-6">

									<div class="single_product_item">

										<div class="single_product_text">
											<h4 style="color: #ff3368;">
												<a href="updateOrder.do?ordCode=${v.ordCode}"
													style="color: #ff3368">(주문번호: ${v.ordCode})</a>_${v.proName}
											</h4>
											<p>주문날짜 : ${v.orderDate}</p>
											<span>수량: ${v.amount}</span>

										</div>
									</div>
								</div>
							</c:forEach>
							<c:if test="${empty ordHistory}">
								<div class="breadcrumb_iner_item">
									<h3>
										<i>구매하신 상품이 없습니다.</i>
									</h3>
								</div>
							</c:if>
						</c:if>

						<c:if test="${!empty manager}">
							<c:forEach var="v" items="${memList}">
								<div class="col-lg-4 col-sm-6">

									<div class="single_product_item">
										<a href="#"><img src="${v.profile}" alt="회원프로필"></a>
										<div class="single_product_text">
											<h4 style="color: #ff3368;">
												<a href="#" style="color: #ff3368">${v.id}</a>_${v.name}님
											</h4>
											<p>생년월일 : ${v.birth}</p>

										</div>
									</div>
								</div>
							</c:forEach>


						</c:if>

					</div>



				</div>
			</div>
		</div>
	</section>
	<!--================End Category Product Area =================-->


	<mytag:footer />

	<!-- jquery plugins here-->
	<script src="js/jquery-1.12.1.min.js"></script>
	<!-- popper js -->
	<script src="js/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="js/bootstrap.min.js"></script>
	<!-- easing js -->
	<script src="js/jquery.magnific-popup.js"></script>
	<!-- swiper js -->
	<script src="js/swiper.min.js"></script>
	<!-- swiper js -->
	<script src="js/masonry.pkgd.js"></script>
	<!-- particles js -->
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<!-- slick js -->
	<script src="js/slick.min.js"></script>
	<script src="js/jquery.counterup.min.js"></script>
	<script src="js/waypoints.min.js"></script>
	<script src="js/contact.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.form.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/stellar.js"></script>
	<script src="js/price_rangs.js"></script>
	<!-- custom js -->
	<script src="js/custom.js"></script>



</body>

</html>