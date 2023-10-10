<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:forEach var="comment" items="${ comments }">				
				<tr>
					<td style="text-align:left;margin:5px;border-bottom: solid 1px;">
					
						<table>
							<tr>
								<td>
									<c:forEach begin="0" end="${comment.depth}">
										&nbsp;&nbsp;
									</c:forEach>
									
									<c:if test="${comment.depth > 0}">
										&gt;&gt; &nbsp;
									</c:if>
									
									
								</td>
								<td>				
									<div id="comment-view-area-${ comment.commentNo }">
									<c:choose>
									<c:when test="${ comment.deleted }">
										<br><br>
										<span style='color:gray'>삭제된 글입니다.</span>
										<br><br>
									</c:when>
									<c:otherwise>
									
										${ comment.nickname } &nbsp;&nbsp;
										[<fmt:formatDate value="${ comment.regDate }" pattern="yyyy-MM-dd"/>]
									    <br /><br />
									    <span>${ fn:replace(comment.commentContent, enter, "<br>") }</span>
										<br /><br />
											<div style='float:left; display:${ (not empty loginuser and loginuser.userNo == comment.userNo) ? "block" : "none" }'>
									    	<a class="edit-comment" data-comment-no="${ comment.commentNo }" href="javascript:">수정</a>
											&nbsp;
											<a class="delete-comment" data-comment-no="${ comment.commentNo }" href="javascript:">삭제</a>
											&nbsp;&nbsp;
										</div>
										<div style='float:left; display:${ not empty loginuser ? "block" : "none" }'>
											<a class="write-recomment" data-comment-no="${ comment.commentNo }" href="javascript:">대댓</a>
										</div>
										<span style="clear:both"></span>
										
									</c:otherwise>
									</c:choose>
									</div>	                
									<div id="comment-edit-area-${ comment.commentNo }" style="display: none">
										${ comment.userNo } &nbsp;&nbsp; [<fmt:formatDate value="${ comment.regDate }" pattern="yyyy-MM-dd"/>]
										<br /><br />
										<form action="editComment" method="post"> <!-- BoardCommentController의 /editcomment에 연결 -->
										<input type="hidden" name="commentNo" value="${ comment.commentNo }" />
									
										<textarea name="commentContent" style="width: 99%; resize: none" rows="3" 
											maxlength="200">${ comment.commentContent }</textarea>
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
						</table>
				
					</td>
				</tr>
			</c:forEach>        