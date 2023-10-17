package com.gpmatching.dto;

import lombok.Data;

@Data
public class MatchingReviewDto {

	private int reviewNo;
	private int reviewPoint;
	private String reviewContent;
	private int boardNo;
	private int userNo;
	private int reviewedUserNo;
	private int commentNo;
}
