package com.gpmatching.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BoardCommentDto {
	private int commentNo;//코멘트번호 (자동 증가)
	private Date regDate;
	private String commentContent;
	private int commonNo;//코멘트 연결된 글 정보
	private int userNo;//코멘트 작성자 정보
	
	//대댓글 설정
	private int groupNo;
	private int step;
	private int depth;
	
	private boolean deleted;

}
