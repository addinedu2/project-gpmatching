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
<link rel="shortcut icon" type="image/x-icon" href="/project-gpmatching/resources/assets/images/favicon/gps-ico.ico">

<!-- Libs CSS -->


<link href="/project-gpmatching/resources/assets/libs/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link href="/project-gpmatching/resources/assets/libs/dropzone/dist/dropzone.css"  rel="stylesheet">
<link href="/project-gpmatching/resources/assets/libs/@mdi/font/css/materialdesignicons.min.css" rel="stylesheet" />
<link href="/project-gpmatching/resources/assets/libs/prismjs/themes/prism-okaidia.css" rel="stylesheet">








<!-- Theme CSS -->
<link rel="stylesheet" href="/project-gpmatching/resources/assets/css/theme.min.css">
  <title>마이페이지 수정</title>
</head>

<body class="bg-dark">
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
         
              <div class="border-bottom pb-4 mb-4 text-light">              
                  <h3 class="mb-0 fw-bold text-light">마이페이지 수정</h3>             
                
              </div>
           
          </div>
        </div>
        
        <form action="editMypage" method="post" enctype="multipart/form-data">
        <div class="row mb-8">
          <div class="col-xl-3 col-lg-4 col-md-12 col-12">
            <div class="mb-4 mb-lg-0">
              <h4 class="mb-1 text-light" style="font-weight: bold;">회원정보 수정</h4>
            </div>

          </div>


          <div class="col-xl-9 col-lg-8 col-md-12 col-12">
            <!-- card -->
            <div class="card">
              <!-- card body -->
              <div class="card-body">
<!--                 <div class=" mb-6"> -->
<!--                   <h4 class="mb-1">General Settings</h4> -->
<!--                 </div> -->
                
                
                <!-- 프로필사진 -->
	                <div class="row align-items-center mb-8">
	                  <div class="col-md-3 mb-3 mb-md-0">
	                    <h5 class="mb-0">프로필 사진</h5>
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
                    <h5 class="mb-0">프로필 커버</h5>
                  </div>
                  <div class="col-md-9">
                    <!-- dropzone input -->
                    <div>
                      <form action="#" class="dropzone mb-3 border-dashed">
                        <div class="fallback">
                          <input name="file" type="file" multiple />
                        </div>
                      </form>
                      <button type="submit" class="btn btn-outline-white">수정</button>
                    </div>
                  </div>
                </div>
                <div>
                  <!-- border -->
                  <div class="mb-6">
                    <h4 class="mb-1">기본 정보</h4>

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
                          form-label">핸드폰 <span class="text-muted">(선택)</span></label>
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
                    <div class="row align-items-center">
                      <div class="offset-md-4 col-md-8 mt-4">
                        <button type="submit" class="btn btn-primary ">
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
            <div class="mb-4 mb-lg-0 text-light">
              <h4 class="mb-1 text-light" style="font-weight: bold;">회원탈퇴</h4>
            </div>

          </div>

          <div class="col-xl-9 col-lg-8 col-md-12 col-12">
          
            <!-- 회원탈퇴 폼 -->
			<form id="deleteForm" action="deleteUser" method="post">
            <div class="card mb-6">
              <!-- card body -->
              <div class="card-body">
                <div class="mb-6">
				<div class="mb-3">
					<label for="userPwd" class="form-label">비밀번호</label>
					<input type="password" id="userPwd" class="form-control" name="userPwd" required>
				</div>
				
				<div class="mb-3">
					 <label for="confirmPassword" class="form-label">비밀번호 확인</label>
					 <input type="password" id="confirmPassword" class="form-control" name="confirm-password" required>
				</div>
				<div>
				<div>
					<button id="deleteComplete" type="submit" class="btn btn-danger">
					회원탈퇴
					</button>
          	    </div>
          	    </div>
          	   </div>
          	  </div>
            </div>
          </form>
          
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
  
  <script>
	$(function () {
		$('#deleteComplete').on('click', function(event){
			event.preventDefault(); //이벤트 발생 객체의 원래 동작 실행 막기 
		
			const userPwd = $("#userPwd").val();
			if(!userPwd){
				alert('비밀번호를 입력하세요');
				$('#userPwd').focus();
				return;
			}
		
			const confirmPassword = $("#confirmPassword").val();
			if(!confirmPassword){
				alert('비밀번호를 확인하세요');
				$('#confirmPassword').focus();
				return;
			}
			
			if (userPwd != confirmPassword) {
				alert('비밀번호를 확인해주세요');
				$('#confirmPassword').focus();
				return;
			}else{
				alert('탈퇴하시겠습니까?');
			}
			
			
			$("#deleteForm").submit(); //중복검사 됐을때만 submit
			
		});
	});
  </script>
  
  
</body>

</html>