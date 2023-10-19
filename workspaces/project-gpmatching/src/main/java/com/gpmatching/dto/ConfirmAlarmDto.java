package com.gpmatching.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ConfirmAlarmDto {

	private int confirmNo;
	private int commentNo;
	private String comfirmContent;
	private Date regDate;
	
	private int boardNo;
	private String nickname;
}
