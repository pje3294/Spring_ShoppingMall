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
<title>aranaz</title>
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
						<a class="navbar-brand" href="index.jsp"> <img
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

								<!-- <a id="search_1" href="javascript:void(0)"> <i
									class="ti-search"></i>
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

	<!--================Home Banner Area =================-->
	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item">
							<h2>Product insert/update/delete</h2>
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

	<!--================================================-->
	<section class="checkout_area padding_top">
		<div class="container">
			<div class="billing_details">
				<div class="row">
					<div class="col-lg-8">
						<h3>상품정보</h3>
						<!-- -------------- 상품 수정 / 삭제   -------------------- -->

						<form class="row contact_form" action="updateProduct.do"
							method="post" name="updateProduct" enctype="multipart/form-data">

							<div class="col-md-4 form-group p_star">
								<p>상품코드</p>
								<input type="text" name="proCode" value="${data.proCode}"
									readonly="readonly">
							</div>
							<div class="col-md-8 form-group p_star">
								<p>상품명</p>
								<input type="text" class="form-control" id="proName"
									name="proName" maxlength="10" required value="${data.proName}" />
							</div>
							<div class="col-md-8 form-group p_star">
								<p>상품가격</p>
								<input type="number" class="form-control" id="proPrice"
									name="proPrice" required value="${data.proPrice}" />
							</div>
							<div class="col-md-8 form-group p_star">
								<p>상품재고</p>
								<input type="number" class="form-control" id="proStock"
									name="proStock" required value="${data.proStock}" />
							</div>

							<div class="col-md-4 form-group p_star">
								<p>카테고리 (현재 : ${data.proCate})</p>
								<select name="proCate">
									<%-- 안됨,,,,,,,,,,,, 
									<c:forEach var="op" items="${category}">
										<option value="${op.value}">${op.key}</option>
									</c:forEach> --%>
									<option value='' selected>선택</option>
									<option value="chair">의자</option>
									<option value="stool">스툴</option>
									<option value="sofa">소파</option>
								</select>
							</div>
							<div class="col-md-8 form-group p_star">
								<p>하위 카테고리 ([스툴인경우 없음]현재 : ${data.proSubCate})</p>
								<select name="proSubCate">
									<optgroup label="chair">
										<option value="interior">인테리어 의자</option>
										<option value="sittion">좌식 의자</option>
									</optgroup>
									<optgroup label="stool">
										<option value="">-</option>
									</optgroup>
									<optgroup label="sofa">
										<option value="normal">일반 소파</option>
										<option value="beanbag">빈백 소파</option>
									</optgroup>
								</select>
							</div>
							<div class="col-md-8 form-group p_star">
								<p>KC인증</p>
								<input type="text" class="form-control" id="proKC" name="proKC"
									required value="${data.proKC}" />
							</div>
							<div class="col-md-8 form-group p_star">
								<p>색상</p>
								<input type="text" class="form-control" id="proColor"
									name="proColor" required value="${data.proColor}" />
							</div>
							<div class="col-md-8 form-group p_star">
								<p>구성품</p>
								<input type="text" class="form-control" id="proCmpt"
									name="proCmpt" required value="${data.proCmpt}" />
							</div>
							<div class="col-md-8 form-group p_star">
								<p>주요소재</p>
								<input type="text" class="form-control" id="proMtrl"
									name="proMtrl" required value="${data.proMtrl}" />
							</div>
							<div class="col-md-8 form-group p_star">
								<p>제조자(수입자)</p>
								<input type="text" class="form-control" id="proMnfct"
									name="proMnfct" required value="${data.proMnfct}" />
							</div>
							<div class="col-md-8 form-group p_star">
								<p>제조국</p>
								<input type="text" class="form-control" id="proNation"
									name="proNation" required value="${data.proNation}" />
							</div> 
							<div class="col-md-12 form-group p_star">
								<p>크기</p>
								<input type="text" class="form-control" id="proSize"
									name="proSize" required value="${data.proSize}" />
							</div>
							<div class="col-md-8 form-group p_star">
								<p>배송,설치비용</p>
								<input type="number" class="form-control" id="proFee"
									name="proFee" required value="${data.proFee}" />
							</div>
							<div class="col-md-8 form-group p_star">
								<p>품질보증기준</p>
								<input type="text" class="form-control" id="proCerti"
									name="proCerti" required value="${data.proCerti}" />
							</div>
							<div class="col-md-8 form-group p_star">
								<p>A/S 책임자와 전화번호</p>
								<input type="text" class="form-control" id="proAS" name="proAS"
									required value="${data.proAS}" />
							</div>


							<!-- ============= 상품사진 사진 변경  ==============  -->
							<div class="col-md-8 form-group p_star">
								<p>사진변경</p>
								<input type="file" class="form-control" id="mImg"
									name="fileUpload" /> <img src="${data.proImg}" alt="productIMG"
									class="profilImg">
							</div>


							<div class="col-md-12 form-group">
								<button type="submit" value="submit" class="btn_3">상품
									수정하기</button>
								<button type="button" onclick="quit()" class="btn_3">상품
									삭제하기</button>
							</div>

						</form>
						

						<!-- ---------------------------------- -->



					</div>
				</div>
			</div>

		</div>

	</section>






	<!--================End Checkout Area =================-->

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

	<!--===================================== 자바 스크립트 =====================================-->
	<!--  다음 주소 API -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		// 상품 삭제 버튼
		function quit() {
			result = confirm("상품 삭제하시겠습니까?");
			if (result == true) {

				document.updateProduct.action = "deleteProduct.do";
				document.updateProduct.submit();
			} else {
				return;
			}
		}

		// 파일 미리보기
		document.addEventListener('DOMContentLoaded', function() {
			//이미지 객체 타입으로 이미지 확장자 밸리데이션
			var validateType = function(img) {
				return ([ 'image/jpeg', 'image/jpg', 'image/png' ]
						.indexOf(img.type) > -1);
			}

			var validateName = function(fname) {
				let extensions = [ 'jpeg', 'jpg', 'png' ];
				let fparts = fname.split('.');
				let fext = '';

				if (fparts.length > 1) {
					fext = fparts[fparts.length - 1];
				}

				let validated = false;

				if (fext != '') {
					extensions.forEach(function(ext) {
						if (ext == fext) {
							validated = true;
						}
					});
				}

				return validated;
			}

			// 파일 선택 필드에 이벤트 리스너 등록
			document.getElementById('mImg').addEventListener('change',
					function(e) {
						let elem = e.target;
						if (validateType(elem.files[0])) {
							let preview = document.querySelector('.profilImg');
							preview.src = URL.createObjectURL(elem.files[0]); //파일 객체에서 이미지 데이터 가져옴.
							preview.onload = function() {
								URL.revokeObjectURL(preview.src); //URL 객체 해제
							}
						} else {
							console.log('이미지 파일이 아닙니다.');
						}
					});
		});
	</script>


</body>

</html>