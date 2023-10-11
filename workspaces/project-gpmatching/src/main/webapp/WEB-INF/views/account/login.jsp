<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">



<!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon" href="/project-gpmatching/resources/assets/images/favicon/favicon.ico">

<!-- Libs CSS -->


<link href="/project-gpmatching/resources/assets/libs/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link href="/project-gpmatching/resources/assets/libs/dropzone/dist/dropzone.css"  rel="stylesheet">
<link href="/project-gpmatching/resources/assets/libs/@mdi/font/css/materialdesignicons.min.css" rel="stylesheet" />
<link href="/project-gpmatching/resources/assets/libs/prismjs/themes/prism-okaidia.css" rel="stylesheet">


<!-- Theme CSS -->
<link rel="stylesheet" href="/project-gpmatching/resources/assets/css/theme.min.css">
  <title>Sign In | 로그인 </title>
</head>

<body class="bg-light">
	<div id="db-wrapper" class="toggled">
		<!-- navbar vertical -->
		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/modules/sidebar.jsp" />
		<!-- Page content -->
		<div id="page-content">
		<!-- Container fluid -->
		<jsp:include page="/WEB-INF/views/modules/header.jsp" />


  <!-- container -->
  <div class="container d-flex flex-column">
    <div class="row align-items-center justify-content-center g-0
        min-vh-100">
      <div class="col-12 col-md-8 col-lg-6 col-xxl-4 py-8 py-xl-0">
        <!-- Card -->
        <div class="card smooth-shadow-md">
          <!-- Card body -->
          <div class="card-body p-6">
            <div class="mb-4">
              <a href="/project-gpmatching/home">
              	<img src="/project-gpmatching/resources/assets/images/brand/logo/opgglogo-primary.png" class="mb-2" alt="">
              </a>
              <p class="mb-6">ID와 비밀 번호를 입력해주세요</p>
              
            </div>
            <!-- Form -->
            <form action="login" method="post">
           
              <!-- Username -->
              <div class="mb-3">
                <label for="userId" class="form-label">유저 ID</label>
                <input type="text" id="userId" class="form-control" name="userId" placeholder="USER ID here" required="">
                
             
              </div>
              <!-- Password -->
              <div class="mb-3">
                <label for="userPwd" class="form-label">비밀번호</label>
                <input type="password" id="userPwd" class="form-control" name="userPwd" placeholder="**************" required="">
              </div>
              <!-- Checkbox -->
              <div class="d-lg-flex justify-content-between align-items-center
                  mb-4">
                <div class="form-check custom-checkbox">
                  <input type="checkbox" class="form-check-input" id="rememberme">
                  <label class="form-check-label" for="rememberme">기억할까요?</label>
                     
                </div>

              </div>
              <div>
                <!-- Button -->
                <div class="d-grid">
                  <button type="submit" class="btn btn-primary">로그인</button>
                </div>

                <div class="d-md-flex justify-content-between mt-4">
                  <div class="mb-2 mb-md-0">
                    <a href="/project-gpmatching/account/register" class="fs-5">회원 가입 </a>
                  </div>
                  <div>
                    <a href="/project-gpmatching/account/forgetPassword" class="text-inherit
                        fs-5">비밀번호를 잊으셨나요?</a>
                         <!-- 비밀번호 찾기 -->
                  </div>

                </div>
              </div>


            </form>
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
</body>

</html>