<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.gpmatching.common.Time" %>
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
						<div class="card-header bg-info py-4" style="display: flex; align-items: center; justify-content: space-between;">
						    <div style="display: flex; align-items: center;">
						        <img src="/project-gpmatching/resources/assets/images/overwatch/logo.png" height="88px">
						    </div>
						    <div style="display: flex; align-items: center;">
						        <select name="searchType" style="width: 150px;" class="form-select form-select">
						            <option value="" selected>-- 옵션 --</option>
						            <option value="t">제목</option>
						            <option value="c">내용</option>
						            <option value="n">닉네임</option>
						        </select>
						        <input name="keyword" style="width: 200px; margin-left: 10px; margin-right: 10px;" class="form-control" type="search" id="search-input" placeholder="검색어를 입력하세요">
						        <button id="search-btn" type="button" class="btn btn-light mb-2">검색</button>
						    </div>
						</div>
						<!-- table  -->
						<table id="matching-list" class="table table-sm table-dark table-hover">
							<thead>
										
								<tr>
									<th scope="col">플레이어이름</th>
										<th scope="col">제목</th>
										<th scope="col">내용</th>
										<th scope="col">옵티어</th>
							         	<th scope="col">주포지션</th>
							         	<th scope="col">게임시간</th>
							         	<th scope="col">마이크사용</th>
							         	<th scope="col">모집인원</th>
							         	<th scope="col">마감여부</th>
							        	<th scope="col">등록일시</th>
							         	<th scope="col">댓글</th>
							         	<th scope="col"></th>
									</tr>
								</thead>
				 
								<tbody id="overwatch-list">		
									<c:forEach var="matchingBoard" items="${ requestScope.matchingOwList }">
										<tr id="tr-${ matchingBoard.boardNo }" data-title="${ matchingBoard.boardTitle }">
											<th>
											<div class="dropdown dropstart">
		                                        <a class="text-muted text-primary-hover" href="#" role="button" id="dropdownTask" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                                            ${ matchingBoard.nickname }
		                                        </a>
		                                        <div class="dropdown-menu" aria-labelledby="dropdownTask">
		                                            <a class="dropdown-item" href="https://www.op.gg/summoners/kr/${ matchingBoard.nickname }">전적검색</a>
		                                            <a class="dropdown-item" href="/project-gpmatching/commonBoard/reportWrite">신고하기</a>
		                                        </div>
			                                </div>
											</th>
											<th>${ matchingBoard.boardTitle }</th>
											<th>${ matchingBoard.boardContent }</th>
											<th>${ matchingBoard.owTier }</th>
											<th>${ matchingBoard.owPosition }</th>
											<th>${ matchingBoard.startTime } ~ ${ matchingBoard.endTime }</th>
											<th>
											<c:choose>
												<c:when test = "${ matchingBoard.mic eq true}">
													<div class="form-check form-switch">
													    <input class="form-check-input" type="checkbox" role="switch" 
													    id="flexSwitchCheckCheckedDisabled" checked onclick="return toggleSwitch()">
													    <label class="form-check-label" for="flexSwitchCheckCheckedDisabled">ON</label>
													</div>
												</c:when>
												<c:otherwise>
													<div class="form-check form-switch mb-2">
													    <input class="form-check-input" type="checkbox" role="switch" 
													    id="flexSwitchCheckDefault" disabled>
													    <label class="form-check-label" for="flexSwitchCheckDefault">OFF</label>
													</div>
												</c:otherwise>
											</c:choose>
											</th>
											<th>${ matchingBoard.confirmCount + 1} / ${ matchingBoard.headCount + 1}</th>
											<c:choose>
												<c:when test="${matchingBoard.matchingClose == true}">
													<th><i class="icon-sm text-success" data-feather="check-circle"></i></th>
												</c:when>
												<c:otherwise>
													<th><div class="spinner-border" role="status">
													<span class="visually-hidden">Loading...</span></div></th>
												</c:otherwise>
											</c:choose>
												<c:choose>
											    <c:when test="${empty matchingBoard.regDate}">
											        <th>날짜 정보 없음</th>
											    </c:when>
											    <c:otherwise>
											        <th>
											    <c:set var="regDate" value="${matchingBoard.regDate}" scope="page" />
											    <%= Time.calculateTime((java.util.Date) pageContext.getAttribute("regDate")) %>
											</th>
											    </c:otherwise>
											</c:choose>
											<th class="align-middle">
												<!-- Varying modal -->

												<button type="button" class="btn btn-primary btn-sm btn-show-comment-modal" 
														data-boardno="${ matchingBoard.boardNo }">${ matchingBoard.boardNo }
												</button>											
												<button type="button" class="btn btn-primary btn-sm btn-show-commentList-modal"
														data-boardno="${ matchingBoard.boardNo }">목록</button>
											</th>
											<th>
												<div class="dropdown dropstart">
			                                        <a class="text-muted text-primary-hover" href="#" role="button" id="dropdownTask" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			                                            <i class="icon-xxs" data-feather="more-vertical"></i>
			                                        </a>
			                                        <div class="dropdown-menu" aria-labelledby="dropdownTask">
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
			</div>
			<!-- 댓글 쓰기 모달 -->
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
			            	<div class="d-flex justify-content-between
			                      align-items-center mb-4">
			                    <div class="d-flex align-items-center">
			                      <!-- img -->
			                      <div>
			                        <a class="rounded-circle" href="#" role="button" id="dropdownUser"
							          data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							          <div class="avatar avatar-md">
							          		<c:choose>
							          			<c:when test="${loginuser.userImage == null}">
							           	    		<img alt="avatar" src="/project-gpmatching/resources/assets/images/avatar/anonymous.png" class="rounded-circle" />
							           	    	</c:when>
							                   	<c:otherwise> 
							                   		<img src="${pageContext.request.contextPath}/resources/upload/${loginuser.userImage}" class="rounded-circle" alt="Image" height="30" width="30" >
							                   	</c:otherwise>
							           	    </c:choose>
							          </div>
							        </a>

			                      </div>
			                      <!-- text -->
			                      <div class="ms-3 ">
			                        <h5 class="mb-1">${ loginuser.nickname }</h5>
			                        <p class="text-muted mb-0 fs-5 text-muted">${ loginuser.ownickname }
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
			                <h5 class="modal-title" id="title2-in-modal"></h5>
			                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
			                </button>
			            </div>
			            <div id="comment-list" class="modal-body" >
							
			            </div>
			            <div id="dynamic-button-area" class="modal-body" >
			            
			            </div>
			            <!-- card : 댓글 ui는 나중에 이런 형식으로 구현할 예정입니다 -->
			              <div class="card mb-4">
			                <!-- card body -->
			                <div class="card-body">
			                  <!-- card title -->
			                  
			                  <div class="d-flex justify-content-between
			                      align-items-center mb-4">
			                    <div class="d-flex align-items-center">
			                      <!-- img -->
			                      <div>
			                        <a class="rounded-circle" href="#" role="button" id="dropdownUser"
							          data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							          <div class="avatar avatar-md">
							          		<c:choose>
							          			<c:when test="${loginuser.userImage == null}">
							           	    		<img alt="avatar" src="/project-gpmatching/resources/assets/images/avatar/anonymous.png" class="rounded-circle" />
							           	    	</c:when>
							                   	<c:otherwise> 
							                   		<img src="${pageContext.request.contextPath}/resources/upload/${loginuser.userImage}" class="rounded-circle" alt="Image" height="30" width="30" >
							                   	</c:otherwise>
							           	    </c:choose>
							          </div>
							        </a>

			                      </div>
			                      <!-- text -->
			                      <div class="ms-3 ">
			                        <h5 class="mb-1">${ loginuser.nickname }</h5>
			                        <p class="text-muted mb-0 fs-5 text-muted">${ loginuser.ownickname }
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
	
	
	// 글번호(댓글쓰기) 버튼을 누르면 해당 행의 데이터를 포함한 모달창을 보여줌 (-허지웅)
	$(function() {
		$('#overwatch-list').on("click", '.btn-show-comment-modal', function(event) {
			const boardNo = $(this).data('boardno');
			const currentTr = $('#tr-' + boardNo);
			

			$('#title-in-modal').text("(" + boardNo + ") " + currentTr.data('title'));
			$('#boardno-in-modal').val(boardNo);
			$('#comment-modal').modal('show');
		});
	});
	


	// 댓글쓰기 모달창의 등록 버튼을 누르면 데이터가 전송됨
	$('#write-comment-lnk').on('click', function(event){
		
		const formData = $('#commentform').serialize();	// <form> 에 포함된 입력요소의 값을 뽑아서 전송가능한 문자열로 반환
		
		$.ajax({
			"url": "write-comment",
			"method": "post",
			"data": formData,
			"success": function(data, status, xhr){
				alert('지원이 완료되었습니다!');
				$('#comment-modal').modal("hide");
			},
			"error": function(xhr, status, err){
				alert('지원 실패!');
				
			}
		});	 
	});
	

	// 검색어를 입력하고 검색 버튼을 누르면 해당되는 게시글을 보여줌 (-허지웅)
	$(function(){
		
		$('#search-btn').on("click", function(event){
			
			var searchType = $("select[name = searchType]").val();
			var keyword = $("input[name = keyword]").val();
			
			self.location = "/project-gpmatching/boardMatching/overwatchBoard/overwatch-list?searchType=" + searchType + "&keyword=" + keyword;
			
			console.log("searchType : " + searchType);
			console.log("keyword : " + keyword);
		})
	});
	
	
	// 닫기 버튼 - 잘 동작함
	$(function() {
		$('#dynamic-button-area').on("click", '.btn-matching-modal-close', function(event) {
			location.href = "overwatch-list";

		});
	});
	
	
	
	// 매칭 마감 버튼 
	$(function() {
		$('#dynamic-button-area').on("click", '.btn-matching-close', function(event) {
			const boardNo = $(this).data('boardno');
			const matchingClose = $(this).data('matchingclose');
			if(matchingClose){
				alert("매칭을 마감할 수 없습니다.")
			}else {
				var confirmflag = confirm("매칭을 마감하시겠습니까?");
				
				if(confirmflag){
					location.href = "matchingCloseTrue?boardNo=" + boardNo;
				}
				
			}
			

		});
	});
	


	// 버튼을 누르면 해당 글의 댓글 보기 (-허지웅)
	$(function() {
		$('#overwatch-list').on("click", '.btn-show-commentList-modal', function(event) {
			
			const boardNo = $(this).data('boardno');
			const currentTr = $('#tr-' + boardNo);
			$('#title2-in-modal').text("(" + boardNo + ") " + currentTr.data('title'));
			
			$.ajax({
				
				"url": "ajax-show-comment-and-btn-matching",
				"method": "get",
				"data": { "boardNo" : boardNo },
				
				"success": function(result){
					
					var sHeadCount = 0;
  					var sConfirmCount = 0;
  					var headCount = 0;
  					var confirmCount = 0;
  					var matchingClose = 0;
	                
					
					var commentList = $('#comment-list');
					commentList.empty();
					if (result != null){
						console.log(result);
						
						// 테이블 헤더 추가
		                var $headerRow = $("<tr>");
		                
		                $headerRow.append($("<th>").text("댓글번호  "));
		                $headerRow.append($("<th>").text("닉네임   "));
		                $headerRow.append($("<th>").text("옵치닉네임  "));
		                $headerRow.append($("<th>").text("댓글내용  "));
						$headerRow.append($("<th>").text("승인여부  "));;
		                
		                commentList.append($headerRow);
		                
						for(var i = 0; i < result.length; i++){
							var $row = $("<tr>");
		                    
		                    $row.append($("<td>").text(result[i].commentNo));
		                    $row.append($("<td>").text(result[i].nickname));
		                    $row.append($("<td>").text(result[i].ownickname));
		                    $row.append($("<td>").text(result[i].mcommentContent));
		                    
		                    // 댓글 승인여부 상태 표시
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
	                            .data('commentno', result[i].commentNo)
	                            .data('boardno', result[i].boardNo)
	                            .text("수락");
		                    
	                     	// 거절 버튼 추가
	                        var $rejectButton = $("<button>")
	                            .addClass("btn btn-danger btn-sm btn-reject-comment")
	                            .data('commentno', result[i].commentNo)
	                            .data('boardno', result[i].boardNo)
	                            .text("거절");

							var $buttonColumn = $("<td>").append($acceptButton, $rejectButton);
	                        $row.append($buttonColumn);
	                        
	                        sHeadCount = result[i].headCount;
	      					sConfirmCount = result[i].confirmCount;
	      					headCount = parseInt(sHeadCount);
	      					confirmCount = parseInt(sConfirmCount);
	      					matchingClose = result[i].matchingClose;
	    	                
	                      
						}
					}
					
					console.log(commentList);
					$('#commentList-modal').modal('show');
					
					
					if( (commentList != null ) && (matchingClose == false) && (headCount == confirmCount ) ){
						
						
						var matchingCloseBtn = '<input type="button" class="btn-matching-close" background-color="#AE302E" data-boardno=' + boardNo + ' data-matchingclose=' + matchingClose + ' value="매칭 마감"/><input type="button" class="btn-matching-modal-close" value="닫기"/>';
							$("#dynamic-button-area").html(matchingCloseBtn)
					} else {
						var closeBtn = '<input type="button" class="btn-matching-modal-close" background-color="#AE302E" value="닫기"/>';
							$("#dynamic-button-area").html(closeBtn).data('boardno', boardNo)
					}
					
					
					
				},
				"error": function(xhr, status, err){
					alert("실패");
				
				} 
				
			}); 
		});
	});
	
	
	
	// 수락 버튼을 누르면 화면이 변하지 않고 글의 댓글 목록 보기 유지 (-이현일)
	$(function() {
		$('#comment-list').on("click", '.btn-accept-comment', function(event) {
			
			const commentNo = $(this).data('commentno');
			const boardNo = $(this).data('boardno');
			const currentTr = $('#tr-' + boardNo);
			$('#title2-in-modal').text("(" + boardNo + ") " + currentTr.data('title'));
			
			$.ajax({
				
				"url": "commentConfirm",
				"method": "get",
				"data": { "commentNo" : commentNo },
				
				"success": function showcommentlist(result){
					
					var sHeadCount = 0;
  					var sConfirmCount = 0;
  					var headCount = 0;
  					var confirmCount = 0;
  					var matchingClose = 0;
					
					var commentList = $('#comment-list');
					commentList.empty();
					if (result != null){
						console.log(result);
						
						// 테이블 헤더 추가
		                var $headerRow = $("<tr>");
		                
		                $headerRow.append($("<th>").text("댓글번호  "));
		                $headerRow.append($("<th>").text("닉네임   "));
		                $headerRow.append($("<th>").text("옵치닉네임  "));
		                $headerRow.append($("<th>").text("댓글내용  "));
						$headerRow.append($("<th>").text("승인여부  "));;
		                
		                commentList.append($headerRow);
		                
						for(var i = 0; i < result.length; i++){
							var $row = $("<tr>");
		                    
		                    $row.append($("<td>").text(result[i].commentNo));
		                    $row.append($("<td>").text(result[i].nickname));
		                    $row.append($("<td>").text(result[i].ownickname));
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
	                            .attr('id', 'btn-accept-comment')
	                            .data('commentno', result[i].commentNo)
	                            .data('boardno', result[i].boardNo)
	                            .text("수락");
		                    
	                     	// 거절 버튼 추가
	                        var $rejectButton = $("<button>")
	                            .addClass("btn btn-danger btn-sm btn-reject-comment")
	                            .attr('id', 'btn-reject-comment')
	                            .data('commentno', result[i].commentNo)
	                            .data('boardno', result[i].boardNo)
	                            .text("거절");


	                     	var $buttonColumn = $("<td>").append($acceptButton, $rejectButton);
	                        $row.append($buttonColumn);
	                        
	                       
	                        sHeadCount = result[i].headCount;
	      					sConfirmCount = result[i].confirmCount;
	      					headCount = parseInt(sHeadCount);
	      					confirmCount = parseInt(sConfirmCount);
	      					matchingClose = result[i].matchingClose;
	                    
		                    
						}
						
    					
					}
					
					console.log(commentList);
					$('#commentList-modal').modal('show');
					
					
					if( (commentList != null ) && (matchingClose == false) && (headCount == confirmCount ) ){
						
						
						var matchingCloseBtn = '<input type="button" class="btn-matching-close" data-boardno=' + boardNo + ' data-matchingclose=' + matchingClose + ' value="매칭 마감"/><input type="button" class="btn-matching-modal-close" value="닫기"/>';
							$("#dynamic-button-area").html(matchingCloseBtn)
					} else {
						var closeBtn = '<input type="button" class="btn-matching-modal-close" value="닫기"/>';
							$("#dynamic-button-area").html(closeBtn)
					}

				},
				"error": function(xhr, status, err){
					alert("실패");
				
				} 
				
			}); 
		});
	});

 	
 	
	// 거절 버튼을 누르면 화면이 변하지 않고 글의 댓글 목록 보기 유지 (-이현일)
 	$(function() {
	    $('#comment-list').on("click", '.btn-reject-comment', function(event) {
	    	
	    	const commentNo = $(this).data('commentno');
			const boardNo = $(this).data('boardno');
			const currentTr = $('#tr-' + boardNo);
			$('#title2-in-modal').text("(" + boardNo + ") " + currentTr.data('title'));
			
			$.ajax({
				
				"url": "commentReject",
				"method": "get",
				"data": { "commentNo" : commentNo },
				
				"success": function showcommentlist(result){
					
					var commentList = $('#comment-list');
					commentList.empty();
					if (result != null){
						console.log(result);
						
						// 테이블 헤더 추가
		                var $headerRow = $("<tr>");
		                
		                $headerRow.append($("<th>").text("댓글번호  "));
		                $headerRow.append($("<th>").text("닉네임   "));
		                $headerRow.append($("<th>").text("옵치닉네임  "));
		                $headerRow.append($("<th>").text("댓글내용  "));
						$headerRow.append($("<th>").text("승인여부  "));;
		                
		                commentList.append($headerRow);
		                
						for(var i = 0; i < result.length; i++){
							var $row = $("<tr>");
		                    
		                    $row.append($("<td>").text(result[i].commentNo));
		                    $row.append($("<td>").text(result[i].nickname));
		                    $row.append($("<td>").text(result[i].ownickname));
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
	                            .attr('id', 'btn-accept-comment')
	                            .data('commentno', result[i].commentNo)
	                            .data('boardno', result[i].boardNo)
	                            .text("수락");
		                    
	                     	// 거절 버튼 추가
	                        var $rejectButton = $("<button>")
	                            .addClass("btn btn-danger btn-sm btn-reject-comment")
	                            .attr('id', 'btn-reject-comment')
	                            .data('commentno', result[i].commentNo)
	                            .data('boardno', result[i].boardNo)
	                            .text("거절");
	
	
	                     	var $buttonColumn = $("<td>").append($acceptButton, $rejectButton);
	                        $row.append($buttonColumn);
		                 
	                        
	                        sHeadCount = result[i].headCount;
	      					sConfirmCount = result[i].confirmCount;
	      					headCount = parseInt(sHeadCount);
	      					confirmCount = parseInt(sConfirmCount);
	      					matchingClose = result[i].matchingClose;
	    	                
	                      
						}
					}
					
					console.log(commentList);
					$('#commentList-modal').modal('show');
					
					
					if( (commentList != null ) && (matchingClose == false) && (headCount == confirmCount ) ){
						
						
						var matchingCloseBtn = '<input type="button" class="btn-matching-close" data-boardno=' + boardNo + ' data-matchingclose=' + matchingClose + ' value="매칭 마감"/><input type="button" class="btn-matching-modal-close" value="닫기"/>';
							$("#dynamic-button-area").html(matchingCloseBtn)
					} else {
						var closeBtn = '<input type="button" class="btn-matching-modal-close" value="닫기"/>';
							$("#dynamic-button-area").html(closeBtn).data('boardno', boardNo)
					}
					
					
				},
				"error": function(xhr, status, err){
					alert("실패");
				
				} 
				
			}); 
		});
	});



	
 	function toggleSwitch() {
        // 스위치 상태를 변경하지 않고 기존 상태를 유지
        return false;
    }
 	
	</script>
	
	<script src="/project-gpmatching/resources/assets/js/common.js"></script>
	
</body>

</html>