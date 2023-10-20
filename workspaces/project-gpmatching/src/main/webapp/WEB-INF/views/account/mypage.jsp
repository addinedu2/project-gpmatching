<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">



<!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon" href="/project-gpmatching/resources/assets/images/favicon/favicon.ico">

<!-- Libs CSS -->


<link href="/project-gpmatching/resources/assets/libs/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link href="/project-gpmatching/resources/assets/libs/dropzone/dist/dropzone.css"  rel="stylesheet">
<link href="/project-gpmatching/resources/assets/libs/@mdi/font/css/materialdesignicons.min.css" rel="stylesheet" />
<link href="/project-gpmatching/resources/assets/libs/prismjs/themes/prism-okaidia.css" rel="stylesheet">








<!-- Theme CSS -->
<link rel="stylesheet" href="/project-gpmatching/resources/assets/css/theme.min.css">
  <title>마이페이지</title>
</head>

<body class="bg-dark"> 
  <div id="db-wrapper">
    <!-- navbar vertical -->
     <jsp:include page="/WEB-INF/views/modules/sidebar.jsp" />
     
    <!-- page content -->
    <div id="page-content">
      <div class="header @@classList">

  		<jsp:include page="/WEB-INF/views/modules/header.jsp" />
  
     </div>
      <jsp:include page="/WEB-INF/views/account/modules/mypage-header.jsp" />
        
        
      
        
        <!-- content -->
        <div class="py-6">
          <!-- row -->
          <div class="row">
          
            <div class="col-xl-6 col-lg-12 col-md-12 col-12 mb-6">
              <!-- card -->
              <div class="card">
                <!-- card body -->
                <div class="card-body">
                  <div>
                  <!-- card title -->
                  <h3 class="card-title"><strong>내 정보</strong></h3>
                  <span class="text-uppercase fw-medium text-dark fs-5 ls-2"><strong>소개</strong></span>
                  <!-- text -->
                  <p class="mt-2 mb-6">${loginuser.userIntro}</p>
                  </div>
                  <!-- row -->
                  <div class="row">
                    <div class="col-12 mb-5">
                      <!-- text -->
                      <h6 class="text-uppercase fs-5 ls-2">review Point
                      </h6>
                      <p class="mb-0">${reviewPoint}</p>
                    </div>
                    
                    <div class="col-6 mb-5">
                      <h6 class="text-uppercase fs-5 ls-2">Phone </h6>
                      <p class="mb-0">${loginuser.userPhone}</p>
                    </div>
                    
                    <div class="col-6 mb-5">
                      <h6 class="text-uppercase fs-5 ls-2"><strong>가입일자</strong></h6>
                      <p class="mb-0"><fmt:formatDate value="${loginuser.regDate}" pattern="yyyy-MM-dd"/></p>
                    </div>
                    
                    <div class="col-6">
                      <h6 class="text-uppercase fs-5 ls-2"><strong>이메일</strong> </h6>
                      <p class="mb-0">${loginuser.userEmail}</p>
                    </div>
                    
                    <div class="col-6">
                      <h6 class="text-uppercase fs-5 ls-2">userGrade
                      </h6>
                      <p class="mb-0">${loginuser.userGrade}</p>
                    </div>
                  </div>
                  
                </div>
              </div>
            </div>
            
            <div class="col-xl-6 col-lg-12 col-md-12 col-12 mb-6">
              <!-- card -->
              <div class="card">
              
                <!-- card body -->
                <!-- 내가 쓴 글 만 보 기 -->
				<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
				
				
				  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" data-board="matching" checked>
				  <label class="btn btn-outline-primary" for="btnradio1">매칭게시판</label>
				
				  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" data-board="common">
				  <label class="btn btn-outline-primary" for="btnradio2">자유게시판</label>
				
				  
				</div>
                <div id="write-Board-List">
                
                  	
					<table class="table text-nowrap mb-0" style="table-layout: fixed; width: 100%">
					   <thead class="table-light">
					      <tr>
					         <th style="width: 70%">제목</th>
					         <th style="width: 30%; text-align: right;">작성일자</th>
					      </tr>
					   </thead>
					   <tbody>
					   
					    <c:forEach var="board" items="${requestScope.boardList }">
					   	<tr>
                           <td class="align-middle" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                               <div class="d-flexalign-items-center">
                                   <div class="ms-3 lh-1">
                                       <h5 class=" mb-1"> <a href="#" class="text-inherit">${ board.boardTitle }</a></h5>
                                   </div>
                               </div>
                           </td>
                           <td class="align-middle" style="text-align: right;">
                           		<fmt:formatDate value="${ board.regDate }"
					         				    pattern="yyyy-MM-dd"/>
                           </td>
                           
                       </tr>
                       </c:forEach>
					   </tbody>
					   
					</table>
					
                </div>
                <!-- 내가쓴글만보기 -->
              </div>
            </div>
            
            
            </div>
        </div>
      </div>
    </div>
  </div>
      
    
    

  <!-- Scripts -->
  <!-- Libs JS -->
