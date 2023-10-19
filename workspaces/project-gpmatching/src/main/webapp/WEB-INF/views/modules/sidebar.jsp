﻿<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<nav class="navbar-vertical navbar">
	<div class="nav-scroller">
		<!-- Brand logo -->

		<!-- <a class="navbar-brand"
			href="/project-gpmatching/home"> <img
			src="/project-gpmatching/resources/assets/images/brand/logo/opgglogo.svg"
			alt="" />
		</a> 원본-->
		
		<a class="navbar-brand"
			href="/project-gpmatching/home"> <img
			src="/project-gpmatching/resources/assets/images/brand/logo/gps-sidebar.png"
			
			alt="" />
		</a>
		
		

		<!-- Navbar nav -->
		<ul class="navbar-nav flex-column" id="sideNavbar">
<!-- 			<li class="nav-item"><a class="nav-link has-arrow  active " -->
<!-- 				href="/project-gpmatching/home"> <i data-feather="home" -->
<!-- 					class="nav-icon icon-xs me-2"></i> Dashboard -->
<!-- 			</a></li> -->


			<!-- Nav item -->
			<li class="nav-item">
				<div class="navbar-heading">Layouts & Pages</div>
			</li>


			<!-- Nav item -->
			<li class="nav-item"><a class="nav-link has-arrow  collapsed "
				href="#" data-bs-toggle="collapse" data-bs-target="#navPages"
				aria-expanded="false" aria-controls="navPages"> <i
					data-feather="layers" class="nav-icon icon-xs me-2"> </i> 게임 파티 매칭
			</a>

				<div id="navPages" class="collapse " data-bs-parent="#sideNavbar">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link "
							href="/project-gpmatching/boardMatching/lolBoard/lol-list"> LOL </a></li>
						<li class="nav-item"><a class="nav-link has-arrow   "
							href="/project-gpmatching/boardMatching/pubgBoard/battleground-list">
								배틀그라운드 </a></li>


						<li class="nav-item"><a class="nav-link "
							href="/project-gpmatching/boardMatching/overwatchBoard/overwatch-list"> 오버워치
						</a></li>
					</ul>
				</div></li>
			<!-- Nav item -->
			<li class="nav-item"><a class="nav-link has-arrow  collapsed "
				href="#!" data-bs-toggle="collapse"
				data-bs-target="#navAuthentication" aria-expanded="false"
				aria-controls="navAuthentication"> <i data-feather="lock"
					class="nav-icon icon-xs me-2"> </i> 계정
			</a>
				<div id="navAuthentication" class="collapse "
					data-bs-parent="#sideNavbar">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link "
							href="/project-gpmatching/account/login"> 로그인</a></li>
						<li class="nav-item"><a class="nav-link  "
							href="/project-gpmatching/account/register"> 회원가입</a></li>
						<li class="nav-item"><a class="nav-link "
							href="/project-gpmatching/account/mypage"> 마이페이지</a></li>
						<li class="nav-item">
								<li class="nav-item"><a class="nav-link  "
							href="/project-gpmatching/account/forgetId"> ID 찾기</a></li>
						<li class="nav-item"><a class="nav-link  "
							href="/project-gpmatching/account/forgetPassword">비밀번호 찾기</a></li>
						


					</ul>
				</div></li>
			<!-- common -->
			<li class="nav-item">
               <a class="nav-link has-arrow  collapsed " href="#!"
               data-bs-toggle="collapse" data-bs-target="#common" aria-expanded="false"
               aria-controls="common">
               <i data-feather="sidebar" class="nav-icon icon-xs me-2"> </i>공통게시판</a>
                            <div id="common" class="collapse " data-bs-parent="#sideNavbar" style="">
                                <ul class="nav flex-column">
                                    <li class="nav-item">
                                        <a class="nav-link " href="/project-gpmatching/commonBoard/commonList"> 자유게시판 </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link has-arrow" href="/project-gpmatching/commonBoard/reportList"> 신고게시판 </a>
                                    </li>
                                     <li class="nav-item">
                                        <a class="nav-link has-arrow" href="/project-gpmatching/commonBoard/tipsList"> Tips </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link has-arrow" href="/project-gpmatching/commonBoard/alarmList"> 알람 </a>
                                    </li>
                                </ul>
                            </div>
                        </li>

			</ul>

	</div>
</nav>