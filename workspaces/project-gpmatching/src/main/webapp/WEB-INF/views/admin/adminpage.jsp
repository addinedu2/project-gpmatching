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
								<li class="nav-item"><a class="nav-link active" href="#">Overview</a>
								</li>
								<li class="nav-item"><a class="nav-link"
									href="/project-gpmatching/admin/adminUserList">UserList</a></li>

								<li class="nav-item"><a class="nav-link" href="#">Files</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">Teams</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">
										Followers </a></li>
								<li class="nav-item"><a class="nav-link" href="#">Activity</a>
								</li>
							</ul>
						</div>
					</div>
				</div>

				<!-- content -->
				<div class="py-6">
					<!-- 활동량 row -->
					<div class="row">
						<div class="col-xl-6 col-lg-12 col-md-12 col-12 mb-6">
							<!-- row  -->
							<div class="row my-6">
								<div class="col-xl-4 col-lg-12 col-md-12 col-12 mb-6 mb-xl-0">
									<!-- card  -->
									<div class="card h-100">
										<!-- card body  -->
										<div class="card-body">
											<div
												class="d-flex align-items-center justify-content-between">
												<div>
													<h4 class="mb-0">활동량</h4>
												</div>
												<!-- dropdown  -->
												<div class="dropdown dropstart">
													<a class="text-muted text-primary-hover" href="#"
														role="button" id="dropdownTask" data-bs-toggle="dropdown"
														aria-haspopup="true" aria-expanded="false"> <i
														class="icon-xxs" data-feather="more-vertical"></i>
													</a>
													<div class="dropdown-menu" aria-labelledby="dropdownTask">
														<a class="dropdown-item" href="#"> 오늘의 매칭량 </a> <a
															class="dropdown-item" href="#"> 이번 주의 매칭량 </a> <a
															class="dropdown-item" href="#"> 이번 주의 게시판량 </a>
													</div>
												</div>
											</div>
											<!-- chart  -->
											<div class="mb-8">
												<div id="perfomanceChart"></div>
											</div>
											<!-- icon with content  -->
											<div class="d-flex align-items-center justify-content-around">
												<div class="text-center">
													<i class="icon-sm text-success" data-feather="check-circle"></i>
													<h1 class="mt-3  mb-1 fw-bold">76%</h1>
													<p>Completed</p>
												</div>
												<div class="text-center">
													<i class="icon-sm text-warning" data-feather="trending-up"></i>
													<h1 class="mt-3  mb-1 fw-bold">32%</h1>
													<p>In-Progress</p>
												</div>
												<div class="text-center">
													<i class="icon-sm text-danger" data-feather="trending-down"></i>
													<h1 class="mt-3  mb-1 fw-bold">13%</h1>
													<p>Behind</p>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- 회원 목록 card  -->
								<div class="col-xl-8 col-lg-12 col-md-12 col-12">
									<div class="card h-100">
										<!-- card header  -->
										<div class="card-header bg-white py-4">
											<h4 class="mb-0">회원 목록</h4>
										</div>
										<!-- table  -->
										<div id="new-user-list" class="table-responsive">
													<!-- 여기에 Ajax로 동적 데이터 넣기. -->
					<table class="table text-nowrap mb-0">
					   <thead class="table-light">
					      <tr>
					         <th>아이디</th>
					         <th>닉네임</th>
					         <th>가입일자</th>
					      </tr>
					   </thead>
					   <tbody>
					   
					    <c:forEach var="user" items="${requestScope.newUsers }">
					   	<tr>
                           <td class="align-middle">
                               <div class="d-flexalign-items-center">
                                   <div class="ms-3 lh-1">
                                       <h5 class=" mb-1"> <a href="#" class="text-inherit">${ user.userId }</a></h5>
                                   </div>
                               </div>
                           </td>
                              <td class="align-middle">
                               <div class="d-flexalign-items-center">
                                   <div class="ms-3 lh-1">
                                       <h5 class=" mb-1"> <a href="#" class="text-inherit">${ user.nickname }</a></h5>
                                   </div>
                               </div>
                           </td>
                           <td class="align-middle">
                           		<fmt:formatDate value="${ board.regDate }"
					         				    pattern="yyyy-MM-dd"/>
                           </td>
                           
                       </tr>
                       </c:forEach>
					   </tbody>
					   
					</table>
													
												</tbody>
											</table>
										</div>
									</div>
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
		//회원 목록 함수
		loadUserList();
	})
	
	function loadUserList() {
    $.ajax({
        url: "userHome",
        method: "get",
        dataType: "json",
        success: function(data) {
        
        	
        	
        	
        	
        	
            });
        },
        error: function(xhr, status, error) {
            console.error("Error: " + error);
        }
    });
}
	
	
	</script>
	
				
</body>

</html>