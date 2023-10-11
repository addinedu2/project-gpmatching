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

<title>LOL 매칭 게시판</title>
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
			<a href="/project-gpmatching/boardMatching/lolBoard/lol-write">
				<button type="button" class="btn btn-primary me-2">LoL 매칭 게시글 쓰기</button>
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
						<div class="card-header bg-info  py-4">
							<h4 class="mb-0">LEAGUE OF LEGENDS</h4>
						</div>
						
						<!-- table  -->
						<table id="matching-list" class="table table-sm table-dark table-hover">
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
									 		<a class="dropdown-item" href="lol-list">모든 티어</a>
											<a class="dropdown-item" href="lol-list?lolTier=bronze">브론즈</a>
											<a class="dropdown-item" href="lol-list?lolTier=silver">실버</a>
											<a class="dropdown-item" href="lol-list?lolTier=gold">골드</a>											
										</div>
									</div>
									</th>
						         	
							         	<th scope="col">주포지션</th>
							         	<th scope="col">선호성별</th>
							         	<th scope="col">마이크사용</th>
							         	<th scope="col">모집인원</th>
							         	<th scope="col">마감여부</th>
							        	<th scope="col">등록일시</th>
							         	<th scope="col">댓글</th>
							         	<th scope="col"></th>
							         	<th scope="col"></th>
									</tr>
								</thead>
				 
								<tbody id="lol-list">		
									<c:forEach var="matchingBoard" items="${ requestScope.matchingLolList }">
										<tr id="tr-${ matchingBoard.boardNo }" data-title="${ matchingBoard.boardTitle }">

											<th scope="row">${ matchingBoard.nickname }</th>
											<th>${ matchingBoard.boardTitle }</th>
											<th>${ matchingBoard.boardContent }</th>
											<td>
											<c:set var="lolTier" value="${ matchingBoard.lolTier }" />
											<c:choose>
												<c:when test = "${ lolTier eq 'bronze'}">
													<span class="badge bg-danger">${ matchingBoard.lolTier }</span>
												</c:when>
												<c:when test = "${ lolTier eq 'silver'}">
													<span class="badge rounded-pill bg-light text-dark">${ matchingBoard.lolTier }</span>
												</c:when>	
												<c:when test = "${ lolTier eq 'gold'}">
													<span class="badge bg-warning">${ matchingBoard.lolTier }</span>
												</c:when>
												<c:otherwise>
													<span class="badge bg-dark">unranked</span>
												</c:otherwise>
											</c:choose>
											</td>
											<td>
											<c:set var="lolPosition" value="${ matchingBoard.lolPosition }" />
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
													${ matchingBoard.lolPosition }
												</c:otherwise>
											</c:choose>
											</td>
											<th>${ matchingBoard.preferGender }</th>
											<th>${ matchingBoard.mic }</th>
											<th>${ matchingBoard.headCount }</th>
											<th>${ matchingBoard.matchingClose }</th>
											<th>
												<fmt:formatDate value="${ matchingBoard.regDate }"
         				    						pattern="yyyy-MM-dd"/>
											</th>
											<th class="align-middle">
												<!-- Varying modal -->
												<button type="button" class="btn btn-primary btn-sm btn-show-comment-modal" 
														data-boardno="${ matchingBoard.boardNo }">지원하기</button>	
											</th>
											<th>										
												<button type="button" class="btn btn-primary btn-sm btn-show-commentList-modal" 
														data-boardno="${ matchingBoard.boardNo }">목록</button>
											</th>
											<th>
												<div class="dropdown dropstart">
			                                        <a class="text-muted text-primary-hover" href="#" role="button" id="dropdownTask" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			                                            <i class="icon-xxs" data-feather="more-vertical"></i>
			                                        </a>
			                                        <div class="dropdown-menu" aria-labelledby="dropdownTask">
			                                            <a class="dropdown-item" href="lol-edit?boardNo=${matchingBoard.boardNo}">수정</a>
			                                            <a class="dropdown-item" href="lol-delete?boardNo=${matchingBoard.boardNo}">삭제</a>
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
			</div>
			<!-- 댓글 쓰기 모달 -->
			<div class="modal fade" id="comment-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			    <div class="modal-dialog" role="document">
			        <div class="modal-content">
			            <div class="modal-header">
			                <h5 class="modal-title" id="title-in-modal">${ matchingBoard.boardTitle }</h5>
			                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
			                    <!-- <span aria-hidden="true">&times;</span> -->
			                </button>
			            </div>
						<form id="commentform" action="write-comment" method="post">
							<input type="hidden" id="boardno-in-modal" name="boardNo" value="${ matchingBoard.boardNo }" /> 
							<input type="hidden" name="userNo" value="${ loginuser.userNo }" /> 
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
			                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			                <button type="button" id="write-comment-lnk" class="btn btn-primary">등록</button>
			            </div>
						</form>
			        </div>
			    </div>
			</div>
			<!-- 댓글 목록 보기 -->
			<div class="modal fade" id="commentList-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			    <div class="modal-dialog" role="document">
			        <div class="modal-content">
			            <div class="modal-header">			            
			                <h5 class="modal-title" id="title2-in-modal">댓글</h5>
			                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
			                </button>
			            </div>
			            <div id="comment-list" class="modal-body" >
							
			            </div>
			            <div class="modal-footer">
			                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			                <button type="button" class="btn btn-primary">Save changes</button>
			            </div>
			            <!-- card : 댓글 ui는 나중에 이런 형식으로 구현할 예정입니다 -->
			              <div class="card mb-4">
			                <!-- card body -->
			                <div class="card-body">
			                  <!-- card title -->
			                  <h4 class="card-title">나중에 댓글 ui 이런식으로 어때요?</h4>
			                  <div class="d-flex justify-content-between
			                      align-items-center mb-4">
			                    <div class="d-flex align-items-center">
			                      <!-- img -->
			                      <div>
			                        <img src="/project-gpmatching/resources/assets/images/avatar/avatar-1.jpg" class="rounded-circle avatar-md" alt="">
			                      </div>
			                      <!-- text -->
			                      <div class="ms-3 ">
			                        <h5 class="mb-1">여기는 지원자 닉네임</h5>
			                        <p class="text-muted mb-0 fs-5 text-muted">여기는 간단한 내용
			                        </p>
			                      </div>
			                    </div>
			                    <div>
			                      <a href="/누르면매칭수락" class="text-muted text-primary-hover"><i
			                            class="me-4 icon-xs" data-feather="phone-call"></i></a>
			                      <a href="/누르면매칭거절" class="text-muted text-primary-hover"><i
			                            class="icon-xs" data-feather="video"></i></a>
			                    </div>
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
	
	// 버튼을 누르면 해당 행의 데이터를 포함한 모달창을 보여줌 (-허지웅)
	$(function() {
		
		$('#lol-list').on("click", '.btn-show-comment-modal', function(event) {
			const boardNo = $(this).data('boardno');
			const currentTr = $('#tr-' + boardNo);
			//alert(boardNo);

			$('#title-in-modal').text("(" + boardNo + ") " + currentTr.data('title'));
			$('#boardno-in-modal').val(boardNo);
			$('#comment-modal').modal('show');
		});
	    

		// 댓글 모달창의 등록 버튼을 누르면 데이터가 전송됨
		$('#write-comment-lnk').on('click', function(event){
			
			const formData = $('#commentform').serialize();	// <form> 에 포함된 입력요소의 값을 뽑아서 전송가능한 문자열로 반환
			alert(formData);
	
			$.ajax({
				"url": "write-comment",
				"method": "post",
				"data": formData,
				"success": function(data, status, xhr){
					alert('성공');
					$('#comment-modal').modal("hide");
				},
				"error": function(xhr, status, err){
					alert('실패');
				}
			});	 
		});
	});
	
		
	$(function(){
		// 버튼을 누르면 해당 글의 댓글 보기 (-허지웅)
		$('#lol-list').on("click", '.btn-show-commentList-modal', function(event) {
			
			const boardNo = $(this).data('boardno');
			const currentTr = $('#tr-' + boardNo);
			$('#title2-in-modal').text("(" + boardNo + ") " + currentTr.data('title'));
			
			$.ajax({
				
				"url": "ajax-show-comment",
				"method": "get",
				"data": { "boardNo" : boardNo },
				
				"success": function(result){
					
					var commentList = $('#comment-list');
					commentList.empty();
					if (result != null){
						console.log(result);
						
						// 테이블 헤더 추가
		                var $headerRow = $("<tr>");
		                
		                $headerRow.append($("<th>").text("댓글 번호"));
		                $headerRow.append($("<th>").text("닉네임"));
		                $headerRow.append($("<th>").text("댓글 내용"));
						$headerRow.append($("<th>").text("승인여부"));;
		                
		                commentList.append($headerRow);
		                
						for(var i = 0; i < result.length; i++){
							var $row = $("<tr>");
		                    
		                    $row.append($("<td>").text(result[i].mcommentNo));
		                    $row.append($("<td>").text(result[i].nickname));
		                    $row.append($("<td>").text(result[i].mcommentContent));
		                    if(result[i].status == "0"){
		                    	$row.append($("<td>").text("미승인"));
							}else if (result[i].status == "1"){
								$row.append($("<td>").text("승인"));
							}else if (result[i].status == "2"){
								$row.append($("<td>").text("거절"));
							}
		                    
		                    commentList.append($row);
		                    
		                    // 수락 버튼 추가
	                        var $acceptButton = $("<button>")
	                            .addClass("btn btn-primary btn-sm btn-accept-comment")
	                            .data('commentno', result[i].mcommentNo)
	                            .text("수락");
		                    
	                     	// 거절 버튼 추가
	                        var $rejectButton = $("<button>")
	                            .addClass("btn btn-danger btn-sm btn-reject-comment")
	                            .data('commentno', result[i].mcommentNo)
	                            .text("거절");
	                        
	                     	// 수락 버튼 눌렀을 때의 동작 
	                        $('#comment-list').on("click", '.btn-accept-comment', function(event) {
	                        	var boardNo = $(this).data('boardno');
	                            var commentNo = $(this).data('commentno');
	                            location.href = "commentConfirm?commentNo=" + commentNo;
	                            // TODO: 수정 버튼을 눌렀을 때의 동작 구현
	                        });

	                        // 거절 버튼 눌렀을 때의 동작 
	                        $('#comment-list').on("click", '.btn-reject-comment', function(event) {
	                            var commentNo = $(this).data('commentno');
	                            location.href = "commentReject?commentNo=" + commentNo;
	                            // TODO: 삭제 버튼을 눌렀을 때의 동작 구현
	                        });
	                        
	                     	var $buttonColumn = $("<td>").append($acceptButton, $rejectButton);
	                        $row.append($buttonColumn);
		                    
						}
					
					}
					
					console.log(commentList);
					$('#commentList-modal').modal('show');
				},
				"error": function(xhr, status, err){
					alert("실패");
				
				} 
				
			}); 
		});
	});
	
	
	
</script>
</body>

</html>