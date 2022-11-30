package somdoong.community.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import somdoong.community.dto.FboardComment;
import somdoong.community.service.face.FboardCommentService;

@Controller
@RequestMapping("/community/free")
public class FboardCommentController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired FboardCommentService commService;
	
	//댓글 등록
	@PostMapping("/writeC")
	public ResponseEntity<String> writeC(FboardComment fcomm, HttpSession session) {
		logger.info("writeC 실행");
		
		ResponseEntity<String> entity = null;
		
		//로그인한 사용자 정보 적용
		fcomm.setUserno((int)session.getAttribute("userno"));
		fcomm.setUserid((String)session.getAttribute("userid"));
		
		logger.info("writeC {}", fcomm);
		
		commService.writeC(fcomm);
		
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		
		return entity;
		
	}
	
	
	//댓글 목록 : controller방식 (수정)
	@RequestMapping("/listC")
	public ModelAndView listC(@RequestParam int bno, ModelAndView mav) {
		
		List<FboardComment> list = commService.getList(bno);
		
		//뷰 이름 지정
		mav.setViewName("/community/free/view");
		
		//뷰에 전달할 데이터 지정
		mav.addObject("list", list);
		
		//commDetail.jsp
		return mav;
	}
	
	
	
	@ResponseBody
	@GetMapping("/listJson")
	public Map<String, Object> listJson(@RequestParam int bno, Model model) {
		logger.info("listJson 실행");
		
		List<FboardComment> list = commService.getList(bno);
		logger.info("listJson : {}", list);
		
		int total = commService.getTotal(bno);
		logger.info("총 댓글 갯수 : {}", total);
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("total", total);
		
//		model.addAttribute("list", list);
		
		return map;
	}
	
	
	@GetMapping("/detailC/{cno}")
	public ModelAndView detailC(@PathVariable("cno") Integer cno, ModelAndView mav) {
		
		FboardComment fcomm = commService.detailC(cno);
		
		//뷰 이름 지정
		mav.setViewName("/community/free/commDetail");
		
		//뷰에 전달할 데이터 지정
		mav.addObject("fcomm", fcomm);
		
		//commDetail.jsp
		return mav;
		
	}
	
	
//	//댓글 변경 저장 처리 요청
//	@ResponseBody 
//	@RequestMapping(value="/updateC", produces="application/text; charset=utf-8")
//	public String updateC(@RequestBody FboardComment fcomm) {
//		return commService.updateC(fcomm) > 0 ? "성공" : "실패";
//	} //comment_update()
	

	
	
	
	
	
}
