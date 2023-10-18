<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <title>Setting | Dash Ui - Bootstrap 5 Admin Dashboard Template</title>
</head>

<body class="bg-light">
  <div id="db-wrapper">
    <!-- navbar vertical -->
     <!-- Sidebar -->
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
         
              <div class="border-bottom pb-4 mb-4">              
                  <h3 class="mb-0 fw-bold">마이 페이지 수정!</h3>             
                
              </div>
           
          </div>
        </div>
        
        <form action="editMypage" method="post" enctype="multipart/form-data">
        <div class="row mb-8">
          <div class="col-xl-3 col-lg-4 col-md-12 col-12">
            <div class="mb-4 mb-lg-0">
              <h4 class="mb-1">General Setting</h4>
              <p class="mb-0 fs-5 text-muted">Profile configuration settings </p>
            </div>

          </div>


          <div class="col-xl-9 col-lg-8 col-md-12 col-12">
            <!-- card -->
            <div class="card">
              <!-- card body -->
              <div class="card-body">
                <div class=" mb-6">
                  <h4 class="mb-1">General Settings</h4>
                </div>
                
                
                <!-- 프로필사진 -->
	                <div class="row align-items-center mb-8">
	                  <div class="col-md-3 mb-3 mb-md-0">
	                    <h5 class="mb-0">Avatar</h5>
	                  </div>
	                  <div class="col-md-9">
	                  
	                    <div class="d-flex align-items-center">
	                      <div class="me-3">
	                        <label for="imageInput" style="cursor: pointer;">
		                        <c:choose>
		                        	<c:when test="${ loginuser.userImage == null }">
			                        	<img id="preview" src="/project-gpmatching/resources/assets/images/avatar/anonymous.png" class="rounded-circle avatar avatar-lg" alt="">
			                        	<input type="file" id="imageInput" name="imageName" style="display: none" accept="image/*" onchange="readURL(this);" />
		                        	</c:when>
		                        	<c:otherwise>
		                        		<img id="preview" src="${pageContext.request.contextPath}/resources/upload/${loginuser.userImage}" class="avatar-xxl
		                        rounded-circle border border-4 border-white-color-40" alt="Image" height="30" width="30" alt="Image" >
		                        		<input type="file" id="imageInput" name="imageName" style="display: none;" accept="image/*" onchange="readURL(this);" />
		                        	</c:otherwise>
		                        </c:choose>
	                        </label>
	                      </div>
	                      <div>
	                        <button type="button" id="imageUpdateButton" class="btn btn-outline-white me-1">수정</button>
	                        <button type="button" id="imageDeleteButton" class="btn btn-outline-white">삭제</button>
	                      </div>
	                    </div>
	                    
	                  </div>
	                </div>
                
                
                
                <!-- 프로필커버사진 -->
                <!-- col -->
                <div class="row mb-8">
                  <div class="col-md-3 mb-3 mb-md-0">
                    <!-- heading -->
                    <h5 class="mb-0">Cover photo</h5>
                  </div>
                  <div class="col-md-9">
                    <!-- dropzone input -->
                    <div>
                      <form action="#" class="dropzone mb-3 border-dashed">
                        <div class="fallback">
                          <input name="file" type="file" multiple />
                        </div>
                      </form>
                      <button type="submit" class="btn btn-outline-white">Change</button>
                    </div>
                  </div>
                </div>
                <div>
                  <!-- border -->
                  <div class="mb-6">
                    <h4 class="mb-1">Basic information</h4>

                  </div>
           
		        <input type="hidden" name="userId" value="${ loginuser.userId }">

                    <!-- row -->
                    <div class="mb-3 row">
                      <label for="email" class="col-sm-4 col-form-label
                          form-label">이메일</label>
                      <div class="col-md-8 col-12"><!--이메일  -->
                        <input type="Email" class="form-control" name="userEmail" placeholder="${loginuser.userEmail}" id="userEmail">
                      </div>
                    </div>
                    
                    <!-- row -->
                    <div class="mb-3 row">
                      <label for="phone" class="col-sm-4 col-form-label
                          form-label">핸드폰 <span class="text-muted">(Optional)</span></label>
                      <div class="col-md-8 col-12">
                        <input type="text" class="form-control" name="userPhone" placeholder="${loginuser.userPhone}" id="userPhone">
                      </div>
                    </div>
                    
                    <!-- row -->
                    <div class="mb-3 row">
                      <label for="location" class="col-sm-4 col-form-label
                          form-label">닉네임</label>
                      <div class="col-md-8 col-12">
                  <input type="text" class="form-control" name="nickname" placeholder="${loginuser.nickname}" id="nickname">
                   <!--      <select class="form-select" id="newnickname">
                        <option selected>Select Country</option>
                            <option value="1">India</option>
                            <option value="2">UK</option>
                            <option value="3">USA</option> 
                          </select> -->  <!-- 데이터 선택이라 일단 주석으로 남겨놓는다 -->
                      </div>
                    </div>
                    
                    <!-- row -->
                    <div class="mb-3 row">
                      <label for="addressLine" class="col-sm-4 col-form-label
                          form-label">소개</label>
                      <div class="col-md-8 col-12">
                        <input type="text" class="form-control" name="userIntro" placeholder="${loginuser.userIntro}" id="userIntro">
                      </div>
                    </div>
                    
                    <!-- row -->
                    <div class="mb-3 row">
                      <label for="addressLineTwo" class="col-sm-4
                          col-form-label form-label">position</label>
                      <div class="col-md-8 col-12">
                        <input type="text" class="form-control" placeholder="placeholder" id="addressLineTwo">
                      </div>
                    </div>
                    <!-- row -->
                    <div class="row align-items-center">
                      <label for="zipcode" class="col-sm-4 col-form-label
                          form-label">Zip code <i data-feather="info"
                            class="me-2 icon-xs"></i></label>

                      <div class="col-md-8 col-12">
                        <input type="text" class="form-control" placeholder="placeholder" id="zipcode">
                      </div>
                      <div class="offset-md-4 col-md-8 mt-4">
                      
                        <button type="submit" class="btn btn-primary">
                        	회원정보 수정
                        </button>
                       
                      </div>
                    </div>
                </div>
              </div>
            </div>
          </div>
        </div>
       </form>
        
        
        <div class="row">
          <div class="col-xl-3 col-lg-4 col-md-12 col-12">
            <div class="mb-4 mb-lg-0">
              <h4 class="mb-1">Delete Account</h4>
              <p class="mb-0 fs-5 text-muted">Easily set up social media accounts</p>
            </div>

          </div>

          <div class="col-xl-9 col-lg-8 col-md-12 col-12">
            <!-- card -->

            <div class="card mb-6">
              <!-- card body -->
              <div class="card-body">
                <div class="mb-6">
                  <h4 class="mb-1">Danger Zone </h4>

                </div>
                <div>
                  <!-- text -->
                  <p>Delete any and all content you have, such as articles, comments, your reading list or chat messages. Allow your username to become available to anyone.</p>
                  <a href="#" class="btn btn-danger">Delete Account</a>
                  <p class="small mb-0 mt-3">Feel free to contact with any <a href="#">dashui@example.com</a> questions.
                  </p>
                </div>
              </div>
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

<script src="https://code.jquery.com/jquery-3.7.1.js"></script>

<!-- <script>
	$(function(event) {
	    $("#imageUpdateButton").click(function() {
	        alert("수정 버튼을 클릭했습니다.");
	    });
	
	    $("#imageDeleteButton").click(function() {
	        alert("삭제 버튼을 클릭했습니다.");
	    });
	});
</script> -->


<script>
  function readURL(input) {

      if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {
              $("#preview").attr("src", e.target.result);
          };
          reader.readAsDataURL(input.files[0]);
      }
  }
  </script>
  
  
</body>

</html>