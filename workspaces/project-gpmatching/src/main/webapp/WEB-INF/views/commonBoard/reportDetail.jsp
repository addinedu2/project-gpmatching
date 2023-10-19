<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	


<!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon" href="/project-gpmatching/resources/assets/images/favicon/favicon.ico">
<!-- Theme CSS -->
<link rel="stylesheet" href="/project-gpmatching/resources/assets/css/theme.min.css">
<link rel="stylesheet" href="/project-gpmatching/resources/assets/css/theme.css">

<!-- Libs CSS -->
<link href="/project-gpmatching/resources/assets/libs/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link href="/project-gpmatching/resources/assets/libs/dropzone/dist/dropzone.css" rel="stylesheet">
<link href="/project-gpmatching/resources/assets/libs/@mdi/font/css/materialdesignicons.min.css" rel="stylesheet" />
<link href="/project-gpmatching/resources/assets/libs/prismjs/themes/prism-okaidia.css" rel="stylesheet">

<title>게시판글쓰기</title>
	
</head>
<body class="bg-dark">

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
		               
		                  <h3 class="mb-0 fw-bold text-light">게시물 상세 보기</h3>
		           
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
		                
		                	<span class="text-uppercase fw-medium text-darks-5 ls-2">제목</span>
			                <!-- text -->
			                <h4 class="card-title">${reportBoard.commonTitle }</h4>
		                
		                	<div class="d-flex align-items-center">
		                      <!-- <div>
		                        <img src="../assets/images/avatar/avatar-1.jpg" alt="" class="avatar avatar-md rounded-circle">
		                      </div> -->
		                      <div>
		                        <h5 class="mb-0 fw-bold">${reportBoard.nickname }</h5>
		                        <p class="mb-0"><fmt:formatDate value="${reportBoard.regDate }" pattern="yyyy-MM-dd" /></p>
		                      </div>
		                    </div>
		                    <br>
		                    
							
		                    
		                    <div class="row">
			                      <!-- text -->
			                    <div class="col-6 mb-5">
			                      <h6 class="text-uppercase fs-5 ls-2">글번호 </h6>
			                      <p class="mb-0">${requestScope.reportBoard.commonNo }</p>
			                    </div>
			                    <div class="col-6 mb-5">
			                      <h6 class="text-uppercase fs-5 ls-2">조회수</h6>
			                      <p class="mb-0">${reportBoard.readCount }</p>
			                    </div>
			                 </div>
			                
			                <!-- attach -->
			                <div>
			                	<c:forEach var="attach" items="${ reportBoard.boardAttachList }">
		                			첨부파일 : <a href="download?boardAttachNo=${ attach.boardAttachNo }">${ attach.userFilename }</a>
		                			[${attach.downloadCount }]<br>
		                		</c:forEach>
			                </div>
			                
