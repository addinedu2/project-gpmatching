package com.gpmatching.dto;


import java.sql.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import lombok.Data;


@Data
public class UserDto {

//	private int userNo;
//	private String userId;
//	private String userPwd;
//	private String userEmail;

	
	// AccountController의 유효성 검사를 살리고 싶으면 이렇게 만들어주자
	// 패스워드 정규식
	@NotBlank(message = "아이디를 입력하세요")
	@Pattern(regexp = "^[a-zA-Z0-9]{8,12}$", message = "아이디는 영문자, 숫자 조합으로 8~12 문자입니다.") // 정규표션식 ^ : 시작, $ : 끝
	private String userId;
	
	@NotBlank(message = "패스워드를 입력하세요")
	@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8}$", 
			 message = "패스워드는 최소 8 자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자를 포함해야 합니다.")
	private String userPwd;
	
	@NotBlank(message = "이메일을 입력하세요")
	@Email(message = "이메일 형식이 아닙니다.")
	private String userEmail;


	private String nickname;
	private String userPhone;
	private String userGrade;
	private Date regDate;


}



