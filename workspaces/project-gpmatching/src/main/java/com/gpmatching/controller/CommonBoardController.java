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

import com.gpmatching.common.Util;
import com.gpmatching.dto.BoardAttachDto;
import com.gpmatching.dto.CommonBoardDto;
import com.gpmatching.service.CommonBoardService;
import com.gpmatching.ui.ThePager;

@Controller
@RequestMapping(path= {"/commonBoard"})
public class CommonBoardController {
	
	@Autowired
	private CommonBoardService commonBoardService;

	@GetMapping(path= {"/commonList"})
	public String commonList(@RequestParam(defaultValue="1") int pageNo, Model model) {
//		전체게시물조회
//		List<CommonBoardDto> commonBoardList = commonBoardService.listCommonBoard();
		
		//페이지별 게시물 조회
		int pageSize = 10; //한 페이지 표시 개수
		int pagerSize = 5;//표시 페이지 개수
		String linkUrl = "commonList"; //commonList?page=x href
		int dataCount = commonBoardService.getCommonBoardCount();//총 게시물 개수
		
		int from = (pageNo -1) *pageSize;//첫번째 페이지 게시물 순서
		List<CommonBoardDto> commonBoardList = commonBoardService.listCommonBoardByPage(from, pageSize);
		
		//페이지 번호 표시 부분
		ThePager pager = 
				new ThePager(dataCount, pageNo, pageSize, pagerSize, linkUrl);
		
		model.addAttribute("commonBoardList",commonBoardList);
		model.addAttribute("pager",pager);
		model.addAttribute("pageNo",pageNo);
		
		return "/commonBoard/commonList";
	}
	
	//공통게시판 글쓰기 form
	@GetMapping(path = {"/commonWrite"})
	public String showWriteForm() {
//		if(session.getAttribute("loginuser") == null) {
//			return "redirect:/account/login";
//		}
		
		return "/commonBoard/commonWrite";
	}
	
	//공통게시판 글쓰기 구현
	@PostMapping(path= {"/commonWrite"})
	public String writeCommonBoard(CommonBoardDto commonBoard, MultipartFile attach, HttpServletRequest req) {
		
		String uploadDir = req.getServletContext().getRealPath("/resources/upload/");
		ArrayList<BoardAttachDto> boardAttachList = handleUploadFile(attach, uploadDir);
		commonBoard.setBoardAttachList(boardAttachList);
		
		commonBoardService.writeCommonBoard(commonBoard);
		
		return "redirect:commonList";
	}
	private ArrayList<BoardAttachDto> handleUploadFile(MultipartFile attach, String uploadDir) {
		ArrayList<BoardAttachDto> boardAttachList = new ArrayList<>();
		if(!attach.isEmpty()) {
			try {
				String savedFileName = Util.makeUniqueFileName(attach.getOriginalFilename());
				
				attach.transferTo(new File(uploadDir, savedFileName));
				
				BoardAttachDto boardAttach = new BoardAttachDto();
				boardAttach.setUserFilename(attach.getOriginalFilename());
				boardAttach.setSavedFilename(savedFileName);
				
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
		if(commonNo == -1 || pageNo == -1) {
			return "redirect:commonList";
		}
		
		CommonBoardDto commonBoardDto = commonBoardService.findCommonBoardByCommonNo(commonNo);
		
		if(commonBoardDto == null) {//조회 글 없는 경우
			return "redirect:list";
		}
		
		model.addAttribute("commonBoard",commonBoardDto);
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
		
		CommonBoardDto commonBoardDto = commonBoardService.findCommonBoardByCommonNo(commonNo);
		
		if(commonBoardDto == null) {
			return "redirect:commonList";
		}
		
		model.addAttribute("commonBoard", commonBoardDto);
		model.addAttribute("pageNo",pageNo);
		
		return "commonBoard/commonEdit";
	}
	
	//공통게시판 글 수정
	@PostMapping(path= {"/commonEdit"})
	public String commonEdit(CommonBoardDto commonBoardDto,
							 @RequestParam(defaultValue="-1")int pageNo) {
		
		if(pageNo < 1) {
			return "redirect:commonList";
		}
		
		commonBoardService.commonEdit(commonBoardDto);
		
		return String.format("redirect:commonDetail?commonNo=%d&pageNo=%d",commonBoardDto.getCommonNo(),pageNo);
	}
	
	
	///////////////////////////////////
	//작성 예정
//	@GetMapping(path= {"/tipsList"}) 
//	public String tipsList() {
//		
//		return "/commonBoard/tipsList";
//	}
//	
}
