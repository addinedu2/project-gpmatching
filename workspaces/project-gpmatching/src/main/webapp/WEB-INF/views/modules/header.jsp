<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<div class="header @@classList">
  <!-- navbar -->
  <nav class="navbar-classic navbar navbar-expand-lg">
    <a id="nav-toggle" href="#"><i
        data-feather="menu"

        class="nav-icon me-2 icon-xs"></i></a>
    <div class="ms-lg-3 d-none d-md-none d-lg-block">
      <!-- Form -->
      
    </div>
    <!--Navbar nav -->
    <ul class="navbar-nav navbar-right-wrap ms-auto d-flex nav-top-wrap">
      <li>
		<c:choose>
			<c:when test="${ not empty loginuser }">
				${ loginuser.nickname }님, 환영합니다!<br>
				<a href="/project-gpmatching/review/write">
				리뷰를 작성해주세요 (${matchingCloseCount}개)</a>
				<button type="button" class="btn btn-primary btn-sm review-btn">클릭</button>		  
			</c:when>
		</c:choose>
      
      </li>
      <li class="dropdown stopevent">
        <a class="btn btn-light btn-icon rounded-circle indicator
          indicator-primary text-muted" href="#" role="button"
          id="dropdownNotification" data-bs-toggle="dropdown" aria-haspopup="true"
          aria-expanded="false" data-userno="${loginuser.userNo}">
          <!-- <i class="icon-xs" data-feather="bell"></i>원본 -->
          <i id="notificationicon" class="icon-xs" data-feather="bell"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end"
          aria-labelledby="dropdownNotification">
          <div>
            <div class="border-bottom px-3 pt-2 pb-3 d-flex
              justify-content-between align-items-center">
              <p class="mb-0 text-dark fw-medium fs-4">알림</p>
              <a href="#" class="text-muted">
                <span>
                  <i class="me-1 icon-xxs" data-feather="settings"></i>
                </span>
              </a>
            </div>
              
              
             <!-- List group -->
            <div id="alarm-list" class="notification-list-scroll">
	            <ul class="list-group list-group-flush" >
					<li class="list-group-item border-bottom">
						<a href="#" class="text-muted"> 
							<c:forEach var="mAlarms" items="${matchingAlarms}">
								<li>${mAlarms.nickname}님이 ${mAlarms.alarmContent }</li>

								<hr>
							</c:forEach>
						</a>
					</li> 
	            </ul>
            </div>
            <div class="border-top px-3 py-2 text-center">
              <a href="/project-gpmatching/commonBoard/alarmList" class="text-inherit fw-semi-bold"
              id="checkAlarm" data-userno="${loginuser.userNo}">
                View all Notifications
              </a>
            </div>
          </div>
        </div>
      </li>
      <!-- List -->
      <li class="dropdown ms-2">
        <a class="rounded-circle" href="#" role="button" id="dropdownUser"
          data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <div class="avatar avatar-md avatar-indicators avatar-online">
          		<c:choose>
          			<c:when test="${loginuser.userImage == null}">
           	    		<img alt="avatar" src="/project-gpmatching/resources/assets/images/avatar/anonymous.png" class="rounded-circle" />
           	    	</c:when>
                   	<c:otherwise> 
                   		<img src="${pageContext.request.contextPath}/resources/upload/${loginuser.userImage}" class="rounded-circle" alt="Image" height="30" width="30" >
                   	</c:otherwise>
           	    </c:choose>
          </div>
        </a>
        <div class="dropdown-menu dropdown-menu-end"
          aria-labelledby="dropdownUser">
          <div class="px-4 pb-0 pt-2">


            <div class="lh-1 ">
              <h5 class="mb-1"> ${loginuser.nickname}</h5>
              <c:choose>
				<c:when test="${ not empty loginuser }">
					<a href="/project-gpmatching/account/mypage" class="text-inherit fs-6">마이페이지</a>
				</c:when>
				<c:otherwise>
					<a href="/project-gpmatching/account/login" class="text-inherit fs-6">로그인</a>
				</c:otherwise>
			  </c:choose>
              
            </div>
            <div class=" dropdown-divider mt-3 mb-2"></div>
          </div>

          <ul class="list-unstyled">

            <li>
              <a class="dropdown-item" href="/project-gpmatching/account/editMypage">
                <i class="me-2 icon-xxs dropdown-item-icon" data-feather="user"></i>회원정보 수정
              </a>
            </li>
            <li>
              <a class="dropdown-item"
                href="#">
                <i class="me-2 icon-xxs dropdown-item-icon"
                  data-feather="activity"></i>Activity Log
              </a>


            </li>

            <li>
              <a class="dropdown-item text-primary" href="#">
                <i class="me-2 icon-xxs text-primary dropdown-item-icon"
                  data-feather="star"></i>Go Pro
              </a>
            </li>
            <li>
              <a class="dropdown-item" href="#">
                <i class="me-2 icon-xxs dropdown-item-icon"
                  data-feather="settings"></i>Account Settings
              </a>
            </li>
            <li>
            <c:choose>
            	<c:when test="${ loginuser eq null }">
					<a class="dropdown-item" href="/project-gpmatching/account/login">
					  <i class="me-2 icon-xxs dropdown-item-icon" data-feather="power"></i>로그인
					</a>
			    </c:when>
			    <c:otherwise>
					<a class="dropdown-item" href="/project-gpmatching/account/logout">
					    <i class="me-2 icon-xxs dropdown-item-icon" data-feather="power"></i>로그아웃
					</a>
			    </c:otherwise>
            </c:choose>  
            </li>
          </ul>

        </div>
      </li>
    </ul>
  </nav>
