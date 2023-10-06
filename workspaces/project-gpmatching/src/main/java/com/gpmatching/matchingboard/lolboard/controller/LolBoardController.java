

/**
* 클래스 설명: 
* 
* MatchingBoard 테이블은 Lol 와 1:1 관계
* 롤 매칭게시판에서 글쓰기 시에 폼 정보가 MatchingBoard 와 Lol 테이블 에 함께 입력
* @brief 클래스 설명 : matchingBoard 인 lolBoard 게시판 정보 controller 클래스
* @author 최종 수정자 : hi.lee
* @version 1.0, 작업 내용 :
* 롤 매칭게시판 글쓰기 (write)
* 롤 매칭게시판 리스트 보여주기(list)
* @Date : 2023-10-04 
* 
*/



package com.gpmatching.matchingboard.lolboard.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gpmatching.dto.MatchingAlarmDto;
import com.gpmatching.matchingboard.dto.LolDto;
import com.gpmatching.matchingboard.dto.MatchingBoardDto;
import com.gpmatching.matchingboard.lolboard.service.LolBoardService;
import com.gpmatching.matchingboard.lolboard.service.LolService;

import lombok.Setter;

@Controller
@RequestMapping(path = { "/boardMatching/lolBoard"})
public class LolBoardController {
	
	@Setter(onMethod_ = { @Autowired }) 
	private LolBoardService lolBoardService;
	
	@Setter(onMethod_ = { @Autowired }) 
	private LolService lolService;
	
	

	
	/**
	 * 롤 매칭 게시판 보기
	 * 
	 * @param model 뷰에 전달할 모델정보
	 * @return 롤 게시판 뷰
	 */
	
	
	@GetMapping(path = { "/lol-list"})
	public String matchingBoardList(Model model) {
		
		List<MatchingBoardDto> matchingLolList = lolBoardService.getSelectLolBoardListByGameName("league of legends");
		MatchingBoardDto matchingComment = lolBoardService.findMatchingBoardByBoardNo("내일할일");
				
		model.addAttribute("matchingLolList", matchingLolList);
		model.addAttribute("matchingComment", matchingComment);
		
		return "/boardMatching/lolBoard/lol-list";
	}
	
	
	/**
	 * 롤 매칭 게시판 글쓰기 view 요청
	 * 
	 * @param session 글 작성자 세션 정보
	 * @return 롤 게시판 뷰
	 */
	
	
	@GetMapping(path = { "/lol-write"})
	public String showLolWriteForm(HttpSession session) {
		// 아래 코드는 AuthInterceptor 인터셉터에서 처리
		//if(session.getAttribute("loginuser") == null) {
		//	return "redirect:/account/login";
		//}
		return "/boardMatching/lolBoard/lol-write";
	}
	
	
	/**
	 * 롤 매칭 게시판 글쓰기 form 요청
	 * 
	 * @param matchingBoardDto 매칭게시판 matchingBoard 테이블
	 * @param lolDto 롤 Lol 테이블 
	 * @return 롤 게시판 뷰 리다이렉트 요청
	 */
	
	
	@PostMapping(path = { "/lol-write"})
	public String writeLolMatchingBoard(MatchingBoardDto matchingBoardDto, LolDto lolDto) {
		
		
		//롤 게임번호 주기
		matchingBoardDto.setGameNo(5);
		lolBoardService.write(matchingBoardDto);
		int boardNo = lolBoardService.getLastMatchingItemBoardNo();
		lolService.write(lolDto, boardNo);
		
		
		return "redirect:lol-list";	
	}

	/**
	 * 롤 매칭 게시판 수정 view 요청
	 * 
	 * @param session 글 작성자 세션 정보
	 * @return 롤 게시판 뷰
	 */
	
	
	@GetMapping(path = { "/lol-edit"})
	public String showLolEditForm(HttpSession session, int boardNo, Model model) {
		
		MatchingBoardDto lolMatchingBoard = lolBoardService.findLolBoardByBoardNo(boardNo);
		
		model.addAttribute("lolMatchingBoard", lolMatchingBoard);
		
		//System.out.println(lolMatchingBoard);
		
		return "/boardMatching/lolBoard/lol-edit";
	}
	
	
	
	/**
	 * 롤 매칭 게시판 글수정 form 요청
	 * 
	 * @param matchingBoardDto 매칭게시판 matchingBoard 테이블
	 * @param lolDto 롤 Lol 테이블 
	 * @return 롤 게시판 뷰 리다이렉트 요청
	 */
	
	
	@PostMapping(path = { "/lol-edit"})
	public String editLolMatchingBoard(MatchingBoardDto matchingBoardDto, LolDto lolDto) {
		
		lolBoardService.edit(matchingBoardDto);
		lolService.edit(lolDto);
		
		return "redirect:lol-list";	
	}
}