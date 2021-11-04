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
										aria-expanded="false"> <i class="fas fa-cart-plus"></i>
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
										aria-expanded="false"> <i class="fas fa-cart-plus"></i>
									</a>
								</div>

								<!-- <a id="search_1" href="javascript:void(0)"> <i
									class="ti-search"></i>
								</a> -->



							</div>
						</c:if>
						<!--================================================================================  -->



					</nav>
				</div>
			</div>
		</div>
		<!--  메인에서만 전체 상품명 검색 가능
		<div class="search_input" id="search_input_box">
			<div class="container ">
				<form class="d-flex justify-content-between search-inner" action="productList.do" method="post">
					<input type="text" class="form-control" id="search_input"
						placeholder="Search Here" name="keyword">
					<button type="submit" class="btn"></button>
					<span class="ti-close" id="close_search" title="Close Search"></span>
				</form>
			</div>
		</div> -->
	</header>
	<!-- Header part end-->

	<!--================Home Banner Area =================-->
	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item">
							<h2>Shop Category</h2>
							<p>
								Shop <span>-</span>${param.proCate}</p>
						</div>
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
				<div class="col-lg-3">
					<div class="left_sidebar_area">
						<aside class="left_widgets p_filter_widgets">
							<div class="l_w_title">
								<h3>SubCategory</h3>
							</div>
							<!-- <div class="widgets_inner"> -->
							<c:set var="proCate" value="${param.proCate}" />

							<c:if test="${proCate eq 'chair'}">
								<div class="widgets_inner">
									<ul class="list">
										<li><a href="main.do?proCate=chair&proSubCate=interior">interior</a></li>
										<li><a href="main.do?proCate=chair&proSubCate=sitting">sitting</a></li>
									</ul>
								</div>
							</c:if>
							<c:if test="${proCate eq 'stool'}">
								<div class="widgets_inner">
									<ul class="list">
										<li><a href="main.do?proCate=stool&proSubCate=l">no
												category</a></li>
									</ul>
								</div>
							</c:if>
							<c:if test="${proCate eq'sofa'}">
								<div class="widgets_inner">
									<ul class="list">
										<li><a href="main.do?proCate=sofa&proSubCate=normal">normal</a></li>
										<li><a href="main.do?proCate=sofa&proSubCate=beanbag">beanbag</a></li>
									</ul>
								</div>
							</c:if>
							<c:if test="${empty proCate}">
								<div class="widgets_inner">
									<div class="col-lg-9">
										<div class="row">
											<div class="col-lg-12">
												<div
													class="product_top_bar d-flex justify-content-between align-items-center">
													<!-- <div class="single_product_menu">
														<p>
															<span>10000 </span> Prodict Found
														</p>
													</div> -->

													<form action="main.do" method="post">
														<div class="single_product_menu">

															<div class="input-group">
																<input type="text" class="form-control"
																	placeholder="search"
																	aria-describedby="inputGroupPrepend" name="keyword">
																<div class="input-group-prepend">
																	<button type="submit" class="btn">
																		<span class="input-group-text" id="inputGroupPrepend">
																			<i class="ti-search"></i>
																		</span>
																	</button>

																</div>
															</div>
														</div>
													</form>

												</div>
											</div>
										</div>
									</div>
								</div>
							</c:if>
							<!-- <li><a href="#">Meat Alternatives</a> <span>(250)</span></li>
									<li><a href="#">Fresh Fish</a> <span>(250)</span></li>
									<li><a href="#">Meat Alternatives</a> <span>(250)</span></li>
									<li><a href="#">Meat</a> <span>(250)</span></li> -->

							<!-- </div> -->
						</aside>





					</div>
				</div>
				<div class="col-lg-9">
					<div class="row">
						<div class="col-lg-12">
							<div
								class="product_top_bar d-flex justify-content-between align-items-center">
								<div class="single_product_menu">
									<!-- <p><span>10000 </span> Prodict Found</p> -->
								</div>

								<!-- <div class="single_product_menu d-flex">
									<div class="input-group">
										<input type="text" class="form-control" placeholder="search"
											aria-describedby="inputGroupPrepend" name="keyword">
										<div class="input-group-prepend">
											<span class="input-group-text" id="inputGroupPrepend"><i
												class="ti-search"></i></span>
										</div>
									</div>
								</div> -->
							</div>
						</div>
					</div>

					<!-- ==============  상품 정렬 section ======================= -->






					<div class="row align-items-center latest_product_inner">
						<c:forEach var="v" items="${datas}" varStatus="status">
							<div class="col-lg-4 col-sm-6">
								<form action="addCart.do?status=${status.index}" method="post"
									name="addCart">
									<input type="hidden" name="id" value="${user.id}"> <input
										type="hidden" name="proCode" value="${v.proCode}"> <input
										type="hidden" name="proImg" value="${v.proImg}"> <input
										type="hidden" name="proName" value="${v.proName}"> <input
										type="hidden" name="proPrice" value="${v.proPrice}"> <input
										type="hidden" name="amount" type="number" value="1">

									<div class="single_product_item">
										<a href="productDetail.do?proCode=${v.proCode}"><img
											src="${v.proImg}" alt="상품이미지"></a>
										<div class="single_product_text">
											<h4>${v.proName}</h4>
											<h3>${v.proPrice}원</h3>
											<%-- <a href="addCart.do?staus=${status.index}&amount=1&" class="add_cart">+ add to cart</a> --%>
											<button type="submit" class="add_cart" onclick="login_check()" style="color: #ff3368; text-transform: uppercase; border: none; background-color: white;">+
												add to cart</button>
										</div>
									</div>
								</form>
							</div>
						</c:forEach>
						<c:if test="${empty datas}">
							<div class="breadcrumb_iner_item">
								<h3>
									<i>Sorry,, This product does not exist...</i>
								</h3>
							</div>
						</c:if>

						<div class="col-lg-12">
							<div class="pageination">
								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center">
										<li class="page-item"><a class="page-link" href="#"
											aria-label="Previous"> <i class="ti-angle-double-left"></i>
										</a></li>
										<li class="page-item"><a class="page-link" href="#">1</a></li>
										<li class="page-item"><a class="page-link" href="#">2</a></li>
										<li class="page-item"><a class="page-link" href="#">3</a></li>
										<li class="page-item"><a class="page-link" href="#">4</a></li>
										<li class="page-item"><a class="page-link" href="#">5</a></li>
										<li class="page-item"><a class="page-link" href="#">6</a></li>
										<li class="page-item"><a class="page-link" href="#"
											aria-label="Next"> <i class="ti-angle-double-right"></i>
										</a></li>
									</ul>
								</nav>
							</div>
						</div>
					</div>



				</div>
			</div>
		</div>
	</section>
	<!--================End Category Product Area =================-->

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
	
	<script type="text/javascript">
	function login_check(){ 
        var user = '<%=(String)session.getAttribute("user")%>';

         if(user=="null"){ 
            swal("로그인이 필요한 항목입니다.","회원 가입 또는 로그인을 해주세요", "error"); 
            history.go(-1)();
         }

   }   
	
	</script>
	
</body>

</html>