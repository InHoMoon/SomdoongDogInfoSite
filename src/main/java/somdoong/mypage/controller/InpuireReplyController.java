package somdoong.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import somdoong.mypage.dto.InquireReply;
import somdoong.mypage.service.face.InquireReplyService;
import somdoong.mypage.view.ReplyPaging;

@Controller
@RequestMapping("/mypage")
public class InpuireReplyController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired InquireReplyService inquireReplyService;
	
	//댓글 등록
	@ResponseBody
	@PostMapping("/Cwrite")
	public String Cwrite(InquireReply ireply, HttpSession session) {
		logger.info("Cwrite 실행");
		
		//로그인한 사용자 정보 적용
		ireply.setAdminid((String)session.getAttribute("adminid"));
			
		logger.info("새 댓글 : {}", ireply);
			
		inquireReplyService.Cwrite(ireply);
			
		return "success";
			
		}
	
	//댓글 갯수
	@ResponseBody
	@GetMapping("/cCount")
	public int cCount(@RequestParam int iNum, Model model) {
		logger.info("cCount 실행");
		
		int total = inquireReplyService.getTotal(iNum);
		logger.info("총 댓글 갯수 : {}", total);
		
		return total;
	}
	
	//댓글 목록
    @RequestMapping(value="/Clist", method=RequestMethod.GET)
    public ModelAndView replyList(@RequestParam int iNum, @RequestParam(defaultValue="1") int curPage, 
    								ModelAndView mav, HttpSession session){
        
    	// 페이징 처리
        int count = inquireReplyService.getTotal(iNum); // 댓글 갯수
        ReplyPaging replyPaging = new ReplyPaging(count, curPage);
        
        // 현재 페이지의 페이징 시작 번호
        int start = replyPaging.getPageBegin();
        
        // 현재 페이지의 페이징  끝 번호
        int end = replyPaging.getPageEnd();
        List<InquireReply> list = inquireReplyService.list(iNum, start, end, session);
        
        // 뷰이름 지정
        mav.setViewName("/mypage/replyList");
        
        // 뷰에 전달할 데이터 지정
        mav.addObject("list", list);
        mav.addObject("replyPaging", replyPaging);
        
        // replyList.jsp로 포워딩
        return mav;
    }
    
    //댓글 수정 처리
    @RequestMapping(value="/Cupdate/{incno}", method={RequestMethod.PUT, RequestMethod.PATCH})
    public ResponseEntity<String> Cupdate(@PathVariable("incno") int incno, @RequestBody InquireReply ireply){
    	
        ResponseEntity<String> entity = null;
        try {
        	
        	ireply.setIncno(incno);
            inquireReplyService.update(ireply);
            
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
            
        } catch (Exception e) {
            e.printStackTrace();
            
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        
        return entity;
    }
    
    //댓글 삭제
    @RequestMapping(value="/Cdelete/{incno}")
    public ResponseEntity<String> Cdelete(@PathVariable("incno") int incno){
    	
        ResponseEntity<String> entity = null;
        
        try {
            inquireReplyService.delete(incno);
            
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
            
        } catch (Exception e) {
            e.printStackTrace();
            
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        
        return entity;
    }
	
}
