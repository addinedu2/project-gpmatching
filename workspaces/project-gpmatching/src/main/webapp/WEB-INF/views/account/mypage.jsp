<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
  <title>Profile Overview | Dash Ui - Bootstrap 5 Admin Dashboard Template</title>
</head>

<body class="bg-light"> 
  <div id="db-wrapper">
    <!-- navbar vertical -->
     <jsp:include page="/WEB-INF/views/modules/sidebar.jsp" />
     
    <!-- page content -->
    <div id="page-content">
      <div class="header @@classList">

  		<jsp:include page="/WEB-INF/views/modules/header.jsp" />
  
     </div>
      <jsp:include page="/WEB-INF/views/account/modules/mypage-header.jsp" />
        
        
      
        
        <!-- content -->
        <div class="py-6">
          <!-- row -->
          <div class="row">
          
            <div class="col-xl-6 col-lg-12 col-md-12 col-12 mb-6">
              <!-- card -->
              <div class="card">
                <!-- card body -->
                <div class="card-body">
                  <!-- card title -->
                  <h4 class="card-title">내 정보</h4>
                  <span class="text-uppercase fw-medium text-dark
                      fs-5 ls-2">소개</span>
                  <!-- text -->
                  <p class="mt-2 mb-6">나는 커피도둑
                  </p>
                  <!-- row -->
                  <div class="row">
                    <div class="col-12 mb-5">
                      <!-- text -->
                      <h6 class="text-uppercase fs-5 ls-2">Position
                      </h6>
                      <p class="mb-0">어쩌라고</p>
                    </div>
                    <div class="col-6 mb-5">
                      <h6 class="text-uppercase fs-5 ls-2">Phone </h6>
                      <p class="mb-0">${loginuser.userPhone}</p>
                    </div>
                    <div class="col-6 mb-5">
                      <h6 class="text-uppercase fs-5 ls-2">가입일자</h6>
                      <p class="mb-0"><fmt:formatDate value="${loginuser.regDate}" pattern="yyyy-MM-dd"/></p>
                    </div>
                    <div class="col-6">
                      <h6 class="text-uppercase fs-5 ls-2">이메일 </h6>
                      <p class="mb-0">${loginuser.userEmail}</p>
                    </div>
                    <div class="col-6">
                      <h6 class="text-uppercase fs-5 ls-2">userGrade
                      </h6>
                      <p class="mb-0">${loginuser.userGrade}</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-xl-6 col-lg-12 col-md-12 col-12 mb-6">
              <!-- card -->
              <div class="card">
              
                <!-- card body -->
                <!-- 내가 쓴 글 만 보 기 -->
				<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
				
				
				  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
				  <label class="btn btn-outline-primary" for="btnradio1">매칭게시판</label>
				
				  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
				  <label class="btn btn-outline-primary" for="btnradio2">자유게시판</label>
				
				  
				</div>
                <div id="write-Board-List">
                
                  	
					<table >
					   <thead>
					      <tr class="listCommon" >
					     
					         <th>제목</th>
					         <th>작성일자</th>
					      </tr>
					   </thead>
					   <tbody>
					   <c:forEach var="writeBoardList" items="${requestScope.myPageView }">
					   	  <tr>
					         <td>${ writeBoardList.commonTitle }</td>
					         <td>
					         	<fmt:formatDate value="${ writeBoardList.regDate }"
					         				    pattern="yyyy-MM-dd"/>
					         </td>
					      </tr>
					      </c:forEach>
					   </tbody>
					</table>
					
                </div>
                <!-- 내가쓴글만보기 -->
              </div>
            </div>
            
            
            <div class="col-xl-6 col-md-12 col-12 mb-6">
              <!-- card -->
              <div class="card">
                <!-- card body -->
                <div class="card-body">
                  <div class="d-flex justify-content-between mb-5
                      align-items-center">
                    <!-- avatar -->
                    <div class="d-flex align-items-center">
                      <div>
                        <img src="/project-gpmatching/resources/assets/images/avatar/avatar-1.jpg" alt="" class="avatar avatar-md rounded-circle">
                      </div>
                      <div class="ms-3">
                        <h5 class="mb-0 fw-bold">Jitu Chauhan</h5>
                        <p class="mb-0">19 minutes ago</p>
                      </div>
                    </div>
                    <div>
                      <!-- dropdown -->
                      <div class="dropdown dropstart">
                        <a href="#" class="text-muted text-primary-hover" id="dropdownprojectFive" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <i data-feather="more-vertical" class="icon-xxs"></i>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="dropdownprojectFive">
                          <a class="dropdown-item" href="#">Action</a>
                          <a class="dropdown-item" href="#">Another action</a>
                          <a class="dropdown-item" href="#">Something else
                              here</a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="mb-4">
                    <!-- text -->
                    <p class="mb-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspen disse var ius enim in eros elementum tristique. Duis cursus, mi quis viverra ornare, eros dolor interdum nulla, ut commodo diam libero vitae erat.</p>
                    <img src="/project-gpmatching/resources/assets/images/blog/blog-img-1.jpg" class="rounded-3 w-100" alt="">
                  </div>
                  <!-- icons -->
                  <div class="mb-4">
                    <span class="me-1 me-md-4"><i data-feather="heart"
                          class="icon-xxs text-muted me-2"></i><span>20 Like</span></span>
                    <span class="me-1 me-md-4"><i
                          data-feather="message-square" class="icon-xxs
                          text-muted me-2"></i><span>12 Comment</span></span>
                    <span><i data-feather="share-2" class="icon-xxs
                          text-muted me-2"></i><span>Share</span></span>
                  </div>
                  <div class="border-bottom border-top py-5 d-flex
                      align-items-center mb-4">
                    <!-- avatar group -->
                    <div class="avatar-group me-2 me-md-3">
                      <span class="avatar avatar-sm">
                            <!-- img -->
                          <img alt="avatar"
                            src="/project-gpmatching/resources/assets/images/avatar/avatar-7.jpg"
                            class="rounded-circle">
                        </span>
                      <span class="avatar avatar-sm">
                             <!-- img -->
                          <img alt="avatar"
                            src="/project-gpmatching/resources/assets/images/avatar/avatar-8.jpg"
                            class="rounded-circle">
                        </span>
                      <span class="avatar avatar-sm">
                             <!-- img -->
                          <img alt="avatar"
                            src="/project-gpmatching/resources/assets/images/avatar/avatar-9.jpg"
                            class="rounded-circle">
                        </span>
                    </div>
                    <div><span>You and 20 more liked this</span></div>
                  </div>
                  <!-- row -->
                  <div class="row">
                    <div class="col-xl-1 col-lg-2 col-md-2 col-12 mb-3 mb-lg-0">
                      <!-- avatar -->
                      <img src="/project-gpmatching/resources/assets/images/avatar/avatar-1.jpg" class="avatar avatar-md rounded-circle" alt="">
                    </div>
                    <!-- input -->
                    <div class="col-xl-11 col-lg-10 col-md-9 col-12 ">

                      <div class="row g-3 align-items-center">
                        <div class="col-md-2 col-xxl-1">
                          <label for="name" class="col-form-label ">Name</label>
                        </div>
                        <div class="col-md-8 col-xxl-9  mt-0 mt-md-3">
                          <input type="password" id="name" class="form-control" aria-describedby="name">
                        </div>
                        <div class="col-md-2 col-xxl-2">
                          <button type="submit" class="btn btn-primary">Post</button>
                        </div>
                      </div>

                    </div>

                  </div>
                </div>
              </div>
            </div>
            <div class="col-xl-6 col-lg-12 col-md-12 col-12 mb-6">
              <!-- card -->
              <div class="card mb-4">
                <!-- card body -->
                <div class="card-body">
                  <!-- card title -->
                  <h4 class="card-title">My Team</h4>
                  <div class="d-flex justify-content-between
                      align-items-center mb-4">
                    <div class="d-flex align-items-center">
                      <!-- img -->
                      <div>
                        <img src="/project-gpmatching/resources/assets/images/avatar/avatar-1.jpg" class="rounded-circle avatar-md" alt="">
                      </div>
                      <!-- text -->
                      <div class="ms-3 ">
                        <h5 class="mb-1">Dianna Smiley</h5>
                        <p class="text-muted mb-0 fs-5 text-muted">UI / UX Designer
                        </p>
                      </div>
                    </div>
                    <div>
                      <a href="#" class="text-muted text-primary-hover"><i
                            class="me-4 icon-xs" data-feather="phone-call"></i></a>
                      <a href="#" class="text-muted text-primary-hover"><i
                            class="icon-xs" data-feather="video"></i></a>
                    </div>
                  </div>
                  <div class="d-flex justify-content-between
                      align-items-center mb-4">
                    <div class="d-flex align-items-center">
                      <!-- img -->
                      <div>
                        <img src="/project-gpmatching/resources/assets/images/avatar/avatar-2.jpg" class="rounded-circle avatar-md" alt="">
                      </div>
                      <!-- content -->
                      <div class="ms-3 ">
                        <h5 class="mb-1">Anne Brewer</h5>
                        <p class="text-muted mb-0 fs-5 text-muted">Senior UX Designer
                        </p>
                      </div>
                    </div>
                    <div>
                      <!-- icons -->
                      <a href="#" class="text-muted text-primary-hover"><i
                            class="me-4 icon-xs" data-feather="phone-call"></i></a>
                      <a href="#" class="text-muted text-primary-hover"><i
                            class="icon-xs" data-feather="video"></i></a>
                    </div>
                  </div>
                  <div class="d-flex justify-content-between
                      align-items-center mb-4">
                    <div class="d-flex align-items-center">
                      <!-- img -->
                      <div>
                        <img src="/project-gpmatching/resources/assets/images/avatar/avatar-3.jpg" class="rounded-circle avatar-md" alt="">
                      </div>
                      <!-- text -->
                      <div class="ms-3 ">
                        <h5 class="mb-1">Richard Christmas
                        </h5>
                        <p class="text-muted mb-0 ">Front-End Engineer</p>
                      </div>
                    </div>
                    <div>
                      <!-- icons -->
                      <a href="#" class="text-muted text-primary-hover"><i
                            class="me-4 icon-xs" data-feather="phone-call"></i></a>
                      <a href="#" class="text-muted text-primary-hover"><i
                            class="icon-xs" data-feather="video"></i></a>
                    </div>
                  </div>
                  <div class="d-flex justify-content-between
                      align-items-center">
                    <!-- img -->
                    <div class="d-flex align-items-center">
                      <div>
                        <img src="/project-gpmatching/resources/assets/images/avatar/avatar-4.jpg" class="rounded-circle avatar-md" alt="">
                      </div>
                      <!-- text -->
                      <div class="ms-3 ">
                        <h5 class="mb-1">Nicholas Binder
                        </h5>
                        <p class="text-muted mb-0 fs-5 ">Content Marketing Manager</p>
                      </div>
                    </div>
                    <div>
                      <a href="#" class="text-muted text-primary-hover"><i
                            class="me-4 icon-xs" data-feather="phone-call"></i></a>
                      <a href="#" class="text-muted text-primary-hover"><i
                            class="icon-xs" data-feather="video"></i></a>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-12">
                  <!-- card -->
                  <div class="card">
                    <!-- card body -->
                    <div class="card-body">
                      <!-- card title -->
                      <h4 class="card-title">Activity Feed</h4>

                      <div class="d-flex mb-5">
                        <!-- img -->
                        <div>
                          <img src="/project-gpmatching/resources/assets/images/avatar/avatar-6.jpg" class="rounded-circle avatar-md" alt="">
                        </div>
                        <!-- content -->
                        <div class="ms-3 ">
                          <h5 class="mb-1">Dianna Smiley</h5>
                          <p class="text-muted mb-2">Just create a new Project in Dashui...
                          </p>
                          <p class="fs-5 mb-0">2m ago</p>
                        </div>
                      </div>
                      <div class="d-flex mb-5">
                        <!-- img -->
                        <div>
                          <img src="/project-gpmatching/resources/assets/images/avatar/avatar-7.jpg" class="rounded-circle avatar-md" alt="">
                        </div>
                        <!-- content -->
                        <div class="ms-3 ">
                          <h5 class="mb-1">Irene Hargrove</h5>
                          <p class="text-muted mb-2">Comment on Bootstrap Tutorial Says Hi, I m irene...
                          </p>
                          <p class="fs-5 mb-0">1hour ago</p>
                        </div>
                      </div>
                      <div class="d-flex">
                        <!-- img -->
                        <div>
                          <img src="/project-gpmatching/resources/assets/images/avatar/avatar-9.jpg" class="rounded-circle avatar-md" alt="">
                        </div>
                        <!-- content -->
                        <div class="ms-3 ">
                          <h5 class="mb-1">Trevor Bradley</h5>
                          <p class="text-muted mb-2">Just share your article on Social Media..
                          </p>
                          <p class="mb-0 fs-5 text-muted">2month ago</p>
                        </div>
                      </div>
                    </div>
                  </div>
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

