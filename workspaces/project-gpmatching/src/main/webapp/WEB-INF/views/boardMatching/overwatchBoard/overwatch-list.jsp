<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">



<!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon"
	href="/project-gpmatching/resources/assets/images/favicon/favicon.ico">

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








<!-- Theme CSS -->
<link rel="stylesheet"
	href="/project-gpmatching/resources/assets/css/theme.css">
<link rel="stylesheet" href="/project-gpmatching/resources/assets/css/theme.min.css">

<title>오버워치 매칭 게시판</title>
</head>

<body class="bg-dark">
	<div id="db-wrapper" class="toggled" class="toggled">
		<!-- navbar vertical -->
		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/modules/sidebar.jsp" />
		
		<!-- page content -->
		<div id="page-content">
			<!--  header -->
			<jsp:include page="/WEB-INF/views/modules/header.jsp" />
			<!-- Container fluid -->

			<!-- Primary Button -->
			<br>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<a href="/project-gpmatching/boardMatching/overwatchBoard/overwatch-write">
				<button type="button" class="btn btn-primary me-2">오버워치 매칭 게시글 쓰기</button>
			</a>
			<a href="/project-gpmatching/home">
				<button type="button" class="btn btn-primary me-3">홈으로</button>
			</a>
			</div>
	
			<div class="row mt-6">
				<div class="col-md-12 col-12">
					<!-- card  -->
					<div class="card">
						<!-- card header  -->
						<div class="card-header bg-info py-4">
							<h4 class="mb-0">오버워치</h4>
						</div>
						<!-- table  -->
						<div class="table-responsive">
							<table class="table table-sm table-dark table-hover">
								<thead>
									<tr>
										<th scope="col">플레이어이름</th>
										<th scope="col">제목</th>
										<th scope="col">내용</th>
										<th scope="col">옵티어</th>
										<th scope="col">주포지션</th>
										<th scope="col">옵플레이</th>
										<th scope="col">선호성별</th>
										<th scope="col">마이크사용</th>
										<th scope="col">마감여부</th>
										<th scope="col">등록일시</th>
										<th scope="col">댓글</th>
										<th scope="col"></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="matchingBoard" items="${ requestScope.matchingOwList }" varStatus="vs">
										 <tr>

											<th>${ matchingBoard.nickname }</th>
											<th>${ matchingBoard.boardTitle }</th>
											<th>${ matchingBoard.boardContent }</th>
											<th>${ matchingBoard.owTier }</th>
											<th>${ matchingBoard.owPosition }</th>
											<th>${ matchingBoard.owPlay }</th>
											<th>${ matchingBoard.preferGender }</th>
											<th>${ matchingBoard.mic }</th>
											<th>${ matchingBoard.matchingClose }</th>
											<th>
												<fmt:formatDate value="${ matchingBoard.regDate }"
         				    						pattern="yyyy-MM-dd"/>
											</th>
											<th class="align-middle">
												<!-- Varying modal -->
												<button type="button" class="btn btn-primary btn-show-comment-modal" 
														data-boardno="${ matchingBoard.boardNo }">
														${ matchingBoard.boardNo }
												</button>
											</th>
											<th>
											  <!-- collapse -->
											  <div class="dropdown">
											  	<button type="button" id="dropdownMenuButton" class="btn btn-icon btn-white border border-2 rounded-circle btn-dashed ms-2" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
												      +
												</button>
											   <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
													<a class="dropdown-item" href="overwatch-edit?boardNo=${matchingBoard.boardNo}">수정</a>
													<a class="dropdown-item" href="overwatch-delete?boardNo=${matchingBoard.boardNo}">삭제</a>
											   </div>
											 </div>
											</th>
										</tr>

									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			
			<div class="modal fade" id="comment-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelOne" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="title-in-modal"></h5>
							<button type="button" class="btn-close"
								data-bs-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form id="commentform" action="write-comment" method="post">
							<input type="hidden" id="boardno-in-modal" name="boardNo" value="${ matchingBoard.boardNo }" /> 
							<div class="modal-body">
			
								<div class="mb-3">
									<label for="recipient-name" class="col-form-label">게임 닉네임</label> 
									<input type="text" class="form-control" id="recipient-name-in-modal">
								</div>
								<div class="mb-3">
									<label for="message-text" class="col-form-label">파티장에게 알려줄 내용</label>
									<textarea name="mCommentContent" class="form-control" id="message-text-in-modal"></textarea>
								</div>
			
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
								<button type="submit" class="btn btn-primary">등록</button>
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




	<!-- Theme JS -->
	<script src="/project-gpmatching/resources/assets/js/theme.min.js"></script>
	
	<script>
	
	$(function() {
		$('.btn-show-comment-modal').on("click", function(event) {
			const boardNo = $(this).data('boardno');
			const currentTr = $('#tr-' + boardNo);
			$('#title-in-modal').text(currentTr.data('title'));
			$('#boardno-in-modal').val(boardNo);
			$('#comment-modal').modal('show');
		});
	});
	
	</script>
	<script src="/project-gpmatching/resources/assets/js/common.js"></script>
	
</body>

</html>