<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
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

<title>commonBoard</title>
</head>

<body class="bg-dark">

	<div id="db-wrapper" class="toggled" >
		<!-- navbar vertical -->
		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/modules/sidebar.jsp" />
		<!-- page content -->
		<div id="page-content" >
		<!--  header -->
		<jsp:include page="/WEB-INF/views/modules/header.jsp" />

		
		<!-- Container fluid -->
		<!-- Basic -->
		
		<div class="card" style="width: 20rem;" >
		<form id="reviewform" action="write-review" method="post">
		   <div class="card-body">
		   	  <input type="hidden" name="boardNo" value="${ boardNo }" />
		   	  <input type="hidden" name="userNo" value="${ loginuser.userNo }" />
		   	  <input type="hidden" name="commentNo" value="${ commentNo }" />
			<input type="hidden" name="category"  value="review"> 
		      <h5 class="card-title">글제목 : ${ boardNo }</h5>
		      <hr>
		      <c:choose>
				<c:when test="${ empty commentWriter }">
					<span>리뷰 대상자 : ${ writer }</span>
					<input type="hidden" name="reviewedUserNo" value="${ writerUserNo }" />
				</c:when>
				<c:otherwise>					
					<span>리뷰 대상자 : ${ commentWriter }</span>
					<input type="hidden" name="reviewedUserNo" value="${ commentUserNo }" />		
				</c:otherwise>
		      </c:choose>
		      <hr>
		      <!-- Select Option -->
			  <div class="mb-3">
				<label class="form-label" for="selectOne">평점 <span class="text-secondary">(포인트 적립)</span>
				   <select name ="reviewPoint" class="form-select" aria-label="Default select example">
				     <option value="5" selected>★★★★★ (+5)</option>
				     <option value="4">★★★★☆ (+4)</option>
				     <option value="3">★★★☆☆ (+3)</option>
				     <option value="2">★★☆☆☆ (+2)</option>
				     <option value="1">★☆☆☆☆ (+1)</option>
				   </select>
				</label>  
			  </div>
		      <!-- Textarea -->
				 <div class="mb-3">
				   <label for="textarea-input" class="form-label">리뷰</label>
				   <textarea name ="reviewContent" class="form-control" id="textarea-input" rows="5"></textarea>
				 </div>
		      <button type="submit" class="btn btn-primary">등록</button>
		   </div>
		   </form>
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
</body>
</html>