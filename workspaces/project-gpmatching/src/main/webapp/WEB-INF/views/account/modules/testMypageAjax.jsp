<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<!-- 이게 진짜긴한데 새로 작성해서 남겨만놈  -->
<!-- <script>
$(function(event){
	
	 //버튼 이벤트 따로처리하지 않고 한번에 처리할때 사용할거
	 $('input[name="btnradio"]').on('click', function(event){
		 
		 
	 //내가 작성한 글만 보기(공통게시판) ajax
	 //$("#btnradio2").on('click', function(event){	  //자유게시판만 클릭되게..
		 
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
	                
	                var maxLength = 9;
					for(var i = 0; i < result.length && i < maxLength; i++){
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
</script> -->
</body>
</html>