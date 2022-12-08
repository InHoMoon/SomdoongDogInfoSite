package somdoong.admin.controller;

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

import somdoong.admin.dao.face.InCommDao;
import somdoong.admin.dto.InComm;
import somdoong.admin.service.face.InCommService;

@Controller
@RequestMapping("/inquireComment")
public class InquireCommentController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired InCommService inCommService;
	
	//댓글 등록
	@ResponseBody
	@PostMapping("/writeIn")
	public String writeIn(InComm inComm, HttpSession session) {
		logger.info("writeIn 실행");
		
		//로그인한 관리자 정보 적용
		inComm.setAdminid((String)session.getAttribute("adminid"));
		
		logger.info("새 댓글 : {}", inComm);
		
		inCommService.writeIn(inComm);
		
		return "success";
	}
	
		//댓글 갯수
		@ResponseBody
		@GetMapping("/InCount")
		public int cCount(@RequestParam int inum, Model model) {
			logger.info("InCount 실행");
			
			int total = inCommService.getTotal(inum);
			logger.info("총 댓글 갯수 : {}", total);
			
			return total;
		}
		
		 //댓글 수정 처리
	    @RequestMapping(value="/updateIn/{incno}", method={RequestMethod.PUT, RequestMethod.PATCH})
	    public ResponseEntity<String> updateIc(@PathVariable("inum") int incno, @RequestBody InComm inComm){
	    	
	        ResponseEntity<String> entity = null;
	        try {
	        	
	        	inComm.setInum(incno);
	        	inCommService.update(inComm);
	            
	            entity = new ResponseEntity<String>("success", HttpStatus.OK);
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	            
	            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	        }
	        
	        return entity;
	    }
	    
	    //댓글 삭제
	    @RequestMapping(value="/deleteIn/{incno}")
	    public ResponseEntity<String> deleteC(@PathVariable("incno") int incno){
	    	
	        ResponseEntity<String> entity = null;
	        
	        try {
	            inCommService.delete(incno);
	            
	            entity = new ResponseEntity<String>("success", HttpStatus.OK);
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	            
	            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	        }
	        
	        return entity;
	    }

}
