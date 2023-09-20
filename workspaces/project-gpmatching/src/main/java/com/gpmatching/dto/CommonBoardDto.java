package com.gpmatching.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CommonBoardDto {
	int boardInfoNo;
	
	private int commonNo;
	private String commonTitle;
	private int userNo;
	private String commonContent;
	private Date regDate;
	private int readCount;
	private boolean deleted;
	//private int boardInfoNo;
	
//	private List<BoardAttachDto> boardAttachList;
//	
//	private List<CommonBoardCommentDto> boardCommentList;
	

}
