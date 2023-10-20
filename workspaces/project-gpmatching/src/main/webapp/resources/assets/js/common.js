/**
 * 
 */

	
	//댓글, 승인, 마감 알림 생기면 종모양에 초록동그라미
	$(function(){
	    let userNo = $("#dropdownNotification").data("userno");
	    if (!userNo) {
			return;
		}
		
		$.ajax({
			   "url" : '/project-gpmatching/modules/header',
			   "type" : 'GET',
			   "dataType" : 'json',
			   "data" : {"userNo": userNo},
			   success: function(data){
				   console.log(data); //여기 데이터 카운트 개수 넘어옴.
				   
				   if(data){
						$("#dropdownNotification").addClass('avatar-online');
				   }else{
					   $("#dropdownNotification").removeClass('avatar-online');
				   }

			   },
			   error:function(xhr, status, error){
				   console.log('알람 개수를 가져오는 중 오류 발생: ' + error);
			   }
			   
		   });
	});

	//임시 알람 클릭하면 마이페이지로 넘어감
	$(function(event) {
	    $("#dropdownNotification").on("click", function(event) {
	        event.preventDefault();
	        let userNo = $(this).data("userno");//수정
	       
	
			//알림리스트 시간 표시 - n분 전
	        function calculateTime(regDate) {
	            var regTime = new Date(regDate).getTime(); // 밀리초로 변환
	            var now = new Date().getTime();
	            var diff = now - regTime;
	
	            if (diff < 60000) {
	                return "방금 전";
	            } else if (diff < 3600000) {
	                var minutes = Math.floor(diff / 60000);
	                return minutes + "분 전";
	            } else if (diff < 86400000) {
	                var hours = Math.floor(diff / 3600000);
	                return hours + "시간 전";
	            } else {
	                var options = { year: 'numeric', month: '2-digit', day: '2-digit' };
	                return new Date(regTime).toLocaleDateString(undefined, options);
	            }
	        }
     
			//전체 알림리스트 표시
	        $.ajax({
	            url: '/project-gpmatching/modules/header/matchingAlarms',
	            type: 'get',
	            dataType: 'json',
	            success: function(data) {
	                var alarmList = $('#alarm-list');
	                alarmList.empty();
	
	                $.each(data, function(index, matchingAlarms) {
	                    var timeAgo = calculateTime(matchingAlarms.regDate);
	
	                    var commentAlarm =
	                        '<li><a href="/project-gpmatching/account/mypage">&nbsp;&nbsp;' + matchingAlarms.nickname +'님이&nbsp;&nbsp;'+ matchingAlarms.alarmContent +'</a></li>' +
	                        '<li>&nbsp;&nbsp;' + timeAgo + '</li>' +
	                        '<hr>';
	                    alarmList.append(commentAlarm);
	                });
	            },
	            error: function(xhr, status, error) {
	                console.log('댓글을 가져오는 중 오류 발생: ' + error);
	            }
	        });
	    });
	});
	
	//댓글확인 클릭하면 댓글 알림 삭제
	$(function (event){
		$('#checkAlarm').on("click",function(event){
			event.preventDefault();
			const userNo = $(this).data("userno");
			
			$.ajax({
				"url": '/project-gpmatching/modules/header/checkAlarm',
				"type": 'GET',
				"data" : {"userNo":userNo},
				"success": function(data, status, xhr){
					if(data){	
						$("#dropdownNotification").removeClass('avatar-online');
						window.location.reload();
				   }	
				},
				"error": function(xhr, status, err){
					console.log("요청 실패");
				}
			});
		});
	});
	
	//승인확인 클릭하면 승인 알림 삭제
	$(function (event){
		$('#checkConfirm').on("click",function(event){
			event.preventDefault();
			const userNo = $(this).data("userno");
			
			$.ajax({
				"url": '/project-gpmatching/modules/header/checkConfirm',
				"type": 'GET',
				"data" : {"userNo":userNo},
				"success": function(data, status, xhr){
					
					if(data){	
						$("#dropdownNotification").removeClass('avatar-online');
						window.location.reload();
				   }
				},
				"error": function(xhr, status, err){
					console.log("요청 실패");
				}
			});
		});
	});
	
	//마감확인 클릭하면 마감 알림 삭제
	$(function (event){
		$('#checkClose').on("click",function(event){
			event.preventDefault();
			const userNo = $(this).data("userno");
			
			$.ajax({
				"url": '/project-gpmatching/modules/header/checkClose',
				"type": 'GET',
				"data" : {"userNo":userNo},
				"success": function(data, status, xhr){
					if(data){	
						$("#dropdownNotification").removeClass('avatar-online');
						window.location.reload();
				   }
				},
				"error": function(xhr, status, err){
					console.log("요청 실패");
				}
			});
		});
	});
	
	//// code from header.jsp
	
	$(function() {
	
		$('.review-btn').on("click", function(event){
	
			const loginUser = '${loginuser.userNo}';
			
			if (!loginUser) {
				return;
			}
			
			$.ajax({
				
				"url": "/project-gpmatching/review/ajax-show-review",
				"method": "get",
				"data": { "loginUser" : loginUser },
				
				"success": function(result){
	
					var $modal = $('#review-list');
					$modal.empty();
	
					if (result != null) {
		                // Create the first div with the specified styles
		                var $div1 = $('<div style="width: 50%; border: 1px solid red; float: left;"></div>');
						$div1.attr('id','need-review-list');
	
		                // Append the first div to the modal
		                $modal.append($div1);
		                
		             	// Create the table element
		                var $table = $('<table class="table text-nowrap mb-0"></table>');
	                    $table.css({"table-layout": "fixed", "width": "100%"});
	
		                // Create the table header
		                var $thead = $('<thead>').addClass("table-dark");
		                $table.append($thead);
		                var $headerRow = $("<tr>");
		                $thead.append($headerRow);
		                $headerRow.append($("<th>").text("글제목").css("width", "60%"));
		                $headerRow.append($("<th>").text("글작성자").css("width", "20%"));
		                $headerRow.append($("<th>").text("").css("width", "20%"));
		                
	
		                // Create the table body
						var $tbody = $("<tbody>");
	                    $table.append($tbody);
	                    
						for (var i = 0; i < result.length; i++) {
							
					 		var $row = $("<tr>");
							$tbody.append($row);
							
							var $titleColumn1 = $("<td>").addClass("align-middle");
							$titleColumn1.css({
							    "overflow": "hidden",
							    "text-overflow": "ellipsis",
							    "white-space": "nowrap"
							});
							var $titleColumn2 = $("<td>").addClass("align-middle");
							
							var $titleColumn3 = $("<td>").addClass("align-middle");
	                    
							var $title = $("<a>").attr("href", "#").addClass("text-inherit").text(result[i].boardTitle);
							$titleColumn1.append($title);
							$row.append($titleColumn1);
							
							var $writer = $("<a>").attr("href", "#").addClass("text-inherit").text(result[i].nickname);
							$titleColumn2.append($writer);
							$row.append($titleColumn2);
	                    
							var $viewCommentsButton = $("<button>")
							.addClass("btn btn-primary btn-sm btn-show-comments")
	                        .data('boardNo', result[i].boardNo)
	                     	.text("목록")
	                          
		                    $titleColumn3.append($viewCommentsButton);
		                    $row.append($titleColumn3);
						}
	                                      
		                // Append the table to the div
		                $div1.append($table);
	
		                // Append the first div to the modal
		                $modal.append($div1);
	
		                // Create the second div with the specified styles
		                var $div2 = $('<div style="width: 50%; border: 1px solid green; float: right;"></div>');
						$div2.attr('id','review-comment-list');
		                
						// Append the second div to the modal
		                $modal.append($div2);
		            }
		            $('#review-modal').modal("show");
				},
				"error": function(xhr, status, err){
						alert("실패");
					
				}
				
		
			});
		});
		
		$('#review-list').on("click", ".btn-show-comments", function(event) {
			
			const boardNo = $(this).data('boardNo');
			alert(boardNo);
			
			$.ajax({
				
				"url": "/project-gpmatching/boardMatching/lolBoard/ajax-show-comment2",
				"method": "get",
				"data": { "boardNo" : boardNo },
				
				"success": function(result){
					
					var commentList = $('#review-comment-list');
					commentList.empty();
					if (result != null){
						
						var $table = $("<table>").addClass("table text-nowrap mb-0");
	                    $table.css({"table-layout": "fixed", "width": "100%"});
	                    commentList.append($table);
	
	                    var $thead = $("<thead>").addClass("table-light");
	                    $table.append($thead);
	                    
	                    var $headerRow = $("<tr>");
	                    $thead.append($headerRow);
						
	                    $headerRow.append($("<th>").text("번호").css("width", "20%"));
		                $headerRow.append($("<th>").text("댓글 내용").css("width", "30%"));
		                $headerRow.append($("<th>").text("닉네임").css("width", "30%"));
		                $headerRow.append($("<th>").text("").css("width", "20%"));
		                	                
		                var $tbody = $("<tbody>");
	                    $table.append($tbody);
		                
		                for(var i = 0; i < result.length; i++){
							
		                	var $row = $("<tr>");
							$tbody.append($row);
		                    
							var $titleColumn1 = $("<td>").addClass("align-middle");
							var $titleColumn2 = $("<td>").addClass("align-middle");
							$titleColumn1.css({
							    "overflow": "hidden",
							    "text-overflow": "ellipsis",
							    "white-space": "nowrap"
							});				
							var $titleColumn3 = $("<td>").addClass("align-middle");
							var $titleColumn4 = $("<td>").addClass("align-middle");
							
							var $commentNo = $("<a>").attr("href", "#").addClass("text-inherit").text(result[i].commentNo);
							$titleColumn1.append($commentNo);
							$row.append($titleColumn1);
							
							var $content = $("<a>").attr("href", "#").addClass("text-inherit").text(result[i].mcommentContent);
							$titleColumn2.append($content);
							$row.append($titleColumn2);
							
							var $nickname = $("<a>").attr("href", "#").addClass("text-inherit").text(result[i].nickname);
							$titleColumn3.append($nickname);
							$row.append($titleColumn3);
		                    
		                    var $reviewButton = $("<button>")
	                        .addClass("btn btn-primary btn-sm btn-write-review")
	                        .data('nickname', result[i].nickname)
	                        .data('commentNo', result[i].commentNo)
	                        .data('boardNo', result[i].boardNo)
	                       	.text("리뷰");
		                    
		                    $titleColumn4.append($reviewButton);
	                        $row.append($titleColumn4);
		                }
					}
					
				},
				"error" : function(xhr, status, err){
					alert("실패");
				}
			});
			
		});
		
		
		
		
		
		
		$('#review-list').on("click", '.btn-write-review', function(event) {
			
			const boardNo = $(this).data('boardNo');
			const nickname = $(this).data('nickname');
			const commentNo = $(this).data('commentNo');
			alert(nickname);
			
			$.ajax({
				
				"url": "/project-gpmatching/review/ajax-write-review",
				"method": "get",
				"data": { "nickname" : nickname, 
						  "boardNo" : boardNo,
						  "commentNo" : commentNo
				},
				"success": function(result){
					window.location.href = 
						"/project-gpmatching/review/write?boardNo=" + boardNo + "&commentNo=" + commentNo + "&nickname=" + nickname;
					
					
				},
				"error": function(xhr, status, err){
					alert("실패");
				
				} 
				
			}); 
		});
		
	});
	
	

