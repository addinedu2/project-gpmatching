<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
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

<style>

.gameboard-link, .board-link, .listCommon {
    color: white;
}
h2 {
    color: white;
}
</style>


<title>회원이 쓴 글 리스트</title>
</head>

<body class="bg-dark">


	<!-- commonList -->
	<br>
	<div class="table-container">
		<>
		<h2>매칭 게시판</h2>
		<table border="1" class="table text-light" style="text-align: center">
			<thead>
				<tr class="listCommon">
					<th>제목</th>
					<th>내용</th>
					<th>카테고리</th>
					<th>작성일</th>
					<th>삭제 여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="matchingBoardList"
					items="${requestScope.matchingBoardList }" varStatus="loop">
					<tr>
						<%-- <td>${ matchingBoardList.boardTitle }</td> --%>
						<td><a href="#" class="gameboard-link" data-gameNo="${matchingBoardList.gameNo}" data-boardNo="${matchingBoardList.boardNo}">${ matchingBoardList.boardTitle }</a></td>
						
						<td>${ matchingBoardList.boardContent }</td>
						<td>${ gameMap[matchingBoardList.gameNo] }</td>
						<td><fmt:formatDate value="${ matchingBoardList.regDate }"
								pattern="yyyy-MM-dd" />
						<td>${ matchingBoardList.deleted }</td>				
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<div>
			<ul class="pagination justify-content-center mb-0">${ matchingBoardPager }</ul>
		</div>
	</div>
<br>
<br>
	<div class="table-container">
		<h2>자유 게시판</h2>
		<table border="1" class="table text-light" style="text-align: center">
			<thead>
				<tr class="listCommon">
					<th>제목</th>
					<th>작성일</th>
					<th>삭제 여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="commonBoard"
					items="${requestScope.commonBoardList }" varStatus="loop">
					<tr>

						<td><a class="board-link" href="/project-gpmatching/commonBoard/commonDetail?commonNo=${commonBoard.boardNo}&pageNo=1">${commonBoard.boardTitle}</a></td>
						<td><fmt:formatDate value="${ commonBoard.regDate }"
								pattern="yyyy-MM-dd" />
						<td>${ commonBoard.deleted }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<div>
			<ul class="pagination justify-content-center mb-0">${ commonBoardPager }</ul>
		</div>
	</div>
<br>
<br>


	<div class="table-container">
		<h2>신고 게시판</h2>
		<table border="1" class="table text-light" style="text-align: center">
			<thead>
				<tr class="listCommon">
					<th>제목</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="reportBoard"
					items="${requestScope.reportBoardList }" varStatus="loop">
					<tr>
						<td><a class="board-link" href="/project-gpmatching/commonBoard/reportDetail?commonNo=${reportBoard.boardNo}&pageNo=1">${ reportBoard.boardTitle }</td>
						<td><fmt:formatDate value="${ reportBoard.regDate }"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<div>
			<ul class="pagination justify-content-center mb-0">${ reportBoardPager }</ul>
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

	<!-- Theme JS -->
	<script src="/project-gpmatching/resources/assets/js/theme.min.js"></script>

	<script src="/project-gpmatching/resources/assets/js/common.js"></script>

<script type="text/javascript">
	document.addEventListener("")


</script>



<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
        var gameboardLinks = document.querySelectorAll('.gameboard-link');

        for (var i = 0; i < gameboardLinks.length; i++) {
        	gameboardLinks[i].addEventListener('click', function(event) {
                event.preventDefault(); // 기본 동작을 중지합니다.

                var gameNo = this.getAttribute('data-gameNo');
                var boardNo = this.getAttribute('data-boardNo');
                var gamePath = '';

                // 게임 번호에 따라 기본 링크를 설정합니다.
                if (gameNo == '4') {
                    gamePath = 'pubgBoard/battleground-list';
                } else if (gameNo == '5') {
                    gamePath = 'lolBoard/lol-list';
                } else if (gameNo == '7') {
                    gamePath = 'overwatchBoard/overwatch-list';
                } else {
                    // 예외 처리: 다른 게임 번호에 대한 경로를 설정하거나 기본 경로를 지정할 수 있습니다.
                    gamePath = 'default-path';
                }
                
                // 동적으로 생성된 URL을 만듭니다.
                var dynamicURL = '/project-gpmatching/boardMatching/' + gamePath + '#' + 'tr-' + boardNo;

                // 동적으로 생성된 URL로 이동합니다.
                window.location.href = dynamicURL;
            });
        }
    });
</script>





</body>

</html>