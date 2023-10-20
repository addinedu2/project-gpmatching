<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">



<!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon" href="/project-gpmatching/resources/assets/images/favicon/gps-ico.ico">

<!-- Libs CSS -->


<link href="/project-gpmatching/resources/assets/libs/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link href="/project-gpmatching/resources/assets/libs/dropzone/dist/dropzone.css" rel="stylesheet">
<link href="/project-gpmatching/resources/assets/libs/@mdi/font/css/materialdesignicons.min.css" rel="stylesheet" />
<link href="/project-gpmatching/resources/assets/libs/prismjs/themes/prism-okaidia.css" rel="stylesheet">

<!-- Theme CSS -->
<link rel="stylesheet" href="/project-gpmatching/resources/assets/css/theme.min.css">

<style type="text/css">

.row, .col-xl-4, .col-xl-6 {

float: none;
margin: 0 auto;
cursor : pointer;

}


.card-img {

height : 150px;

}



</style>

<title>GPS</title>

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
		<div class="row row-cols-1 g-3" >
		<div class="col-xl-4 col-lg-6 col-md-6 col-6 mb-3">
		        <div  onClick="location.href='/project-gpmatching/commonBoard/commonList'">
		          <div>
		          <img src="/project-gpmatching/resources/assets/images/brand/logo/GPS_logo_home2.png"
		          	   class="card-img img-fluid" alt="...">
		          	   <!-- 로고이미지 추가 제작 후 수정 필요 -->
		          </div>
		        </div>
		      </div>
		      </div>

		      
	      <!-- carousel -->
	      <div class="row">
              <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                      <div class="tab-content p-4" id="pills-tabContent-with-indicators-slide">
                          <div class="tab-pane tab-example-design fade show active" id="pills-with-indicators-slide-design" role="tabpanel" aria-labelledby="pills-with-indicators-slide-design-tab">
                              <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                                  <ol class="carousel-indicators">
                                      <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></li>
                                      <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1">
                                      </li>
                                      <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2">
                                      </li>
                                  </ol>
                                  <div class="carousel-inner">
                                      <div class="carousel-item active" onClick="location.href='/project-gpmatching/boardMatching/lolBoard/lol-list'">
                                          <img src="/project-gpmatching/resources/assets/images/home/lol_1.jpg" class="d-block w-100 " alt="">
                                      </div>
                                      <div class="carousel-item" onClick="location.href='/project-gpmatching/boardMatching/pubgBoard/battleground-list'">
                                          <img src="/project-gpmatching/resources/assets/images/home/pubg_2.jpg" class="d-block w-100 " alt="">
                                      </div>
                                      <div class="carousel-item" onClick="location.href='/project-gpmatching/boardMatching/overwatchBoard/overwatch-list'">
                                          <img src="/project-gpmatching/resources/assets/images/brand/logo/over_logo2.png" class="d-block w-100 " alt="">
                                      </div>
                                  </div>
                                  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-bs-slide="prev">
                                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                      <span class="visually-hidden">Previous</span>
                                  </a>
                                  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-bs-slide="next">
                                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                      <span class="visually-hidden">Next</span>
                                  </a>
                              </div>
                          </div>
                       </div>
                 	</div>
                </div>
		    
	</div>

<!-- Scripts -->
<!-- Libs JS -->
<script src="/project-gpmatching/resources/assets/libs/jquery/dist/jquery.min.js"></script>
<script src="/project-gpmatching/resources/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="/project-gpmatching/resources/assets/libs/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="/project-gpmatching/resources/assets/libs/feather-icons/dist/feather.min.js"></script>
<script src="/project-gpmatching/resources/assets/libs/prismjs/prism.js"></script>
<script src="/project-gpmatching/resources/assets/libs/apexcharts/dist/apexcharts.min.js"></script>
<script src="/project-gpmatching/resources/assets/libs/dropzone/dist/min/dropzone.min.js"></script>
<script src="/project-gpmatching/resources/assets/libs/prismjs/plugins/toolbar/prism-toolbar.min.js"></script>
<script src="/project-gpmatching/resources/assets/libs/prismjs/plugins/copy-to-clipboard/prism-copy-to-clipboard.min.js"></script>




<!-- Theme JS -->
<script src="/project-gpmatching/resources/assets/js/theme.min.js"></script>
<script src="/project-gpmatching/resources/assets/js/common.js"></script>

<script>

$(".card").mouseover(function(event){
	$(this).addClass('opacity-75');
});

$(".card").mouseout(function(event) {
	$(this).removeClass('opacity-75');
});

</script>
</body>

</html>