<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

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


<!-- <style type="text/css">
.card-img-top {
   
    height: 208px;
}
</style> -->





<!-- Theme CSS -->
<link rel="stylesheet"
	href="/project-gpmatching/resources/assets/css/theme.min.css">
<title>gpMatching site</title>
</head>

<body class="bg-dark">
	<div id="db-wrapper" class="toggled">
		<!-- navbar vertical -->
		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/modules/sidebar.jsp" />
		<!-- Page content -->
		<div id="page-content">
		<!-- Container fluid -->
		<jsp:include page="/WEB-INF/views/modules/header.jsp" />
		
		<div class="py-6">
		    <div class="row row-cols-3 g-3">
		      <div class="col-xl-4 col-lg-6 col-md-6 col-6 mb-4">
		        <div class="card" onClick="location.href='/project-gpmatching/boardMatching/lolBoard/lol-list'"> <!-- 클릭 이벤트 걸어서 페이지 이동 -->
		          <img src="/project-gpmatching/resources/assets/images/home/lol_1.jpg" class="card-img-top img-fluid" alt="..." style="height : 208px" >
		          <div class="card-body">
		            <h5 class="card-title">LOL 매칭 게시판</h5>
		            <!-- <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p> -->
		          </div>
		        </div>
		      </div>
		
		      <div class="col-xl-4 col-lg-6 col-md-6 col-6 mb-4 ">
		        <div class="card" onClick="location.href='/project-gpmatching/boardMatching/pubgBoard/battleground-list'">
		          <img src="/project-gpmatching/resources/assets/images/home/pubg_2.jpg" class="card-img-top img-fluid" alt="..." style="height : 208px">
		          <div class="card-body">
		            <h5 class="card-title">PUBG 매칭 게시판</h5>
		            <!-- <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p> -->
		          </div>
		        </div>
		      </div>
		
		      <div class="col-xl-4 col-lg-6 col-md-6 col-6 mb-4">
		        <div class="card" onClick="location.href='/project-gpmatching/boardMatching/overwatchBoard/overwatch-list'">
		          <img src="/project-gpmatching/resources/assets/images/home/overwatch_1.jpg" class="card-img-top img-fluid" alt="..." style="height : 208px">
		          <div class="card-body">
		            <h5 class="card-title">오버워치 매칭 게시판</h5>
		           <!--  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p> -->
		          </div>
		        </div>
		      </div>
		    </div>
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
			<script src="/project-gpmatching/resources/assets/libs/prismjs/prism.js"></script>
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