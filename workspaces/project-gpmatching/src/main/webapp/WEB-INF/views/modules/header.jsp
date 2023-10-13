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
              <p class="mb-0 text-dark fw-medium fs-4">알림</p>
              <a href="#" class="text-muted">
                <span>
                  <i class="me-1 icon-xxs" data-feather="settings"></i>
                </span>
              </a>
            </div>
              
              
             <!-- List group -->
            <div id="alram-list">
	            <ul class="list-group list-group-flush notification-list-scroll" >
					<li class="list-group-item border-bottom">
						<a href="#" class="text-muted"> 
							<c:forEach var="alram" items="${alrams}">
								<li>유저번호:${alram.userNo}</li> 
								<li>알람번호:${alram.alramNo}</li>
								<li>댓글번호:${alram.commentNo}</li>
								<hr>
							</c:forEach>
						</a>
					</li> 
	            </ul>
            </div>
            <div class="border-top px-3 py-2 text-center">
              <a href="/project-gpmatching/commonBoard/alramList" class="text-inherit fw-semi-bold">
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
              <a href="/project-gpmatching/account/mypage" class="text-inherit fs-6">마이페이지</a>
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
	