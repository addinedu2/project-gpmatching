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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">



<!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon" href="/project-gpmatching/resources/assets/images/favicon/favicon.ico">

<!-- Libs CSS -->


<link href="/project-gpmatching/resources/assets/libs/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link href="/project-gpmatching/resources/assets/libs/dropzone/dist/dropzone.css" rel="stylesheet">
<link href="/project-gpmatching/resources/assets/libs/@mdi/font/css/materialdesignicons.min.css" rel="stylesheet" />
<link href="/project-gpmatching/resources/assets/libs/prismjs/themes/prism-okaidia.css" rel="stylesheet">








<!-- Theme CSS -->
<link rel="stylesheet" href="/project-gpmatching/resources/assets/css/theme.css">
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
						<div class="card-header bg-gray-800 py-4" style="display: flex; align-items: center; justify-content: space-between;">
						    <div style="display: flex; align-items: center;">
						        <img src="/project-gpmatching/resources/assets/images/lol/logo.png" width="200px">
						    </div>
						    <div style="display: flex; align-items: center;">
						        <select name="searchType" style="width: 150px;" class="form-select form-select">
						            <option value="" selected>-- 옵션 --</option>
						            <option value="t">제목</option>
						            <option value="c">내용</option>
						            <option value="n">닉네임</option>
						        </select>
						        <input name="keyword" style="width: 200px; margin-left: 10px; margin-right: 10px;" class="form-control" type="search" id="search-input" placeholder="검색어를 입력하세요">
						        <button id="search-btn" type="button" class="btn btn-light">검색</button>
						    </div>
						</div>
						<!-- table  -->
						<table id="matching-list" class="table table-sm table-dark table-hover">
							<thead style="vertical-align: middle;">
										
								<tr>
									<th scope="col" style="width:100px;">소환사이름</th>
									<th scope="col">제목</th>
									<th scope="col">내용</th>
									<th>
									<div class="dropdown" style="width:110px; text-align:center;">
										<button class="btn btn-secondary btn-sm dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										티어											
										</button>
									 	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									 		<a class="dropdown-item" href="/project-gpmatching/boardMatching/lolBoard/lol-list">모든 티어</a>
											<a class="dropdown-item" href="?lolTier=bronze">브론즈</a>
											<a class="dropdown-item" href="?lolTier=silver">실버</a>
											<a class="dropdown-item" href="?lolTier=gold">골드</a>											

										</div>
									</div>
									</th>
						         	
							         	<th scope="col" style="width:110px; vertical-align: middle;">주포지션</th>
							         	<th scope="col" style="width:110px;" >게임시간</th>
							         	<th scope="col">마이크사용</th>
							         	<th scope="col" style="width:80px;">모집인원</th>
							         	<th scope="col" style="width:80px;">마감여부</th>
							        	<th scope="col" style="width:80px;">등록일시</th>
							         	<th scope="col" style="text-align: center">댓글</th>
							         	<th scope="col"></th>
									</tr>
								</thead>
				 
								<tbody id="lol-list"  style="vertical-align: middle;">		
									<c:forEach var="matchingBoard" items="${ requestScope.matchingLolList }">
										<tr id="tr-${ matchingBoard.boardNo }" data-title="${ matchingBoard.boardTitle }">
											<th style="text-align:center; vertical-align: middle;">
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
											<td style="text-align:center;">
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
											<td style="text-align:center;">
											<c:set var="lolPosition" value="${ matchingBoard.lolPosition }" />
											<c:choose>
												<c:when test = "${ lolPosition eq 'all'}">
													<img src="/project-gpmatching/resources/assets/images/lol/all.png" width=24px>
												</c:when>
												<c:when test = "${ lolPosition eq 'top'}">
													<img src="/project-gpmatching/resources/assets/images/lol/top.svg" width=24px>
												</c:when>
												<c:when test = "${ lolPosition eq 'jungle'}">
													<img src="/project-gpmatching/resources/assets/images/lol/jungle.svg" width=24px>
												</c:when>	
												<c:when test = "${ lolPosition eq 'mid'}">
													<img src="/project-gpmatching/resources/assets/images/lol/mid.svg" width=24px>
												</c:when>
												<c:when test = "${ lolPosition eq 'adcarry'}">
													<img src="/project-gpmatching/resources/assets/images/lol/adcarry.svg" width=24px>
												</c:when>
												<c:when test = "${ lolPosition eq 'support'}">
													<img src="/project-gpmatching/resources/assets/images/lol/support.svg" width=24px>
												</c:when>
												<c:otherwise>
													${ matchingBoard.lolPosition }
												</c:otherwise>
											</c:choose>
											</td>
											<th style="text-align:center;">
											<c:choose>
											<c:when test = "${ empty(matchingBoard.startTime) && empty(matchingBoard.endTime) }">
											미정
											</c:when>
											<c:otherwise>
											${ matchingBoard.startTime } ~ ${ matchingBoard.endTime }
											</c:otherwise>
											</c:choose>
											
											</th>
											
											<th style="text-align:center;">
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
											<th style="text-align:center;">${ matchingBoard.confirmCount + 1} / ${ matchingBoard.headCount + 1}</th>
											<c:choose>
												<c:when test="${matchingBoard.matchingClose == true}">
													<th style="text-align:center;"><i class="icon-sm text-success" data-feather="check-circle"></i></th>
												</c:when>
												<c:otherwise>
													<th style="text-align:center;"><div class="spinner-border" role="status">
													<span class="visually-hidden">Loading...</span></div></th>
												</c:otherwise>
											</c:choose>
												<c:choose>
											    <c:when test="${empty matchingBoard.regDate}">
											        <th>날짜 정보 없음</th>
											    </c:when>
											    <c:otherwise>
											        <th style="text-align:center;">
											    <c:set var="regDate" value="${matchingBoard.regDate}" scope="page" />
											    <%= Time.calculateTime((java.util.Date) pageContext.getAttribute("regDate")) %>
											</th>
											    </c:otherwise>
											</c:choose>
											<th class="align-middle" style="width:110px;">
												<!-- Varying modal -->
