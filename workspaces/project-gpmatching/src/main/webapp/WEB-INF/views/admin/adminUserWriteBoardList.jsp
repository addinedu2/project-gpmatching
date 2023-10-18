<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
	
<!-- 	<style type="text/css">
	listCommon {
	text-align: center;
	}
	
	</style>
 -->	
  <style>
        .table-container h2 {
            color: white;
        }
    </style>
 
 
    <title>회원이 쓴 글 리스트</title>
</head>

<body class="bg-dark">

             
             <!-- commonList -->
    
<div class="table-container">
    <h2>매칭 게시판</h2>
    <table border="1" class="table text-light" style="text-align: center">
   <thead>
      <tr class="listCommon" >
             <th>제목</th>
             <th>카테고리</th>
             <th>작성일</th>
             <th>삭제 여부</th>
      </tr>
   </thead>
   <tbody>
   <c:forEach var="matchingBoardList"  items="${requestScope.matchingBoardList }" varStatus="loop">
      <tr>
         <td>${ matchingBoardList.boardTitle }</td>
         <td>${ matchingBoardList.gameNo }</td>
         <td>
         	<fmt:formatDate value="${ matchingBoardList.regDate }"
         				    pattern="yyyy-MM-dd"/>
 		 <td>${ matchingBoardList.deleted }</td>
         </td>
      </tr>
      </c:forEach>
   </tbody>
</table>
<br>
             <div>
             	<ul class="pagination justify-content-center mb-0">
             	${ commonBoardPager }
             	</ul>
             </div>
            </div>
          </div>
          
<div class="table-container">
    <h2>자유 게시판</h2>
    <table border="1" class="table text-light" style="text-align: center">
   <thead>
      <tr class="listCommon" >
             <th>제목</th>
             <th>작성일</th>
             <th>삭제 여부</th>
      </tr>
   </thead>
   <tbody>
   <c:forEach var="commonBoard"  items="${requestScope.commonBoardList }" varStatus="loop">
      <tr>
         <td>${ commonBoard.boardTitle }</td>
         <td>
         	<fmt:formatDate value="${ commonBoard.regDate }"
         				    pattern="yyyy-MM-dd"/>
 		 <td>${ commonBoard.deleted }</td>
         </td>
      </tr>
      </c:forEach>
   </tbody>
</table>
<br>
             <div>
             	<ul class="pagination justify-content-center mb-0">
             	${ commonBoardPager }
             	</ul>
             </div>
            </div>
          </div>
          
         
<div class="table-container">
    <h2>신고 게시판</h2> 
    <table border="1" class="table text-light" style="text-align: center">
   <thead>
      <tr class="listCommon" >
             <th>제목</th>
             <th>작성일</th>
      </tr>
   </thead>
   <tbody>
   <c:forEach var="reportBoardList"  items="${requestScope.reportBoardList }" varStatus="loop">
      <tr>
         <td>${ reportBoardList.boardTitle }</td>
         <td>
         	<fmt:formatDate value="${ reportBoardList.regDate }"
         				    pattern="yyyy-MM-dd"/>
         </td>
      </tr>
      </c:forEach>
   </tbody>
</table>
<br>
             <div>
             	<ul class="pagination justify-content-center mb-0">
             	${ reportBoardPager }
             	</ul>
             </div>
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
	
	<script src="/project-gpmatching/resources/assets/js/common.js"></script>
	
</body>

</html>