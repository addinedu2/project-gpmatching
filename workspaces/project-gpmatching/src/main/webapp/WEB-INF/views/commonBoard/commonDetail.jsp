<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<title>게시판글쓰기</title>
	
</head>
<body class="bg-light">

	<div id="db-wrapper" class="toggled">
		<!-- navbar vertical -->
		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/modules/sidebar.jsp" />
		<!-- page content -->
		<div id="page-content">
			<!--  header -->
			<jsp:include page="/WEB-INF/views/modules/header.jsp" />

			<div class="container-fluid p-6">
			
				<div class="row">
		          <div class="col-lg-12 col-md-12 col-12">
		            <!-- Page header -->
		           
		              <div class="border-bottom pb-4 mb-4 ">
		               
		                  <h3 class="mb-0 fw-bold">게시물 상세 보기</h3>
		           
		            </div>
		          </div>
		        </div>
			
				<div class="py-6">
		          <!-- row -->
		          <div class="row">
		          	<div class="col-xl-12 col-md-12 col-12 mb-6">
		              <!-- card -->
		              <div class="card">
		                <!-- card body -->
		                <div class="card-body">
		                
		                	<div class="d-flex align-items-center">
		                      <!-- <div>
		                        <img src="../assets/images/avatar/avatar-1.jpg" alt="" class="avatar avatar-md rounded-circle">
		                      </div> -->
		                      <div class="ms-3">
		                        <h5 class="mb-0 fw-bold">${commonBoard.userNo }</h5>
		                        <p class="mb-0"><fmt:formatDate value="${commonBoard.regDate }" pattern="yyyy-MM-dd" /></p>
		                      </div>
		                    </div>
		                    <br>
		                    

		                    
		                    <div class="row">
			                      <!-- text -->
			                    <div class="col-6 mb-5">
			                      <h6 class="text-uppercase fs-5 ls-2">글번호 </h6>
			                      <p class="mb-0">${requestScope.commonBoard.commonNo }</p>
			                    </div>
			                    <div class="col-6 mb-5">
			                      <h6 class="text-uppercase fs-5 ls-2">조회수</h6>
			                      <p class="mb-0">${commonBoard.readCount }</p>
			                    </div>
			                 </div>
			                <span class="text-uppercase fw-medium text-darks-5 ls-2">제목</span>
			                <!-- text -->
			                <h4 class="card-title">${commonBoard.commonTitle }</h4>
			                
<c:set var="enter" value="
" />		
			                <span class="text-uppercase fw-medium text-darks-5 ls-2">본문</span>
			                <!-- text -->
			                <p class="mt-2 mb-6">${fn:replace(commonBoard.commonContent,enter,"<br>") }</p>
		                	
		                	
		               
		                  <div class="row">
		                    <!-- <div class="col-xl-1 col-lg-2 col-md-2 col-12 mb-3 mb-lg-0">
		                      avatar
		                      <img src="../assets/images/avatar/avatar-1.jpg" class="avatar avatar-md rounded-circle" alt="">
		                    </div> -->
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
		            
		            	<br>
			            <div class="btn-center" >
				        	<a href="commonList?=pageNo=${pageNo}">
				        	<button type="button" class="btn btn-primary btn-group-sm mb-2" aria-label="Small button group">목록</button>
				        	</a>
				        	
				        	<!-- sessionScope.loginuser != null && loginuser.memberId == board.writer 같은 의미-->
				        	
				        	<a href="commonEdit?commonNo=${commonBoard.commonNo}&pageNo=${pageNo}">
				        	<button type="button" class="btn btn-secondary btn-group-sm mb-2" aria-label="Small button group">수정</button>
				        	</a>
		
				        	
				        	<a href="javascript:" id="delete-board-lnk">
				        	<button type="button" class="btn btn-danger btn-group-sm mb-2" aria-label="Small button group">삭제</button>
				        	</a>
				        	
		
				        
				        </div>
		            
		            </div>
	            
		          </div>
		          
		        </div>

		        
		<!-- write comment area -->
		<form id="commentform" action="writeComment" method="post">
			<input type="hidden" name="commonNo" value="${ commonBoard.commonNo }" />
			<input type="hidden" name="pageNo" value="${ pageNo }" />
			<%-- <input type="hidden" name="userNo" value="${ userNo}" /> --%>
			<table style="width:800px;border:solid 1px;margin:0 auto">
				<tr>
					<td style="width:750px">	                	
						<textarea id="commentContent" name="commentContent" style="width:100%;resize: none;" rows="3"></textarea>	                    
					</td>
					<td style="width:50px;vertical-align:middle">
						<a id="write-comment-lnk" href="javascript:" style="text-decoration:none">
							댓글<br />등록
						</a>
					</td>
				</tr>                    
			</table>
		</form>
	
		<!-- end of write comment area -->
		
		 
		</div>

	</div>

	
	
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


	<script>
	 $(function(event) {
		
		$('#delete-board-lnk').on('click', function(event) {
			const yes = confirm(${ commonBoard.commonNo } + "번 게시물을 삭제할까요?");
			if (yes) {
				location.href = 'deleteCommon/' + ${ commonBoard.commonNo } + "?pageNo=" + ${ pageNo };
			}
		});
		
		// 댓글 쓰기 이벤트 처리
		$("#write-comment-lnk").on("click", function(event) {
			$('#commentform').submit(); // <input type="submit"을 클릭한 것과 같은 효과 --> form을 submit
		});
		
		// 댓글 삭제 이벤트 처리
		$(".delete-comment").on('click', function(event) {
			const commentNo = $(this).attr("data-comment-no");			
			const yn = confirm(commentNo + "번 댓글을 삭제할까요?");
			if (yn) {
				location.href = 'delete-comment?commentNo=' + commentNo + 
											  '&boardNo=' + ${ commonBoard.commonNo } + 
											  '&pageNo=' + ${ pageNo };
			}
		});

		
		let currentEditCommentNo = null;
		
		// 편집 링크 클릭 이벤트 처리
		$(".edit-comment").on('click', function(event) {
			const commentNo = $(this).attr("data-comment-no");
			
			$('#comment-edit-area-' + commentNo).css('display', '');
			$('#comment-view-area-' + commentNo).css('display', 'none');
			
			if (currentEditCommentNo) { // 이전에 편집하던 요소의 표시 상태 변경 (복원)
				$('#comment-edit-area-' + currentEditCommentNo).css('display', 'none');
				$('#comment-view-area-' + currentEditCommentNo).css('display', '');
			}
			currentEditCommentNo = commentNo;
			
		}); // end of addEventListener

		
		// 편집 취소 링크 클릭 이벤트 처리
		$(".cancel-edit-comment").on('click', function(event) {
			const commentNo = $(this).attr("data-comment-no");
			
			$('#comment-edit-area-' + commentNo).css('display', 'none');
			$('#comment-view-area-' + commentNo).css('display', '');
			
			currentEditCommentNo = null;
			
		}); // end of addEventListener
		
		// 댓글 수정 이벤트 처리
		$(".update-comment").click(function(event) {

			// const commentNo = $(this).attr("data-comment-no");
			const commentNo = $(this).data('comment-no'); // data-속성이름="값" 으로 표현된 속성의 값 읽기
			$('#comment-edit-area-' + commentNo + ' form').submit();
			
		});

	});</script>
	

	<!-- Theme JS -->
	<script src="/project-gpmatching/resources/assets/js/theme.min.js"></script>
	

</body>
</html>