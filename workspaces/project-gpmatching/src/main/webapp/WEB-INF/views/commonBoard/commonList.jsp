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
	
    <title>commonList</title>
</head>

<body class="bg-light">
    <div id="db-wrapper" class="toggled">
    <jsp:include page="/WEB-INF/views/modules/sidebar.jsp" />
    <div id="page-content">
	<jsp:include page="/WEB-INF/views/modules/header.jsp" />
             
             <!-- commonList -->
             <a href="/project-gpmatching/commonBoard/commonWrite">
				<button type="button" class="btn btn-secondary mb-2">글쓰기</button></a>
             <!-- basic table -->
<table class="table">
   <thead>
      <tr>
         <th>번호</th>
         <th>제목</th>
         <th>작성자</th>
         <th>조회수</th>
         <th>작성일자</th>
      </tr>
   </thead>
   <!-- commonNo, commonTitle, userNo, readCount, regDate --> 
   <tbody>
   <c:forEach var="commonBoard" items="${commonBoardList }">
      <tr>
         <td>${commonBoard.commonNo }</td>
         <td style="text-align:left; padding-left:10px">
         <c:choose>
         	<c:when test="${not commonBoard.deleted }">
         		<a href="commonDetail?commonNo=${commonBoard.commonNo}&pageNo=${pageNo}">${commonBoard.commonTitle }</a>
         	</c:when>
         	<c:otherwise>
         	<span class="deleted" style="color:gray;">[삭제된 글]</span>
         	</c:otherwise>
         </c:choose>
         
         <td>${ commonBoard.userNo }</td>
         <td>${ commonBoard.readCount }</td>
         <td>
         	<fmt:formatDate value="${commonBoard.regDate }"
         				    pattern="yyyy-MM-dd"/>
         </td>
      </tr>
      </c:forEach>
   </tbody>
</table>
             ${pager }
            </div>
            <%-- <jsp:include page="/WEB-INF/views/modules/testBottom.jsp" /> --%>

</body>

</html>