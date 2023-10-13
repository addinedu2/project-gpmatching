package com.gpmatching.dto;

import java.util.Date;

import lombok.Data;

@Data
public class AlramDto {
	
	//-> private String toId;//원글쓴 commonNo-userNo
	//-> private String fromId;//댓글쓴 commentNo-userNo
	//-> private int commonNo;//실제 글 번호
	//-> private String commentContent;//댓글 본문 commentNo-commentContent

	private int alramNo;//알람 번호
	//private int mCommentNo; 나중에 사용할 매칭댓글
	private int commentNo;
	
	private int userNo;
	private String nickname;
	private String commentContent;
	private Date regDate;

}