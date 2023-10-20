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
<link rel="shortcut icon" type="image/x-icon" href="/project-gpmatching/resources/assets/images/favicon/gps-ico.ico">

<!-- Libs CSS -->


<link href="/project-gpmatching/resources/assets/libs/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link href="/project-gpmatching/resources/assets/libs/dropzone/dist/dropzone.css"  rel="stylesheet">
<link href="/project-gpmatching/resources/assets/libs/@mdi/font/css/materialdesignicons.min.css" rel="stylesheet" />
<link href="/project-gpmatching/resources/assets/libs/prismjs/themes/prism-okaidia.css" rel="stylesheet">








<!-- Theme CSS -->
<link rel="stylesheet" href="/project-gpmatching/resources/assets/css/theme.min.css">
  <title>마이페이지</title>
</head>

<body class="bg-light"> 
  <div id="db-wrapper">
    <!-- navbar vertical -->
     <jsp:include page="/WEB-INF/views/modules/sidebar.jsp" />
     
    <!-- page content -->
    <div id="page-content">
      <div class="header @@classList">

  		<jsp:include page="/WEB-INF/views/modules/header.jsp" />
  
     </div>
      <jsp:include page="/WEB-INF/views/account/modules/mypage-header.jsp" />
        
        
      
        
        
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

<script>

$(function(event){
	
	 $('input[name="btnradio"]').on('click', function(event){
		
		//let selectBtn = $('input[name="btnradio"]:checked').val();
		let loginUser = "${loginUser.userNo}";
		//alert(loginUser);
		
		$.ajax({
			"url":"boardSelect",
			"method": "get",
			"data":  {"loginUser" : loginUser } ,
			"success": function(result){
				
				console.log(loginUser);
				
				var myBoardList = $('#write-Board-List');
				myBoardList.empty();
				if (result != null){
					
					console.log(result);
					
					// 테이블 헤더 추가
	                var $headerRow = $("<tr>");
	                
	                $headerRow.append($("<th>").text("제목"));
	                $headerRow.append($("<th>").text("작성일자"));
	                
	                myBoardList.append($headerRow);
	                
					for(var i = 0; i < result.length; i++){
						var $row = $("<tr>");
	                    
	                    $row.append($("<td>").text(result[i].commonTitle));
	                    $row.append($("<td>").text(result[i].regDate));
	                    
	                    myBoardList.append($row);
	                    
					}
					
					
				}
				
			},
			"error": function(xhr, status, err){
				alert("실패");
			}
		});
		
	});
	
})

</script>

</body>

</html>