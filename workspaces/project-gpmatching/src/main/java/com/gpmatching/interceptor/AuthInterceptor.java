
/**
* @brief 클래스 설명 : 사용자 로그인 정보 검증하는 interceptor 클래스
* @author 최종 수정자 : hi.lee
* @version 1.0, 작업 내용 :
* Controller 실행 전에 로그인을 안 했다면 로그인 페이지를 요청하도록 처리
* 매칭게시판에 적용
* @Date : 2023-10-03
* 
*/

package com.gpmatching.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.gpmatching.dto.UserDto;
import com.gpmatching.service.AccountService;

public class AuthInterceptor implements HandlerInterceptor{
	
	// Controller 실행 전에 호출
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		
		HttpSession session = request.getSession();
		UserDto user = (UserDto) session.getAttribute("loginuser");
		// 컨트롤러 호출 여부 결정 가능 (반환 값이 true : 호출, 반환 값이 false이면 호출 생략)
		if (user == null) { // 로그인 하지 않은 경우
			String currentUrl = request.getRequestURI();
			if(currentUrl.contains("ajax-writeComment")) {
				response.setContentType("text/plain;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("unauthorized");
			}else {
				currentUrl = currentUrl.replace("/project-gpmatching", "");
				response.sendRedirect("/project-gpmatching/account/login?returnUrl=" + currentUrl);
			}
			return false;
		} else {
			return true;
		}
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, 
			ModelAndView modelAndView) throws Exception {
		
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}

}
