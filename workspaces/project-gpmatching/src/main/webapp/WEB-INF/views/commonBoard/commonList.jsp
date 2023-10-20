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
<link rel="shortcut icon" type="image/x-icon" href="/project-gpmatching/resources/assets/images/favicon/gps-ico.ico">
<!-- Theme CSS -->
<link rel="stylesheet" href="/project-gpmatching/resources/assets/css/theme.min.css">
<link rel="stylesheet" href="/project-gpmatching/resources/assets/css/theme.css">

<!-- Libs CSS -->
<link href="/project-gpmatching/resources/assets/libs/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link href="/project-gpmatching/resources/assets/libs/dropzone/dist/dropzone.css" rel="stylesheet">
<link href="/project-gpmatching/resources/assets/libs/@mdi/font/css/materialdesignicons.min.css" rel="stylesheet" />
<link href="/project-gpmatching/resources/assets/libs/prismjs/themes/prism-okaidia.css" rel="stylesheet">
		
<title>자유게시판</title>

</head>

<body class="bg-dark">
    <div id="db-wrapper" class="toggled">
    <jsp:include page="/WEB-INF/views/modules/sidebar.jsp" />
    <div id="page-content">
	<jsp:include page="/WEB-INF/views/modules/header.jsp" />
             
             <!-- commonList -->
             <br>
             <div class="d-grid gap-2 d-md-flex justify-content-md-end">
             <a href="/project-gpmatching/commonBoard/commonWrite">
				<button type="button" class="btn btn-secondary me-2">글쓰기</button>
			 </a>
			<a href="/project-gpmatching/home">
				<button type="button" class="btn btn-primary me-3">홈으로</button>
			</a>	
				
			 </div>
			 <br>
             <!-- basic table -->
<table class="table text-light" style="text-align: center">
   <thead>
      <tr class="listCommon" >
         <th>번호</th>
         <th>제목</th>
         <th>작성자</th>
         <th>조회수</th>
         <th>작성일자</th>
      </tr>
   </thead>
   <!-- commonNo, commonTitle, userNo, readCount, regDate --> 
   <tbody>
   <c:forEach var="commonBoard" items="${requestScope.commonBoardList }" varStatus="loop">
      <tr>
         <td>${commonBoard.commonNo }</td>
         <td style="text-align:left; padding-left:10px">
         <c:choose>
         	<c:when test="${not commonBoard.deleted }">
    	     	<a href="commonDetail?commonNo=${commonBoard.commonNo}&pageNo=${pageNo}" style="text-decoration: none; color: inherit;">${commonBoard.commonTitle } </a>
				<a href="commonDetail?commonNo=${commonBoard.commonNo}&pageNo=${pageNo}#comment-list"  style="text-decoration: none; color: inherit;"> [<c:out value="${commentCounts[loop.index]}"></c:out>]</a>         <!--  varStatus="loop"를 이용한 댓글 갯수 가져오기 -->
         	</c:when>
         	<c:otherwise>
         	<span class="deleted" style="color:gray;">[삭제된 글]</span>
         	</c:otherwise>
         </c:choose>
        
         <td>${ commonBoard.nickname }</td>
         <td>${ commonBoard.readCount }</td>
         <td>
         	<fmt:formatDate value="${ commonBoard.regDate }"
         				    pattern="yyyy-MM-dd"/>
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
	
</body>

</html>