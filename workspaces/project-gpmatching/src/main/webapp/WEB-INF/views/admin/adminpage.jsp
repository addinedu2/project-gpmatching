<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<c:url value="${pagingUrl}" var="adminUserListUrl">
    <c:param name="pageNo" value="${param.pageNo}" />
</c:url> <!-- 컨트롤러의 pagingUrl에서 연결된 것 -->


<!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon"
	href="/project-gpmatching/resources/assets/images/favicon/favicon.ico">

<!-- Libs CSS -->


<link
	href="/project-gpmatching/resources/assets/libs/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="/project-gpmatching/resources/assets/libs/dropzone/dist/dropzone.css"
	rel="stylesheet">
<link
	href="/project-gpmatching/resources/assets/libs/@mdi/font/css/materialdesignicons.min.css"
	rel="stylesheet" />
<link
	href="/project-gpmatching/resources/assets/libs/prismjs/themes/prism-okaidia.css"
	rel="stylesheet">








<!-- Theme CSS -->
<link rel="stylesheet"
	href="/project-gpmatching/resources/assets/css/theme.min.css">
<title>관리자 | Dash Ui - Bootstrap 5 Admin Dashboard Template</title>
</head>

<body class="bg-light">
	<div id="db-wrapper">
		<!-- navbar vertical -->
		<jsp:include page="/WEB-INF/views/modules/sidebar.jsp" />

		<!-- page content -->
		<div id="page-content">
			<div class="header @@classList">

				<jsp:include page="/WEB-INF/views/modules/header.jsp" />



			</div>
			<!-- Container fluid -->
			<div class="container-fluid p-6">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-12">
						<!-- Page header -->

						<div class="border-bottom pb-4 mb-4 ">

							<h3 class="mb-0 fw-bold">Overview</h3>


						</div>
					</div>
				</div>
				<div class="row align-items-center">
					<div class="col-xl-12 col-lg-12 col-md-12 col-12">
						<!-- Bg -->
						<div class="pt-20 rounded-top"
							style="background: url(/project-gpmatching/resources/assets/images/background/profile-cover.jpg) no-repeat; background-size: cover;">
						</div>
						<div class="bg-white rounded-bottom smooth-shadow-sm ">
							<div
								class="d-flex align-items-center justify-content-between
                  pt-4 pb-6 px-4">
								<div class="d-flex align-items-center">
									<!-- avatar -->
									<div
										class="avatar-xxl avatar-indicators avatar-online me-2
                      position-relative d-flex justify-content-end
                      align-items-end mt-n10">
										<img
											src="/project-gpmatching/resources/assets/images/avatar/avatar-1.jpg"
											class="avatar-xxl
                        rounded-circle border border-4 border-white-color-40"
											alt=""> <a href="#!"
											class="position-absolute top-0 right-0 me-2"
											data-bs-toggle="tooltip" data-placement="top" title=""
											data-original-title="Verified"> <img
											src="/project-gpmatching/resources/assets/images/svg/checked-mark.svg"
											alt="" height="30" width="30">
										</a>
									</div>
									<!-- text -->
									<div class="lh-1">
										<h2 class="mb-0">
											${loginuser.nickname}
											<!-- 닉네임 -->
											<a href="#!" class="text-decoration-none"
												data-bs-toggle="tooltip" data-placement="top" title=""
												data-original-title="Beginner"> </a>
										</h2>

										<p class="mb-0 d-block">
											@${loginuser.userNo}
											<!-- 원래 유저 아이디 인데 userNo 넘어오는거 테스트용-->
										</p>

									</div>
								</div>
								<div>
									<a href="/project-gpmatching/account/editMypage"
										class="btn btn-outline-primary
                      d-none d-md-block">회원정보
										수정</a> <a href="/project-gpmatching/commonBoard/reportWrite"
										class="btn btn-outline-primary
                      d-none d-md-block">신고
										하기</a> <a href="/project-gpmatching/commonBoard/reviewtestList"
										class="btn btn-outline-primary
                      d-none d-md-block">리뷰
										게시판</a>
								</div>
							</div>
							<!-- nav -->
							<ul class="nav nav-lt-tab px-4" id="pills-tab" role="tablist">
								<li class="nav-item"><a class="nav-link active" 
								href="/project-gpmatching/admin/adminOverview" id="overview">Overview</a>
								</li>
								<li class="nav-item">
								<c:url value="/admin/adminUserList" var="adminUserListUrl"><c:param name="pageNo" value="${param.pageNo }"/>
								</c:url>
								
								<a class="nav-link"
									href="/project-gpmatching/admin/adminUserList" id="UserListLink">UserList</a></li>

								<li class="nav-item"><a class="nav-link" href="#">회원이 쓴 글</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">차트(롤/배그/오버/전체/전체 사용량</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">
										기타 </a></li>
								<li class="nav-item"><a class="nav-link" href="#">Activity</a>
								</li>
							</ul>
						</div>
					</div>
				</div>

				<!-- content -->
				<div>여기가 시작</div>
				
				
		<div id="admincontent">
		</div>
				

	<!-- Scripts -->
	<!-- Libs JS -->
	<script
		src="/project-gpmatching/resources/assets/libs/jquery/dist/jquery.min.js"></script>
	<script
		src="/project-gpmatching/resources/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="/project-gpmatching/resources/assets/libs/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script
		src="/project-gpmatching/resources/assets/libs/feather-icons/dist/feather.min.js"></script>
	<script
		src="/project-gpmatching/resources/assets/libs/prismjs/prism.js"></script>
	<script
		src="/project-gpmatching/resources/assets/libs/apexcharts/dist/apexcharts.min.js"></script>
	<script
		src="/project-gpmatching/resources/assets/libs/dropzone/dist/min/dropzone.min.js"></script>
	<script
		src="/project-gpmatching/resources/assets/libs/prismjs/plugins/toolbar/prism-toolbar.min.js"></script>
	<script
		src="/project-gpmatching/resources/assets/libs/prismjs/plugins/copy-to-clipboard/prism-copy-to-clipboard.min.js"></script>

<!-- Theme JS -->
	<script src="/project-gpmatching/resources/assets/js/theme.min.js"></script>

	<script>
	
	$(document).ready(function() {
	    // Overview 버튼 클릭 이벤트 처리
	    $("#overview").on("click", function(event) {
	        event.preventDefault();
	        loadJSPPage($(this).attr("href"), event);
	    });
	    // UserListLink 링크 클릭 이벤트 처리
	    $("#UserListLink").on("click", function(event) {
	        event.preventDefault();
	        loadJSPPage($(this).attr("href"), event);
	    });

	    // 링크 페이지를 동적으로 로드하는 함수
	    function loadJSPPage(url, event, pageNo) {
	        // 기본 이벤트 중지
	        event.preventDefault();
	        $("#admincontent").load(url);
	    }
	    
	    $('#admincontent').on('click', '.pager-ul .page-item a', function(event) {
	    	event.preventDefault();
	    	
	    	const href = $(this).attr("href");  //"href" + pager-ul .page-item a(페이지 수) = 페이징 된 링크)
	    	loadJSPPage(href, event);
	    });
		
	    
	    
	    
	    // Overview를 동적으로 로드하는 함수 (이 부분을 주석 처리하면 초기에 Overview가 로딩되지 않습니다)
	    // loadOverview();
	});



		
		
		
		
		
		
		
		
	
	</script>
				
</body>

</html>