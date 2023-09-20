package com.gpmatching.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BoadAttachDto {
	int boadAttachNo;
	String userFilename;
	String savedFilename;
	Date regDate;
	int downloadCount;
	int commonNo;

}
