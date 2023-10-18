package com.gpmatching.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MatchingAlarmDto {

	private int alarmNo;
	private int commentNo;
	private String alarmContent;
	private Date regDate;
	
	private int boardNo;
	private String nickname;
}
