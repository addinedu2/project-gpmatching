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
	<title>자유게시판</title>
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

	<div id="pageContainer">
		
		<div style="padding-top:25px;text-align:center">
		<div id="inputcontent">
		    <div id="inputmain">
		        <div class="inputsubtitle">게시글 정보</div>
		        <table>
		        	<tr>
		                <th>글번호</th>
		                <td>${requestScope.commonBoard.commonNo }</td>
		            </tr>
		            <tr>
		                <th>제목</th>
		                <td>${commonBoard.commonTitle }</td>
		            </tr>
		            <tr>
		                <th>작성자</th>
		                <td>${commonBoard.userNo }</td>
		            </tr>
		            <tr>
		                <th>작성일</th>
		                <td>
		                <fmt:formatDate value="${commonBoard.regDate }" pattern="yyyy-MM-dd" />
		                </td>
		            </tr>
		            <tr>
		                <th>조회수</th>
		                <td>${commonBoard.readCount }</td>
		            </tr>
		            <tr>
		            
<c:set var="enter" value="
" />		
		            <!-- c:set은 변수를 만들어줌. value값에 ""사이에 실제 줄바꿈 엔터를 쳐줘야함 -->
		                <th>본문</th>
		                <td>${fn:replace(commonBoard.commonContent,enter,"<br>") }</td>
		                <!--  -->
		     <!-- c:set에서 var="enter"설정을 줄바꿈으로 설정해줘서 enter칠 때마다 자동으로 <br>들어감 -->
		            </tr>
		        </table>
		        <div class="buttons">
		        	[ <a href="commonList?=pageNo=${pageNo}">목록보기</a> ]
		        	<!-- sessionScope.loginuser != null && loginuser.memberId == board.writer 같은 의미-->
		        	[ <a href="commonEdit?commonNo=${commonBoard.commonNo}&pageNo=${pageNo}">수정</a> ]
		        	[ <a href="javascript:" id="delete-board-lnk">삭제</a> ]
		        
		        </div>
		        
		        <!-- write comment area -->
		<form id="commentform" action="writeComment" method="post">
			<input type="hidden" name="commonNo" value="${ commonBoard.commonNo }" />
			<input type="hidden" name="pageNo" value="${ pageNo }" />
			<%-- <input type="hidden" name="userNo" value="${ userNo }" />  --%>
			<!-- 로그인하면 댓글 쓰는 걸로 처리할 시 loginuser.userNo 체크  -->
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
		
		<!-- comment list area -->
		<hr style="width:800px;margin:0 auto">
<br>
<table id="comment-list" style="width:800px;border:solid 1px;margin:0 auto">
    <c:forEach var="comment" items="${commonBoard.boardCommentList}">				
        <tr>
            <td style="text-align:left;margin:5px;border-bottom: solid 1px;">
                <div id="comment-view-area-${comment.commentNo}">
                    <c:choose>
                        <c:when test="${comment.deleted}">
                            <br><br>
                            <span style='color:gray'>삭제된 글입니다.</span>
                            <br><br>
                        </c:when>
                        <c:otherwise>
                            ${comment.writer } &nbsp;&nbsp; [<fmt:formatDate value="${comment.regDate}" pattern="yyyy-MM-dd hh:mm:ss"/>]
                            <br /><br />
                            <span>${fn:replace(comment.content, enter, "<br>")}</span>
                            <br /><br />
                                <a class="edit-comment" data-comment-no="${comment.commentNo}" href="javascript:">편집</a>
                                &nbsp;
                                <a class="delete-comment" data-comment-no="${comment.commentNo}" href="javascript:">삭제</a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>	                
                <div id="comment-edit-area-${comment.commentNo}" style="display: none">
                    ${comment.userNo } &nbsp;&nbsp; [${comment.regDate}]
                    <br /><br />
                    <form action="editComment" method="post">
                        <input type="hidden" name="commentNo" value="${comment.commentNo}" />
                        <textarea name="content" style="width: 99%; resize: none" rows="3" maxlength="200">${comment.commentContent}</textarea>
                    </form>
                    <br />
                    <div>
                        <a class="update-comment" data-comment-no="${comment.commentNo}" href="javascript:">수정</a> 
                        &nbsp; 
                        <a class="cancel-edit-comment" data-comment-no="${comment.commentNo}" href="javascript:">취소</a>
                    </div>
                </div>
            </td>
        </tr>
    </c:forEach>        	
</table>
		
		
		<%-- 로그인 해서야 돌아가는 코드이니 남겨준다 로그인 걸리면 주석 풀 것
		<br>
	    <hr style="width:800px;margin:0 auto">
	    <br>
	    <table id="comment-list" style="width:800px;border:solid 1px;margin:0 auto">
		<c:forEach var="comment" items="${ commonBoard.boardCommentList }">				
			<tr>
				<td style="text-align:left;margin:5px;border-bottom: solid 1px;">					
					<div id="comment-view-area-${ boardComment.commentNo }">
					<c:choose>
					<c:when test="${ boardComment.deleted }">
						<br><br>
						<span style='color:gray'>삭제된 글입니다.</span>
						<br><br>
					</c:when>
					<c:otherwise>
						${ boardComment.writer } &nbsp;&nbsp; [<fmt:formatDate value="${ boardComment.regDate }" pattern="yyyy-MM-dd hh:mm:ss"/>]
					    <br /><br />
					    <span>${ fn:replace(boardComment.content, enter, "<br>") }</span>
						<br /><br />
						<div style='display:${ (not empty loginuser and loginuser.memberId == BoardComment.writer) ? "block" : "none" }'>
					    	<a class="edit-comment" data-comment-no="${ boardComment.commentNo }" href="javascript:">편집</a>
							&nbsp;
							<a class="delete-comment" data-comment-no="${ boardComment.commentNo }" href="javascript:">삭제</a>
						</div>
					</c:otherwise>
					</c:choose>
					</div>	                
					<div id="comment-edit-area-${ boardComment.commentNo }" style="display: none">
						${ boardComment.userNo } &nbsp;&nbsp; [${ boardComment.regDate }]
						<br /><br />
						<form action="editComment" method="post">
						<input type="hidden" name="commentNo" value="${ boardComment.commentNo }" />
						<input type="hidden" name="commonNo" value="${ commonBoard.commonNo }" />
						<input type="hidden" name="pageNo" value="${ pageNo }" />
						<textarea name="content" style="width: 99%; resize: none" rows="3" maxlength="200">${ boardComment.commentContent }</textarea>
						</form>
						<br />
						<div>
							<a class="update-comment" data-comment-no="${boardComment.commentNo}" href="javascript:">수정</a> 
							&nbsp; 
							<a class="cancel-edit-comment" data-comment-no="${ boardComment.commentNo }" href="javascript:">취소</a>
						</div>
					</div>
			
				</td>
			</tr>
		</c:forEach>        	
		</table> --%>
		<!-- end of comment list area -->
		    </div>
		</div>
		<br><br>
		
		
	
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




	<!-- Theme JS -->
	<script src="/project-gpmatching/resources/assets/js/theme.min.js"></script>
	
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

	});
	</script>
	

</body>
</html>