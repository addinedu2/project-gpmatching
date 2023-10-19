package com.gpmatching.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gpmatching.common.Util;
import com.gpmatching.dto.UserDto;
import com.gpmatching.service.AccountService;
import com.gpmatching.service.MatchingReviewService;

import lombok.Setter;
import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping(path = { "/account" })
public class AccountController {

	private AccountService accountService;

	@Autowired
	@Qualifier("accountService")
	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
		// 어카운트 서비스에서만 돌릴것
	}
	
	@Setter(onMethod_ = { @Autowired })
	private MatchingReviewService matchingReviewService;

	// 회원가입 버튼
	@GetMapping(path = { "/register" })
	public String registerForm(HttpSession session, Model model) {
		// 이미 로그인된 사용자가 있을 경우 마이 페이지로 리디렉션
		if (session.getAttribute("loginuser") != null) {
			return "account/mypage";
		} else {
			return "account/register";
		}
	}

//	@PostMapping(path = { "/register" })  todo
//	//@valid/indingResult result 는 유효성 검사라서 회원 가입할때 유효성을 걸어놔야한다. userdto도 활성화
//	public String register(@ModelAttribute("user") @Valid UserDto user, BindingResult result) {
//		
//		if(result.hasErrors()) {
//			return "account/register";
//		}
//		accountService.register(user);
//		
//		return "redirect:/home";
//	}//회원가입 폼 한 후 홈으로 돌아오기

	// 회원 가입
		@PostMapping(path = { "/register" })
		public String register(@ModelAttribute("user") UserDto user, HttpSession session, HttpServletRequest req, 
							   @RequestParam("imageName") MultipartFile userImage) {
			
			String uploadDir = req.getServletContext().getRealPath("/resources/upload/");
			String uploadedImageFileName = handleUploadFile(userImage, uploadDir);

			if (uploadedImageFileName != null) {
		        user.setUserImage(uploadedImageFileName);
		    }
			
			
			//회원가입 회원정보 등록
			accountService.register(user);
			return "redirect:/home";

			}

			private String handleUploadFile(MultipartFile attach, String uploadDir) {
			
				if (!attach.isEmpty()) {
					try {
						String savedFileName = Util.makeUniqueFileName(attach.getOriginalFilename());
						attach.transferTo(new File(uploadDir, savedFileName)); // 파일을 컴퓨터에 저장
			
						// 썸네일 생성
						File thumbnailFile = new File(uploadDir, "thumbnail_" + savedFileName);
						Thumbnails.of(new File(uploadDir, savedFileName))
									.size(100, 100) // 썸네일 크기
									.toFile(thumbnailFile);
						return savedFileName;
			
					} catch (Exception ex) {
						ex.printStackTrace();
					}
				}
				return null;
			}

	// 로그인 버튼
	@GetMapping(path = { "/login" })
	public String loginForm(@RequestParam(defaultValue = "/home") String returnUrl, Model model) {
		
		model.addAttribute("returnUrl", returnUrl.replace("!", "&"));
		return "account/login";
		
	}

