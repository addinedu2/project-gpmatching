﻿<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<nav class="navbar-vertical navbar">
	<div class="nav-scroller">
		<!-- Brand logo -->

		<a class="navbar-brand"
			href="/project-gpmatching/resources/index.html"> <img
			src="/project-gpmatching/resources/assets/images/brand/logo/opgglogo.svg"
			alt="" />
		</a>

		<!-- Navbar nav -->
		<ul class="navbar-nav flex-column" id="sideNavbar">
			<li class="nav-item"><a class="nav-link has-arrow  active "
				href="/project-gpmatching/home"> <i data-feather="home"
					class="nav-icon icon-xs me-2"></i> Dashboard
			</a></li>


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
							href="/project-gpmatching/boardMatching/lol-list"> LOL </a></li>
						<li class="nav-item"><a class="nav-link has-arrow   "
							href="/project-gpmatching/boardMatching/battleground-list">
								배틀그라운드 </a></li>


						<li class="nav-item"><a class="nav-link "
							href="/project-gpmatching/boardMatching/overwatch-list"> 오버워치
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
						<!-- <li class="nav-item"><a class="nav-link "
							href="/project-gpmatching/account/mypage"> 마이페이지</a></li>
						 --><li class="nav-item">
							<a class="nav-link  "
							href="/project-gpmatching/resources/pages/forget-password.html">
							비밀번호 찾기 </a>
						</li>


					</ul>
				</div></li>
			<li class="nav-item"><a class="nav-link "
				href="/project-gpmatching/resources/pages/layout.html"> <i
					data-feather="sidebar" class="nav-icon icon-xs me-2"> </i> 커뮤니티
			</a></li>

			<!-- Nav item -->
			<li class="nav-item">
				<div class="navbar-heading">UI Components</div>
			</li>

			<!-- Nav item -->
			<li class="nav-item"><a class="nav-link has-arrow "
				href="/project-gpmatching/resources/docs/accordions.html"> <i
					data-feather="package" class="nav-icon icon-xs me-2"> </i>
					Components
			</a></li>


			<li class="nav-item"><a class="nav-link has-arrow  collapsed "
				href="#!" data-bs-toggle="collapse" data-bs-target="#navMenuLevel"
				aria-expanded="false" aria-controls="navMenuLevel"> <i
					data-feather="corner-left-down" class="nav-icon icon-xs me-2">
				</i> Menu Level
			</a>
				<div id="navMenuLevel" class="collapse "
					data-bs-parent="#sideNavbar">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link has-arrow " href="#!"
							data-bs-toggle="collapse" data-bs-target="#navMenuLevelSecond"
							aria-expanded="false" aria-controls="navMenuLevelSecond"> Two
								Level </a>
							<div id="navMenuLevelSecond" class="collapse"
								data-bs-parent="#navMenuLevel">
								<ul class="nav flex-column">
									<li class="nav-item"><a class="nav-link " href="#!">
											NavItem 1</a></li>
									<li class="nav-item"><a class="nav-link " href="#!">
											NavItem 2</a></li>
								</ul>
							</div></li>
						<li class="nav-item"><a
							class="nav-link has-arrow  collapsed  " href="#!"
							data-bs-toggle="collapse" data-bs-target="#navMenuLevelThree"
							aria-expanded="false" aria-controls="navMenuLevelThree">
								Three Level </a>
							<div id="navMenuLevelThree" class="collapse "
								data-bs-parent="#navMenuLevel">
								<ul class="nav flex-column">
									<li class="nav-item"><a class="nav-link  collapsed "
										href="#!" data-bs-toggle="collapse"
										data-bs-target="#navMenuLevelThreeOne" aria-expanded="false"
										aria-controls="navMenuLevelThreeOne"> NavItem 1 </a>
										<div id="navMenuLevelThreeOne" class="collapse collapse "
											data-bs-parent="#navMenuLevelThree">
											<ul class="nav flex-column">
												<li class="nav-item"><a class="nav-link " href="#!">
														NavChild Item 1 </a></li>
											</ul>
										</div></li>
									<li class="nav-item"><a class="nav-link " href="#!">
											Nav Item 2</a></li>
								</ul>
							</div></li>
					</ul>
				</div></li>

			<!-- Nav item -->
			<li class="nav-item">
				<div class="navbar-heading">Documentation</div>
			</li>

			<!-- Nav item -->
			<li class="nav-item"><a class="nav-link has-arrow "
				href="/project-gpmatching/resources/docs/index.html"> <i
					data-feather="clipboard" class="nav-icon icon-xs me-2"> </i> Docs
			</a></li>
			<li class="nav-item"><a class="nav-link has-arrow "
				href="/project-gpmatching/resources/docs/changelog.html"> <i
					data-feather="git-pull-request" class="nav-icon icon-xs me-2">
				</i> Changelog
			</a></li>




		</ul>

	</div>
</nav>