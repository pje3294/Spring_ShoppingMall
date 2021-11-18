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
<!-- font awesome CSS -->
<link rel="stylesheet" href="css/all.css">
<!-- flaticon CSS -->
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/themify-icons.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="css/magnific-popup.css">
<!-- swiper CSS -->
<link rel="stylesheet" href="css/slick.css">
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
									<a class="dropdown-toggle" href="cart.jsp"> <i class="fas fa-cart-plus"><span
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

	<!-- banner part start-->
	<section class="banner_part">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-12">
					<div class="banner_slider owl-carousel">
						<div class="single_banner_slider">
							<div class="row">
								<div class="col-lg-5 col-md-8">
									<div class="banner_text">
										<div class="banner_text_iner">
											<h1>Cozy & relaxed</h1>
											<p>편안하고 예쁘기까지 한 가구,<br>"GaGu"에서 구경해보세요!</p>
											<a href="#pointer" class="btn_2">buy now</a>
										</div>
									</div>
								</div>
								<div class="banner_img d-none d-lg-block">
									<img src="img/banner_img.png" alt="">
								</div>
							</div>
						</div>
					
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- banner part start-->

	<!-- -------------------------------------------------------- -->
	<!-- feature_part start-->
	<section class="feature_part padding_top">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="section_tittle text-center">
						<h2>Category</h2>
					</div>
				</div>
			</div>
			<div class="row align-items-center justify-content-between">
				<div class="col-lg-7 col-sm-6">
					<div class="single_feature_post_text" id="pointer">
						<p>CHAIR</p>
						<h3>의자</h3>
						<a href="main.do?proCate=의자" class="feature_btn">EXPLORE NOW <i
							class="fas fa-play"></i></a> <img src="img/feature/feature_1.png"
							alt="">
					</div>
				</div>
				<div class="col-lg-5 col-sm-6">
					<div class="single_feature_post_text">
						<p>STOOL</p>
						<h3>스툴</h3>
						<a href="main.do?proCate=스툴" class="feature_btn">EXPLORE NOW <i
							class="fas fa-play"></i></a> <img src="img/feature/feature_3.png"
							alt=""> 
					</div>
				</div>
				<div class="col-lg-5 col-sm-6">
					<div class="single_feature_post_text">
						<p>NEW</p>
						<h3>신상품</h3>
						<a href="main.do?condition=proDate" class="feature_btn">EXPLORE
							NOW <i class="fas fa-play"></i>
						</a> <img src="img/feature/feature_2.png" alt="">
					</div>
				</div>
				<div class="col-lg-7 col-sm-6">
					<div class="single_feature_post_text">
						<p>SOFA</p>
						<h3>소파</h3>
						<a href="main.do?proCate=소파" class="feature_btn">EXPLORE NOW <i
							class="fas fa-play"></i></a> <img src="img/feature/feature_4.png"
							alt="">
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- -------------------------------------------------------------------- -->
	<!-- -------------------------------------------------------------------- -->


	<!-- awesome_shop start-->
<!-- 	<section class="our_offer section_padding">
		<div class="container">
			<div class="row align-items-center justify-content-between">
				<div class="col-lg-6 col-md-6">
					<div class="offer_img">
						<img src="img/offer_img.png" alt="">
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="offer_text">
						<h2>Weekly Sale on 60% Off All Products</h2>
						<div class="date_countdown">
							<div id="timer">
								<div id="days" class="date"></div>
								<div id="hours" class="date"></div>
								<div id="minutes" class="date"></div>
								<div id="seconds" class="date"></div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</section> -->
	<!-- awesome_shop part start-->



	<!-- --------------------------------------------------- -->
	<!-- product_list part start-->
	<!-- <section class="product_list best_seller section_padding">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="section_tittle text-center">
						<h2>
							Best Sellers <span>shop</span>
						</h2>
					</div>
				</div>
			</div>
			<div class="row align-items-center justify-content-between">
				<div class="col-lg-12">
					<div class="best_product_slider owl-carousel">
						<div class="single_product_item">
							<img src="img/product/product_1.png" alt="">
							<div class="single_product_text">
								<h4>
									<a href="getProduct.do?proCode=">Quartz Belt Watch</a>
								</h4>
								<h3>$150.00</h3>
							</div>
						</div>
						<div class="single_product_item">
							<img src="img/product/product_2.png" alt="">
							<div class="single_product_text">
								<h4>Quartz Belt Watch</h4>
								<h3>$150.00</h3>
							</div>
						</div>
						<div class="single_product_item">
							<img src="img/product/product_3.png" alt="">
							<div class="single_product_text">
								<h4>Quartz Belt Watch</h4>
								<h3>$150.00</h3>
							</div>
						</div>
						<div class="single_product_item">
							<img src="img/product/product_4.png" alt="">
							<div class="single_product_text">
								<h4>Quartz Belt Watch</h4>
								<h3>$150.00</h3>
							</div>
						</div>
						<div class="single_product_item">
							<img src="img/product/product_5.png" alt="">
							<div class="single_product_text">
								<h4>Quartz Belt Watch</h4>
								<h3>$150.00</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section> -->
	<!-- product_list part end-->

	
	<mytag:footer/>


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
	<!-- custom js -->
	<script src="js/custom.js"></script>
</body>

</html>