//	// 로그인 성공/실패(수정전)
//	@PostMapping(path = { "/login" })
//	public String login(UserDto user, HttpSession session, Model model) {
//		
//		UserDto loginUser = accountService.findLoginUser(user);
//		
//		if (loginUser != null) { // loginUser가 비지 않았다=데이터베이스에 id와 pw가 일치한다=로그인 하기
//			session.setAttribute("loginuser", loginUser); // loginUser 정보를 "loginuser"에 넣기
//			
//			//작성이 필요한 리뷰 개수 헤더에 출력
//			int matchingCloseCount = matchingReviewService.getMatchingCloseByLoginUser(loginUser.getUserNo()); 
//			session.setAttribute("matchingCloseCount", matchingCloseCount);
//			
//			return "redirect:/home";
//		} else {
//			model.addAttribute("loginfail", true); // 로그인 실패를 했으니 "loginfail"에 참 넣기
//			model.addAttribute("userId", user.getUserId());
//			return "account/login";
//		}
//	}
	
	// 로그인 성공/실패(수정후) - 리다이렉트
	@PostMapping(path = { "/login" })
	public String login(UserDto user, String returnUrl, HttpSession session, Model model) {
		
		UserDto loginUser = accountService.findLoginUser(user);
		
		if (loginUser != null) { // loginUser가 비지 않았다=데이터베이스에 id와 pw가 일치한다=로그인 하기
			session.setAttribute("loginuser", loginUser); // loginUser 정보를 "loginuser"에 넣기
			
			//작성이 필요한 리뷰 개수 헤더에 출력
			int matchingCloseCount = matchingReviewService.getMatchingCloseByLoginUser(loginUser.getUserNo()); 
			session.setAttribute("matchingCloseCount", matchingCloseCount);
			
			return "redirect:" + returnUrl; 
		} else {
			model.addAttribute("loginfail", true); // 로그인 실패를 했으니 "loginfail"에 참 넣기
			model.addAttribute("userId", user.getUserId());
			model.addAttribute("returnUrl", returnUrl);
			return "account/login";
		}
	}

	
	// 로그아웃
	@GetMapping(path = { "/logout" })
	public String logout(HttpSession session) {
		session.removeAttribute("loginuser"); // 세션 정보에서 "loginuser"를 뺀다=로그아웃
		return "redirect:/home";
		// return "account/logout";
	}

	// id 찾기 페이지 가기
	@GetMapping(path = {"/forgetId"})
		public String forgetIdForm (HttpSession session, Model model) {
	 		// 이미 로그인된 사용자가 있을 경우 마이 페이지로 리디렉션
		    if (session.getAttribute("loginuser") != null) {
		        return "account/mypage";
		    } else {
		        return "account/forget-id";
		    }
	}
	
	@PostMapping(path = {"/forgetId"})
	public String findUserByPhoneAndEmail(@RequestParam("userPhone") String userPhone, @RequestParam("userEmail") String userEmail, 
											Model model) {
	  UserDto userId = accountService.findUserByPhoneAndEmail(userPhone, userEmail);
		if(userId != null) {
			model.addAttribute("message" , "당신의 아이디는: " + userId.getUserId());
			} else {
			model.addAttribute("message" , "맞는 데이터가 없습니다. 핸드폰 번호와 이메일을 확인해주세요");	
			}
		return "account/forget-id";
	}
	
	
	
//	//비밀번호 찾기 페이지 가기
//	@GetMapping(path = {"/forgetPassword"})
//		public String forgetPasswordForm (HttpSession session, Model model) {
//	 		// 이미 로그인된 사용자가 있을 경우 마이 페이지로 리디렉션
//		    if (session.getAttribute("loginuser") != null) {
//		        return "account/mypage";
//		    } else {
//		        return "account/forget-password";
//		    }
//	}
//	
//	
	
	
	//회원가입 아이디 중복검사
	@GetMapping(path = {"/check-id-dup"}, produces = "text/plain;charset=utf-8")  //  produces = "text/plain;charset=utf-8"  한글
	@ResponseBody //이 메서드가 반환하는 값은 view이름이 아니고 응답 컨텐츠 입니다. 별도의 처리를 하지 않고 그냥 응답해라. ajax를 쓰면 필수적으로 사용되는 어노테이션
	public String checkMemberIdDuplication(String userId) {
		
		boolean valid = accountService.isUserIdValid(userId);
		
		return String.valueOf(valid); 
	}
	
	
	//회원가입 닉네임 중복검사
	@GetMapping(path = {"/check-nickname-dup"}) 
	@ResponseBody 
	public String checkMemberNickNameDuplication(String nickname) {
		
		boolean valid = accountService.isNickNameValid(nickname);
		
		return String.valueOf(valid); 
	}

}
	