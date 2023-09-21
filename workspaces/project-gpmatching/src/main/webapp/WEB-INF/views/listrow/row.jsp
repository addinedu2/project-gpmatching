<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- row  -->

<div class="row mt-6">
	<div class="col-md-12 col-12">
		<!-- card  -->
		<div class="card">
			<!-- card header  -->
			<div class="card-header bg-white  py-4">

				<h4 class="mb-0">LEAGUE OF LEGENDS</h4>
			</div>
			<!-- table  -->
			<div class="table-responsive">
				<table class="table text-nowrap mb-0">
					<thead class="table-light">
						<tr>
							<th>제목</th>
							<th>등록일</th>
							<th>티어</th>
							<th>인원</th>
							<th>내용</th>
							
						</tr>
					</thead>
					<tbody>
						<c:forEach var="matchingBoard"
							items="${ requestScope.matchingBoardList }">
							<tr>
								<td class="align-middle">
									<div
										class="d-flex
                            align-items-center">
										<div>
											<div
												class="icon-shape icon-md border p-4
                                rounded-1">
												<img src="assets/images/brand/dropbox-logo.svg" alt="">
											</div>
										</div>
										<div class="ms-3 lh-1">
											<h5 class=" mb-1">
												<a href="#" class="text-inherit">${ matchingBoard.boardTitle }</a>
											</h5>

										</div>
									</div>
								</td>
								<td class="align-middle">34</td>
								<td class="align-middle"><span
									class="badge
                            bg-warning">Medium</span></td>
								<td class="align-middle">
									<div class="avatar-group">
										<span class="avatar avatar-sm"> <img alt="avatar"
											src="assets/images/avatar/avatar-1.jpg"
											class="rounded-circle">
										</span> <span class="avatar avatar-sm"> <img alt="avatar"
											src="assets/images/avatar/avatar-2.jpg"
											class="rounded-circle">
										</span> <span class="avatar avatar-sm"> <img alt="avatar"
											src="assets/images/avatar/avatar-3.jpg"
											class="rounded-circle">
										</span> <span class="avatar avatar-sm avatar-primary"> <span
											class="avatar-initials rounded-circle
                                fs-6">+5</span>
										</span>
									</div>
								</td>
								<td class="align-middle text-dark">
									<div class="float-start me-3">15%</div>
									<div class="mt-2">
										<div class="progress" style="height: 5px;">
											<div class="progress-bar" role="progressbar"
												style="width: 15%" aria-valuenow="15" aria-valuemin="0"
												aria-valuemax="100"></div>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>


