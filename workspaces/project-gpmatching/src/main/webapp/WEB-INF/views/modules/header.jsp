﻿<%@ page language="java" contentType="text/html; charset=utf-8"
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
          aria-expanded="false">
          <i class="icon-xs" data-feather="bell"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end"
          aria-labelledby="dropdownNotification">
          <div>
            <div class="border-bottom px-3 pt-2 pb-3 d-flex
              justify-content-between align-items-center">
              <p class="mb-0 text-dark fw-medium fs-4">아직 구현 안됨</p>
              <a href="#" class="text-muted">
                <span>
                  <i class="me-1 icon-xxs" data-feather="settings"></i>
                </span>
              </a>
            </div>
            <!-- List group -->
            <ul class="list-group list-group-flush notification-list-scroll">
              <!-- List group item -->
              <li class="list-group-item bg-light">


                <a href="#" class="text-muted">
                    <h5 class=" mb-1">Rishi Chopra</h5>
                    <p class="mb-0">
                      Mauris blandit erat id nunc blandit, ac eleifend dolor pretium.
                    </p>
                </a>



          </li>
             <!-- List group item -->
             <li class="list-group-item">


              <a href="#" class="text-muted">
                  <h5 class=" mb-1">Neha Kannned</h5>
                  <p class="mb-0">
                    Proin at elit vel est condimentum elementum id in ante. Maecenas et sapien metus.
                  </p>
              </a>



        </li>
              <!-- List group item -->
              <li class="list-group-item">


                <a href="#" class="text-muted">
                    <h5 class=" mb-1">Nirmala Chauhan</h5>
                    <p class="mb-0">
                      Morbi maximus urna lobortis elit sollicitudin sollicitudieget elit vel pretium.
                    </p>
                </a>



          </li>
              <!-- List group item -->
              <li class="list-group-item">


                    <a href="#" class="text-muted">
                        <h5 class=" mb-1">Sina Ray</h5>
                        <p class="mb-0">
                          Sed aliquam augue sit amet mauris volutpat hendrerit sed nunc eu diam.
                        </p>
                    </a>



              </li>
            </ul>
            <div class="border-top px-3 py-2 text-center">
              <a href="#" class="text-inherit fw-semi-bold">
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
            <img alt="avatar" src="/spring-demoweb/resources/assets/images/avatar/avatar-1.jpg"
              class="rounded-circle" />
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
      <div class="modal-body">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<script src="/project-gpmatching/resources/assets/libs/jquery/dist/jquery.min.js"></script>

<script>

$(function() {
	
	$('.review-btn').on("click", function(event){
		
		$.ajax({
			
			"url": "ajax-show-review",
			"method": "get",
			"data": { "userNo" : userNo },
			
			"success": function(result){
				
				var commentList = $('#comment-list');
				commentList.empty();
				if (result != null){
					console.log(result);
					
					// 테이블 헤더 추가
	                var $headerRow = $("<tr>");
	                
	                $headerRow.append($("<th>").text("댓글 번호"));
	                $headerRow.append($("<th>").text("닉네임"));
	                $headerRow.append($("<th>").text("댓글 내용"));
					$headerRow.append($("<th>").text("승인여부"));;
					$headerRow.append($("<th>").text("글번호 : " + boardNo));; // 테스트중
	                
	                commentList.append($headerRow);
	                
					for(var i = 0; i < result.length; i++){
						var $row = $("<tr>");
	                    
	                    $row.append($("<td>").text(result[i].mcommentNo));
	                    $row.append($("<td>").text(result[i].nickname));
	                    $row.append($("<td>").text(result[i].mcommentContent));
	                 
	                    commentList.append($row);
	                    
	                    
					}
					$('#review-modal').modal('show');
				}
				
				
			},
			"error": function(xhr, status, err){
				alert("실패");
			
			}
		
		});
	 });
	
});
	
</script>
	