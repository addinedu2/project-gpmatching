package com.gpmatching.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CloseAlarmDto {
	
	private int closeNo;
	private int commentNo;
	private String closeContent;
	private Date regDate;
	
	private int boardNo;
	private String nickname;

}
