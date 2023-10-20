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
	href="/project-gpmatching/resources/assets/css/theme.min.css">
<title>관리자 차트</title>
  <script src="/webjars/chartjs/4.1.2/dist/Chart.min.js"></script>
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


  <div>
        <!-- 하루치 원형 그래프 -->
        <canvas id="dailyChart" width="10" height="10"></canvas>
    </div>
    <div>
        <!-- 일주일치 원형 그래프 -->
        <canvas id="weeklyChart" width="10" height="10"></canvas>
    </div>

    <script>
        // 하루치 원형 그래프 데이터
        var dailyData = {
            labels: ['Common Board', 'Battleground', 'Lol', 'Overwatch'],
            datasets: [{
                data: [<%= AdminDto.getCommonBoardCountForDay() %>, <%= AdminDto.getMatchingBoardCountBattlegroundForDay() %>, <%= AdminDto.getMatchingBoardCountLolForDay() %>, <%= AdminDto.getMatchingBoardCountOverwatchForDay() %>],
                backgroundColor: ['red', 'blue', 'green', 'orange']
            }]
        };

        // 일주일치 원형 그래프 데이터
        var weeklyData = {
            labels: ['Common Board', 'Battleground', 'Lol', 'Overwatch'],
            datasets: [{
                data: [<%= AdminDto.getCommonBoardCountForWeek() %>, <%= AdminDto.getMatchingBoardCountBattlegroundForWeek() %>, <%= AdminDto.getMatchingBoardCountLolForWeek() %>, <%= AdminDto.getMatchingBoardCountOverwatchForWeek() %>],
                backgroundColor: ['red', 'blue', 'green', 'orange']
            }]
        };

        // 하루치 원형 그래프 그리기
        var dailyChart = new Chart(document.getElementById('dailyChart'), {
            type: 'doughnut',
            data: dailyData
        });

        // 일주일치 원형 그래프 그리기
        var weeklyChart = new Chart(document.getElementById('weeklyChart'), {
            type: 'doughnut',
            data: weeklyData
        });
    </script>
    
    
    
    
</body>
</html>






