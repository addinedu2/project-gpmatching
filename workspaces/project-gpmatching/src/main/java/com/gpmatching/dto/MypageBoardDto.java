package com.gpmatching.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MypageBoardDto {
	private int boardNo;
	private String boardTitle;

	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date regDate;
	
	private String boardType;
	
	private int reviewPoint;

}