<c:set var="enter" value="
" />		
			                <span class="text-uppercase fw-medium text-darks-5 ls-2">본문</span>
			                <!-- text -->
			                <p class="mt-2 mb-6">${fn:replace(reportBoard.commonContent,enter,"<br>") }</p>
		                	
		                </div>
		              </div>
		             
		            	<br>
			            <div class="btn-center" >
				        	<a href="reportList?pageNo=${pageNo}">
				        	<button type="button" class="btn btn-primary btn-group-sm mb-2" aria-label="Small button group">목록</button>
				        	</a>
				        	
				        </div>
		            
		            </div>
	            
		          </div>
		          
		        </div>
		       	

		        
		<!-- write comment area -->
				<!-- card -->
				<div class="card">
					<!-- card body -->
					<div class="card-body">

						<form id="commentform" action="writeComment" method="post">
							<input type="hidden" name="commonNo" value="${ reportBoard.commonNo }" />
							<input type="hidden" name="pageNo" value="${ pageNo }" />
							<input type="hidden" name="userNo" value="${ loginuser.userNo }" />
							<table style="margin: 0 auto">
								<tr>
									<td style="width: 750px">
										<div class="col-md-8 col-xxl-9  mt-0 mt-md-3"
											style="width: 100%; resize: none;">
											<textarea class="form-control" aria-describedby="name" id="commentContent" name="commentContent"
													  style="width: 100%; resize: none;"></textarea>
										</div>
									</td>
									<td style="vertical-align: middle">
									<a id="write-comment-lnk" href="javascript:" style="text-decoration: none; resize: none;">
											<button type="button" class="btn btn-primary">등록</button>
									</a></td>
								</tr>
							</table>
						</form>


						<!-- end of write comment area -->
						<!-- comment list area -->

						<div class="col-xl-12 col-lg-12 col-md-12 col-12">
							<div class="card h-100">
								<br>
								<!-- <hr style="width:100%;margin:0 auto"> -->
								<div class="table-responsive">
									<table class="table text-nowrap" id="comment-list">
										<tbody>
											<c:forEach var="comment"
												items="${ reportBoard.boardCommentList }">
												<tr>
													<td class="align-middle">
														<div id="comment-view-area-${ comment.commentNo }" style="padding-left: ${comment.depth * 20}px;">
															<!-- 여기에 패딩 left 넣어서 들어가는거 처리 -->
															<c:choose>
																<c:when test="${ comment.deleted }">
																	<br><br>
																	<span style='color: gray'>삭제된 댓글입니다.</span>
																	<br><br>
																</c:when>

																<c:otherwise>
																	<div style="float: left">
																		${ comment.nickname } &nbsp;&nbsp; 
																		[<fmt:formatDate value="${ comment.regDate }" pattern="yyyy-MM-dd" />]
																		<br /> <br /> 
																		<span>${ fn:replace(comment.commentContent, enter, "<br>") }</span>
																	</div>
																	<div class="dropdown dropstart " style="float: right; align: middle">
																		<a class="text-muted text-primary-hover" href="#"
																			role="button" id="dropdownTeam${ comment.commentNo }"
																			data-bs-toggle="dropdown" aria-haspopup="true"
																			aria-expanded="false"> <i class="icon-xxs"
																			data-feather="more-vertical"></i>
																		</a>
																	<%-- <div class="dropdown-menu"
																			aria-labelledby="dropdownTeam${ comment.commentNo }">
																			<div class="dropdown-item"
																				style='display:${ (not empty loginuser and loginuser.userNo == comment.userNo) ? "block" : "none" }'>
																				<a class="edit-comment"
																					data-comment-no="${ comment.commentNo }"
																					href="javascript:" style="color: inherit;">수정</a>

																			</div>
																			<div class="dropdown-item"
																				style='display:${ (not empty loginuser and loginuser.userNo == comment.userNo) ? "block" : "none" }'>
																				<a class="delete-comment"
																					data-comment-no="${ comment.commentNo }"
																					href="javascript:" style="color: inherit;">삭제</a>

																			</div>
																			<span style="clear: both"></span>
																		</div>
																	</div>
																	<div
																		style='float:right;aligh:middle; display:${ not empty loginuser ? "" : "none" }'>
																		<a class="write-recomment"
																			data-comment-no="${ comment.commentNo }"
																			href="javascript:" style="color: inherit;">답글</a>
																		&nbsp;
																	</div> --%>
																	<span style="clear: both"></span>

																</c:otherwise>
															</c:choose>
														</div>

														<div id="comment-edit-area-${ comment.commentNo }"
															style="display: none">
															${ comment.nickname } &nbsp;&nbsp; 
															[<fmt:formatDate value="${ comment.regDate }" pattern="yyyy-MM-dd" />]
															<br /> <br />
															<form action="editComment" method="post">
																<input type="hidden" name="commentNo" value="${ comment.commentNo }">
																<input type="hidden" name="commonNo" value="${ reportBoard.commonNo }">
																<input type="hidden" name="pageNo" value="${ pageNo }">
																<div class="col-md-8 col-xxl-9  mt-0 mt-md-3" style="width: 99%; resize: none;" rows="3">
																	<textarea class="form-control" aria-describedby="name"
																			  name="commentContent" style="resize: none;" rows="3">${ comment.commentContent }</textarea>
																</div>
															</form>
															<br />
															<div>
																<a class="update-comment" data-comment-no="${ comment.commentNo }" href="javascript:">수정</a> &nbsp;
																<a class="cancel-edit-comment" data-comment-no="${ comment.commentNo }" href="javascript:">취소</a>
															</div>
														</div>

													</td>
												</tr>
											</c:forEach>
										</tbody>

									</table>
								</div>
							</div>
							<!-- end of comment list area -->

						</div>

					</div>
				</div>
		 
		</div>

	</div>

	
	
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
		if (yn) { /* 여기서 BoardCommentController.java 의 /deleteComment에 연결시킬 것 */
			location.href = 'deleteComment?commentNo=' + commentNo + 
										  '&commonNo=' + ${ commonBoard.commonNo } + 
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

});
 </script>


<!-- Theme JS -->
<script src="/project-gpmatching/resources/assets/js/theme.min.js"></script>
<script src="/project-gpmatching/resources/assets/js/common.js"></script>

</body>
</html>