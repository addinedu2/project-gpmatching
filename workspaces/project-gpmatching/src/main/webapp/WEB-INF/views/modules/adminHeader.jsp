<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<!-- Container fluid -->
      <div class="container-fluid p-6">
        <div class="row">
          <div class="col-lg-12 col-md-12 col-12">
            <!-- Page header -->
           
              <div class="border-bottom pb-4 mb-4 ">
               
                  <h3 class="mb-0 fw-bold">Overview</h3>
              
           
            </div>
          </div>
        </div>
        
        <div class="row align-items-center">
          <div class="col-xl-12 col-lg-12 col-md-12 col-12">
            <!-- Bg -->
            <div class="pt-20 rounded-top" style="background:
                url(/project-gpmatching/resources/assets/images/background/profile-cover.jpg) no-repeat;
                background-size: cover;">
            </div>
            <div class="bg-white rounded-bottom smooth-shadow-sm ">
              <div class="d-flex align-items-center justify-content-between
                  pt-4 pb-6 px-4">
                <div class="d-flex align-items-center">
                 
                  <!-- avatar -->
                  <div class="avatar-xxl avatar-indicators avatar-online me-2
                      position-relative d-flex justify-content-end
                      align-items-end mt-n10">
                    	<c:choose> 
	                    	<c:when test="${loginuser.userImage == null}">
			                    <img src="/project-gpmatching/resources/assets/images/avatar/anonymous.png" class="avatar-xxl
			                        rounded-circle border border-4 border-white-color-40" alt="">
			                    <a href="#!" class="position-absolute top-0 right-0 me-2" data-bs-toggle="tooltip" data-placement="top" title="" data-original-title="Verified">
			                      <img src="/project-gpmatching/resources/assets/images/svg/checked-mark.svg" alt="" height="30" width="30">
			                    </a>
	                    	</c:when>
	                    	<c:otherwise> 
	                    		<img src="${pageContext.request.contextPath}/resources/upload/${loginuser.userImage}" class="avatar-xxl
			                        rounded-circle border border-4 border-white-color-40" alt="Image" height="30" width="30" >
	                    	</c:otherwise>
                    </c:choose>
                  </div>
                  
                  <!-- text -->
                  <div class="lh-1">
                    <h2 class="mb-0"> ${loginuser.nickname}   <!-- 닉네임 -->
                      <a href="#!" class="text-decoration-none" data-bs-toggle="tooltip" data-placement="top" title="" data-original-title="Beginner">

                      </a>
                    </h2>

                    <p class="mb-0 d-block">@${loginuser.userId} <!-- 원래 유저 아이디 인데 userNo 넘어오는거 테스트용--></p>

                  </div>
                </div>
                <div>
                  <a href="/project-gpmatching/account/editMypage" class="btn btn-outline-primary
                      d-none d-md-block">회원정보수정</a>
                  <a href="/project-gpmatching/commonBoard/reportWrite" class="btn btn-outline-primary
                      d-none d-md-block">신고하기</a>
                </div>
              </div>
              <!-- nav -->
              <ul class="nav nav-lt-tab px-4" id="pills-tab" role="tablist">
                <li class="nav-item">
                  <a class="nav-link" href="/project-gpmatching/admin/adminOverview">Overview</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link active" href="/project-gpmatching/admin/adminUserList" id="UserListLink">회원목록</a>
                </li>

                <li class="nav-item">
                  <a class="nav-link" href="#">Files</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Teams</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">
                      Followers
                    </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Activity</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
        