package com.gpmatching.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		//페지이별 게시물 조회
		int pageSize = 10; //한 페이지 표시 개수
		int pagerSize = 5;//표시 페이지 개수
		String linkUrl = "commonList"; //commonList?page=x href
		int dataCount = commonBoardService.getCommonBoardCount();
		
		int from = (pageNo -1) *pageSize;//첫번째 페이지 게시물 순서
		List<CommonBoardDto> commonBoardList = commonBoardService.listCommonBoardByPage(from, pageSize);
		
		ThePager pager = 
				new ThePager(dataCount, pageNo, pageSize, pagerSize, linkUrl);
		
		model.addAttribute("commonBoardList",commonBoardList);
		model.addAttribute("pager",pager);
		model.addAttribute("pageNo",pageNo);
		
		return "/commonBoard/commonList";
	}
	
	
	@GetMapping(path = {"/commonWrite"})
	public String showWriteForm() {
//		if(session.getAttribute("loginuser") == null) {
//			return "redirect:/account/login";
//		}
		
		return "/commonBoard/commonWrite";
	}
	
	@PostMapping(path= {"/commonWrite"})
	public String writeCommonBoard(CommonBoardDto commonBoardDto) {
		
//		ArrayList<BoardAttachDto> attachList = new ArrayList<>();
//		if(!attach.isEmpty()) {
//			try {
//				String savedFileName = Util.makeUniqueFileName(attach.getOriginalFilename());
//				
//				String uploadDir = req.getServletContext().getRealPath("/resources/upload/");
//				attach.transferTo(new File(uploadDir, savedFileName));
//				
//				BoardAttachDto boardAttach = new BoardAttachDto();
//				boardAttach.setUserFilename(attach.getOriginalFilename());
//				boardAttach.setSavedFilename(savedFileName);
//				
//				System.out.println(boardAttach);//testCode
//				
//				attachList.add(boardAttach);
//				
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		commonBoardDto.setBoardAttachList(attachList);
		
		commonBoardService.writeCommonBoard(commonBoardDto);
		
		return "redirect:commonList";
	}
	
	@GetMapping(path= {"/commonDetail"})
	public String commonDetail(@RequestParam(defaultValue="-1") int commonNo,
							   @RequestParam(defaultValue=" -1") int pageNo, Model model) {
		if(commonNo == -1 || pageNo == -1) {
			return "redirect:list";
		}
		
		if(commonNo == -1) {
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
	
	
	@GetMapping(path= {"/deleteCommon/{commonNo}"}) //안됨
	public String deleteCommon(@PathVariable("commonNo") int commonNo,
							   @RequestParam(defaultValue="-1") int pageNo) {
		if(pageNo == -1) {
			return "redirect:/commonBoard/commonList";
		}
		
		commonBoardService.deleteCommon(commonNo);
		
		return String.format("redirect:/commonBoard/commonList?pageNo=%d", pageNo);
	}
	
	//Edit
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
	
	//Edit
	@PostMapping(path= {"/commonEdit"})
	public String commonEdit(CommonBoardDto commonBoardDto,
							 @RequestParam(defaultValue="-1")int pageNo) {
		
		if(pageNo < 1) {
			return "redirect:list";
		}
		
		commonBoardService.commonEdit(commonBoardDto);
		
		return String.format("redirect:commonDetail?commonNo=%d",commonBoardDto.getCommonNo());
	}
	
	
	///////////////////////////////////
	@GetMapping(path= {"/tipsList"})
	public String tipsList() {
		
		return "/commonBoard/tipsList";
	}
	
}
