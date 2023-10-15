/**
 * 
 */


	$(function(event) {
		$("#dropdownNotification").hover(function(event) {
			let loginUser = "${loginUser.userNo}";
		
			 $.ajax({
				url: '/project-gpmatching/modules/header',
				type: 'get',
				dataType: 'json',
				success: function (data) {
					var alarmList = $('#alarm-list');
					alarmList.empty();
					
					$.each(data, function (index, matchingAlarms) {
		                var commentAlarm = '<li>&nbsp;&nbsp;'+matchingAlarms.nickname+'님이 댓글을 달았습니다</li>' + 
		                '<hr>';
						alarmList.append(commentAlarm);
					});
				},
				error: function (xhr, status, error) {
					console.error('댓글을 가져오는 중 오류 발생: ' + error);
				}
			});
		});
	});