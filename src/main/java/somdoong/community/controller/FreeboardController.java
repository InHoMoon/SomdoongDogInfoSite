package somdoong.community.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import somdoong.community.dto.FboardFile;
import somdoong.community.dto.Freeboard;
import somdoong.community.service.face.FreeboardService;
import somdoong.community.util.Paging_f;

@RequestMapping("/community/free")
@Controller
public class FreeboardController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired FreeboardService fboardService;
	
	
	//게시판 목록
	@GetMapping("/list")
	public void list(@RequestParam(defaultValue = "0") int curPage, Freeboard fboard, Model model) {
		
		logger.info("/community/free/list");
		
		Paging_f paging = fboardService.getPaging(curPage);
		logger.info("{}", paging);
		model.addAttribute("paging", paging);
		
		List<Freeboard> list = fboardService.list(paging);
//		for( Freeboard f : list )	logger.info("{}", f);
		
		
		model.addAttribute("list", list);
	}
	
	
	
	// 검색 + 정렬
	@PostMapping ("/listS")
	@ResponseBody
	public ModelAndView search(@RequestParam(defaultValue = "title") String searchType, 
			@RequestParam(defaultValue = "") String keyword, 
			@RequestParam(defaultValue = "0")int curPage, 
			@RequestParam(defaultValue = "newest") String type, 
			ModelAndView mav) {
		
		logger.info("/community/free/listS");
		//- 검색된 전체 게시물 수 조회
		Paging_f paging = new Paging_f();
		
		paging.setSearchType(searchType);
		paging.setKeyword(keyword);
		paging.setCurPage(curPage);
		paging.setType(type);
		
		Paging_f sePaging = fboardService.getPagingSearchCnt(paging);
		sePaging.setSearchType(searchType);
		sePaging.setKeyword(keyword);
		sePaging.setType(type);
		
		List<Freeboard> sList = fboardService.getList(sePaging);
		
		mav.setViewName("/community/free/search");
		mav.addObject("sePaging", sePaging);
		mav.addObject("sList", sList);
		mav.addObject("totalCnt", sePaging.getTotalCount());
		return mav;
	} 
	
	
	//게시글 상세보기
	@RequestMapping("/view")
	public String view(Freeboard fboard, Model model) {
		logger.info("/community/free/view");
		
		//잘못된 게시글 번호 처리
		if( fboard.getFno() < 0 ) {
			return "redirect:/community/free";
		}
		
		//게시글 조회
		fboard = fboardService.view(fboard);
		logger.info("조회된 게시글 {}", fboard);
		
		//모델값 전달
		model.addAttribute("fboard", fboard);
		
		
		//첨부파일 모델값 전달
		FboardFile fboardFile = fboardService.getAttachFile(fboard);
		model.addAttribute("fboardFile", fboardFile);
		
		
		return "/community/free/view";
	}
	
	
	//글 작성
	@GetMapping("/write")
	public void write() {}
	
	@PostMapping("/write")
	public String writeProc(Freeboard fboard, MultipartFile file, HttpSession session) {
		logger.info("{}", fboard);
		logger.info("{}", file);
		
		fboard.setUserid( (String) session.getAttribute("userid") );
		logger.info("{}", fboard);
		
		fboardService.write(fboard, file);
		
		return "redirect:/community/free/list";
	}
	
	
	//첨부파일 다운로드
	@RequestMapping("/download")
	public String download(FboardFile fboardfile, Model model) {
		//첨부파일 정보 객체
		fboardfile = fboardService.getFile(fboardfile);
		logger.debug("{}", fboardfile);
		
		//모델값 전달
		model.addAttribute("downFile", fboardfile);
		
		return "down_f";
	}
	
	
	//게시글 수정
	@GetMapping("/update")
	public String update(Freeboard fboard, Model model) {
		logger.info("/update get");
		logger.info("{}", fboard);
		
		//잘못된 게시글 번호 처리
		if( fboard.getFno() < 0 ) {
			return "redirect:/community/free/list";
		}
		
		//게시글 조회
		fboard = fboardService.view(fboard);
		logger.info("조회된 게시글 {}", fboard);
		
		//모델값 전달
		model.addAttribute("updateBoard", fboard);
		
		
		//첨부파일 모델값 전달
		FboardFile fboardfile = fboardService.getAttachFile(fboard);
		model.addAttribute("fboardfile", fboardfile);
		
		return "community/free/update";
	}
	

	//게시글 수정 처리
	@PostMapping("/updateConn")
	public String updateProcess(Freeboard fboard, MultipartFile file) {
		logger.info("update post");
		logger.info("{}", fboard);
		
		fboardService.update(fboard, file);
		
		return "redirect:/community/free/view?fno=" + fboard.getFno();
	}
	
	
	//게시글 삭제
	@RequestMapping("/delete")
	public String delete(Freeboard fboard) {
		
		fboardService.delete(fboard);
		
		return "redirect:/community/free/list";
	}

}
