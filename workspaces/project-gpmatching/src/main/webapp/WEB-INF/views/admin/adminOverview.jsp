<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Favicon icon-->
    <link rel="shortcut icon" type="image/x-icon" href="/project-gpmatching/resources/assets/images/favicon/gps-ico.ico">

    <!-- Theme CSS -->
    <link rel="stylesheet" href="/project-gpmatching/resources/assets/css/theme.min.css">
    <title>관리자 차트</title>

    <!-- ApexCharts CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/apexcharts">

</head>

<body class="bg-light">
    <!-- page content -->
    <div id="page-content">
        <div>
            <!-- 하루치 원형 그래프 -->
            
            <br>하루치 차트
            <div id="dailyChart"></div>
        </div>
        <div>
            <!-- 일주일치 원형 그래프 -->
            일주일치 차트
            <div id="weeklyChart"></div>
        </div>
    </div>

    <!-- ApexCharts JS -->
 <script src="/project-gpmatching/resources/assets/libs/apexcharts/dist/apexcharts.min.js"></script>

    <script>
        // 하루치 원형 그래프 데이터
        var dailyData = {
            series: [100, 14, 25, 34],
            labels: ['Common Board', 'Battleground', 'Lol', 'Overwatch'],
            colors: ['#ff0000', '#0000ff', '#008000', '#ffa500']
        };

        // 일주일치 원형 그래프 데이터
        var weeklyData = {
            series: [1000, 256, 321, 160],
            labels: ['Common Board', 'Battleground', 'Lol', 'Overwatch'],
            colors: ['#ff0000', '#0000ff', '#008000', '#ffa500']
        };

        // 하루치 원형 그래프 그리기
        var dailyChart = new ApexCharts(document.getElementById('dailyChart'), {
            series: dailyData.series,
            labels: dailyData.labels,
            colors: dailyData.colors,
            chart: {
                type: 'donut',
            },
        });
        dailyChart.render();

        // 일주일치 원형 그래프 그리기
        var weeklyChart = new ApexCharts(document.getElementById('weeklyChart'), {
            series: weeklyData.series,
            labels: weeklyData.labels,
            colors: weeklyData.colors,
            chart: {
                type: 'donut',
            },
        });
        weeklyChart.render();
    </script>
</body>

</html>
