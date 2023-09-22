<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	


<!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon"
	href="/project-gpmatching/resources/assets/images/favicon/favicon.ico">
<!-- Theme CSS -->
<link rel="stylesheet"
	href="/project-gpmatching/resources/assets/css/theme.min.css">
	<link rel="stylesheet"
	href="/project-gpmatching/resources/assets/css/theme.css">

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
	<title>게시판글쓰기</title>
	
</head>
<body class="bg-light">

	<div id="db-wrapper" class="toggled">
		<!-- navbar vertical -->
		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/modules/sidebar.jsp" />
		<!-- page content -->
		<div id="page-content">
			<!--  header -->
			<jsp:include page="/WEB-INF/views/modules/header.jsp" />

			<div class="container-fluid p-6">
			
				<div class="row">
		          <div class="col-lg-12 col-md-12 col-12">
		            <!-- Page header -->
		           
		              <div class="border-bottom pb-4 mb-4 ">
		               
		                  <h3 class="mb-0 fw-bold">게시물 상세 보기</h3>
		           
		            </div>
		          </div>
		        </div>
			
				<div class="py-6">
		          <!-- row -->
		          <div class="row">
		          	<div class="col-xl-12 col-md-12 col-12 mb-6">
		              <!-- card -->
		              <div class="card">
		                <!-- card body -->
		                <div class="card-body">
		                
		                	<div class="d-flex align-items-center">
		                      <!-- <div>
		                        <img src="../assets/images/avatar/avatar-1.jpg" alt="" class="avatar avatar-md rounded-circle">
		                      </div> -->
		                      <div class="ms-3">
		                        <h5 class="mb-0 fw-bold">${commonBoard.userNo }</h5>
		                        <p class="mb-0"><fmt:formatDate value="${commonBoard.regDate }" pattern="yyyy-MM-dd" /></p>
		                      </div>
		                    </div>
		                    <br>
		                    

		                    
		                    <div class="row">
			                      <!-- text -->
			                    <div class="col-6 mb-5">
			                      <h6 class="text-uppercase fs-5 ls-2">글번호 </h6>
			                      <p class="mb-0">${requestScope.commonBoard.commonNo }</p>
			                    </div>
			                    <div class="col-6 mb-5">
			                      <h6 class="text-uppercase fs-5 ls-2">조회수</h6>
			                      <p class="mb-0">${commonBoard.readCount }</p>
			                    </div>
			                 </div>
			                <span class="text-uppercase fw-medium text-darks-5 ls-2">제목</span>
			                <!-- text -->
			                <h4 class="card-title">${commonBoard.commonTitle }</h4>
			                
<c:set var="enter" value="
" />		
			                <span class="text-uppercase fw-medium text-darks-5 ls-2">본문</span>
			                <!-- text -->
			                <p class="mt-2 mb-6">${fn:replace(commonBoard.commonContent,enter,"<br>") }</p>
		                	
		                	
		               
		                  <div class="row">
		                    <!-- <div class="col-xl-1 col-lg-2 col-md-2 col-12 mb-3 mb-lg-0">
		                      avatar
		                      <img src="../assets/images/avatar/avatar-1.jpg" class="avatar avatar-md rounded-circle" alt="">
		                    </div> -->
		                    <!-- input -->
		                    <div class="col-xl-11 col-lg-10 col-md-9 col-12 ">
		
		                      <div class="row g-3 align-items-center">
		                        <div class="col-md-2 col-xxl-1">
		                          <label for="name" class="col-form-label ">Name</label>
		                        </div>
		                        <div class="col-md-8 col-xxl-9  mt-0 mt-md-3">
		                          <input type="password" id="name" class="form-control" aria-describedby="name">
		                        </div>
		                        <div class="col-md-2 col-xxl-2">
		                          <button type="submit" class="btn btn-primary">Post</button>
		                        </div>
		                      </div>
		
		                    </div>
		
		                  </div>
		                  
		                  
		                </div>
		              </div>
		            
		            	<br>
			            <div class="btn-center" >
				        	<a href="commonList?=pageNo=${pageNo}">
				        	<button type="button" class="btn btn-primary btn-group-sm mb-2" aria-label="Small button group">목록</button>
				        	</a>
				        	
				        	<!-- sessionScope.loginuser != null && loginuser.memberId == board.writer 같은 의미-->
				        	
				        	<a href="commonEdit?commonNo=${commonBoard.commonNo}&pageNo=${pageNo}">
				        	<button type="button" class="btn btn-secondary btn-group-sm mb-2" aria-label="Small button group">수정</button>
				        	</a>
		
				        	
				        	<a href="javascript:" id="delete-board-lnk">
				        	<button type="button" class="btn btn-danger btn-group-sm mb-2" aria-label="Small button group">삭제</button>
				        	</a>
				        	
		
				        
				        </div>
		            
		            </div>
	            
		          </div>
		          
		        </div>
			</div>

		</div>
	</div>
	
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
	

</body>
</html>