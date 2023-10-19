<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="enter" value="
" />
											<tbody>
											<c:forEach var="comment"
												items="${ comments }">
												<tr>
													<td class="align-middle">
														<div id="comment-view-area-${ comment.commentNo }"
															style="padding-left: ${comment.depth * 20}px;">
															<!-- 여기에 패딩 left 넣어서 들어가는거 처리 -->
															<c:choose>
																<c:when test="${ comment.deleted }">
																	<br><br>
																	<span style='color: gray'>삭제된 댓글입니다.</span>
																	<br><br>
																</c:when>

																<c:otherwise>
																	<div style="float: left">
																		${ comment.nickname }
																		&nbsp;&nbsp;
																		[<fmt:formatDate value="${ comment.regDate }" pattern="yyyy-MM-dd" />]
																		<br /> <br />
																		<span>${ fn:replace(comment.commentContent, enter, "<br>") }</span>
																	</div>
																	<div class="dropdown dropstart " style="float: right; align: middle">
																		<a class="text-muted text-primary-hover dropdown-toggle" href="#"
																			role="button" id="dropdownTeam${ comment.commentNo }"
																			data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
																		</a>


																		<div class="dropdown-menu" aria-labelledby="dropdownTeam${ comment.commentNo }">
																			<div class="dropdown-item"
																				style='display:${ (not empty loginuser and loginuser.userNo == comment.userNo) ? "block" : "none" }'>
																				<a class="edit-comment" data-comment-no="${ comment.commentNo }"
																					href="javascript:" style="color: inherit;">수정</a>

																			</div>
																			<div class="dropdown-item"
																				style='display:${ (not empty loginuser and loginuser.userNo == comment.userNo) ? "block" : "none" }'>
																				<a class="delete-comment" data-comment-no="${ comment.commentNo }"
																					href="javascript:" style="color: inherit;">삭제</a>

																			</div>
																			<span style="clear: both"></span>
																		</div>
																	</div>
																	<div
																		style='float:right;aligh:middle; display:${ not empty loginuser ? "" : "none" }'>
																		<a class="write-recomment" data-comment-no="${ comment.commentNo }"
																			href="javascript:" style="color: inherit;">답글</a>
																		&nbsp;
																	</div>
																	<span style="clear: both"></span>

																</c:otherwise>
															</c:choose>
														</div>

														<div id="comment-edit-area-${ comment.commentNo }" style="display: none">
														${ comment.nickname }
														&nbsp;&nbsp;
														[<fmt:formatDate value="${ comment.regDate }" pattern="yyyy-MM-dd" />]
														<br /> <br />
														<form action="editComment" method="post">
															<input type="hidden" name="commentNo" value="${ comment.commentNo }">
															<input type="hidden" name="commonNo" value="${ commonBoard.commonNo }">
															<input type="hidden" name="pageNo" value="${ pageNo }">
															<div class="col-md-8 col-xxl-9  mt-0 mt-md-3" style="width: 99%; resize: none;" rows="3">
																<textarea class="form-control" aria-describedby="name"
																		  name="commentContent" style="resize: none;" rows="3">${ comment.commentContent }</textarea>
																</div>
															</form>
															<br />
															<div>
																<a class="update-comment" data-comment-no="${ comment.commentNo }" href="javascript:">수정</a>
																&nbsp;
																<a class="cancel-edit-comment" data-comment-no="${ comment.commentNo }" href="javascript:">취소</a>
															</div>
														</div>

													</td>
												</tr>
											</c:forEach>
											
										</tbody>