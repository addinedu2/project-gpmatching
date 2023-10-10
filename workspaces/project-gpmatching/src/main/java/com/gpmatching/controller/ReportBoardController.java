package com.gpmatching.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;

import com.gpmatching.common.Util;
import com.gpmatching.dto.BoardAttachDto;
import com.gpmatching.dto.ReportBoardDto;
import com.gpmatching.service.ReportBoardService;
import com.gpmatching.ui.ReportPager;
import com.gpmatching.view.DownloadView;

@Controller
@RequestMapping(path= {"/commonBoard"})
public class ReportBoardController { //공통게시판, 댓글, 첨부파일 데이터베이스 공유
	
	@Autowired
	private ReportBoardService reportBoardService;
	
	@GetMapping(path= {"/reportList"})
	public String reportList(@RequestParam(name = "pageNo", defaultValue = "1") int pageNo, @RequestParam(defaultValue = "report") String category, Model model) {
//		전체게시물조회
//		List<CommonBoardDto> commonBoardList = commonBoardService.listCommonBoard();
		
		//페이지별 게시물 조회
		int pageSize = 10; //한 페이지 표시 개수
		int pagerSize = 5;//표시 페이지 개수
		String linkUrl = "reportList"; //commonList?page=x href
		int dataCount = reportBoardService.getCommonBoardCount();//총 게시물 개수
		
		int from = (pageNo -1) *pageSize;//첫번째 페이지 게시물 순서
		List<ReportBoardDto> reportBoardList = reportBoardService.listReportBoardByPage(from, pageSize, linkUrl);
		
		//페이지 번호 표시 부분
		ReportPager pager = 
				new ReportPager(dataCount, pageNo, pageSize, pagerSize, linkUrl);
		
		model.addAttribute("reportBoardList",reportBoardList);
		model.addAttribute("pager",pager);
		model.addAttribute("pageNo",pageNo);
		
		return "/commonBoard/reportList";
	}
	
	//공통게시판 글쓰기 form
	@GetMapping(path = {"/reportWrite"})
	public String showReportWriteForm(Model model,  @RequestParam(defaultValue = "report") String category) {
		model.addAttribute("category", category);
//		if(session.getAttribute("loginuser") == null) {
//			return "redirect:/account/login";
//		}
		
		return "/commonBoard/reportWrite";
	}
	
	
	
	
	//공통게시판 글쓰기 구현
	@PostMapping(path= {"/reportWrite"})
	public String writeReportBoard(ReportBoardDto reportBoard, MultipartFile attach, HttpServletRequest req) {
		
		String uploadDir = req.getServletContext().getRealPath("/resources/upload/");
		ArrayList<BoardAttachDto> boardAttachList = handleUploadFile(attach, uploadDir);
		reportBoard.setBoardAttachList(boardAttachList);
		
		reportBoardService.writeReportBoard(reportBoard);
		
		return "redirect:/commonBoard/reportList?category=report";
	}
	private ArrayList<BoardAttachDto> handleUploadFile(MultipartFile attach, String uploadDir) {
		ArrayList<BoardAttachDto> boardAttachList = new ArrayList<>();
		if(!attach.isEmpty()) {
			try {
				String savedFilename = Util.makeUniqueFileName(attach.getOriginalFilename());
				
				attach.transferTo(new File(uploadDir, savedFilename));
				
				BoardAttachDto boardAttach = new BoardAttachDto();
				boardAttach.setUserFilename(attach.getOriginalFilename());
				boardAttach.setSavedFilename(savedFilename);
				
				boardAttachList.add(boardAttach);
				
			}catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return boardAttachList;
	}
	
	//신고게시판 글 상세보기
	@GetMapping(path= {"/reportDetail"})
	public String reportDetail(@RequestParam(defaultValue="-1") int commonNo,
							   @RequestParam(defaultValue="-1") int pageNo, Model model) {
		if(commonNo == -1 || pageNo == -1) {
			return "redirect:reportList";
		}
		
		ReportBoardDto reportBoard = reportBoardService.findReportBoardByCommonNo(commonNo);
		
		if(reportBoard == null) {//조회 글 없는 경우
			return "redirect:reportList";
		}
		
		model.addAttribute("reportBoard",reportBoard);
		model.addAttribute("pageNo",pageNo);
		
		return "commonBoard/reportDetail";
	}
	
	@GetMapping(path= {"/reportdownload/{boardAttachNo}"})
	public View download(@PathVariable int boardAttachNo, Model model) {
		//첨부파일조회
		BoardAttachDto boardAttach = reportBoardService.findBoardAttachByBoardAttachNo(boardAttachNo);
		//다운로드
		model.addAttribute("boardAttach",boardAttach);
		DownloadView downloadView = new DownloadView();
		
		model.addAttribute("attach",boardAttach);
		
		return downloadView;
	}
	
//	//CommonBoard에 테스트했기 때문에 GetMapping은 여기서 했고 PostMapping은 MatchingReviewController에서 수행했습니다.
//	@GetMapping(path = { "/review" })
//	public String showMatchingReviewForm(@RequestParam(defaultValue = "-1")int commonNo, 
//								 		 @RequestParam(defaultValue = "-1")int pageNo, Model model) {
//		
//		CommonBoardDto commonBoardDto = commonBoardService.findCommonBoardByCommonNo(commonNo);
//		model.addAttribute("commonBoard", commonBoardDto);
//		model.addAttribute("pageNo",pageNo);
//
//		
//		return "/commonBoard/reviewtest";
//	}
	
	
	///////////////////////////////////
	//ToDo
//	@GetMapping(path= {"/tipsList"}) 
//	public String tipsList() {
//		
//		return "/commonBoard/tipsList";
//	}
//	
}
