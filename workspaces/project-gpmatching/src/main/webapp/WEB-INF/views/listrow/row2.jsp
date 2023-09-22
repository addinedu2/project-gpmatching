<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
							<th>댓글</th>

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
								<td class="align-middle"><fmt:formatDate
										value="${ matchingBoard.regDate }"
										pattern="yyyy-MM-dd a hh:mm:ss" /></td>
								<td class="align-middle"><span
									class="badge
                            bg-warning">Gold</span></td>
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
									<div class="float-start me-3">${ matchingBoard.boardContent }</div>

								</td>
								<td>
									<!-- Varying modal -->
									<button id="getboardNo" type="button" class="btn btn-primary"
										data-bs-toggle="modal" data-bs-target="#exampleModal${ matchingBoard.boardNo }"
										data-whatever="@getbootstrap">${ matchingBoard.boardNo }</button>
										
									<div class="modal fade" id="exampleModal${ matchingBoard.boardNo }" tabindex="-1"
										role="dialog" aria-labelledby="exampleModalLabelOne"
										aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabelOne">${ matchingBoard.boardTitle }</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<form id="commentform" action="write-comment" method="post">
													<input type="hidden" name="boardNo"
														value="${ matchingBoard.boardNo }" /> 
													<div class="modal-body">

														<div class="mb-3">
															<label for="recipient-name" class="col-form-label">게임
																닉네임</label> <input type="text" class="form-control"
																id="recipient-name">
														</div>
														<div class="mb-3">
															<label for="message-text" class="col-form-label">파티장에게
																알려줄 내용</label>
															<textarea name="mCommentContent" class="form-control" id="message-text"></textarea>
														</div>

													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">닫기</button>
														<button type="submit" class="btn btn-primary">등록</button>
													</div>
												</form>
											</div>
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

<div class="modal fade" id="commentModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelOne" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="title-in-modal">${ matchingBoard.boardTitle }</h5>
				<button type="button" class="btn-close"
					data-bs-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form id="commentform" action="write-comment" method="post">
				<input type="hidden" id="boardno-in-modal" name="boardNo" value="${ matchingBoard.boardNo }" /> 
				<div class="modal-body">

					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">게임 닉네임</label> 
						<input type="text" class="form-control" id="recipient-name-in-modal">
					</div>
					<div class="mb-3">
						<label for="message-text" class="col-form-label">파티장에게 알려줄 내용</label>
						<textarea name="mCommentContent" class="form-control" id="message-text-in-modal"></textarea>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button type="submit" class="btn btn-primary">등록</button>
				</div>
			</form>
		</div>
	</div>
</div>
								

<script src="https://code.jquery.com/jquery-3.7.1.js"></script>

<!-- <script>
$('#getBoardNo').on('click', function(event){
	$('#commentform').submit();
});
</script>
 -->

