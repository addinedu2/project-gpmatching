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
    <title>유저 목록</title>
</head>

<body class="bg-dark">
    <div id="db-wrapper" class="toggled">
    <jsp:include page="/WEB-INF/views/modules/sidebar.jsp" />
    <div id="page-content">
	<jsp:include page="/WEB-INF/views/modules/header.jsp" />
             
             <!-- commonList -->
             <br>
             <div class="d-grid gap-2 d-md-flex justify-content-md-end"></div>
			 <br>
             <!-- basic table -->
<table class="table text-light" style="text-align: center">
   <thead>
      <tr class="userList" >
     
         <th>아이디</th>
         <th>닉네임</th>
         <th>회원 등급</th>
         <th>게시글 수</th>
         <th>댓글 수</th>
      	<th>가입일</th>
      </tr>
   </thead>
   <!-- userId, nickname, regDate, userGrade, regDate --> 
   <tbody>
   <c:forEach var="userlist" items="${requestScope.listuser }" varStatus="loop">
      <tr>
         <td>${ userlist.userId }</td>
         <td>${ userlist.nickname }</td>
         <td>${ userlist.userGrade }</td>
          <td>게시판 수</td>
          <td>댓글 수</td>
        <td><fmt:formatDate value="${ userlist.regDate }" pattern="yyyy-MM-dd"/>
         </td>
      </tr>
      </c:forEach>
   </tbody>
</table>
<br>
             <div>
             	<ul class="pagination justify-content-center mb-0">
             	${ pager }
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
	
</body>

</html>