package com.gpmatching.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BoardCommentDto {
	int commentNo;
	Date regDate;
	String commentContent;
	int commonNo;
	int userNo;
	int groupNo;
	int step;
	int depth;
	boolean deleted;

}
