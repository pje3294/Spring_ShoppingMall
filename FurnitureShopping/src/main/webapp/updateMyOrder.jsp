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
						<div class="breadcrumb_iner_item">
							<h2>Product Checkout</h2>
							<p>
								Home 
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->

	<!--================ 주문/ 결제 부분! =================-->
	<section class="checkout_area padding_top">
		<div class="container">

			<div class="billing_details">
				<form class="row contact_form" action="updateOrder.do" method="post"
					novalidate="novalidate"  name="updateOrder">
					
					<div class="row">
						<div class="col-lg-8">

							<div class="col-md-4 form-group p_star">
								<p>주문번호</p>
								<input type="number" class="form-control" value="${myOrder.ordCode}"
									name="ordCode" readonly="readonly" />

							</div>
							<div class="col-md-6 form-group p_star">
								<p>주문자</p>
								<input type="text" class="form-control" value="${user.id}"
									name="id" readonly="readonly" />

							</div>


							<div class="col-lg-12">
								<h3>Shipping Details</h3>
							</div>
							<!-- 주소 API  -->
							<div class="col-md-8 form-group p_star">
							<p>우편번호</p>
								<input type="text" class="form-control" id="pCode" name="pCode"
									value="${myOrder.pCode}" required />
							</div>
							<div class="col-md-4 form-group p_star">
								<a href="#" class="genric-btn default-border circle"
									onclick="searchAddr();">우편번호 찾기</a>
							</div>

							<div class="col-md-12 form-group p_star">
							<p>도로명/지번주소</p>
								<input type="text" class="form-control" id="addr" name="addr"
									value="${myOrder.addr}" required />
							</div>
							<div class="col-md-12 form-group p_star">
							<p>상세주소</p>
								<input type="text" class="form-control" id="etcAddr"
									name="etcAddr" value="${myOrder.etcAddr}" required />
							</div>
							<div class="col-md-6 form-group p_star">
								<p>수취인</p> <input type="text" class="form-control" id="recName"
									name="recName" value="${myOrder.recName}" required />
							</div>

							<div class="col-md-8 form-group p_star">
								<p>전화번호</p> <input type="text" class="form-control" id="text"
									name="recPhone" value="${myOrder.recPhone}" onkeypress="inNumber();" pattern=".{11}" maxlength="11" required/>
							</div>

							<div class="col-md-12 form-group p_star">
								<p>배송메모</p> <input type="text" class="form-control" id="text"
									name="memo" value="${myOrder.memo}" maxlength="100"/>
							</div>

						</div>

					</div>


					<div class="col-md-6 form-group">
						<button type="submit" value="submit" class="btn_3">배송정보 수정하기</button>
					</div>
					<div class="col-md-6 form-group">
						<button type="button" onclick="quit()" class="btn_3">주문취소하기</button>
					</div>

				</form>
			</div>
		</div>
	</section>
	<!--================End Checkout Area =================-->

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
	<!--  다음 주소 API -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		function searchAddr() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.

							if (data.userSelectedType === 'R') { // 도로명 주소 선택 시 
								document.querySelector("#pCode").value = data.zonecode;
								document.querySelector("#addr").value = data.roadAddress;
								document.querySelector("#etcAddr").value = data.buildingName;

							} else { //지번 주소 선택시
								document.querySelector("#pCode").value = data.zonecode;
								document.querySelector("#addr").value = data.jibunAddress;
								document.querySelector("#etcAddr").value = data.buildingName;

							}

						}
					}).open();
		}
		
		
		// 전하번호 칸  번호만 입력
		function inNumber() {
			if (event.keyCode<48 || event.keyCode>57) {
				event.returnValue = false;
			}
		}
		
		
		// 탈퇴 버튼
		function quit() {
			result = confirm("주문을 취소하시겠습니까?");
			if (result == true) {

				document.updateOrder.action = "deleteOrder.do";
				document.updateOrder.submit();
			} else {
				return;
			}
		}
	</script>
</body>

</html>