<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>aranoz</title>
<link rel="icon" href="img/favicon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet" href="css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/lightslider.min.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="css/all.css">
<!-- flaticon CSS -->
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/themify-icons.css">
<!-- font awesome CSS -->
<link rel="stylesheet" href="css/magnific-popup.css">
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
							src="img/logo.png" alt="logo">
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
								<li class="nav-item"><a class="nav-link" href="index.html">Home</a>
								</li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="blog.html"
									id="navbarDropdown_1" role="button" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> Shop </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
										<a class="dropdown-item" href="category.html"> shop
											category</a> <a class="dropdown-item" href="single-product.html">product
											details</a>

									</div></li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="blog.html"
									id="navbarDropdown_3" role="button" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> pages </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
										<a class="dropdown-item" href="login.html"> login</a> <a
											class="dropdown-item" href="tracking.html">tracking</a> <a
											class="dropdown-item" href="checkout.html">product
											checkout</a> <a class="dropdown-item" href="cart.html">shopping
											cart</a> <a class="dropdown-item" href="confirmation.html">confirmation</a>
										<a class="dropdown-item" href="elements.html">elements</a>
									</div></li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="blog.html"
									id="navbarDropdown_2" role="button" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> blog </a>
									<div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
										<a class="dropdown-item" href="blog.html"> blog</a> <a
											class="dropdown-item" href="single-blog.html">Single blog</a>
									</div></li>

								<li class="nav-item"><a class="nav-link"
									href="contact.html">Contact</a></li>
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

								<!-- <a id="search_1" href="javascript:void(0)"><i
									class="ti-search"></i></a> -->

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
											class="dropdown-item" href="myPage.do?user=${user.id}">마이페이지</a>
									</div>
								</div>

								<div class="dropdown cart">
									<a class="dropdown-toggle" href="#" id="navbarDropdown3"
										role="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> <i class="fas fa-cart-plus"><span
											class="cartNew">${cartCnt}</span></i>
									</a>
								</div>

								<!-- <a id="search_1" href="javascript:void(0)"> 
								<i class="ti-search"></i>
								</a> -->



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
											class="dropdown-item" href="myPage.do?user=${manager.id}">관리자페이지</a>
									</div>
								</div>

								<div class="dropdown cart">
									<a class="dropdown-toggle" href="#" id="navbarDropdown3"
										role="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> <i class="fas fa-cart-plus"><span
											class="cartNew">${cartCnt}</span></i>
									</a>
								</div>

								<!-- <a id="search_1" href="javascript:void(0)"> 
								<i class="ti-search"></i>
								</a> -->



							</div>
						</c:if>
						<!--================================================================================  -->


					</nav>
				</div>
			</div>
		</div>
		<!-- <div class="search_input" id="search_input_box">
			<div class="container ">
				<form class="d-flex justify-content-between search-inner">
					<input type="text" class="form-control" id="search_input"
						placeholder="Search Here">
					<button type="submit" class="btn"></button>
					<span class="ti-close" id="close_search" title="Close Search"></span>
				</form>
			</div>
		</div> -->
	</header>
	<!-- Header part end-->

	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item">
							<h2>마이페이지</h2>
							<p>
								Home <span>-</span> Shop Single
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->
	<!--================End Home Banner Area =================-->

	<!-------------------------------------------------------------------  -->
	<div class="product_image_area section_padding">
		<div class="container">
			<!-- ============ 내 프로필 영역 (회원용) ============== -->
			<div class="row s_product_inner justify-content-between">
				<div class="col-lg-7 col-xl-7">
					<div class="product_slider_img">
						<div id="vertical">
							<div data-thumb="img/product/single-product/product_1.png">
								<c:if test="${!empty user}">
									<img src="${user.profile}" alt="post">
								</c:if>
								<c:if test="${!empty manager}">
									<img src="${manager.profile}" alt="post">
								</c:if>
							</div>
							<!-- C:\Users\박정은\git\Spring_ShoppingMall\FurnitureShopping\src\main\webapp\images\product\surface.jpg -->
							<!--C:\\Users\\박정은\\git\\Spring_ShoppingMall\\FurnitureShopping\\src\\main\\webapp\\${data.proImg} -->
						</div>
					</div>
				</div>
				<div class="col-lg-5 col-xl-4">
					<div class="s_product_text">

						<!-- ==============================         개인 정보       ======================================= -->
						<c:if test="${!empty user}">
							<h3 class="active" id="id">${user.id}</h3>
							<%-- <input type="hidden" id="id">${user.id} --%>
							<br>
							<ul class="list">
								<li><a class="active" href="join.jsp">내정보
										수정/탈퇴&nbsp;&nbsp;<i class="ti-settings"></i>
								</a></li>

							</ul>
							<p>
								<i class="ti-user"></i>&nbsp;&nbsp;name: ${user.name}
							</p>
							<p>
								<i class="ti-email"></i>&nbsp;&nbsp;email: ${user.email}
							</p>
							<p>
								<i class="ti-mobile"></i>&nbsp;&nbsp;phone: ${user.phone}
							</p>
							<p>
								<i class="ti-face-smile"></i>&nbsp;&nbsp;birth: ${user.birth}
							</p>
						</c:if>
						<c:if test="${!empty manager}">
							<h2>관리자 계정입니다.</h2>
							<br>
							<h3 class="active">[${manager.id}]님♥</h3>
							<br>
							<ul class="list">
								<li><a class="active" href="join.jsp">내정보
										수정/탈퇴&nbsp;&nbsp;<i class="ti-settings"></i>
								</a></li>

							</ul>
							<p>
								<a href="insertProduct.do" class="d-flex"> <span>새상품
										추가하기</span>
								</a>
							</p>


						</c:if>


					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->

	<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<!-- <li class="nav-item"><a class="nav-link" id="home-tab"
					data-toggle="tab" href="#home" role="tab" aria-controls="home"
					aria-selected="true">Description</a></li> -->
				<c:if test="${!empty user}">
					<a href="myOrder.do?id=${user.id}">구매내역</a>
				</c:if>
				<c:if test="${!empty manager}">
					<li class="nav-item"><a class="nav-link" id="profile-tab" data-toggle="tab"
						href="#contact" role="tab" aria-controls="profile"
						aria-selected="false">회원보기</a></li>
				</c:if>
			</ul>
			<div class="tab-content" id="myTabContent">


				<!--   ===============   (회원용) 구매 내역 section   ===================-->
				<div class="tab-pane fade" id="profile" role="tabpanel"
					aria-labelledby="profile-tab">
					<div class="table-responsive">
						<table class="table">
							<tr>
								<td>
									<h5>상품명</h5>
								</td>
								<td>
									
								</td>
							</tr>
							<%-- <tr>
								<td>
									<h5>KC인증</h5>
								</td>
								<td>
									<h5>${ord.proKC}</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>색상</h5>
								</td>
								<td>
									<h5>${data.proColor}</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>구성품</h5>
								</td>
								<td>
									<h5>${data.proCmpt}</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>주요소재</h5>
								</td>
								<td>
									<h5>${data.proMtrl}</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>제조자(수입자)</h5>
								</td>
								<td>
									<h5>${data.proMnfct}</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>제조국</h5>
								</td>
								<td>
									<h5>${data.proNation}</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>크기</h5>
								</td>
								<td>
									<h5>${data.proSize}</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>배송,설치비용</h5>
								</td>
								<td>
									<h5>${data.proFee}</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>품질보증기준</h5>
								</td>
								<td>
									<h5>${data.proCerti}</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>A/S 책임자와 전화번호</h5>
								</td>
								<td>
									<h5>${data.proAS}</h5>
								</td>
							</tr> --%>

							</tbody>
						</table>
					</div>
				</div>

				<div class="tab-pane fade" id="contact" role="tabpanel"
					aria-labelledby="contact-tab">
					<div class="row">
						<div class="col-lg-6">
							<div class="comment_list">
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/single-product/review-1.png" alt="" />
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<h5>12th Feb, 2017 at 05:56 pm</h5>
											<a class="reply_btn" href="#">Reply</a>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
								</div>
								<div class="review_item reply">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/single-product/review-2.png" alt="" />
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<h5>12th Feb, 2017 at 05:56 pm</h5>
											<a class="reply_btn" href="#">Reply</a>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
								</div>
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/single-product/review-3.png" alt="" />
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<h5>12th Feb, 2017 at 05:56 pm</h5>
											<a class="reply_btn" href="#">Reply</a>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="review_box">
								<h4>Post a comment</h4>
								<form class="row contact_form" action="contact_process.php"
									method="post" id="contactForm" novalidate="novalidate">
									<div class="col-md-12">
										<div class="form-group">
											<input type="text" class="form-control" id="name" name="name"
												placeholder="Your Full name" />
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<input type="email" class="form-control" id="email"
												name="email" placeholder="Email Address" />
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<input type="text" class="form-control" id="number"
												name="number" placeholder="Phone Number" />
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<textarea class="form-control" name="message" id="message"
												rows="1" placeholder="Message"></textarea>
										</div>
									</div>
									<div class="col-md-12 text-right">
										<button type="submit" value="submit" class="btn_3">
											Submit Now</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>
	</section>

	<!--================End Product Description Area =================-->

	<!-- product_list part start-->
	<section class="product_list best_seller">
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
								<h4>Quartz Belt Watch</h4>
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
	</section>
	<!-- product_list part end-->

	<!--::footer_part start::-->
	<footer class="footer_part">
		<div class="container">
			<div class="row justify-content-around">
				<div class="col-sm-6 col-lg-2">
					<div class="single_footer_part">
						<h4>Top Products</h4>
						<ul class="list-unstyled">
							<li><a href="">Managed Website</a></li>
							<li><a href="">Manage Reputation</a></li>
							<li><a href="">Power Tools</a></li>
							<li><a href="">Marketing Service</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-6 col-lg-2">
					<div class="single_footer_part">
						<h4>Quick Links</h4>
						<ul class="list-unstyled">
							<li><a href="">Jobs</a></li>
							<li><a href="">Brand Assets</a></li>
							<li><a href="">Investor Relations</a></li>
							<li><a href="">Terms of Service</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-6 col-lg-2">
					<div class="single_footer_part">
						<h4>Features</h4>
						<ul class="list-unstyled">
							<li><a href="">Jobs</a></li>
							<li><a href="">Brand Assets</a></li>
							<li><a href="">Investor Relations</a></li>
							<li><a href="">Terms of Service</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-6 col-lg-2">
					<div class="single_footer_part">
						<h4>Resources</h4>
						<ul class="list-unstyled">
							<li><a href="">Guides</a></li>
							<li><a href="">Research</a></li>
							<li><a href="">Experts</a></li>
							<li><a href="">Agencies</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-6 col-lg-4">
					<div class="single_footer_part">
						<h4>Newsletter</h4>
						<p>Heaven fruitful doesn't over lesser in days. Appear
							creeping</p>
						<div id="mc_embed_signup">
							<form target="_blank"
								action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
								method="get" class="subscribe_form relative mail_part">
								<input type="email" name="email" id="newsletter-form-email"
									placeholder="Email Address" class="placeholder hide-on-focus"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = ' Email Address '">
								<button type="submit" name="submit" id="newsletter-submit"
									class="email_icon newsletter-submit button-contactForm">subscribe</button>
								<div class="mt-10 info"></div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="copyright_part">
			<div class="container">
				<div class="row">
					<div class="col-lg-8">
						<div class="copyright_text">
							<P>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with <i
									class="ti-heart" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</P>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="footer_icon social_icon">
							<ul class="list-unstyled">
								<li><a href="#" class="single_social_icon"><i
										class="fab fa-facebook-f"></i></a></li>
								<li><a href="#" class="single_social_icon"><i
										class="fab fa-twitter"></i></a></li>
								<li><a href="#" class="single_social_icon"><i
										class="fas fa-globe"></i></a></li>
								<li><a href="#" class="single_social_icon"><i
										class="fab fa-behance"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!--::footer_part end::-->

	<!-- jquery plugins here-->
	<!-- jquery -->
	<script src="js/jquery-1.12.1.min.js"></script>
	<!-- popper js -->
	<script src="js/popper.min.js"></script>
	<!-- bootstrap js -->
	<script src="js/bootstrap.min.js"></script>
	<!-- easing js -->
	<script src="js/jquery.magnific-popup.js"></script>
	<!-- swiper js -->
	<script src="js/lightslider.min.js"></script>
	<!-- swiper js -->
	<script src="js/masonry.pkgd.js"></script>
	<!-- particles js -->
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<!-- slick js -->
	<script src="js/slick.min.js"></script>
	<script src="js/swiper.jquery.js"></script>
	<script src="js/jquery.counterup.min.js"></script>
	<script src="js/waypoints.min.js"></script>
	<script src="js/contact.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.form.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/stellar.js"></script>
	<!-- custom js -->
	<script src="js/theme.js"></script>
	<script src="js/custom.js"></script>



</body>

</html>