<script src="/project-gpmatching/resources/assets/libs/jquery/dist/jquery.min.js"></script>
<script src="/project-gpmatching/resources/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="/project-gpmatching/resources/assets/libs/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="/project-gpmatching/resources/assets/libs/feather-icons/dist/feather.min.js"></script>
<script src="/project-gpmatching/resources/assets/libs/prismjs/prism.js"></script>
<script src="/project-gpmatching/resources/assets/libs/apexcharts/dist/apexcharts.min.js"></script>
<script src="/project-gpmatching/resources/assets/libs/dropzone/dist/min/dropzone.min.js"></script>
<script src="/project-gpmatching/resources/assets/libs/prismjs/plugins/toolbar/prism-toolbar.min.js"></script>
<script src="/project-gpmatching/resources/assets/libs/prismjs/plugins/copy-to-clipboard/prism-copy-to-clipboard.min.js"></script>




<!-- Theme JS -->
<script src="/project-gpmatching/resources/assets/js/theme.min.js"></script>


<!-- 테스트코드(공통게시판) -->
<script>
$(function(event) {
	//btnradio2 자유게시판, btnradio 매칭게시판
    $("#btnradio2, #btnradio1").on('click', function(event) {
        let loginUser = "${loginUser.userNo}";
        console.log(event.target.id)
        
        //<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" data-board="common"> 여기에서 data-board="common" 이부분임
        const board = $(this).data("board"); // data-board속성의 값 읽기

        $.ajax({
            "url": "boardSelect",
            "method": "get",
            "data": { "loginUser": loginUser, "board": board },
            "success": function(result) {
                var myBoardList = $('#write-Board-List');
                myBoardList.empty();

                if (result != null) {
                    console.log(result);

                    var $table = $("<table>").addClass("table text-nowrap mb-0");
                    $table.css({"table-layout": "fixed", "width": "100%"});
                    myBoardList.append($table);

                    var $thead = $("<thead>").addClass("table-light");
                    $table.append($thead);
                    
                    var $headerRow = $("<tr>");
                    $thead.append($headerRow);
                    
                    $headerRow.append($("<th>").text("제목").css("width", "70%"));
                    $headerRow.append($("<th>").text("작성일자").css("text-align", "right").css("width", "30%"));
                    
                    var $tbody = $("<tbody>");
                    $table.append($tbody);
                    
						
                    //var maxItems = 6;
                    for (var i = 0; i < result.length; i++) {
                        var $row = $("<tr>");
                        $tbody.append($row);
                        
                        var $titleColumn = $("<td>").addClass("align-middle");
                        $titleColumn.css({
                            "overflow": "hidden",
                            "text-overflow": "ellipsis",
                            "white-space": "nowrap"
                        });
                        $row.append($titleColumn);
                        
                        
                        // radio1 or radio2 중 어느것이 클릭 되었는지 출력해보기
                        console.log(event.target.id === 'btnradio1');
                        console.log(event.target.id === 'btnradio2');
                        
                        // 출력한걸 토대로 if문으로 버튼구분해서 링크걸기 - 배그, 옵치게시판추가시 else if로 구현
                        var $titleLink = ""
                        if(event.target.id === 'btnradio1') {//매칭게시판
                        	$titleLink = $("<a>").attr("href", '/project-gpmatching/boardMatching/lolBoard/lol-list#tr-' + result[i].boardNo).addClass("text-inherit").text(result[i].boardTitle);
                        	
                        } else{//자유게시판
                        	$titleLink = $("<a>").attr("href", "/project-gpmatching/commonBoard/commonDetail?commonNo=" + result[i].boardNo + "&pageNo=1").addClass("text-inherit").text(result[i].boardTitle);
                        }
                        $titleColumn.append($titleLink);
                        
                        var $dateCell = $("<td>").text(result[i].regDate).css("text-align", "right");
                        $row.append($dateCell); 
                    }

                }
            },
            "error": function(xhr, status, err) {
                alert("게시글을 불러오지 못했습니다.");
            }
        });
    });
    
	
	
	
//     //마이페이지 내 nav바 활성화 (-허지웅)()
//     $('.nav-link').click(function(event) {
// 	    // 모든 nav-link에서 'active' 클래스 제거
// 	    $('.nav-link').removeClass('active');

// 	    // 현재 클릭한 nav-link에 'active' 클래스 추가
// 	    $(this).addClass('active');
// 	});
});
</script>

<script src="/project-gpmatching/resources/assets/js/common.js"></script>

</body>

</html>