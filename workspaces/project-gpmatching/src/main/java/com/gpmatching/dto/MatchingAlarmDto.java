package com.gpmatching.dto;

import lombok.Data;

@Data
public class MatchingAlarmDto {

	private int alarmNo;
	private int mCommentNo;
	private String alarmContent;
	
	private int boardNo;
	private String nickname;
}
