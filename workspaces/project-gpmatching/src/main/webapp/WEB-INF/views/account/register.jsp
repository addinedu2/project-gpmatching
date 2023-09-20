<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">



<!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon" href="/project-gpmatching/resource/assets/images/favicon/favicon.ico">

<!-- Libs CSS -->


<link href="/project-gpmatching/resource/assets/libs/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link href="/project-gpmatching/resource/assets/libs/dropzone/dist/dropzone.css"  rel="stylesheet">
<link href="/project-gpmatching/resource/assets/libs/@mdi/font/css/materialdesignicons.min.css" rel="stylesheet" />
<link href="/project-gpmatching/resource/assets/libs/prismjs/themes/prism-okaidia.css" rel="stylesheet">








<!-- Theme CSS -->
<link rel="stylesheet" href="/project-gpmatching/resource/assets/css/theme.min.css">
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
              <a href="/project-gpmatching/resource/index.html"><img src="/project-gpmatching/resource/assets/images/brand/logo/logo-primary.svg" class="mb-2" alt=""></a>
              <p class="mb-6">Please enter your user information.</p>

            </div>      
            <!-- Form -->
         
            <form:form id="registerform" action="register" method="post" modelAttribute="user">
              <!-- userId -->
              <div class="mb-3">
                <label for="userId" class="form-label">User Id</label>
                <input type="text" id="userId" class="form-control" name="userId" placeholder="User Name" >
              </div>
              <!-- Password -->
              <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" id="userPwd" class="form-control" name="userPwd" placeholder="**************" required="">
              </div>
              <!-- Password -->
              <div class="mb-3">
                <label for="confirm-password" class="form-label">Confirm
                    Password</label>
                <input type="password" id="confirm-password" class="form-control" name="confirm-password" placeholder="**************" required="">
              </div>
              <!-- Email -->
              <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" id="userEmail" class="form-control" name="userEmail" placeholder="Email address here" required="">
              </div>
              <!-- nickname -->
              <div class="mb-3">
                <label for="nickname" class="form-label">Nick Name</label>
                <input type="text" id="nickname" class="form-control" name="nickname" placeholder="닉네임을넣어주세요" required="">
              </div>
              <!-- userPhone -->
              <div class="mb-3">
                <label for="userPhone" class="form-label">userPhone</label>
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
                  <button type="submit" class="btn btn-primary">
                    Create Free Account
                  </button>
                </div>

                <div class="d-md-flex justify-content-between mt-4">
                  <div class="mb-2 mb-md-0">
                    <a href="sign-up.html" class="fs-5">Already
                        member? Login </a>
                  </div>
                  <div>
                    <a href="forget-password.html" class="text-inherit
                        fs-5">Forgot your password?</a>
                  </div>

                </div>
              </div>

            </form:form>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Scripts -->
  <!-- Libs JS -->
<script src="/project-gpmatching/resource/assets/libs/jquery/dist/jquery.min.js"></script>
<script src="/project-gpmatching/resource/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="/project-gpmatching/resource/assets/libs/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="/project-gpmatching/resource/assets/libs/feather-icons/dist/feather.min.js"></script>
<script src="/project-gpmatching/resource/assets/libs/prismjs/prism.js"></script>
<script src="/project-gpmatching/resource/assets/libs/apexcharts/dist/apexcharts.min.js"></script>
<script src="/project-gpmatching/resource/assets/libs/dropzone/dist/min/dropzone.min.js"></script>
<script src="/project-gpmatching/resource/assets/libs/prismjs/plugins/toolbar/prism-toolbar.min.js"></script>
<script src="/project-gpmatching/resource/assets/libs/prismjs/plugins/copy-to-clipboard/prism-copy-to-clipboard.min.js"></script>




<!-- Theme JS -->
<script src="/project-gpmatching/resource/assets/js/theme.min.js"></script>
</body>

</html>