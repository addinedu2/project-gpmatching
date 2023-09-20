package com.gpmatching.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class RegisterRuleDto {

	private int ruleNo;
	private String ruleName;
	private Date regDate;
}
