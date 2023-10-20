<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
  <title>register | 회원가입</title>
  
        <style>
        .flexBox {
            display: flex;
            justify-content: space-between;
        }
    </style>
    
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
              <p class="mb-6">회원 정보를 입력해주세요.</p>
            </div>      
            <!-- Form -->
         
            <form id="registerform" action="register" method="post" enctype="multipart/form-data">
              <!-- userId -->
              <div class="mb-3">
					<label for="userId" class="form-label">회원 ID</label>
					<div class="input-group">
						<input type="text" id="userId" class="form-control" name="userId" placeholder="회원 ID" required>
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
                <label for="userPwd" class="form-label">회원 비밀번호</label>
                <input type="password" id="userPwd" class="form-control" name="userPwd" required oninput="checkPassword()">
                
              </div>
              <!-- Password -->
              <div class="mb-3">
                <label for="confirmPassword" class="form-label">회원 비밀번호 확인</label>
                <input type="password" id="confirmPassword" class="form-control" name="confirm-password" required oninput="checkPassword()">
                
              </div>
              <p id="passwordCheck"></p>
              
              <!-- Email -->
              <div class="mb-3">
                <label for="userEmail" class="form-label">이메일</label>
                <input type="text" id="userEmail" class="form-control" name="userEmail" placeholder="Email address here" required>
              </div>
              
              <!-- nickname -->
              <div class="mb-3">
                <label for="nickname" class="form-label">닉네임</label>
                <input type="text" id="nickname" class="form-control" name="nickname" placeholder="닉네임을넣어주세요" required>
              </div>
              
              <!-- userPhone -->
              <div class="mb-3">
                <label for="userPhone" class="form-label">핸드폰 번호</label>
                <input type="text" id="userPhone" class="form-control" name="userPhone" placeholder="000-0000-0000" required>
              </div>
              
              <div class="mb-3">
		           <label for="imageInput" class="form-label">
		               <img id="preview" src="/project-gpmatching/resources/assets/images/avatar/anonymous.png" width="100" height="100">
		           </label>
		           <input type="file" id="imageInput" name="imageName" style="display: none;" accept="image/*" onchange="readURL(this);" />
       	       </div>   
              
              
              
              
              <!-- Checkbox -->
              <div class="mb-3">
                <div class="form-check custom-checkbox">
                  <input type="checkbox" class="form-check-input" id="agreeCheck">
                  <label class="form-check-label" for="agreeCheck">
                  	<span class="fs-5">I agree to the <a href="terms-condition-page.html">Terms of Service </a>and <a href="terms-condition-page.html">Privacy Policy.</a></span>
                  </label>
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
            </form>
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

   <script>
      //프로필 이미지 
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
		
		let dupChecked = false;		// 중복검사 실행여부를 저장하는 변수
		
		$("#checkDup").on("click", function(event) {
			event.preventDefault(); // 이벤트 발생 객체의 원래 동작 실행 막기. 그냥 넣어주면됨
			
			const userId = $("#userId").val();
			if (!userId){ // !userId : null or "" 인 경우 true -> 사용자가 입력하지 않은경우
				alert('아이디를 입력하세요');
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
						alert("사용 가능한 아이디 입니다");
					}else{
						dupChecked = false;
						alert("이미 사용중");
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
				const userId = $("#userId").val();
				alert("아이디를 입력하세요");
				$('#userId').focus();
				return;
			}
			
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
			
			const userEmail = $("#userEmail").val();
			if(!userEmail){
				alert('이메일을 입력하세요');
				$('#userEmail').focus();
				return;
			}
			
			const nickname = $("#nickname").val();
			if(!nickname){
				alert('닉네임을 입력하세요');
				$('#nickname').focus();
				return;
			}
			
			if (userPwd != confirmPassword) {
		        alert('비밀번호와 비밀번호 확인이 일치하지 않습니다');
		        $('#confirmPassword').focus();
		        return;
			}
			
			$("#registerform").submit(); //중복검사 됐을때만 submit
			
		});
		
		$('#userId').on('keyup', function(){  //키보드를 손대면 다시 중복검사 ,( keyup, keydown )
			dupChecked = false;
		});
		
	});
	
</script>
	
<script>
		//비밀번호, 비밀번호 확인 일치
		var passwordField = document.getElementById('userPwd');
		var passwordConfirmField = document.getElementById('confirmPassword');
		var registerButton = document.getElementById('registerComplete');
		
		function checkPassword(){
		   var userPwd = passwordField.value;
		   var confirmPassword = passwordConfirmField.value;
		   var passwordCheck = document.getElementById('passwordCheck')
		   
		   
		   
/* 		   var pwdOption = document.getElementById('pwdOption')
		   var SpecialChar = ["!","@","#","$","%"];
		   var checkSpecialChar = 0;
		   
		   if(userPwd.length < 6 || userPwd.length>16) {
			   pwdOption.innerHTML = '비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.';
			   pwdOption.style.color = 'red';          
		   }
		   
		   for(var i=0; i<SpecialChar.length; i++){
		      if(userPwd.indexOf(SpecialChar[i]) != -1){
		         checkSpecialChar = 1;            
		      }          
		   }
		   if(checkSpecialChar == 0){
			   pwdOption.innerHTML = '!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.'  
		   }  
		 
		    $('#register').on('click', function(event){
		    event.preventDefault();
		   
		    if (userPwd != confirmPassword){
		       alert("비밀번호가 일치하지 않습니다");
		       $('#userPwd').focus();
		       return
		    }
		   });  */
		   
		   
		   
		   
		   if(userPwd !== '' && confirmPassword !== ''){
		      if(userPwd === confirmPassword){
		    	 passwordCheck.innerHTML = '비밀번호가 일치합니다.'
		    	 passwordCheck.style.color = 'green';
		         //return true;
		         registerButton.disabled = false;
		      } else {
		    	 passwordCheck.innerHTML = '비밀번호가 일치하지 않습니다.';
		    	 passwordCheck.style.color = 'red';
		         //return false;
		         registerButton.disabled = false;
		        }
		   }
		}
</script>

</body>

</html>