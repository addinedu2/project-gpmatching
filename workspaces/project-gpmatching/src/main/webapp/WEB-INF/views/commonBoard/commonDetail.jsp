<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
									<h4 class="card-title">${commonBoard.commonTitle }</h4>

									<div class="d-flex align-items-center">
										<!-- <div>
		                        <img src="../assets/images/avatar/avatar-1.jpg" alt="" class="avatar avatar-md rounded-circle">
		                      </div> -->
										<div>
											<h5 class="mb-0 fw-bold">${commonBoard.nickname }</h5>
											<p class="mb-0">
												<fmt:formatDate value="${commonBoard.regDate }"
													pattern="yyyy-MM-dd" />
											</p>
										</div>
									</div>
									<br>



									<div class="row">
										<!-- text -->
										<div class="col-6 mb-5">
											<h6 class="text-uppercase fs-5 ls-2">글번호</h6>
											<p class="mb-0">${requestScope.commonBoard.commonNo }</p>
										</div>
										<div class="col-6 mb-5">
											<h6 class="text-uppercase fs-5 ls-2">조회수</h6>
											<p class="mb-0">${commonBoard.readCount }</p>
										</div>
									</div>

									<!-- attach -->
									<div>
										<c:forEach var="attach"
											items="${ commonBoard.boardAttachList }">
		                			첨부파일 : <a
												href="download?boardAttachNo=${ attach.boardAttachNo }">${ attach.userFilename }</a>
		                			[${attach.downloadCount }]<br>
										</c:forEach>
									</div>

									<c:set var="enter" value="
