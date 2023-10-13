/**
 * 
 */


 $(function(event) {
		        	    $("#dropdownNotification").on('click', function(event) {
		        	        let loginUser = "${loginUser.userNo}";
		
				    $.ajax({
				        url: '/project-gpmatching/modules/header',
				        type: 'get',
				        dataType: 'json',
				        success: function (data) {
				        	var alramList = $('#alram-list');
				        	alramList.empty();
				
				            $.each(data, function (index, comment) {
				                var commentAlram = '<li>유저번호: ' + comment.userNo + '</li>' +
				                                 '<li>알람번호: ' + comment.alramNo + '</li>' +
				                                 '<li>댓글번호: ' + comment.commentNo + '</li>' +
				                                 '<hr>';
				                alramList.append(commentAlram);
				            });
				        },
				        error: function (xhr, status, error) {
				            console.error('댓글을 가져오는 중 오류 발생: ' + error);
				        }
				    });
				});
		    });