<script>

$(function(event){
	
	$('input[name="btnradio"]').on('click', function(event){
		
		//let selectBtn = $('input[name="btnradio"]:checked').val();
		let loginUser = "${loginUser.userNo}";
		//alert(loginUser);
		
		$.ajax({
			"url":"boardSelect",
			"method": "get",
			"data":  {"loginUser" : loginUser } ,
			"success": function(result){
				
				console.log(loginUser);
				
				var myBoardList = $('#write-Board-List');
				myBoardList.empty();
				if (result != null){
					
					console.log(result);
					
					// 테이블 헤더 추가
	                var $headerRow = $("<tr>");
	                
	                $headerRow.append($("<th>").text("제목"));
	                $headerRow.append($("<th>").text("작성일자"));
	                
	                myBoardList.append($headerRow);
	                
					for(var i = 0; i < result.length; i++){
						var $row = $("<tr>");
	                    
	                    $row.append($("<td>").text(result[i].commonTitle));
	                    $row.append($("<td>").text(result[i].regDate));
	                    
	                    myBoardList.append($row);
	                    
					}
					
					
				}
				
			},
			"error": function(xhr, status, err){
				alert("실패");
			}
		});
		
	});
	
	 
	$('.nav-link').click(function(event) {
		    // 모든 nav-link에서 'active' 클래스 제거
		    $('.nav-link').removeClass('active');

		    // 현재 클릭한 nav-link에 'active' 클래스 추가
		    $(this).addClass('active');
	});
	 	
});



</script>

</body>

</html>