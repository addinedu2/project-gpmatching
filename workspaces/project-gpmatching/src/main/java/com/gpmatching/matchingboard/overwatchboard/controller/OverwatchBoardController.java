

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
* 오버워치 매칭게시판 글수정 (edit)
* 오버워치 매칭게시판 글삭제 (delete)
* @Date : 2023-10-16 
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
import org.springframework.web.bind.annotation.RequestParam;

import com.gpmatching.matchingboard.overwatchboard.service.OverwatchService;
import com.gpmatching.service.MatchingCommentService;
import com.gpmatching.dto.CloseAlarmDto;
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
	
	@Setter(onMethod_ = { @Autowired }) 
	private MatchingCommentService matchingCommentService;
	

	/**
	 * 오버워치 매칭 게시판 글쓰기 view 요청
	 * 
	 * @param session 글 작성자 세션 정보
	 * @return 베틀 그라운드 게시판 뷰
	 */
	
	@GetMapping(path = { "/overwatch-write"})
	public String showOverwatchWriteForm(HttpSession session) {
		
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
	
	/**
	 * 오버워치 매칭 게시판 글쓰기 view 요청
	 * 
	 * @param session 글 작성자 세션 정보
	 * @return 베틀 그라운드 게시판 뷰
	 */
	
	@GetMapping(path = { "/overwatch-edit"})
	public String showOverwatchEditForm(HttpSession session, int boardNo, Model model) {
		
		boolean matchingClose = overwatchBoardService.getMatchingCloseByBoardNo(boardNo);
		if(matchingClose) {
			return "redirect:overwatch-list";
			
		}
		
		MatchingBoardDto overwatchBoard = overwatchBoardService.findOwBoardByBoardNo(boardNo);
		
		model.addAttribute("owMatchingBoard", overwatchBoard);
		
		return "/boardMatching/overwatchBoard/overwatch-edit";
	}
	
	/**
	 * 오버워치 매칭 게시판 글쓰기 form 요청
	 * 
	 * @param matchingBoardDto 매칭게시판 matchingBoard 테이블
	 * @param overwatchDto 오버워치 overwatch 테이블 
	 * @return 오버워치 게시판 뷰 리다이렉트 요청
	 */
	
	@PostMapping(path = { "/overwatch-edit"})
	public String editOwMatchingBoard(MatchingBoardDto matchingBoardDto, OverwatchDto overwatchDto) {
		
		
		//옵치 게임번호 주기
		overwatchBoardService.edit(matchingBoardDto);
		overwatchService.edit(overwatchDto);
		
		return "redirect:overwatch-list";	
	}

	/**
	 * 롤 매칭 게시판 글삭제 기능
	 * 
	 * @param 매칭게시판 boardNo
	 * @return 롤 게시판 뷰 리다이렉트 요청
	 */
	
	
	@GetMapping(path = { "/overwatch-delete"})
	public String deleteLolMatchingBoard(int boardNo) {
		
		overwatchBoardService.delete(boardNo);

		return "redirect:overwatch-list";	
	}
	
	/**
	 * 오버워치 매칭 게시판 보기
	 * 
	 * @param model 뷰에 전달할 모델정보
	 * @return 오버워치 게시판 뷰
	 */
	
	// 게시판 검색 기능이 포함된 overwatch-list 경로 입니다 (-허지웅)
	@GetMapping(path = { "/overwatch-list"})
	public String owMatchingBoardList(@RequestParam(name = "searchType", required = false) String searchType,
			 							@RequestParam(name = "keyword", required = false) String keyword, Model model) {
		
		List<MatchingBoardDto> matchingOwList ;
		
		if ("t".equals(searchType)){
			
			matchingOwList = overwatchBoardService.searchMatchingBoardListByTitle("overwatch2", keyword);
			
		} else {
			matchingOwList = overwatchBoardService.getSelectOwBoardListByGameName("overwatch2");
			
		}
		
		model.addAttribute("matchingOwList", matchingOwList);
		
		return "/boardMatching/overwatchBoard/overwatch-list";
	}
	
	@GetMapping(path = { "/matchingCloseTrue"})
	public String MatchingClose(int boardNo, CloseAlarmDto closeAlarm) {
		if(overwatchBoardService.isMatchingCloseCondition(boardNo)) {
			overwatchBoardService.setMatchingCloseTrue(boardNo, closeAlarm);
			return "redirect:overwatch-list";
		}else {
			return "redirect:overwatch-list";
		}
		
	}

}