" />
									<span class="text-uppercase fw-medium text-darks-5 ls-2">본문</span>
									<!-- text -->
									<p class="mt-2 mb-6">${fn:replace(commonBoard.commonContent,enter,"<br>") }</p>

								</div>
							</div>


							<br>
							<div class="btn-center">
								<a href="commonList?pageNo=${pageNo}">
									<button type="button" class="btn btn-primary btn-group-sm mb-2"
										aria-label="Small button group">목록</button>
								</a> <a
									href="commonEdit?commonNo=${commonBoard.commonNo}&pageNo=${pageNo}">
									<button type="button"
										class="btn btn-secondary btn-group-sm mb-2"
										aria-label="Small button group">수정</button>
								</a> <a href="javascript:" id="delete-board-lnk">
									<button type="button" class="btn btn-danger btn-group-sm mb-2"
										aria-label="Small button group">삭제</button>
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
							<input type="hidden" name="commonNo"
								value="${ commonBoard.commonNo }" /> <input type="hidden"
								name="pageNo" value="${ pageNo }" /> <input type="hidden"
								name="userNo" value="${ loginuser.userNo }" />
							<table style="margin: 0 auto">
								<tr>
									<td style="width: 750px">
										<div class="col-md-8 col-xxl-9  mt-0 mt-md-3"
											style="width: 100%; resize: none;">
											<textarea class="form-control" aria-describedby="name"
												id="commentContent" name="commentContent"
												style="width: 100%; resize: none;"></textarea>
										</div>
									</td>
									<td style="vertical-align: middle"><a
										id="write-comment-lnk" href="javascript:"
										style="text-decoration: none; resize: none;">
											<button type="button" class="btn btn-primary">등록</button>
									</a></td>
								</tr>
							</table>
						</form>


						<!-- end of write comment area -->
						<!-- comment list area -->
						<!-- <br>
		<hr style="width:825px;margin:0 auto">
		<br> -->


						<!-- 추가삽입 댓글 테이블 -->
						<div class="col-xl-12 col-lg-12 col-md-12 col-12">
							<div class="card h-100">
								<!-- card header  -->
								<!-- <div class="card-header bg-white py-4">
	                <h4 class="mb-0">Teams </h4>
	            </div> -->
								<!-- table  -->
								<br>
								<!-- <hr style="width:100%;margin:0 auto"> -->
								<div class="table-responsive">
									<table class="table text-nowrap" id="comment-list">

										<!-- <thead class="table-light">
	                        <tr>
	                            <th>Name</th>
	                            <th>Role</th>
	                            <th>Last Activity</th>
	                            <th></th>
	                        </tr>
	                    </thead> -->
										<tbody>
											<c:forEach var="comment"
												items="${ commonBoard.boardCommentList }">
												<tr>
													<td class="align-middle">
														<div id="comment-view-area-${ comment.commentNo }"
															style="padding-left: ${comment.depth * 20}px;">
															<!-- 여기에 패딩 left 넣어서 들어가는거 처리 -->
															<c:choose>
																<c:when test="${ comment.deleted }">
																	<br><br>
																	<span style='color: gray'>삭제된 댓글입니다.</span>
																	<br><br>
																</c:when>

																<c:otherwise>
																	<div style="float: left">
																		${ comment.nickname } &nbsp;&nbsp; [
																		<fmt:formatDate value="${ comment.regDate }"
																			pattern="yyyy-MM-dd" />
																		] <br />
																		<br /> <span>${ fn:replace(comment.commentContent, enter, "<br>") }</span>
																	</div>
																	<div class="dropdown dropstart "
																		style="float: right; align: middle">
																		<a class="text-muted text-primary-hover" href="#"
																			role="button" id="dropdownTeam${ comment.commentNo }"
																			data-bs-toggle="dropdown" aria-haspopup="true"
																			aria-expanded="false"> <i class="icon-xxs"
																			data-feather="more-vertical"></i>
																		</a>


																		<div class="dropdown-menu"
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
																	</div>
																	<span style="clear: both"></span>

																</c:otherwise>
															</c:choose>
														</div>

														<div id="comment-edit-area-${ comment.commentNo }"
															style="display: none">
															${ comment.nickname } &nbsp;&nbsp; [
															<fmt:formatDate value="${ comment.regDate }"
																pattern="yyyy-MM-dd" />
															] <br />
															<br />
															<form action="editComment" method="post">
																<input type="hidden" name="commentNo"
																	value="${ comment.commentNo }"> <input
																	type="hidden" name="commonNo"
																	value="${ commonBoard.commonNo }"> <input
																	type="hidden" name="pageNo" value="${ pageNo }">
																<div class="col-md-8 col-xxl-9  mt-0 mt-md-3"
																	style="width: 99%; resize: none;" rows="3">
																	<textarea class="form-control" aria-describedby="name"
																		name="commentContent" style="resize: none;" rows="3">${ comment.commentContent }</textarea>
																</div>
															</form>
															<br />
															<div>
																<a class="update-comment"
																	data-comment-no="${ comment.commentNo }"
																	href="javascript:">수정</a> &nbsp; <a
																	class="cancel-edit-comment"
																	data-comment-no="${ comment.commentNo }"
																	href="javascript:">취소</a>
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
	</div>

	<!-- modal -->
	<div class="modal" id="recomment-modal" tabindex="-1" role="dialog"
		aria-labelledby="recomment-modal-label">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="recomment-modal-label">답글 쓰기</h5>

					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" />
					</button>

				</div>
				<div class="modal-body">

					<form id="recommentform" action="writeRecomment" method="post">
						<input type="hidden" name="commentNo" value="" /> <input
							type="hidden" name="userNo" value="${ loginuser.userNo }" />

						<textarea id="recomment-content" name="commentContent"
							class="form-control" style="resize: none;" rows="3"></textarea>
					</form>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary"
						id="write-recomment-btn">쓰기</button>
				</div>
			</div>
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
		 
		 let currentEditCommentNo = null;
		
		$('#delete-board-lnk').on('click', function(event) {
			const yes = confirm(${ commonBoard.commonNo } + "번 게시물을 삭제할까요?");
			if (yes) {
				location.href = 'deleteCommon/' + ${ commonBoard.commonNo } + "?pageNo=" + ${ pageNo };
			}
		});//delete
		
		// 댓글 쓰기 이벤트 처리
		$("#write-comment-lnk").on("click", function(event) {
			const formData = $('#commentform').serialize(); // <input type="submit"을 클릭한 것과 같은 효과 --> form을 submit
			
			$.ajax({
				"url" : "ajax-writeComment",
				"method" : "post",
				"data" : formData,
				"success": function(data, status, xhr){
					$('#comment-list').load('commentList?commonNo=${commonBoard.commonNo}');
				},
				"error" : function(xhr, status, err){
					alert("fail");
				}
			});
		
		});//write
		
		// 댓글 삭제 이벤트 처리
		$("#comment-list").on('click', ".delete-comment", function(event) {
		//$(".delete-comment").on('click', function(event) {
			const commentNo = $(this).attr("data-comment-no");			
			const yn = confirm(commentNo + "번 댓글을 삭제할까요?");
			if (yn) {
				  $.ajax({
						"url": "ajax-deleteComment",
						"method": "get",
						"data": "commentNo=" + commentNo,
						"success": function(data, status, xhr) {
							$('#comment-list').load('commentList?commonNo=${commonBoard.commonNo}');
							currentEditCommentNo = null;
						},
						"error": function(xhr, status, err) {
							alert("댓글 삭제 실패");
						}
				});
			}
		});//delete
		
		// 편집 링크 클릭 이벤트 처리
		$("#comment-list").on('click', ".edit-comment", function(event) {
			const commentNo = $(this).attr("data-comment-no");
			
			$('#comment-edit-area-' + commentNo).css('display', '');
			$('#comment-view-area-' + commentNo).css('display', 'none');
			
			if (currentEditCommentNo) { // 이전에 편집하던 요소의 표시 상태 변경 (복원)
				$('#comment-edit-area-' + currentEditCommentNo).css('display', 'none');
				$('#comment-view-area-' + currentEditCommentNo).css('display', '');
			}
			currentEditCommentNo = commentNo;
			
		}); //edit
		
		// 편집 취소 링크 클릭 이벤트 처리
		$(".cancel-edit-comment").on('click', function(event) {
			const commentNo = $(this).attr("data-comment-no");
			
			$('#comment-edit-area-' + commentNo).css('display', 'none');
			$('#comment-view-area-' + commentNo).css('display', '');
			
			currentEditCommentNo = null;
			
		}); //edit cancel
		
		
		// 댓글 수정 이벤트 처리
		$("#comment-list").on("click", ".update-comment", function(event) {
			const commentNo = $(this).data('comment-no');
			const formData = $('#comment-edit-area-' + commentNo + ' form').serialize();
			$.ajax({
				"url" : "ajax-editComment",
				"method" : "post",
				"data" : formData,
				"success" : function(data, status, xhr){
					$("#comment-list").load('commentList?commonNo=${commonBoard.commonNo}');

					$('.dropdown-toggle').dropdown();

					currentEditCommentNo = null;
				},
				"error" : function(xhr, status, err){
					alert("댓글 수정 실패");
				}
			})	
		});//update
		
		$("#comment-list").on("click",".write-recomment",function(event){
			const commentNo = $(this).data('comment-no');
			
			$('#recommentform #recomment-content').val("");
			$('#recommentform input[name=commentNo]').val(commentNo);
			
			$('#recomment-modal').modal("show");

		});
		
		$('#write-recomment-btn').on('click',function(event){
			
			const formData = $('#recommentform').serialize();
			
			console.log(formData)
			$.ajax({
				"url" : "writeRecomment",
				"method" : "post",
				"data" : formData,
				"success" : function(data, status, xhr){
					alert('댓글 쓰기 성공');
					$('#recomment-modal').modal("hide");
					$('#comment-list').load('commentList?commonNo=${commonBoard.commonNo}');
				},
				"error" : function(xhr, status, err){
					alert("댓글 쓰기 실패");
				}
				
			});
		});//recomment write
	
	 })
	</script>


	<!-- Theme JS -->
	<script src="/project-gpmatching/resources/assets/js/theme.min.js"></script>


</body>
</html>