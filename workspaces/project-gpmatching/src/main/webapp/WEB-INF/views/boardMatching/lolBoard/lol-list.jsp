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

<title>LOL Matching | LOL 매칭 게시판</title>
</head>

<body class="bg-light">
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
			<a href="/project-gpmatching/boardMatching/lolBoard/lol-write">
				<button type="button" class="btn btn-primary mb-2">LoL 매칭 게시글 쓰기</button>
			</a>
			<a href="/project-gpmatching/home">
				<button type="button" class="btn btn-primary mb-2">홈으로</button>
			</a>
					
			<div class="row mt-6">
				<div class="col-md-12 col-12">
					<!-- card  -->
					<div class="card">
						<!-- card header  -->
						<div class="card-header bg-info  py-4">
							<h4 class="mb-0">LEAGUE OF LEGENDS</h4>
						</div>
						
						<!-- table  -->
						<div class="table-responsive">
							<table class="table table-sm table-dark table-hover">
								<thead>
									<tr>
										<th scope="col">소환사이름</th>
										<th scope="col">제목</th>
										<th scope="col">내용</th>
										<th>
										<div class="dropdown">
											<button class="btn btn-secondary btn-sm dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											티어											
											</button>
										 	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
												<a class="dropdown-item" href="/project-gpmatching/boardMatching/lolBoard/lol-list/bronze">브론즈</a>
												<a class="dropdown-item" href="/project-gpmatching/boardMatching/lolBoard/lol-list/silver">실버</a>
												<a class="dropdown-item" href="/project-gpmatching/boardMatching/lolBoard/lol-list/gold">골드</a>											
											</div>
										</div>
										</th>
							         	<th scope="col">주포지션</th>
							         	<th scope="col">서렌여부</th>
							         	<th scope="col">선호플레이</th>
							         	<th scope="col">선호성별</th>
							         	<th scope="col">마이크사용</th>
							         	<th scope="col">마감여부</th>
							        	<th scope="col">등록일시</th>
							       	  	<th scope="col">조회수</th>
							         	<th scope="col">댓글</th>
							         	<th scope="col"></th>
									</tr>
								</thead>
				 
								<tbody>		
									<c:forEach var="matchingBoard" items="${ requestScope.matchingLolList }" varStatus="vs">
										<tr id="tr-${ matchingBoard.boardNo }" data-title="${ matchingBoard.boardTitle }">

											<th>${ matchingLolList[vs.index].get("nickname") }</th>
											<th>${ matchingLolList[vs.index].get("boardTitle") }</th>
											<th>${ matchingLolList[vs.index].get("boardContent") }</th>
											<td>
											<c:set var="lolTier" value="${ matchingLolList[vs.index].get('lolTier') }" />
											<c:choose>
												<c:when test = "${ lolTier eq 'bronze'}">
													<span class="badge bg-danger">${ matchingLolList[vs.index].get("lolTier") }</span>
												</c:when>
												<c:when test = "${ lolTier eq 'silver'}">
													<span class="badge rounded-pill bg-light text-dark">${ matchingLolList[vs.index].get("lolTier") }</span>
												</c:when>	
												<c:when test = "${ lolTier eq 'gold'}">
													<span class="badge bg-warning">${ matchingLolList[vs.index].get("lolTier") }</span>
												</c:when>
												<c:otherwise>
													<span class="badge bg-dark">unranked</span>
												</c:otherwise>
											</c:choose>
											</td>
											<td>
											<c:set var="lolPosition" value="${ matchingLolList[vs.index].get('lolPosition') }" />
											<c:choose>
												<c:when test = "${ lolPosition eq 'top'}">
													<img src="/project-gpmatching/resources/assets/images/lolposition/top.svg" width=24px>
												</c:when>
												<c:when test = "${ lolPosition eq 'jungle'}">
													<img src="/project-gpmatching/resources/assets/images/lolposition/jungle.svg" width=24px>
												</c:when>	
												<c:when test = "${ lolPosition eq 'mid'}">
													<img src="/project-gpmatching/resources/assets/images/lolposition/mid.svg" width=24px>
												</c:when>
												<c:when test = "${ lolPosition eq 'adcarry'}">
													<img src="/project-gpmatching/resources/assets/images/lolposition/adcarry.svg" width=24px>
												</c:when>
												<c:when test = "${ lolPosition eq 'support'}">
													<img src="/project-gpmatching/resources/assets/images/lolposition/support.svg" width=24px>
												</c:when>
												<c:otherwise>
													${ matchingLolList[vs.index].get("lolPosition") }
												</c:otherwise>
											</c:choose>
											</td>
											<th>${ matchingLolList[vs.index].get("lolSur") }</th>
											<th>${ matchingLolList[vs.index].get("lolPlay") }</th>
											<th>${ matchingLolList[vs.index].get("preferGender") }</th>
											<th>${ matchingLolList[vs.index].get("mic") }</th>
											<th>${ matchingLolList[vs.index].get("matchingClose") }</th>
											<th>${ matchingLolList[vs.index].get("regDate") }</th>
											<th>${ matchingLolList[vs.index].get("readCount") }</th>
											<th class="align-middle">
												<!-- Varying modal -->
												<button type="button" class="btn btn-primary btn-show-comment-modal" 
														data-boardno="${ matchingLolList[vs.index].get('boardNo') }">${ matchingLolList[vs.index].get("boardNo") }
												</button>
											</th>
											<th>
											  <!-- collapse -->
											  <div class="dropdown">
											  	<button type="button" id="dropdownMenuButton" class="btn btn-icon btn-white border border-2 rounded-circle btn-dashed ms-2" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
												      +
												</button>
											   <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
													<a class="dropdown-item" href="#">수정</a>
													<a class="dropdown-item" href="#">삭제</a>
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
									<label for="recipient-name" class="col-form-label">닉네임 : ${ loginuser.nickname }</label> 
									<input type="text" class="form-control" id="recipient-name-in-modal" 
									placeholder="게임 아이디를 입력해주세요">
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
			<!--  댓글 select 기능 임시로 구현함 -->
			<div class="modal fade" id="commentlist-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelOne" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="title-in-modal"></h5>
							<button type="button" class="btn-close"
								data-bs-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
					
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
	
	$(function() {
		$('.btn-show-commentlist-modal').on("click", function(event) {
			const boardNo = $(this).data('boardno');
			const currentTr = $('#tr-' + boardNo);
			$('#title-in-modal').text(currentTr.data('title'));
			$('#boardno-in-modal').val(boardNo);
			$('#commentlist-modal').modal('show');
		});
	});
	
	</script>
</body>

</html>