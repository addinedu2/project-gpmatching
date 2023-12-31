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
import com.gpmatching.dto.CommonBoardDto;
import com.gpmatching.service.BoardCommentService;
import com.gpmatching.service.CommonBoardService;
import com.gpmatching.ui.ThePager;
import com.gpmatching.view.DownloadView;

@Controller
@RequestMapping(path= {"/commonBoard"})
public class CommonBoardController {

	@Autowired
	private CommonBoardService commonBoardService;
	@Autowired
	private BoardCommentService boardCommentService;

	@GetMapping(path= {"/commonList"}) //게시물 목록 및 댓글 포함
	public String commonList(@RequestParam(defaultValue="1") int pageNo, @RequestParam(defaultValue = "common") String category, Model model) {
		
		//페이지별 게시물 조회
		int pageSize = 10; //한 페이지 표시 개수
		int pagerSize = 5;//표시 페이지 개수
		String linkUrl = "commonList"; //commonList?page=x href
		int dataCount = commonBoardService.getCommonBoardCount();//총 게시물 개수
		
		int from = (pageNo -1) *pageSize;//첫번째 페이지 게시물 순서
		List<CommonBoardDto> commonBoardList = commonBoardService.listCommonBoardByPage(from, pageSize, linkUrl);
		
		
		//각 게시글에 대한 댓글 갯수 조회
		List<Integer> commentCounts = new ArrayList<>();
		for (CommonBoardDto commonBoard : commonBoardList) {
			int commentCount = boardCommentService.countCommentsByPostId(commonBoard.getCommonNo());
			commentCounts.add(commentCount);
		}
		
		//페이지 번호 표시 부분
		ThePager pager = 
				new ThePager(dataCount, pageNo, pageSize, pagerSize, linkUrl);
		
		model.addAttribute("commonBoardList",commonBoardList);
		model.addAttribute("commentCounts", commentCounts);
		model.addAttribute("pager",pager);
		model.addAttribute("pageNo",pageNo);
		
		return "/commonBoard/commonList";
	}

	//공통게시판 글쓰기
	@GetMapping(path = {"/commonWrite"})
	public String showCommonWriteForm(Model model,  @RequestParam(defaultValue = "common") String category) {
		model.addAttribute("category", category);
		
		return "/commonBoard/commonWrite";
	}
	
	//공통게시판 글쓰기 구현
	@PostMapping(path= {"/commonWrite"})
	public String writeCommonBoard(CommonBoardDto commonBoard, MultipartFile attach, HttpServletRequest req) {
		
		String uploadDir = req.getServletContext().getRealPath("/resources/upload/");
		ArrayList<BoardAttachDto> boardAttachList = handleUploadFile(attach, uploadDir);
		commonBoard.setBoardAttachList(boardAttachList);
		
		commonBoardService.writeCommonBoard(commonBoard);
		
		return "redirect:/commonBoard/commonList?category=common";
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
	
	//공통게시판 글 상세보기
	@GetMapping(path= {"/commonDetail"})
	public String commonDetail(@RequestParam(defaultValue="-1") int commonNo,
							   @RequestParam(defaultValue="-1") int pageNo, Model model) {

		CommonBoardDto commonBoard = commonBoardService.findCommonBoardByCommonNo(commonNo);
		
		if(commonBoard == null) {//조회 글 없는 경우
			return "redirect:list";
		}
		
		//조회수 증가 코드
		commonBoardService.incrementReadCount(commonNo);
		commonBoard.setReadCount(commonBoard.getReadCount()+1);
		
		model.addAttribute("commonBoard",commonBoard);
		model.addAttribute("pageNo",pageNo);
		
		return "commonBoard/commonDetail";
	}
	
	//공통게시판 글 삭제
	@GetMapping(path= {"/deleteCommon/{commonNo}"})
	public String deleteCommon(@PathVariable("commonNo") int commonNo,
							   @RequestParam(defaultValue="-1") int pageNo) {
		if(pageNo == -1) {
			return "redirect:/commonBoard/commonList";
		}
		
		commonBoardService.deleteCommon(commonNo);
		
		return String.format("redirect:/commonBoard/commonList?pageNo=%d", pageNo);
	}
	
	//공통게시판 글 수정 페이지 가져오기
	@GetMapping(path= {"/commonEdit"})
	public String showCommonEditForm(@RequestParam(defaultValue = "-1")int commonNo, 
									 @RequestParam(defaultValue = "-1")int pageNo,Model model) {
		
		if(commonNo == -1 || pageNo == -1) {
			return "redirect:commonList";
		}
		
		CommonBoardDto commonBoard = commonBoardService.findCommonBoardByCommonNo(commonNo);
		
		if(commonBoard == null) {
			return "redirect:commonList";
		}
		
		model.addAttribute("commonBoard", commonBoard);
		model.addAttribute("pageNo",pageNo);
		
		return "commonBoard/commonEdit";
	}
	
	//공통게시판 글 수정
	@PostMapping(path= {"/commonEdit"})
	public String commonEdit(CommonBoardDto commonBoard, MultipartFile attach,HttpServletRequest req,
							 @RequestParam(defaultValue="-1")int pageNo) {
		
		if(pageNo < 1) {
			 return "redirect:/commonBoard/commonList?category=common";
		}
		
		String uploadDir = req.getServletContext().getRealPath("/resources/upload/");
		ArrayList<BoardAttachDto> boardAttachList = handleUploadFile(attach, uploadDir);
		commonBoard.setBoardAttachList(boardAttachList);
		
		commonBoardService.commonEdit(commonBoard);
		
		return String.format("redirect:commonDetail?commonNo=%d&pageNo=%d",commonBoard.getCommonNo(),pageNo);
	}
	
	@GetMapping(path= {"/download"})
	public View download(int boardAttachNo, Model model) {
		//첨부파일조회
		BoardAttachDto boardAttach = commonBoardService.findBoardAttachByBoardAttachNo(boardAttachNo);

		//다운로드
		model.addAttribute("boardAttach",boardAttach);
		DownloadView downloadView = new DownloadView();
		
		model.addAttribute("attach",boardAttach);
		
		return downloadView;
	}
	
}