</div>


<!-- Modal -->
<div class="modal fade gd-example-modal-lg" id="review-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
   <div class="modal-content">
    <div class="modal-header">
        <h5 class="modal-title"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
        </button>
      </div>
      <div class="modal-body" id="review-list">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<!-- collapse -->


<script src="/project-gpmatching/resources/assets/libs/jquery/dist/jquery.min.js"></script>

<script>


$(function() {
	
	$('.review-btn').on("click", function(event){

		const loginUser = ${loginuser.userNo};
		const loginNickname = "${loginuser.nickname}";
		
		$.ajax({
			
			"url": "/project-gpmatching/review/ajax-show-review",
			"method": "get",
			"data": { "loginUser" : loginUser },
			
			"success": function(result){
				alert(loginNickname);
				var reviewList = $('#review-list');
				reviewList.empty();
				if (result != null) {
                    
                    var $table = $("<table>").addClass("table text-nowrap mb-0");
                    $table.css({"table-layout": "fixed", "width": "100%"});
                    reviewList.append($table);

                    var $thead = $("<thead>").addClass("table-light");
                    $table.append($thead);
                    
                    var $headerRow = $("<tr>");
                    $thead.append($headerRow);
                    
                    $headerRow.append($("<th>").text("글번호").css("width", "10%"));
                    $headerRow.append($("<th>").text("글제목").css("width", "30%"));
                    $headerRow.append($("<th>").text("글작성자").css("width", "20%"));
                    $headerRow.append($("<th>").text("지원번호").css("width", "10%"));
                    $headerRow.append($("<th>").text("지원자").css("width", "20%"));
                    $headerRow.append($("<th>").text("버튼").css("width", "10%"));
                    
                    var $tbody = $("<tbody>");
                    $table.append($tbody);
				 
				
				 	for (var i = 0; i < result.length; i++) {
						
				 		var $row = $("<tr>");
						$tbody.append($row);
						
						var $titleColumn1 = $("<td>").addClass("align-middle");
						$titleColumn1.css({
						    "overflow": "hidden",
						    "text-overflow": "ellipsis",
						    "white-space": "nowrap"
						});
						var $titleColumn2 = $("<td>").addClass("align-middle");
						$titleColumn2.css({
						    "overflow": "hidden",
						    "text-overflow": "ellipsis",
						    "white-space": "nowrap"
						});
						var $titleColumn3 = $("<td>").addClass("align-middle");
						$titleColumn3.css({
						    "overflow": "hidden",
						    "text-overflow": "ellipsis",
						    "white-space": "nowrap"
						});
						var $titleColumn4 = $("<td>").addClass("align-middle");
						$titleColumn4.css({
						    "overflow": "hidden",
						    "text-overflow": "ellipsis",
						    "white-space": "nowrap"
						});
						var $titleColumn5 = $("<td>").addClass("align-middle");
						$titleColumn5.css({
						    "overflow": "hidden",
						    "text-overflow": "ellipsis",
						    "white-space": "nowrap"
						});
						var $titleColumn6 = $("<td>").addClass("align-middle");
						
						
						var $board = $("<a>").attr("href", "#").addClass("text-inherit").text(result[i].boardNo);
						$titleColumn1.append($board);
						$row.append($titleColumn1);
						
						var $title = $("<a>").attr("href", "#").addClass("text-inherit").text(result[i].boardTitle);
						$titleColumn2.append($title);
						$row.append($titleColumn2);
						
						var $writer = $("<a>").attr("href", "#").addClass("text-inherit");
						if (loginNickname === result[i].writer) {
							result[i].writer = "";
							$writer.text(result[i].writer);
							$titleColumn3.append($writer);
							$row.append($titleColumn3);     
	                    } else {					
							$writer.text(result[i].writer);
							$titleColumn3.append($writer);
							$row.append($titleColumn3); 
	                    }
						var $commentNo = $("<a>").attr("href", "#").addClass("text-inherit").text(result[i].commentNo);
						$titleColumn4.append($commentNo);
						$row.append($titleColumn4); 
						
						var $commentWriter = $("<a>").attr("href", "#").addClass("text-inherit");
						if (loginNickname === result[i].commentWriter) {
							result[i].commentWriter = "";
							$commentWriter.text(result[i].commentWriter);
							$titleColumn5.append($commentWriter);
							$row.append($titleColumn5);     
	                    } else {
							$commentWriter.text(result[i].commentWriter);
							$titleColumn5.append($commentWriter);
							$row.append($titleColumn5); 
	                    }
						
						// 상세보기 버튼 추가
                        var $viewCommentsButton = $("<button>")
                            .addClass("btn btn-primary btn-sm btn-write-review")
                            .data('writer', result[i].writer)
                            .data('commentWriter', result[i].commentWriter)
                            .data('commentNo', result[i].commentNo)
                        	.data('boardNo', result[i].boardNo)
                        	.data('boardTitle', result[i].boardTitle)
                        	.text("리뷰");
	                          
                        $titleColumn6.append($viewCommentsButton);
                        $row.append($titleColumn6);
                                         		
					}
				 	
				}
				$('#review-modal').modal("show");	
				
		
			},
			"error": function(xhr, status, err){
					alert("실패");
				
			}
			
	
		});
	});
	
	
	
	
	$('#review-list').on("click", '.btn-write-review', function(event) {
		
		const boardNo = $(this).data('boardNo');
		const writer = $(this).data('writer');
		const commentWriter = $(this).data('commentWriter');
		const commentNo = $(this).data('commentNo');
		alert("성공");
		
		$.ajax({
			
			"url": "/project-gpmatching/review/ajax-write-review",
			"method": "get",
			"data": { "commentWriter" : commentWriter , 
					  "writer" : writer, 
					  "boardNo" : boardNo,
					  "commentNo" : commentNo
			},
			"success": function(result){
				window.location.href = 
					"/project-gpmatching/review/write?boardNo=" + boardNo + "&commentNo=" + commentNo + "&writer=" + writer + "&commentWriter=" + commentWriter;
				
				
			},
			"error": function(xhr, status, err){
				alert("실패");
			
			} 
			
		}); 
	});
	
	
	
	
	
	
	
	
	
	
	
});

	
</script>
	