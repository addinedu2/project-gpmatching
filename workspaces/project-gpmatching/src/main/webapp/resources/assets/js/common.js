/**
 * 
 */

	//리뷰
	$(function() {
		
		$('.review-btn').on("click", function(event){
	
			$.ajax({
				
				"url": "ajax-show-review",
				"method": "get",
				"data": { "userNo" : userNo },
				
				"success": function(result){
					
					var reviewList = $('#review-list');
					reviewList.empty();
					if (result != null){
						
						// 테이블 헤더 추가
		                var $headerRow = $("<tr>");
		                
		                $headerRow.append($("<th>").text("제목"));
		                $headerRow.append($("<th>").text("파티장"));
		                $headerRow.append($("<th>").text("파티원"));
		                
		                commentList.append($headerRow);
		                
	// 					for(var i = 0; i < result.length; i++){
	// 						var $row = $("<tr>");
		                    
	// 	                    $row.append($("<td>").text(result[i].mcommentNo));
	// 	                    $row.append($("<td>").text(result[i].nickname));
	// 	                    $row.append($("<td>").text(result[i].mcommentContent));
		                 
	// 	                    commentList.append($row);
		                    
		                    
	// 					}
						$('#review-modal').modal('show');
					}
					
					
				},
				"error": function(xhr, status, err){
					alert("실패");
				
				}
			
			});
		 });
		
	});
	
	//알림 생기면 종모양에 초록동그라미
	$(function(){
	    //let userNo = $("#notificationicon").data("userno");원본
	    let userNo = $("#dropdownNotification").data("userno");
	    console.log(userNo);
		
		$.ajax({
			   "url" : '/project-gpmatching/modules/header',
			   "type" : 'GET',
			   "dataType" : 'json',
			   "data" : {"userNo": userNo},
			   //"cache": false, //캐싱 비활성화
			   success: function(data){
				   console.log(data); //여기 데이터 카운트 개수 넘어옴.
  
				  /* if(data){
						$("#notificationicon").attr('data-feather','bell'); 
				   }원본*/
				   
				   if(data){
						$("#dropdownNotification").addClass('avatar-online');
				   }

					
				   //feather.replace();
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
	        //let loginUser = $(this).data("userno");
	        let userNo = $(this).data("userno");//수정
	        //const userNo = $(this).data("userno");//추가
	
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
	                        '<li><a href="/project-gpmatching/account/mypage">&nbsp;&nbsp;' + matchingAlarms.nickname + '님이 댓글을 달았습니다</a></li>' +
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
	
	//알림 확인하면 데이터 삭제
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
				   }
				},
				"error": function(xhr, status, err){
					console.log("요청 실패");
				}
			});
		});
	});

