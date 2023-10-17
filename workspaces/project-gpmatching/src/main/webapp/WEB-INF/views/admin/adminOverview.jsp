<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

				<!-- content -->
				
				<div class="py-6">
					<!-- 활동량 row -->
					<div class="row">
						<div class="col-xl-6 col-lg-12 col-md-12 col-12 mb-6">
							<!-- row  -->
							<div class="row my-6">
								<div class="col-xl-4 col-lg-12 col-md-12 col-12 mb-6 mb-xl-0">
									<!-- card  -->
									<div class="card h-100">
										<!-- card body  -->
										<div class="card-body">
											<div
												class="d-flex align-items-center justify-content-between">
												<div>
													<h4 class="mb-0">활동량</h4>
												</div>
												<!-- dropdown  -->
												<div class="dropdown dropstart">
													<a class="text-muted text-primary-hover" href="#"
														role="button" id="dropdownTask" data-bs-toggle="dropdown"
														aria-haspopup="true" aria-expanded="false"> <i
														class="icon-xxs" data-feather="more-vertical"></i>
													</a>
													<div class="dropdown-menu" aria-labelledby="dropdownTask">
														<a class="dropdown-item" href="#"> 오늘의 매칭량 </a> <a
															class="dropdown-item" href="#"> 이번 주의 매칭량 </a> <a
															class="dropdown-item" href="#"> 이번 주의 게시판량 </a>
													</div>
												</div>
											</div>
											<!-- chart  -->
											<div class="mb-8">
												<div id="perfomanceChart"></div>
											</div>
											<!-- icon with content  -->
											<div class="d-flex align-items-center justify-content-around">
												<div class="text-center">
													<i class="icon-sm text-success" data-feather="check-circle"></i>
													<h1 class="mt-3  mb-1 fw-bold">76%</h1>
													<p>Completed</p>
												</div>
												<div class="text-center">
													<i class="icon-sm text-warning" data-feather="trending-up"></i>
													<h1 class="mt-3  mb-1 fw-bold">32%</h1>
													<p>In-Progress</p>
												</div>
												<div class="text-center">
													<i class="icon-sm text-danger" data-feather="trending-down"></i>
													<h1 class="mt-3  mb-1 fw-bold">13%</h1>
													<p>Behind</p>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- 회원 목록 card  -->
								<div class="col-xl-8 col-lg-12 col-md-12 col-12">
									<div class="card h-100">
										<!-- card header  -->
										<div class="card-header bg-white py-4">
											<h4 class="mb-0">회원 목록</h4>
										</div>
										<!-- table  -->
										<div id="new-user-list" class="table-responsive">
													<!-- 여기에 Ajax로 동적 데이터 넣기. -->
					<table class="table text-nowrap mb-0">
					   <thead class="table-light">
					      <tr>
					         <th>아이디</th>
					         <th>닉네임</th>
					         <th>가입일자</th>
					      </tr>
					   </thead>
					   <tbody>
					   
					    <c:forEach var="user" items="${requestScope.newUsers }">
					   	<tr>
                           <td class="align-middle">
                               <div class="d-flexalign-items-center">
                                   <div class="ms-3 lh-1">
                                       <h5 class=" mb-1"> <a href="#" class="text-inherit">${ user.userId }</a></h5>
                                   </div>
                               </div>
                           </td>
                              <td class="align-middle">
                               <div class="d-flexalign-items-center">
                                   <div class="ms-3 lh-1">
                                       <h5 class=" mb-1"> <a href="#" class="text-inherit">${ user.nickname }</a></h5>
                                   </div>
                               </div>
                           </td>
                           <td class="align-middle">
                           		<fmt:formatDate value="${ board.regDate }"
					         				    pattern="yyyy-MM-dd"/>
                           </td>
                           
                       </tr>
                       </c:forEach>
					   </tbody>
					   
					</table>
													
												</tbody>
											</table>
										</div>
									</div>
								</div>

	
	
				
</body>

</html>