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
							<h2>Product insert</h2>
							<p>
								Only Admin
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

						<!-- ---------------------------------- -->
						<!-- 새상품 등록 시  -->

						<form class="row contact_form" action="insertProduct.do"
							method="post" name="insertProduct" enctype="multipart/form-data">
							
							<div class="col-md-8 form-group p_star">
								<p>상품명</p>
								<input type="text" class="form-control" id="proName"
									name="proName" maxlength="10" required />
							</div>
							<%-- <div class="col-md-6 form-group p_star">
									<p>카테고리</p>
									<select name="proCate">
										<c:forEach var="op" items="${category}">
											<option value="${op.value}">${op.key}</option>
										</c:forEach>
									</select>
								</div> --%>
							<div class="col-md-3 form-group p_star">
								<p>카테고리</p>
								<select name="proCate">
									<%-- 	안됨,,,,,,,,,,,, 
									<c:forEach var="op" items="${category}">
										<option value="${op.value}">${op.key}</option>
									</c:forEach> --%>
									<option value="의자" selected>의자</option>
									<option value="스툴">스툴</option>
									<option value="소파">소파</option>
								</select>
							</div>
							<div class="col-md-8 form-group p_star">
								<p>하위 카테고리</p>
								<select name="proSubCate">
									<optgroup label="chair">
										<option value="인테리어">인테리어 의자</option>
										<option value="좌식">좌식 의자</option>
									</optgroup>
									<optgroup label="stool">
										<option value="스툴">스툴</option>
									</optgroup>
									<optgroup label="sofa">
										<option value="일반소파">일반 소파</option>
										<option value="빈백소파">빈백 소파</option>
									</optgroup>
								</select>
							</div>
							<div class="col-md-8 form-group p_star">
								<p>상품가격</p>
								<input type="number" class="form-control" id="proPrice"
									name="proPrice" required />
							</div>
							<div class="col-md-8 form-group p_star">
								<p>상품재고</p>
								<input type="number" class="form-control" id="proStock"
									name="proStock" required />
							</div>
							<div class="col-md-8 form-group p_star">
								<p>KC인증</p>
								<input type="text" class="form-control" id="proKC" name="proKC"
									required />
							</div>
							<div class="col-md-8 form-group p_star">
								<p>색상</p>
								<input type="text" class="form-control" id="proColor"
									name="proColor" required />
							</div>
							<div class="col-md-8 form-group p_star">
								<p>구성품</p>
								<input type="text" class="form-control" id="proCmpt"
									name="proCmpt" required />
							</div>
							<div class="col-md-8 form-group p_star">
								<p>주요소재</p>
								<input type="text" class="form-control" id="proMtrl"
									name="proMtrl" required />
							</div>
							<div class="col-md-8 form-group p_star">
								<p>제조자(수입자)</p>
								<input type="text" class="form-control" id="proMnfct"
									name="proMnfct" required />
							</div>
							<div class="col-md-8 form-group p_star">
								<p>제조국</p>
								<input type="text" class="form-control" id="proNation"
									name="proNation" required />
							</div>
							<div class="col-md-8 form-group p_star">
								<p>크기</p>
								<input type="text" class="form-control" id="proSize"
									name="proSize" required />
							</div>
							<div class="col-md-8 form-group p_star">
								<p>배송,설치비용</p>
								<input type="number" class="form-control" id="proFee"
									name="proFee" required />
							</div>
							<div class="col-md-8 form-group p_star">
								<p>품질보증기준</p>
								<input type="text" class="form-control" id="proCerti"
									name="proCerti" required />
							</div>
							<div class="col-md-8 form-group p_star">
								<p>A/S 책임자와 전화번호</p>
								<input type="text" class="form-control" id="proAS" name="proAS"
									required />
							</div>


							<!-- ============= 상품사진 사진 ==============  -->
							<div class="col-md-8 form-group p_star">
								<p>사진추가</p>
								<input type="file" class="form-control" id="mImg"
									name="fileUpload" /> <img src="${data.proImg}"
									alt="productIMG" class="profilImg">
							</div> 


							<div class="col-md-12 form-group">
								<button type="submit" value="submit" class="btn_3">상품추가하기</button>
							</div>
						</form>

						<!-- ---------------------------------- -->



					</div>
				</div>
			</div>

		</div>

	</section>


	<!--=================================================-->

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

	<!--===================================== 자바 스크립트 =====================================-->
	<!--  다음 주소 API -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		// 탈퇴 버튼
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
							   alert("이미지 형식이 아닙니다!");
					       		document.getElementById('mImg').value='';
					       		$('input[name=fileUpload]').focus();
						}
					});
		});
	</script>


</body>

</html>