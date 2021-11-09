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

	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item">
							<h2>Shop - ${data.proCate}</h2>
							<p>${data.proSubCate}
								<span>></span>${data.proName}</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->
	<!--================End Home Banner Area =================-->

	<!--================Single Product Area =================-->
	<div class="product_image_area section_padding">
		<div class="container">
			<div class="row s_product_inner justify-content-between">
				<div class="col-lg-7 col-xl-7">
					<div class="product_slider_img">
						<div id="vertical">
							<div data-thumb="img/product/single-product/product_1.png">
								<img src="${data.proImg}" alt="상세이미지" />
							</div>
							<!-- C:\Users\박정은\git\Spring_ShoppingMall\FurnitureShopping\src\main\webapp\images\product\surface.jpg -->
							<!--C:\\Users\\박정은\\git\\Spring_ShoppingMall\\FurnitureShopping\\src\\main\\webapp\\${data.proImg} -->
						</div>
					</div>
				</div>
				<div class="col-lg-5 col-xl-4">
					<div class="s_product_text">

						<!-- ==================== 관리지는 상품 수정 / 삭제 가능!!!!!!!!!!==================== -->
						<c:if test="${!empty manager}">
							<h5>
								<a href="formProduct.jsp">상품 수정 <span>|</span> 삭제하기
								</a>
							</h5>
						</c:if>
						<!-- ====================================================================== -->
						<h3>${data.proName}</h3>
						<h2>${data.proPrice}원</h2>
						<ul class="list">
							<li><a class="active"
								href="main.do?proCate=${data.proCate}&proSubCate=${data.proSubCate}">
									<span>Category</span>: ${data.proCate} > ${data.proSubCate}
							</a></li>
							<li><a href="#"> <span>Availibility</span> :
									${data.proStock}개
							</a></li>
							<li><a href="#"> <span>delivery fee</span> :
									${data.proFee}원
							</a></li>
						</ul>
						<br>
						<!-- =============  현재 상품 카톡 링크로 공유하기  ================== -->
						<div>
						<a id="kakao-link-btn" href="javascript:sendLink()">
								<span style="font-size: 17px;">kakao&nbsp;&nbsp;<i class="ti-share"></i></span>
								</a>
						</div>
						<!-- <a id="kakao-link-btn" href="javascript:sendLink()">카카오톡 공유하기
							버튼 </a> <br> <br> <br> <br> -->

						<!--========================== 장바구니 추가하기  ==========================  -->
						<form action="addCart.do" method="post" name="addCart">
							<input type="hidden" name="id" value="${user.id}"> <input
								type="hidden" name="proCode" value="${data.proCode}"> <input
								type="hidden" name="proImg" value="${data.proImg}"> <input
								type="hidden" name="proName" value="${data.proName}"> <input
								type="hidden" name="proPrice" value="${data.proPrice}">
							<input type="hidden" name="proFee" value="${data.proFee}">

							<div
								class="card_area d-flex justify-content-between align-items-center">
								<div class="product_count">

									<input class="input-number" type="number" value="1" min="1"
										max="${data.proStock}" name="amount">
										
										
								</div>
							<c:if test="${empty user || !empty manager}">		
							<input type="button" class="btn_3" value="add to cart" onclick="alert('회원로그인을 먼저 해주세요.')">						
								<!-- <button type="disable"  class="btn_3">add to cart</button> -->
							</c:if>	
								<c:if test="${!empty user}">	
								<button type="submit" value="submit" class="btn_3">add to cart</button>
							</c:if>
							</div>
						</form>
						
						
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
				
				<li class="nav-item"><a class="nav-link" id="profile-tab"
					data-toggle="tab" href="#profile" role="tab"
					aria-controls="profile" aria-selected="false">Specification</a></li>
				<!-- <li class="nav-item"><a class="nav-link" id="review-tab"
					data-toggle="tab" href="#review" role="tab" aria-controls="review"
					aria-selected="false">Reviews</a></li> -->
			</ul>
			<div class="tab-content" id="myTabContent">
				

				<!--   ===============  상품 info section   ===================-->
				<div class="tab-pane fade show" id="profile" role="tabpanel"
					aria-labelledby="profile-tab">
					<div class="table-responsive">
						<table class="table">
							<tr>
								<td>
									<h5>상품등록일</h5>
								</td>
								<td>
									<h5>${data.proDate}</h5>
								</td>
							</tr>
							<tr>
								<td>
									<h5>KC인증</h5>
								</td>
								<td>
									<h5>${data.proKC}</h5>
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
							</tr>

							</tbody>
						</table>
					</div>
				</div>

				
			</div>
		</div>
	</section>
	<!--================End Product Description Area =================-->

	<mytag:footer/>

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

	<!-- 카카오링크 API 설정 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>


	<script type='text/javascript'>
	

	
		//카카오링크 API
	//<![CDATA[
		// // 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('사용할 앱의 JavaScript 키');
		// // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
		Kakao.Link.createDefaultButton({
			container : '#kakao-link-btn',
			objectType : 'feed',
			content : {
				title : $('input[name=proName]').val(),
				description : $('input[name=proPrice]').val()+'원',
				imageUrl :'https://t1.kakaocdn.net/kakaocorp/kakaocorp/admin/news/e7fa9044017c00001.png',
				link : {
					mobileWebUrl : window.location.href,
					webUrl : window.location.href
				}
			},

			buttons : [ {
				title : '웹으로 상품 보기',
				link : {
					webUrl : window.location.href
				}
			} ]
		});
		//]]>

		
	</script>

</body>

</html>