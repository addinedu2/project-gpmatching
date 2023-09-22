package com.gpmatching.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BoardCommentDto {
	private int commentNo;
	private Date regDate;
	private String commentContent;
	private int commonNo;
	private int userNo;
	private int groupNo;
	private int step;
	private int depth;
	private boolean deleted;

}
