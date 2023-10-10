package com.gpmatching.dto;

import lombok.Data;

@Data
public class MatchingReviewDto {

	private int reviewNo;
	private int reviewPoint;
	private String reviewContent;
	private int commonNo;
	private int userNo;
}
