<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<c:url value="${pagingUrl}" var="adminUserListUrl">
    <c:param name="pageNo" value="${param.pageNo}" />
</c:url> <!-- 컨트롤러의 pagingUrl에서 연결된 것 -->


<!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon" href="/project-gpmatching/resources/assets/images/favicon/favicon.ico">

<!-- Libs CSS -->


<link href="/project-gpmatching/resources/assets/libs/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link href="/project-gpmatching/resources/assets/libs/dropzone/dist/dropzone.css" rel="stylesheet">
<link href="/project-gpmatching/resources/assets/libs/@mdi/font/css/materialdesignicons.min.css" rel="stylesheet" />
<link href="/project-gpmatching/resources/assets/libs/prismjs/themes/prism-okaidia.css" rel="stylesheet">

<!-- Theme CSS -->
<link rel="stylesheet" href="/project-gpmatching/resources/assets/css/theme.min.css">

<title>관리자 페이지</title>

</head>

<body class="bg-light">
	<div id="db-wrapper">
		<!-- navbar vertical -->
		<jsp:include page="/WEB-INF/views/modules/sidebar.jsp" />

		<!-- page content -->
		<div id="page-content">
			<div class="header @@classList">
				
				<jsp:include page="/WEB-INF/views/modules/header.jsp" />
				<jsp:include page="/WEB-INF/views/modules/adminHeader.jsp" />






				<!-- content -->
		
				
				
		<div id="admincontent">
		</div>
				

<!-- Scripts -->
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

<script>

$(document).ready(function() {
    // Overview 버튼 클릭 이벤트 처리
    $("#overview").on("click", function(event) {
        event.preventDefault();
        loadJSPPage($(this).attr("href"), event);
    });
    // UserListLink 링크 클릭 이벤트 처리
    $("#UserListLink").on("click", function(event) {
        event.preventDefault();
        loadJSPPage($(this).attr("href"), event);
    });

    // 링크 페이지를 동적으로 로드하는 함수
    function loadJSPPage(url, event, pageNo) {
        // 기본 이벤트 중지
        event.preventDefault();
        $("#admincontent").load(url);
    }
    
    $('#admincontent').on('click', '.pager-ul .page-item a', function(event) {
    	event.preventDefault();
    	
    	const href = $(this).attr("href");  //"href" + pager-ul .page-item a(페이지 수) = 페이징 된 링크)
    	loadJSPPage(href, event);
    });
    // Overview를 동적으로 로드하는 함수 (이 부분을 주석 처리하면 초기에 Overview가 로딩되지 않습니다)
    // loadOverview();
});
/* $('.nav-link').click(function() {
    if ( $(this).hasClass('active') ) {
        $(this).removeClass('active')
    }
    else {
        $(this).addClass('active')
    }
}); */

	
	
	

</script>
				
</body>

</html>