<div>
												<button type="button" class="btn btn-primary btn-sm btn-show-comment-modal" 
														data-boardno="${ matchingBoard.boardNo }"
														data-nickname="${ matchingBoard.nickname }"
														data-close="${ matchingBoard.matchingClose }">${ matchingBoard.boardNo }
												</button>											
												<button type="button" class="btn btn-primary btn-sm btn-show-commentList-modal"
														data-boardno="${ matchingBoard.boardNo }"
														data-nickname="${ matchingBoard.nickname }">목록</button>
											</th>
											<th>
												<div class="dropdown dropstart" >
													<c:choose>
													<c:when test = "${ loginuser.nickname eq matchingBoard.nickname }">
			                                        <a class="text-muted text-primary-hover" href="#" role="button" id="dropdownTask" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			                                            <i class="icon-xxs" data-feather="more-vertical" ></i>
			                                        </a>
			                                        <div class="dropdown-menu" aria-labelledby="dropdownTask">
			                                            <a class="dropdown-item" href="lol-edit?boardNo=${matchingBoard.boardNo}">수정</a>
			                                            <a class="dropdown-item" href="lol-delete?boardNo=${matchingBoard.boardNo}">삭제</a>
			                                        </div>
			                                        </c:when>
			                                        </c:choose>
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
	
	
	// 글번호(댓글쓰기) 버튼을 누르면 모달창을 보여줌 (-허지웅)
	$(function() {
		
		$('#lol-list').on("click", '.btn-show-comment-modal', function(event) {
			
			const boardNo = $(this).data('boardno');
			const userNo = "${ loginuser.userNo }";
			const currentTr = $('#tr-' + boardNo);
			const writerNickname = $(this).data('nickname');
			const loginNickname = "${ loginuser.nickname }";
			const close = $(this).data('close');
			
			if (writerNickname === loginNickname) {
				alert("자신의 글에 댓글을 달 수 없습니다");
				return; 
			
			} else if (close){
				alert("이미 마감된 글에 댓글을 작성할 수 없습니다");
				return;
			}
			
			$.ajax({
				"url": "check-comment-dup",
				"method": "get",
				"data": { "userNo" : userNo , "boardNo" : boardNo },
				"success": function(data){
					
					const dupCheck = $.trim(data);
					if(dupCheck == "false"){
						
						alert("이미 댓글을 작성하셨습니다");
						return;
					} else {
						
						$('#title-in-modal').text("(" + boardNo + ") " + currentTr.data('title'));
						$('#boardno-in-modal').val(boardNo);
						$('#comment-modal').modal('show');
						
 					}
				},
				"error": function(xhr, status, err){
					alert("실패");
				}
				
			});
			
		});
	
			
		// 댓글쓰기 모달창의 등록 버튼을 누르면 데이터가 전송됨
		$('#write-comment-lnk').on('click', function(event){
			
			const formData = $('#commentform').serialize();	// <form> 에 포함된 입력요소의 값을 뽑아서 전송가능한 문자열로 반환
			alert(formData);
			
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
	});

	// 검색어를 입력하고 검색 버튼을 누르면 해당되는 게시글을 보여줌 (-허지웅)
	$(function(){
		
		$('#search-btn').on("click", function(event){
			
			var searchType = $("select[name = searchType]").val();
			var keyword = $("input[name = keyword]").val();
			
			self.location = "/project-gpmatching/boardMatching/lolBoard/lol-list?searchType=" + searchType + "&keyword=" + keyword;
			
			console.log("searchType : " + searchType);
			console.log("keyword : " + keyword);
		})
	});
	
	
	// 닫기 버튼 - 잘 동작함
	$(function() {
		$('#dynamic-button-area').on("click", '.btn-matching-modal-close', function(event) {
			location.href = "lol-list";

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
		$('#lol-list').on("click", '.btn-show-commentList-modal', function(event) {
			
			const boardNo = $(this).data('boardno');
			const currentTr = $('#tr-' + boardNo);
			$('#title2-in-modal').text("(" + boardNo + ") " + currentTr.data('title'));
			const writerNickname = $(this).data("nickname");
			const loginNickname = "${ loginuser.nickname }";

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
		                
		                $headerRow.append($("<th>").text("댓글 번호"));
		                $headerRow.append($("<th>").text("닉네임"));
		                $headerRow.append($("<th>").text("댓글 내용"));
						$headerRow.append($("<th>").text("승인여부"));;
		                
		                commentList.append($headerRow);
		                
		                for(var i = 0; i < result.length; i++){
							var $row = $("<tr>");
		                    
		                    $row.append($("<td>").text(result[i].commentNo));
		                    $row.append($("<td>").text(result[i].nickname));
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
	                        
	                        // 추가: 글작성자와 로그인 사용자를 비교하여 버튼 숨기기
		                    if (loginNickname !== writerNickname) {
		                        $acceptButton.hide();
		                        $rejectButton.hide();
		                    }
		
		                    commentList.append($row);

	                        sHeadCount = result[i].headCount;
	      					sConfirmCount = result[i].confirmCount;
	      					headCount = parseInt(sHeadCount);
	      					confirmCount = parseInt(sConfirmCount);
	      					matchingClose = result[i].matchingClose;
	    	                
	                      
						}
					}
					
					console.log(commentList);
					$('#commentList-modal').modal('show');
					
					
					if( (commentList != null ) && (matchingClose == false) && (headCount == confirmCount ) && (writerNickname == loginNickname)){
						
						
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
		                
		                $headerRow.append($("<th>").text("댓글 번호"));
		                $headerRow.append($("<th>").text("닉네임"));
		                $headerRow.append($("<th>").text("댓글 내용"));
						$headerRow.append($("<th>").text("승인여부"));;
		                
		                commentList.append($headerRow);
		                
						for(var i = 0; i < result.length; i++){
							var $row = $("<tr>");
		                    
		                    $row.append($("<td>").text(result[i].commentNo));
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
		                
		                $headerRow.append($("<th>").text("댓글 번호"));
		                $headerRow.append($("<th>").text("닉네임"));
		                $headerRow.append($("<th>").text("댓글 내용"));
						$headerRow.append($("<th>").text("승인여부"));;
		                
		                commentList.append($headerRow);
		                
						for(var i = 0; i < result.length; i++){
							var $row = $("<tr>");
		                    
		                    $row.append($("<td>").text(result[i].commentNo));
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

 	// 수정 링크를 클릭할 때의 동작
 	document.getElementById("dropdownTask-check").addEventListener("click", function() {
 	    
 		const writerNickname = $(this).data('nickname');
 		const loginNickname = "${ loginuser.nickname }"; 
 		if (writerNickname === loginNickname) {
 	        return;
 	    } else {
 	        // 권한이 없는 사용자에게 경고 또는 에러 메시지를 표시
 	       alert("수정 및 삭제할 권한이 없습니다.");
 	       event.preventDefault();
 	       	
 	    }
 	});

 	function toggleSwitch() {
        // 스위치 상태를 변경하지 않고 기존 상태를 유지
        return false;
    }
 	
	</script>
	
	<script src="/project-gpmatching/resources/assets/js/common.js"></script>
	
</body>

</html>