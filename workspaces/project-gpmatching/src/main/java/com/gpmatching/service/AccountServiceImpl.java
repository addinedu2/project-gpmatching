package com.gpmatching.service;


import org.springframework.beans.factory.annotation.Autowired;

import com.gpmatching.dto.UserDto;
import com.gpmatching.mapper.UserMapper;

public class AccountServiceImpl implements AccountService {

	@Autowired
	private UserMapper userMapper;
	
	
	
	//회원가입
	@Override
	public void register(UserDto user) { //회원 가입을 할 거다
		
//		String hashPasswd = Util.getHashedString(user.getUserPwd(), "SHA-256" ); //입력한 비번 암호화
//		user.setUserPwd(hashPasswd); //암호화 된 비번으로 넣기
						
		userMapper.insertUser(user);
	}
	
	@Override 
	//로그인한 유저 저장
	public UserDto findLoginUser(UserDto user) {

//		String hashedPasswd = Util.getHashedString(user.getUserPwd(), "SHA-256");
//		user.setUserPwd(hashedPasswd);


		UserDto loginUser = userMapper.selectUserByIdAnduserPwd(user.getUserId(), user.getUserPwd());
		return loginUser;  //컨트롤러에서 보자
	}
	
	@Override
	public UserDto findUserByIdAnduserEmail(String userId, String userEmail) {
		// UserMapper를 사용하여 사용자를 데이터베이스에서 조회
	UserDto useridmail = userMapper.findUserByIdAnduserEmail(userId, userEmail);	
		return useridmail;
	}
	
	
	
//	private String generateTemporaryPassword() {
//        // 임시 비밀번호 생성 로직을 구현 (예: 랜덤 문자열 생성)
//        // ...
//        return "temporaryPassword123"; // 임시로 사용할 비밀번호 반환
//    }
//
//    private void sendTemporaryPasswordByEmail(String email, String temporaryPassword) {
//        // 이메일로 임시 비밀번호 전송 로직을 구현 (JavaMailSender 또는 다른 이메일 전송 라이브러리 사용)
//        // ...
//    }
	
	
//	//마이페이지 수정  MypageServiceImpl로 이동
//	@Override
//	public void editUser(UserDto user) {
//		//데이터베이스 데이터 수정(mapper 사용)
//		userMapper.updateUserProfile(user);
//		
//	}

	
	
	//로그인 중복검사
	@Override
	public boolean isUserIdValid(String userId) {
		
		int count = userMapper.selectUserCountMyUserId(userId);
		return count == 0;
	}

	public void setUserMapper(UserMapper bean) {
		// TODO Auto-generated method stub
		
	}
	
	//비밀번호 이메일 보내기

   
	
	
	}
	
	



