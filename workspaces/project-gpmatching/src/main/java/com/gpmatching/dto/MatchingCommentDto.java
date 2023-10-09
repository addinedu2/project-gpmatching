package com.gpmatching.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MatchingCommentDto {

	private int mCommentNo;
	private Date mCommentRegDate;
	private String mCommentContent;
	private boolean mCommentConfirm;
	private int boardNo;
	private int userNo;
	
	
}
