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
	href="/project-gpmatching/resources/assets/images/favicon/gps-ico.ico">
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
	<title>리스트 보기</title>
	
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
		               
		                  <h3 class="mb-0 fw-bold">알람 보기</h3>
		           
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
		                      <div class="ms-3">
		                        <h5 class="mb-0 fw-bold">${loginuser.nickname }</h5>
		                      
		                      </div>
		                    </div>
		                    <br>
		                    
		                    
		                    <c:forEach var="alarm" items="${matchingAlarms }">

			                    <!-- 알림 리스트 테스트★ -->
			                	<div class="row">
				                      <!-- text -->
				                      
				               
				                      
				                    <div class="col-6 mb-5">
				                      <h6 class="text-uppercase fs-5 ls-2">알림번호 </h6>
				                      <p class="mb-0">${alarm.nickname }</p>
				                    </div>
				                    
				                    
				                    
				                   <%--  <div class="col-6 mb-5">
				                      <h6 class="text-uppercase fs-5 ls-2">댓글번호</h6>
				                      <p class="mb-0">${alarm.mCommentNo }</p>
				                    </div> --%>
				                    <div class="col-6 mb-5">
				                      <h6 class="text-uppercase fs-5 ls-2">alramContent내용</h6>
				                      <p class="mb-0">${alarm.alarmContent}</p>
				                    </div>
				                    
				                    
				                </div><!-- row -->
			                	<!-- 여기까지 알림 리스트 테스트 -->
		                    
		                    </c:forEach>
		                    
		                    <%-- <!-- 알림 리스트 테스트★ -->
		                	<div class="row">
			                      <!-- text -->
			                    <div class="col-6 mb-5">
			                      <h6 class="text-uppercase fs-5 ls-2">알림번호 </h6>
			                      <p class="mb-0">${requestScope.alrams[0].alramNo }</p>
			                    </div>
			                    
			                    <div class="col-6 mb-5">
			                      <h6 class="text-uppercase fs-5 ls-2">댓글번호</h6>
			                      <p class="mb-0">${requestScope.alrams[0].commentNo }</p>
			                    </div>
			                    
			                    <div class="col-6 mb-5">
			                      <h6 class="text-uppercase fs-5 ls-2">회원번호</h6>
			                      <p class="mb-0">${alrams[0].userNo }</p>
			                    </div>
			                    
			                </div><!-- row --> --%>
<%-- 		                	<!-- 여기까지 알림 리스트 테스트 -->
		                    <c:out value="${alram.nickname }"/>
			                <c:out value="${alram.usreNo }"/>
			                <c:out value="${alram.commentNo }"/> --%>
		                    
		                    
		                    
		                	
			                </div>
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
	
	<script src="/project-gpmatching/resources/assets/js/common.js"></script>

</body>
</html>