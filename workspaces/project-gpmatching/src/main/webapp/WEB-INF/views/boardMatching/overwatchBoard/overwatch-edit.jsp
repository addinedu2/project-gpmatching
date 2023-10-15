<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


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

<title>오버워치 매칭 글 수정</title>
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
			
			<!-- Container fluid -->

			<a href="/project-gpmatching/boardMatching/overwatchBoard/overwatch-list">
				<button type="button" class="btn btn-primary mb-2">오버워치 목록보기</button>
			</a>
			<a href="/project-gpmatching/home">
				<button type="button" class="btn btn-primary mb-2">홈으로</button>
			</a>
				
			<br>
			<!-- Input -->
			<form action="overwatch-edit" method="post">
				<input name="gameNo" type="hidden" id="textInput" class="form-control" value="${ owMatchingBoard.gameNo }">
				<input name="boardNo" type="hidden" id="textInput" class="form-control" value="${ owMatchingBoard.boardNo }">
				<div class="mb-3 txt-box">
					<label class="form-label" for="textInput">제목</label>
					<input name="boardTitle" type="text" id="textInput" class="form-control" 
							placeholder="시간은 꼭 포함해서 작성해주세요" value="${ owMatchingBoard.boardNo }">
				</div>
				<div class="mb-3 txt-box">
					<label class="form-label" for="textInput">작성자 : ${ loginuser.nickname }</label>
					<input name="userNo" type="hidden" id="textInput" class="form-control" value="${ loginuser.userNo }">
				</div>
				<!-- Textarea -->
				<div class="mb-3 txt-box">
					<label for="textarea-input" class="form-label">내용</label>
					<textarea name="boardContent" class="form-control" id="textarea-input" rows="5">${ owMatchingBoard.boardContent }</textarea>
				</div>
				<!-- Checks -->
				<div class="txt-box">
					<div class="form-check">
						<input name="mic" class="form-check-input" type="checkbox" value=1
							id="flexCheckDefault"> <label class="form-check-label"
							for="flexCheckDefault"> 마이크 사용 </label>
					</div>
				</div>
				<!-- radio-->
				<br>
				<div class="txt-box">
					<div class="form-check">
						<input class="form-check-input" type="radio" value="anyone"
							name="preferGender" id="flexRadioDefault1" checked> <label
							class="form-check-label" for="flexRadioDefault1"> 상관없음 </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" value="M"
							name="preferGender" id="flexRadioDefault1"> <label
							class="form-check-label" for="flexRadioDefault1"> 남자만 </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" value="F"
							name="preferGender" id="flexRadioDefault2"> <label
							class="form-check-label" for="flexRadioDefault2"> 여자만 </label>
					</div>
				</div>			
				
				<!-- 오버워치 등록 -->
				<div class="mb-3 txt-box">
					<label class="form-label" for="textInput">옵티어목록</label>
					<input name="owTier" type="text" id="textInput" class="form-control" value="${ owMatchingBoard.owTier }">
				</div>
				<div class="mb-3 txt-box">
					<label class="form-label" for="textInput">옵포지션</label>
					<input name="owPosition" type="text" id="textInput" class="form-control" value="${ owMatchingBoard.owPosition }">
				</div>
				<div class="mb-3 txt-box">
					<label class="form-label" for="textInput">옵선호플레이</label>
					<input name="owPlay" type="text" id="textInput" class="form-control" value="${ owMatchingBoard.owPlay }">
				</div>
				<br>
				<div class="btn-center">
					<!-- Primary Button -->
					<button type="submit" class="btn btn-primary mb-2">등록</button>
					<!-- Danger Button -->
					<button type="button" id="btnCancel" class="btn btn-danger mb-2">취소</button>
				</div>
			</form>
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
		
				<!-- Scripts -->
		<script>
			window.addEventListener("load", function(event) { // 브라우저가 현재 화면을 모두 처리한 후 호출하는 함수 등록	

				const btnCancel = document.querySelector("#btnCancel"); // id="btnCancel"인 요소 찾기
				btnCancel.addEventListener("click", function(event) {

					location.href = "overwatch-list"; // 브라우저의 주소 입력기에 주소를 입력하는 것과 같은 효과 ( 이동 )
				});
			});
			
			
			
			$("input:checkbox[name='mic']").prop('checked', ${ owMatchingBoard.mic }); // 선택하기
			
			
			$("input:radio[name='preferGender']:radio[value='${ owMatchingBoard.preferGender }']").prop('checked', true); // 선택하기
			

		</script>
		<script src="/project-gpmatching/resources/assets/js/common.js"></script>
		
</body>

</html>