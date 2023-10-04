

/**
* 클래스 설명: 
* 
* MatchingBoard 테이블은 Overwatch 와 1:1 관계
* 오버워치 매칭게시판에서 글쓰기 시에 폼 정보가 MatchingBoard 와 Overwatch 테이블 에 함께 입력
* @brief 클래스 설명 : matchingBoard 인 overwatchBoard 게시판 정보 controller 클래스
* @author 최종 수정자 : hi.lee
* @version 1.0, 작업 내용 :
* 오버워치 매칭게시판 글쓰기 (write)
* 오버워치 매칭게시판 리스트 보여주기(list)
* @Date : 2023-10-04 
* 
*/



package com.gpmatching.matchingboard.overwatchboard.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gpmatching.matchingboard.overwatchboard.service.OverwatchService;
import com.gpmatching.matchingboard.dto.MatchingBoardDto;
import com.gpmatching.matchingboard.dto.OverwatchDto;
import com.gpmatching.matchingboard.overwatchboard.service.OverwatchBoardService;

import lombok.Setter;

@Controller
@RequestMapping(path = { "/boardMatching/overwatchBoard"})
public class OverwatchBoardController {
	
	@Setter(onMethod_ = { @Autowired }) 
	private OverwatchBoardService overwatchBoardService;
	
	@Setter(onMethod_ = { @Autowired }) 	
	private OverwatchService overwatchService;
	

	/**
	 * 오버워치 매칭 게시판 보기
	 * 
	 * @param model 뷰에 전달할 모델정보
	 * @return 오버워치 게시판 뷰
	 */
	
	@GetMapping(path = { "/overwatch-list"})
	public String owMatchingBoardList(Model model) {
		
		List<Map<String, String>> matchingOwList = overwatchBoardService.getSelectOwMatchingMapByGameName("overwatch2");
		
		model.addAttribute("matchingOwList", matchingOwList);
		
		return "/boardMatching/overwatchBoard/overwatch-list";
	}
	

	/**
	 * 오버워치 매칭 게시판 글쓰기 view 요청
	 * 
	 * @param session 글 작성자 세션 정보
	 * @return 베틀 그라운드 게시판 뷰
	 */
	
	@GetMapping(path = { "/overwatch-write"})
	public String showOverwatchWriteForm(HttpSession session) {
		//if(session.getAttribute("loginuser") == null) {
		//	return "account/login";
		//}
		return "/boardMatching/overwatchBoard/overwatch-write";
	}
	
	/**
	 * 오버워치 매칭 게시판 글쓰기 form 요청
	 * 
	 * @param matchingBoardDto 매칭게시판 matchingBoard 테이블
	 * @param overwatchDto 오버워치 overwatch 테이블 
	 * @return 오버워치 게시판 뷰 리다이렉트 요청
	 */
	
	@PostMapping(path = { "/overwatch-write"})
	public String writeOwMatchingBoard(MatchingBoardDto matchingBoardDto, OverwatchDto overwatchDto) {
		
		
		//옵치 게임번호 주기
		matchingBoardDto.setGameNo(4);
		overwatchBoardService.write(matchingBoardDto);
		int boardNo = overwatchBoardService.getLastMatchingItemBoardNo();
		overwatchService.write(overwatchDto, boardNo);
		
		return "redirect:overwatch-list";	
	}

}