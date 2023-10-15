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
	
	////////////아래 추가
	
	// 아이콘 변경 함수
function updateNotificationIcon(increase) {
  // 아이콘 요소 선택
  const iconElement = document.getElementById("notificationIcon");

  // 데이터가 1 증가하면 아이콘을 변경
  if (increase) {
    iconElement.setAttribute("data-feather", "bell-off");
  } else {
    iconElement.setAttribute("data-feather", "bell");
  }

  // 아이콘 새로 고침
  feather.replace();
}