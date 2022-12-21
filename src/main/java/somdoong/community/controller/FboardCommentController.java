package somdoong.community.controller;

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

import somdoong.community.dto.FboardComment;
import somdoong.community.service.face.FboardCommentService;
import somdoong.community.util.CommPaging;

@Controller
@RequestMapping("/community/free")
public class FboardCommentController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired FboardCommentService commService;
	
	//댓글 등록
	@ResponseBody
	@PostMapping("/writeC")
	public String writeC(FboardComment fcomm, HttpSession session) {
		logger.info("writeC 실행");
		
		//로그인한 사용자 정보 적용
		fcomm.setUserid((String)session.getAttribute("userid"));
		
		logger.info("새 댓글 : {}", fcomm);
		
		commService.writeC(fcomm);
		
		return "success";
		
	}
	
	
	//댓글 갯수
	@ResponseBody
	@GetMapping("/cCount")
	public int cCount(@RequestParam int bno, Model model) {
		logger.info("cCount 실행");
		
		int total = commService.getTotal(bno);
		logger.info("총 댓글 갯수 : {}", total);
		
		return total;
	}
	
	
	//댓글 목록
    @RequestMapping(value="/listC", method=RequestMethod.GET)
    public ModelAndView listC(@RequestParam int bno, @RequestParam(defaultValue="1") int curPage, 
    								ModelAndView mav, HttpSession session){
        
    	// 페이징 처리
        int count = commService.getTotal(bno); // 댓글 갯수
        CommPaging commPaging = new CommPaging(count, curPage);
        
        // 현재 페이지의 페이징 시작 번호
        int start = commPaging.getPageBegin();
        
        // 현재 페이지의 페이징  끝 번호
        int end = commPaging.getPageEnd();
        List<FboardComment> list = commService.list(bno, start, end, session);
        
        // 뷰이름 지정
        mav.setViewName("/community/free/commList");
        
        // 뷰에 전달할 데이터 지정
        mav.addObject("list", list);
        mav.addObject("commPaging", commPaging);
        
        // commList.jsp로 포워딩
        return mav;
    }
    
    
    
    //댓글 수정 처리
    @RequestMapping(value="/updateC/{cno}", method={RequestMethod.PUT, RequestMethod.PATCH})
    public ResponseEntity<String> updateC(@PathVariable("cno") int cno, @RequestBody FboardComment fcomm){
    	
        ResponseEntity<String> entity = null;
        try {
        	
        	fcomm.setCno(cno);
            commService.update(fcomm);
            
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
            
        } catch (Exception e) {
            e.printStackTrace();
            
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        
        return entity;
    }
    
    
    //댓글 삭제
    @RequestMapping(value="/deleteC/{cno}")
    public ResponseEntity<String> deleteC(@PathVariable("cno") int cno){
    	
        ResponseEntity<String> entity = null;
        
        try {
            commService.delete(cno);
            
            entity = new ResponseEntity<String>("success", HttpStatus.OK);
            
        } catch (Exception e) {
            e.printStackTrace();
            
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        
        return entity;
    }
	
	
	
	
	

	
	
	
	
	
}
