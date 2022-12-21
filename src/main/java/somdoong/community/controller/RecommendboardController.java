package somdoong.community.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import somdoong.community.dto.FboardFile;
import somdoong.community.dto.Freeboard;
import somdoong.community.dto.RboardFile;
import somdoong.community.dto.RboardLike;
import somdoong.community.dto.Recommendboard;
import somdoong.community.service.face.RecommendboardService;
import somdoong.community.util.Paging_f;

@RequestMapping("/community/recommend")
@Controller
public class RecommendboardController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired RecommendboardService rboardService;
	
	//게시판 목록
	@RequestMapping("/list")
	public void list(@RequestParam(defaultValue = "0") int curPage, Recommendboard rboard, Model model) {
		
		logger.info("/community/recommend/list");
		
		Paging_f paging = rboardService.getPaging(curPage);
		logger.info("{}", paging);
		model.addAttribute("paging", paging);
		
		List<Recommendboard> list = rboardService.list(paging);
		for( Recommendboard r : list )	{
			logger.info("{}", r.toString());
		}
		
		model.addAttribute("list", list);
	}
	

	
	// 게시글 검색 목록
	@PostMapping ("/listS")
	@ResponseBody
	public ModelAndView search(@RequestParam(defaultValue = "title") String searchType, 
			@RequestParam(defaultValue = "") String keyword, 
			@RequestParam(defaultValue = "0")int curPage, 
			@RequestParam(defaultValue = "newest") String type, 
			ModelAndView mav) {
		
		logger.info("/community/recommend/search");
		//- 검색된 전체 게시물 수 조회
		Paging_f paging = new Paging_f();
		
		paging.setSearchType(searchType);
		paging.setKeyword(keyword);
		paging.setCurPage(curPage);
		paging.setType(type);
		
		Paging_f sePaging = rboardService.getPagingSearchCnt(paging);
		sePaging.setSearchType(searchType);
		sePaging.setKeyword(keyword);
		sePaging.setType(type);
		
		List<Recommendboard> sList = rboardService.getList(sePaging);
//		logger.info("sList : {}", sList);
		
		mav.setViewName("/community/recommend/search");
		mav.addObject("sePaging", sePaging);
		mav.addObject("sList", sList);
		mav.addObject("totalCnt", sePaging.getTotalCount());
		return mav;
	} 
	
	

	//게시글 상세보기
	@RequestMapping("/view")
	public String view(Recommendboard rboard, Model model, RboardLike rLike, HttpSession session) {
		logger.info("/community/recommend/view");
		
		
		//잘못된 게시글 번호 처리
		if( rboard.getRno() < 0 ) {
			return "redirect:/community/recommend";
		}
		
		//게시글 조회
		rboard = rboardService.view(rboard);
		logger.info("조회된 게시글 {}", rboard);
		
		//모델값 전달
		model.addAttribute("rboard", rboard);
		
		
		//첨부파일 모델값 전달
		RboardFile rboardFile = rboardService.getAttachFile(rboard);
		model.addAttribute("rboardFile", rboardFile);
		
		//아이디 정보 저장
		rLike.setUserid((String) session.getAttribute("userid") );
		rLike.setRno((int) rboard.getRno());
		
		//좋아요 여부 확인
		int findLike = rboardService.findLike(rLike);

		model.addAttribute("findLike", findLike);
		logger.info("좋아요 여부 : {}", findLike);
		
		
		return "/community/recommend/view";
	}
	
	
	//좋아요
	@PostMapping("/like")
	@ResponseBody
	public int like (@ModelAttribute RboardLike rLike) {
		logger.info("like ajax post");
		
		int data = rboardService.insertLike(rLike);
		logger.info("data: {}", data);
		
		// 1 = 좋아요 등록 / 0 = 좋아요 취소
		return data;
	}
	
	
	//글 작성
	@GetMapping("/write")
	public void write() {}
	
	@PostMapping("/write")
	public String writeProc(Recommendboard rboard, MultipartFile file, HttpSession session) {
//	public String writeProc(Recommendboard rboard, List<MultipartFile> file, HttpSession session) {
		logger.info("{}", rboard);
		logger.info("{}", file);
		
		rboard.setUserid( (String) session.getAttribute("userid") );
		logger.info("{}", rboard);
		
		rboardService.write(rboard, file);
		
		return "redirect:/community/recommend/list";
	}
	
	
	//첨부파일 다운로드
	@RequestMapping("/download")
	public String download(RboardFile rboardfile, Model model) {
		//첨부파일 정보 객체
		rboardfile = rboardService.getFile(rboardfile);
		logger.debug("{}", rboardfile);
		
		//모델값 전달
		model.addAttribute("downFile", rboardfile);
		
		return "down_r";
	}
	
	
	//게시글 수정
	@GetMapping("/update")
	public String update(Recommendboard rboard, Model model) {
		logger.info("/update get");
		logger.info("{}", rboard);
		
		//잘못된 게시글 번호 처리
		if( rboard.getRno() < 0 ) {
			return "redirect:/community/recommend/list";
		}
		
		//게시글 조회
		rboard = rboardService.view(rboard);
		logger.info("조회된 게시글 {}", rboard);
		
		//모델값 전달
		model.addAttribute("updateBoard", rboard);
		
		
		//첨부파일 모델값 전달
		RboardFile rboardfile = rboardService.getAttachFile(rboard);
		model.addAttribute("rboardfile", rboardfile);
		
		return "community/recommend/update";
	}
	
	
	
	//게시글 수정 처리
	@PostMapping("/updateConn")
	public String updateProc(Recommendboard rboard, MultipartFile file) {
		logger.info("update post");
		logger.info("{}", rboard);
		
		rboardService.update(rboard, file);
		
		return "redirect:/community/recommend/view?rno=" + rboard.getRno();
	}
	
	
	
	//게시글 삭제
	@RequestMapping("/delete")
	public String delete(Recommendboard rboard) {
		
		rboardService.delete(rboard);
		
		return "redirect:/community/recommend/list";
	}
	
	

}
