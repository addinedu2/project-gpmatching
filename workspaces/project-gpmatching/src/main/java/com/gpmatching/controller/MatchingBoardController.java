

/**
* 클래스 설명: 
* 
* MatchingBoard 은 각각 Lol, Overwatch, Pubg 와 1:1 관계입니다.
* Lol 매칭게시판에서는 글쓰기 시에 폼 정보가 MatchingBoard 와 Lol 테이블 에 함께 입력 됩니다.
* 베틀그라운드 매칭게시판에서 글쓰기 시에 폼 정보가 MatchingBoard 와 Pubg 테이블 에 함께 입력 됩니다.
* 오버워치 매칭게시판에서 글쓰기 시에 폼 정보가 MatchingBoard 와 Overwatch 테이블 에 함께 입력 됩니다.
* 
* 
* @brief 클래스 설명 : MatchingBoard 게시판 정보 controller 클래스
* @author 최종 수정자 : hi.lee
* @version 1.0, 작업 내용 :
* 게임별 매칭게시판 글쓰기 (write)
* 게임별 매칭게시판 리스트 보여주기(list)
* @Date : 2023-09-26 
* 
*/



package com.gpmatching.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gpmatching.dto.LolDto;
import com.gpmatching.dto.MatchingBoardDto;
import com.gpmatching.dto.OverwatchDto;
import com.gpmatching.dto.PubgDto;
import com.gpmatching.service.LolService;
import com.gpmatching.service.OverwatchService;
import com.gpmatching.service.PubgService;
import com.gpmatching.service.MatchingBoardService;

import lombok.Setter;

@Controller
@RequestMapping(path = { "/boardMatching"})
public class MatchingBoardController {
	
	@Setter(onMethod_ = { @Autowired }) 
	private MatchingBoardService matchingBoardService;
	
	@Setter(onMethod_ = { @Autowired }) 
	private LolService lolService;
	
	@Setter(onMethod_ = { @Autowired }) 	
	private OverwatchService OverwatchService;
	
	@Setter(onMethod_ = { @Autowired }) 	
	private PubgService pubgService;
	
	/**
	 * 롤 매칭 게시판 보기
	 * 
	 * @param model 뷰에 전달할 모델정보
	 * @return 롤 게시판 뷰
	 */
	
	
	@GetMapping(path = { "/lol-list" })
	public String matchingBoardList(Model model) {
		
		List<Map<String, String>> matchingLolList = matchingBoardService.getSelectLolMatchingMapByGameName("league of legends");

		model.addAttribute("matchingLolList", matchingLolList);
		
		return "/boardMatching/lol-list";
	}
	
	
	
	
	/**
	 * 베틀그라운드 매칭 게시판 보기
	 * 
	 * @param model 뷰에 전달할 모델정보
	 * @return 베틀그라운드 게시판 뷰
	 */
	

	@GetMapping(path = { "/battleground-list"})
	public String bgMatchingBoardList(Model model) {
		
		
		List<Map<String, String>> matchingPubgList = matchingBoardService.getSelectPubgMatchingMapByGameName("battle ground");
		
		model.addAttribute("matchingPubgList", matchingPubgList);
		
		return "/boardMatching/battleground-list";
	}
	
	/**
	 * 오버워치 매칭 게시판 보기
	 * 
	 * @param model 뷰에 전달할 모델정보
	 * @return 오버워치 게시판 뷰
	 */
	
	@GetMapping(path = { "/overwatch-list"})
	public String owMatchingBoardList(Model model) {
		
		List<Map<String, String>> matchingOwList = matchingBoardService.getSelectOwMatchingMapByGameName("overwatch2");
		
		model.addAttribute("matchingOwList", matchingOwList);
		
		return "/boardMatching/overwatch-list";
	}
	
	
	/**
	 * 롤 매칭 게시판 글쓰기 view 요청
	 * 
	 * @param session 글 작성자 세션 정보
	 * @return 롤 게시판 뷰
	 */
	
	
	@GetMapping(path = { "/lol-write"})
	public String showLolWriteForm(HttpSession session) {
		
		return "/boardMatching/lol-write";
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
		matchingBoardService.write(matchingBoardDto);
		int boardNo = matchingBoardService.getLastMatchingItemBoardNo();
		lolService.write(lolDto, boardNo);
		
		return "redirect:lol-list";	
	}
	
	
	/**
	 * 베틀 그라운드 매칭 게시판 글쓰기 view 요청
	 * 
	 * @param session 글 작성자 세션 정보
	 * @return 베틀 그라운드 게시판 뷰
	 */
	
	@GetMapping(path = { "/battleground-write"})
	public String showBattlegroundWriteForm(HttpSession session) {
		
		return "/boardMatching/battleground-write";
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
		matchingBoardService.write(matchingBoardDto);
		int boardNo = matchingBoardService.getLastMatchingItemBoardNo();
		pubgService.write(pubgDto, boardNo);
		
		return "redirect:battleground-list";	
	}

	/**
	 * 오버워치 매칭 게시판 글쓰기 view 요청
	 * 
	 * @param session 글 작성자 세션 정보
	 * @return 베틀 그라운드 게시판 뷰
	 */
	
	@GetMapping(path = { "/overwatch-write"})
	public String showOverwatchWriteForm(HttpSession session) {
		
	
		return "/boardMatching/overwatch-write";
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
		matchingBoardService.write(matchingBoardDto);
		int boardNo = matchingBoardService.getLastMatchingItemBoardNo();
		OverwatchService.write(overwatchDto, boardNo);
		
		return "redirect:overwatch-list";	
	}

}