<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
  <title>register | 회원가입</title>
</head>

<body class="bg-light">
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
              <p class="mb-6">회원 정보를 입력해주세요.</p>
            </div>      
            <!-- Form -->
         
            <form:form id="registerform" action="register" method="post" modelAttribute="user">
              <!-- userId -->
              <div class="mb-3">
					<label for="userId" class="form-label">회원 ID</label>
					<div class="input-group">
						<input type="text" id="userId" class="form-control" name="userId" placeholder="회원 ID" required="">
						<button id="checkDup" class="btn btn-primary">중복검사</button>
						<form:errors path="userId" cssClass="error"></form:errors>
					</div>
			  </div>
              <!-- <div class="mb-3">
                <label for="userId" class="form-label">회원 ID</label>
                <input type="text" id="userId" class="form-control" name="userId" placeholder="회원 ID" required="">
              </div> -->
              <!-- Password -->
              <div class="mb-3">
                <label for="password" class="form-label">회원 비밀번호</label>
                <input type="password" id="userPwd" class="form-control" name="userPwd" placeholder="**************" required="">
              </div>
              <!-- Password -->
              <div class="mb-3">
                <label for="confirm-password" class="form-label">회원 비밀번호 확인</label>
                <input type="password" id="confirm-password" class="form-control" name="confirm-password" placeholder="**************" required="">
              </div>
              <!-- Email -->
              <div class="mb-3">
                <label for="email" class="form-label">이메일</label>
                <input type="email" id="userEmail" class="form-control" name="userEmail" placeholder="Email address here" required="">
              </div>
              <!-- nickname -->
              <div class="mb-3">
                <label for="nickname" class="form-label">닉네임</label>
                <input type="text" id="nickname" class="form-control" name="nickname" placeholder="닉네임을넣어주세요" required="">
              </div>
              <!-- userPhone -->
              <div class="mb-3">
                <label for="userPhone" class="form-label">핸드폰 번호</label>
                <input type="text" id="userPhone" class="form-control" name="userPhone" placeholder="000-0000-0000" required="">
              </div>
              
              
              
              
              <!-- Checkbox -->
              <div class="mb-3">
                <div class="form-check custom-checkbox">
                  <input type="checkbox" class="form-check-input" id="agreeCheck">
                  <label class="form-check-label" for="agreeCheck"><span
                        class="fs-5">I agree to the <a
                          href="terms-condition-page.html">Terms of
                          Service </a>and
                        <a href="terms-condition-page.html">Privacy Policy.</a></span></label>
                </div>
              </div>
              <div>
                <!-- Button -->
                <div class="d-grid">
                  <button id="registerComplete" type="submit" class="btn btn-primary">
                    회원 가입 완료!
                  </button>
                </div>

                <div class="d-md-flex justify-content-between mt-4">
                  <div class="mb-2 mb-md-0">
                    <a href="/project-gpmatching/account/login" class="fs-5">이미 가입하셨나요? 로그인 해주세요 </a>
                  </div>
                  <div>
                    <a href="/project-gpmatching/account/forgetPassword" class="text-inherit
                        fs-5">비밀번호를 잊으셨나요?</a>
                         <!-- 비밀번호 찾기 -->
                  </div>

                </div>
              </div>

            </form:form>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  
  <script>
	
	$(function () {
		
		let dupChecked = false;		// 중복검사 실행여부를 저장하는 변수
		
		$("#checkDup").on("click", function(event) {
			event.preventDefault(); // 이벤트 발생 객체의 원래 동작 실행 막기. 그냥 넣어주면됨
			
			const userId = $("#userId").val();
			if (!userId){ // !userId : null or "" 인 경우 true -> 사용자가 입력하지 않은경우
				alert('아이디를 써야 중복검사를 하지');
				$('#userId').focus();
				return;
			}
			
			$.ajax({
				"url": "check-id-dup",
				"method": "get",  //type을 써도됨
				"data" : { "userId" : userId },
				"async" : true,
				"success": function(data, status, xhr) {   //"success" 정상적으로 처리됐을때 호출
					if(data == "true"){
						dupChecked = true;  //중복체크
						alert("사용 가능한 아이디");
					}else{
						dupChecked = false;
						alert("이미 사용중이다");
					}
				},
				"error": function(xhr, status, err){	//"error" 정상적이지 않을때 호출
					alert("error");
				}
			});
		});
		
		$('#registerComplete').on('click', function(event){
			event.preventDefault(); //이벤트 발생 객체의 원래 동작 실행 막기 
			
			if(!dupChecked){
				alert("아이디 중복검사 안하냐");
				return;
			}
			
			$("#registerform").submit(); //중복검사 됐을때만 submit
			
		});
		
		$('#userId').on('keyup', function(){  //키보드를 손대면 다시 중복검사 ,( keyup, keydown )
			dupChecked = false;
		});
		
	});
	
	</script>

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
</body>

</html>