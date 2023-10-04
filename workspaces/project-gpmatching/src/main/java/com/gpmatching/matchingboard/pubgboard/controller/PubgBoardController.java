

/**
* 클래스 설명: 
* 
* MatchingBoard 테이블은 Pubg 와 1:1 관계
* 배틀그라운드 매칭게시판에서 글쓰기 시에 폼 정보가 MatchingBoard 와 Pubg 테이블 에 함께 입력
* @brief 클래스 설명 : matchingBoard 인 pubgBoard 게시판 정보 controller 클래스
* @author 최종 수정자 : hi.lee
* @version 1.0, 작업 내용 :
* 배틀그라운드 매칭게시판 글쓰기 (write)
* 배틀그라운드 매칭게시판 리스트 보여주기(list)
* @Date : 2023-10-04 
* 
*/



package com.gpmatching.matchingboard.pubgboard.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gpmatching.matchingboard.dto.MatchingBoardDto;
import com.gpmatching.matchingboard.dto.PubgDto;
import com.gpmatching.matchingboard.pubgboard.service.PubgBoardService;
import com.gpmatching.matchingboard.pubgboard.service.PubgService;

import lombok.Setter;

@Controller
@RequestMapping(path = { "/boardMatching/pubgBoard"})
public class PubgBoardController {
	
	@Setter(onMethod_ = { @Autowired }) 
	private PubgBoardService pubgBoardService;
	
	
	@Setter(onMethod_ = { @Autowired }) 	
	private PubgService pubgService;
	

	/**
	 * 베틀그라운드 매칭 게시판 보기
	 * 
	 * @param model 뷰에 전달할 모델정보
	 * @return 베틀그라운드 게시판 뷰
	 */
	

	@GetMapping(path = { "/battleground-list"})
	public String bgMatchingBoardList(Model model) {
		
		
		List<Map<String, String>> matchingPubgList = pubgBoardService.getSelectPubgMatchingMapByGameName("battle ground");
		
		model.addAttribute("matchingPubgList", matchingPubgList);
		
		return "/boardMatching/pubgBoard/battleground-list";
	}
	

	
	/**
	 * 베틀 그라운드 매칭 게시판 글쓰기 view 요청
	 * 
	 * @param session 글 작성자 세션 정보
	 * @return 베틀 그라운드 게시판 뷰
	 */
	
	@GetMapping(path = { "/battleground-write"})
	public String showBattlegroundWriteForm(HttpSession session) {
		// 아래 코드는 AuthInterceptor 인터셉터에서 처리
		//if(session.getAttribute("loginuser") == null) {
		//	return "account/login";
		//}
		return "/boardMatching/pubgBoard/battleground-write";
	}
	
	/**
	 * 베틀그라운드 매칭 게시판 글쓰기 form 요청
	 * 
	 * @param matchingBoardDto 매칭게시판 matchingBoard 테이블
	 * @param pubgDto 베틀그라운드 pubg 테이블 
	 * @return 베틀 그라운드 게시판 뷰 리다이렉트 요청
	 */
	
	@PostMapping(path = { "/battleground-write"})
	public String writeBgMatchingBoard(MatchingBoardDto matchingBoardDto, PubgDto pubgDto ) {
		
		//베그 게임번호 주기
		matchingBoardDto.setGameNo(7);
		pubgBoardService.write(matchingBoardDto);
		int boardNo = pubgBoardService.getLastMatchingItemBoardNo();
		pubgService.write(pubgDto, boardNo);
		
		return "redirect:battleground-list";	
	}



}