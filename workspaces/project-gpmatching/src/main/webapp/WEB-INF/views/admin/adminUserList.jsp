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
<style>
  .table.text-light th, .table.text-light td { color: black;  } /* jsp 글자 검은색 */
  a {
  style="text-decoration:none"
  }
</style>
    <title>유저 목록</title>
</head>

<body class="bg-dark">
 
             <!-- commonList -->
             <br>
             <div class="d-grid gap-2 d-md-flex justify-content-md-end"></div>
			 <br>
<!-- card -->
<div class="card">
	<!-- card body -->
	<div class="card-body">
		<!-- 검색창 -->
		<form id="searchForm">
			<table style="text-align: center;" class="table text-light">
			<td>
			<label for="searchInput" class="form-label">회원 검색</label>
			</td>
			<td>
		    <div class="col-md-8 col-xxl-9 ms-2 ">
		        <input type="text" class="form-control" id="searchInput" name="keyword" style="width: 750px; text-decoration: none; resize: none;">
		    </div>
		    </td>
		    <td style="vertical-align: middle">
		    <a style="text-decoration: none; resize: none;">
		    <button type="button" class="btn btn-primary " onclick="searchUsers()">검색</button>
		    </a>
		    </td>
		    </table>
		    <br>
		</form>
		
		
		<!-- basic table -->
		<table class="table text-light" style="text-align: center; ">
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
		
		<!-- 검색 결과를 표시할 테이블 -->
			<tbody style="text-decoration: none; color: inherit;">
		    <c:forEach var="userlist" items="${listuser}">
		        <tr>
		        <td><a href="<c:url value='/admin/user/${userlist.userNo}' />" style="text-decoration:none" target="_blank">${ userlist.userId }</a></td>
				<td><a href="<c:url value='/admin/user/${userlist.userNo}' />" style="text-decoration:none" target="_blank">${ userlist.nickname }</a></td>
				<td><a href="<c:url value='/admin/user/${userlist.userNo}' />" style="text-decoration:none" target="_blank">${ userlist.userGrade }</a></td>
				<td><a href="<c:url value='/admin/userWrite/${userlist.userNo}' />" style="text-decoration:none" target="_blank">작성한 게시물</a></td>
				<td>댓글 수</td>
				<td><fmt:formatDate value="${ userlist.regDate }" pattern="yyyy-MM-dd"/></td>
		        </tr>
		    </c:forEach>
		
		   </tbody>
		</table>
	</div>
</div>
<br>
<div>
	<ul class="pagination justify-content-center mb-0 pager-ul">
	${ pager }
	</ul>
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
	
	<script>
	function searchUsers() {
	    var keyword = document.getElementById("searchInput").value;
	    $.ajax({
	        type: "GET",
	        url: "/project-gpmatching/admin/searchUsers",
	        data: {
	            keyword: keyword
	        },
	        success: function(data) {
	        	 // 기존의 행을 삭제
	            $("#admincontent").empty();
	            
	            // 새로운 결과를 userListTableBody에 동적으로 추가
	            $("#admincontent").html(data);
	        }
	    });
	}

		</script>
</body>

</html>