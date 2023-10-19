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

<title>LOL 매칭 글 수정</title>
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
			
			<!-- Container fluid -->
			<br>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<a href="/project-gpmatching/boardMatching/lolBoard/lol-list">
				<button type="button" class="btn btn-primary me-2">LoL 목록보기</button>
			</a>
			<a href="/project-gpmatching/home">
				<button type="button" class="btn btn-primary me-3">홈으로</button>
			</a>
			</div>

			<!-- Input -->
			<form action="lol-edit" method="post">
				<input name="gameNo" type="hidden" id="textInput" class="form-control" value="${ lolMatchingBoard.gameNo }">
				<input name="boardNo" type="hidden" id="textInput" class="form-control" value="${ lolMatchingBoard.boardNo }">
				<div class="mb-3 txt-box">
					<label class="form-label text-light" for="textInput">제목</label>
					<input name="boardTitle" type="text" id="textInput" class="form-control" 
							placeholder="시간은 꼭 포함해서 작성해주세요" value="${ lolMatchingBoard.boardTitle }">
				</div>
				<div class="mb-3 txt-box">
					<label class="form-label text-light" for="textInput">작성자 : ${ loginuser.nickname }</label>
					<input name="userNo" type="hidden" id="textInput" class="form-control" value="${ loginuser.userNo }">
				</div>
				<!-- Textarea -->
				<div class="mb-3 txt-box">
					<label for="textarea-input" class="form-label text-light">내용</label>
					<textarea name="boardContent" class="form-control" id="textarea-input" rows="5">${ lolMatchingBoard.boardContent }</textarea>
				</div>
				<!-- Checks -->
				<div class="txt-box text-light">
					<div class="form-check ">
						<input name="mic" class="form-check-input" type="checkbox" 
							id="flexCheckDefault"> <label class="form-check-label"
							for="flexCheckDefault"> 마이크 사용 </label>
					</div>
				</div>
				<!-- radio-->
				<br>
				<div class="txt-box text-light ">
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
				<br>
				<div class="mb-3 txt-box">
					<label class="form-label text-light" for="textInput">모집인원 <span class="text-secondary">(최대 4인)</span></label>
					<select class="form-select" id="headCount" name="headCount" aria-label="Default select example">
						<option selected>인원을 선택하세요</option>
						<option value=1>2</option>
						<option value=2>3</option>
						<option value=3>4</option>
						<option value=4>5</option>
					</select>
				</div>		
				<br>
				<!-- 롤 등록 -->
				<div class="mb-3 txt-box">
					<label class="form-label text-light" for="selectOne">롤주포지션</label>
					<select name="lolPosition" id="lolPosition" class="form-select" aria-label="Default select example">
						<option selected>포지션 전체</option>
						<option value="top">탑</option>
						<option value="jungle">정글</option>
						<option value="mid">미드</option>
						<option value="adcarry">원딜</option>
						<option value="support">서폿</option>
					</select>
				</div>
				<div class="mb-3 txt-box">
					<label class="form-label text-light" for="textInput">롤서렌여부</label>
					<input name="lolSur" type="text" id="textInput" class="form-control" value="${ lolMatchingBoard.lolSur }">
				</div>
				<div class="mb-3 txt-box">
					<label class="form-label text-light" for="textInput">롤선호플레이</label>
					<input name="lolPlay" type="text" id="textInput" class="form-control" value="${ lolMatchingBoard.lolPlay }">
				</div>
				<!-- Select Option -->
				<div class="mb-3 txt-box">
					<label class="form-label text-light" for="selectOne">티어<span
						class="text-secondary">(현재 티어)</span></label> 
					<select name="lolTier" id="lolTier" class="form-select"
						aria-label="Default select example">
						<option selected>티어를 선택하세요</option>
						<option value="bronze">브론즈</option>
						<option value="silver">실버</option>
						<option value="gold">골드</option>
					</select>
				</div>
				
				<div class="time1">
				    <label for="customStartTimeRange" class="form-label text-light" style="margin-right: 10px;">시작 시간 : </label><span id="start-time-value"></span>
				    <input type="range" class="form-range" min="0" max="24" step="0.5" id="customStartTimeRange" value="0" oninput="updateSelectedTime('start-time', this.value);">
				    <input type="hidden" name="startTime" id="startTime">
				</div>
				
				<div class="time2">
				    <label for="customEndTimeRange" class="form-label text-light" style="margin-right: 10px;">종료 시간 : </label><span id="end-time-value"></span>
				    <input type="range" class="form-range" min="0" max="24" step="0.5" id="customEndTimeRange" value="0" oninput="updateSelectedTime('end-time', this.value);">
				    <input type="hidden" name="endTime" id="endTime">
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

					location.href = "lol-list"; // 브라우저의 주소 입력기에 주소를 입력하는 것과 같은 효과 ( 이동 )
				});
			});
			
			function updateSelectedTime(timeType, value) {
			    var selectedTime = document.getElementById(timeType + "-value");
			    var hours = Math.floor(value);
			    var minutes = (value % 1) * 60;
			    var ampm = hours >= 12 ? "오후" : "오전";
			    var formattedHours = hours % 12 || 12;

			    selectedTime.innerHTML = ampm + " " + formattedHours + ":" + (minutes < 10 ? "0" : "") + Math.round(minutes);
			    
			 	// 시작 시간 값을 가져와 hidden_start_time 필드에 설정
				var startTimeValue = document.getElementById('start-time-value').textContent;
				document.getElementById('startTime').value = startTimeValue;

				// 종료 시간 값을 가져와 hidden_end_time 필드에 설정
				var endTimeValue = document.getElementById('end-time-value').textContent;
				document.getElementById('endTime').value = endTimeValue;
			}
			
			
			
			$("input:checkbox[name='mic']").prop('checked', ${ lolMatchingBoard.mic }); // 선택하기
			
			
			$("input:radio[name='preferGender']:radio[value='${ lolMatchingBoard.preferGender }']").prop('checked', true); // 선택하기
			
			$("#headCount").val('${ lolMatchingBoard.headCount }').prop("selected", true);// 선택하기
			
			$("#lolPosition").val('${ lolMatchingBoard.lolPosition }').prop("selected", true);// 선택하기
			
			$("#lolTier").val('${ lolMatchingBoard.lolTier }').prop("selected", true);// 선택하기
		</script>
		<script src="/project-gpmatching/resources/assets/js/common.js"></script>
		
</body>

</html>